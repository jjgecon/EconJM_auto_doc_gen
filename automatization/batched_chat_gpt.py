import json

# REMEMBER: this is assuming that there are not any in-process batches

# first check what are the telenovelas we are missing
try:
    old_val = pd.read_csv(
        path_content
        / f"open_ai_{categorization_type}_{model_name.replace('.', '_')}.csv"
    )
except:
    old_val = pd.DataFrame(columns=["telenovela_id"])

missing_titles = set(telenovelas_df.telenovela_id) - set(old_val.telenovela_id)
non_cat_df = telenovelas_df.loc[telenovelas_df["telenovela_id"].isin(missing_titles)]

# now we need to load the batches
# check if there completed batches with the same model and categorization type
model_cat_completed_batches = completed_batches[
    (completed_batches["model"] == model_name)
    & (completed_batches["cat_type"] == categorization_type)
]
model_cat_completed_batches.sort_values(["created_at"], inplace=True)

if not model_cat_completed_batches.empty:
    print("Found completed batches for", model_name, "and", categorization_type.upper())
    print("Updating the existing old_val")
    # this is to update the existing non_cat_df
    for index, row in model_cat_completed_batches.iterrows():
        # get the output file
        file_response = openai_client.files.content(row["output_file_id"])
        results = [json.loads(jline) for jline in file_response.text.splitlines()]

        # create an empty dataframe to store the results
        results_df = pd.DataFrame()
        for result in results:
            answer_json = json.loads(
                result["response"]["body"]["choices"][0]["message"]["content"]
            )
            aux_df = json_to_dataframe(answer_json, content_schema)
            aux_df.loc[:, "telenovela_id"] = result["custom_id"].split(";")[0]
            aux_df.loc[:, "batch_id"] = result["custom_id"].split(";")[1]
            results_df = pd.concat([results_df, aux_df], ignore_index=True)

        variables_names = [
            col
            for col in results_df.columns.tolist()
            if col not in ["telenovela_id", "batch_id"]
        ]

        results_df = results_df.pivot(
            index="telenovela_id",
            columns="batch_id",
            values=variables_names,
        )

        results_df.columns = [
            f"{var}_{batch_id}" for var, batch_id in results_df.columns
        ]

        results_df.reset_index(inplace=True)

        old_val = pd.concat([old_val, results_df], ignore_index=True)
        old_val.drop_duplicates(subset=["telenovela_id"], inplace=True)  # just to check
        old_val.to_csv(
            path_content
            / f"open_ai_{categorization_type}_{model_name.replace('.', '_')}.csv",
            index=False,
        )

        # now we update the batch history
        batch_history.loc[
            batch_history["batch_id"] == row["batch_id"],
            "processing_status",
        ] = True

        # save the batch history
        batch_history.to_csv(path_batch_files / "batches_history.csv", index=False)

# Now we need to recheck the missing titles
missing_titles = set(telenovelas_df.telenovela_id) - set(old_val.telenovela_id)
non_cat_df = telenovelas_df.loc[telenovelas_df["telenovela_id"].isin(missing_titles)]

if non_cat_df.empty:
    gpt_cat = False
    print(
        "No telenovelas to identify", categorization_type.upper(), "using", model_name
    )
else:
    print(
        "Need to categorize",
        non_cat_df.shape[0],
        "telenovelas that contain a",
        categorization_type.upper(),
        "component using",
        model_name,
    )
    # now we create the new batch
    print("Creating a new batch")
    # create the JSON schema for the model
    prompt_json_schema = content_schema.model_json_schema()
    del prompt_json_schema["title"]  # remove the title

    schema_wrapper = {
        "type": "json_schema",
        "json_schema": {
            "name": content_schema.__name__,
            "schema": prompt_json_schema,
            "strict": True,  # enforce strict validation
        },
    }

    save_to_jsonl(
        non_cat_df,  # I have subseted this here for now
        "plot_EN",
        "telenovela_id",
        5,  # number of tries for each event
        path_batch_files / f"{name_jsonl}.jsonl",
        model_name,
        system_instructions,
        schema_wrapper,
        max_tokens=5000,
    )

    new_row = {
        "created_at": pd.Timestamp.now(),
        "description": description_batch,
        "model": model_name,
        "cat_type": categorization_type,
        "batch_id": "",
        "status": "",
        "processing_status": False,
        "input_file_id": "",
        "output_file_id": "",
        "error_file_id": "",
    }

    # upload .jsonl file to OpenAI
    batch_input_file = openai_client.files.create(
        file=open(path_batch_files / f"{name_jsonl}.jsonl", "rb"), purpose="batch"
    )
    new_row["input_file_id"] = batch_input_file.id

    # create the batch entry
    batch_obj = openai_client.batches.create(
        input_file_id=new_row["input_file_id"],
        endpoint="/v1/chat/completions",
        completion_window="24h",
        metadata={
            "description": "historical events batch processing",
        },
    )

    # update batch id
    new_row["batch_id"] = batch_obj.id

    # update status and potential error/output files
    batch = openai_client.batches.retrieve(new_row["batch_id"])
    new_row["status"] = batch.status
    new_row["error_file_id"] = batch.error_file_id
    new_row["output_file_id"] = batch.output_file_id

    batch_history = pd.concat(
        [batch_history, pd.DataFrame([new_row])], ignore_index=True
    )
    batch_history.to_csv(path_batch_files / "batches_history.csv", index=False)

    print(
        "Created a new batch with id",
        new_row["batch_id"],
        "and updated the batch history.",
    )
