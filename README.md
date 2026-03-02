This repo was used to apply for jobs in the economics academic job market 2025-26.

It uses LLMs to generate personalized documents in bulk.

In this repo you wil also find some thoughts and stats from my experience in the market available for the public in this [write-up](https://jjgecon.github.io/).

# How does it generate documents?

The document generation occurs in the jupyter notebook `personalize_docs.ipynb`, and uses `uv` to set up the python environment.

Once you have `uv` installed, follow these commands in the terminal.

> Make sure that in the command line you are working in the root of this repository.

```bash
# Navigate to the folder where the venv should be created
-> cd automatization

# this will automatically create the venv 
-> uv sync
```

Before running the jupyter notebook, please follow the instructions to completly reset the repo.

# Reset the Repo

1. Delete the content of the following directories. DO NOT delete the directories themselves, only the folders and docs inside.
    - `output_docs/`
    - `other_docs/`
    - `data/app_context/`
    - `data/batches/`

    You can achieve this by pasting and running the following command:

    ```bash
    # Deletes contents of specified dirs but keeps the directories themselves
    dirs=( "output_docs" "other_docs" "data/app_context" "data/batches" )
    for d in "${dirs[@]}"; do
        if [ -d "$d" ]; then
            find "$d" -mindepth 1 -exec rm -rf -- {} +
        fi
    done
    ```

    > Make sure that you are in the projects directory before running the commands.

2. Modify the templates found in `templates/`

    - Change he `base_text` used for the generation of the documents. This texts are inputs to the OpenAI models to generate the fit
        - In particular change the `cover_letter.txt` CONDITIONAL EXAMPLES to match your achivments you want to higligh
        - Change the base cover letter, teaching, and research statement body.
    - Make sure that the text matches the body of the `cover_letter`, `teaching_statement` and `research_statement`.
    - If you apply from outside of SMU, you might want to change the logo and footer of the letters.
        - To do this you will need to enter into the `conf.typ` file of each document.

3. Remove all entries from the `EconJM_status.xlsx` in the pages `sum` and `timeline`.

# Potential Improvements

- I would only set it up to create personalized cover letters
- Improve the prompt used for the paragrpah generation
    - Any changes can be made in the `personalize_docs.ipynb` itself
- Due to the use of the batch system for OpenAI, you might need to wait for the models to process your output before generating the docs
    - Any missing data from the to generate docs will create an error in the notenbook
- I'm using `gpt-4.1-mini`, but you might benefir from more expensive models.
    - this can be modified within the notebook.
- The templates only render when in `output_docs` due to the file path to the SMU logo. You can change the folder structure so that templates can also be compiled in the `template/` folder.

# Connecting to Jupyter Notebook with VSCode

1. Then use the command pallete and select the `Python: Select Interpreter`

2. Select `Enter interpreter path`

3. Select the `Find` option

4. Search for the `python.exe` inside the Scripts directory in the `venv`. The full path should be `autoatization/.venv/Scripts/python.exe`

## Alternative with default

1. Need to modify the following lines in the `.vscode/settings.json`

    ```
        "python.defaultInterpreterPath": "${workspaceFolder}/automatization/.venv/bin/python",
        "python.terminal.activateEnvironment": true,
        "python-envs.pythonProjects": []
    ```

    This will ensure that you can see the default environment

2. Then use the command pallete and select the `Python: Select Interpreter`

3. Once in here, select the option `Use Python from "python.defaultInterpreterPath" setting`

4. The you can then select the Kernel in the Jupyter Notebook