import json

# REMEMBER: this is assuming that there are not any in-process batches

try:
    old_docs = pd.read_csv(path_output / f"{cat_type}_docs_{model_name}.csv")
except:
    old_docs = pd.DataFrame(columns=["add_id"])

missing_titles = set(gen_aux.add_id) - set(old_docs.add_id)
non_cat_df = gen_aux.loc[gen_aux["add_id"].isin(missing_titles)]

model_cat_completed_batches = completed_batches[
    (completed_batches["model"] == model_name)
    & (completed_batches["cat_type"] == cat_type)
]
model_cat_completed_batches.sort_values(["created_at"], inplace=True)

if not model_cat_completed_batches.empty:
    print("Found completed batches for", model_name, "and", cat_type.upper())
    print("Updating the existing old_docs")
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
            aux_df.loc[:, "add_id"] = result["custom_id"].split(";")[0]
            aux_df.loc[:, "batch_id"] = result["custom_id"].split(";")[1]
            results_df = pd.concat([results_df, aux_df], ignore_index=True)

        variables_names = [
            col
            for col in results_df.columns.tolist()
            if col not in ["add_id", "batch_id"]
        ]

        results_df = results_df.pivot(
            index="add_id",
            columns="batch_id",
            values=variables_names,
        )

        results_df.columns = [
            f"{var}_{batch_id}" for var, batch_id in results_df.columns
        ]

        results_df.reset_index(inplace=True)

        old_docs = pd.concat([old_docs, results_df], ignore_index=True)
        old_docs.drop_duplicates(subset=["add_id"], inplace=True)  # just to check
        old_docs.to_csv(
            path_output / f"{cat_type}_docs_{model_name}.csv",
            index=False,
        )

        # now we update the batch history
        batch_history.loc[
            batch_history["batch_id"] == row["batch_id"],
            "processing_status",
        ] = True

        # save the batch history
        batch_history.to_csv(path_batch_files / "batches_history.csv", index=False)


missing_titles = set(gen_aux.add_id) - set(old_docs.add_id)
non_cat_df = gen_aux.loc[gen_aux["add_id"].isin(missing_titles)]

if non_cat_df.empty:
    gpt_cat = False
    print("No", cat_type.upper(), "to generate using", model_name)
else:
    print(
        "Need to generate",
        non_cat_df.shape[0],
        cat_type.upper(),
        "docs that contain a",
        "using",
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
        "prompt",
        "add_id",
        1,  # number of tries for each event
        path_batch_files / f"{name_jsonl}.jsonl",
        model_name,
        "",  # this is to ignore system instructions
        schema_wrapper,
        max_tokens=5000,
    )

    new_row = {
        "created_at": pd.Timestamp.now(),
        "description": description_batch,
        "model": model_name,
        "cat_type": cat_type,
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
