import json
import re
import pandas as pd


def extract_json(text):
    """
    Big function to have all the different extraction json functions
    """
    try:
        # print("method1")
        json_obj = extract_json_from_string(text)
        return json_obj
    except:
        # print("method2")
        try:
            json_obj = extract_json_from_string2(text)
            return json_obj
        except:
            raise ValueError("No JSON structure found in the input string")


def extract_json_from_string(text):
    """
    Extracts JSON structure from a string that is enclosed between ```json and ```.

    Args:
    text (str): The input string containing the JSON structure.

    Returns:
    dict: The extracted JSON structure as a dictionary.

    Developed by Copilot
    """
    json_pattern = re.compile(r"```json(.*?)```", re.DOTALL)
    match = json_pattern.search(text)
    if match:
        json_str = match.group(1).strip()
        return json.loads(json_str)
    else:
        raise ValueError("No JSON structure found in the input string in method 1")


def extract_json_from_string2(text):
    """
    This function handles the case where these is an json outpt without the preface ```json ... ```
    """
    # Use regular expression to find the JSON block
    match = re.search(r"\{.*\}", text, re.DOTALL)
    if match:
        # Extract JSON string and replace 'True' with 'true' and 'False' with 'false'
        json_str = match.group(0)
        json_str = json_str.replace("True", "true").replace("False", "false")

        try:
            # Return the parsed JSON as a Python dictionary
            return json.loads(json_str)
        except json.JSONDecodeError as e:
            raise e
    else:
        raise ValueError("No JSON structure found")


def json_to_dataframe(json_data, pydantic_model, suffix=None):
    """
    Mainly used in Gemini models
    Convert a JSON object to a pandas DataFrame based on a Pydantic model structure.

    Args:
        json_data (dict): The JSON data to convert
        pydantic_model (BaseModel): The Pydantic model class that defines the structure
        suffix (str, optional): Suffix to add to all column names

    Returns:
        pd.DataFrame: DataFrame with the structure defined by the Pydantic model
    """
    # Handle a single object or a list of objects
    if isinstance(json_data, dict):
        # Single object - wrap it in a list for consistent processing
        records = [json_data]
    elif isinstance(json_data, list):
        # Already a list of objects
        records = json_data
    else:
        raise ValueError(
            "Input JSON must be either a dictionary or a list of dictionaries"
        )

    # Create empty list to store flattened data
    flattened_data = []

    for record in records:
        # Validate and parse the data using the Pydantic model
        try:
            parsed_data = pydantic_model.model_validate(record)
            # Convert to dict and flatten nested structures if needed
            flat_record = {}

            # Get the model's fields and recursively flatten nested models
            for field_name, field_value in parsed_data.model_dump().items():
                if isinstance(field_value, dict):
                    # Flatten nested dict by prefixing keys with parent field name
                    for nested_key, nested_value in field_value.items():
                        flat_record[f"{field_name}_{nested_key}"] = nested_value
                else:
                    flat_record[field_name] = field_value

            flattened_data.append(flat_record)
        except Exception as e:
            print(f"Error parsing record: {e}")
            continue

    # Create DataFrame from the flattened data
    df = pd.DataFrame(flattened_data)

    # Add suffix to all column names if specified
    if suffix:
        df = df.add_suffix(suffix)

    return df


def pydantic_to_dataframe(pydantic_obj, suffix=None):
    """
    Convert a Pydantic object to a pandas DataFrame by flattening its structure.

    Args:
        pydantic_obj (BaseModel): A Pydantic model instance
        suffix (str, optional): Suffix to add to all column names

    Returns:
        pd.DataFrame: DataFrame with the flattened structure
    """
    # Create empty list to store flattened data
    flattened_data = []

    # Convert to dict and flatten nested structures
    flat_record = {}

    # Get the model's fields and recursively flatten nested models
    for field_name, field_value in pydantic_obj.model_dump().items():
        if isinstance(field_value, list):
            # Handle lists of nested models
            for i, item in enumerate(field_value):
                if hasattr(item, "model_dump"):  # Check if it's a Pydantic model
                    for nested_key, nested_value in item.model_dump().items():
                        flat_record[f"{field_name}_{i}_{nested_key}"] = nested_value
                else:
                    flat_record[f"{field_name}_{i}"] = item
        elif isinstance(field_value, dict):
            # Flatten nested dict by prefixing keys with parent field name
            for nested_key, nested_value in field_value.items():
                flat_record[f"{field_name}_{nested_key}"] = nested_value
        else:
            flat_record[field_name] = field_value

    flattened_data.append(flat_record)

    # Create DataFrame from the flattened data
    df = pd.DataFrame(flattened_data)

    # Add suffix to all column names if specified
    if suffix:
        df = df.add_suffix(suffix)

    return df


def create_request_body(
    row,
    column_name,
    id_var,
    batch_n,
    model,
    system_prompt,
    max_tokens,
    model_json_schema,
):
    """Creates a request body for the OpenAI API."""
    instruction_prompt = row[column_name]
    body = {
        "custom_id": row[id_var]
        + f";{batch_n}",  # unique identifier for the event + the numbers asked
        "method": "POST",
        "url": "/v1/chat/completions",
        "body": {
            "model": model,
            "messages": [
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": f"{instruction_prompt}"},
            ],
            "max_tokens": max_tokens,
            "response_format": model_json_schema,
        },
    }
    return body


def save_to_jsonl(
    df,
    column_name,
    id_var,
    number_tries,
    filename,
    model,
    system_prompt,
    model_json_schema,
    max_tokens=5000,  # max tokens for the response
):
    """Saves the request bodies to a .jsonl file."""
    with open(filename, "w") as f:
        for i in range(1, number_tries + 1):
            for _, row in df.iterrows():
                body = create_request_body(
                    row,
                    column_name,
                    id_var,
                    i,
                    model,
                    system_prompt,
                    max_tokens,
                    model_json_schema,
                )
                json_record = json.dumps(body)
                f.write(json_record + "\n")


def update_batch_status(batch_df, client):
    for index, row in batch_df.iterrows():
        # update only the status of those batched that are not processing

        if row["processing_status"] is False:
            batch = client.batches.retrieve(row["batch_id"])
            batch_df.at[index, "status"] = batch.status

            if pd.isna(row["error_file_id"]) and batch.error_file_id is not None:
                batch_df.at[index, "error_file_id"] = batch.error_file_id
            if pd.isna(row["output_file_id"]) and batch.output_file_id is not None:
                batch_df.at[index, "output_file_id"] = batch.output_file_id

    return batch_df
