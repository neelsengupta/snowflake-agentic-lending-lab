# Put Agents to Work: agentic lending lab

A hands-on Snowflake lab. You build a credit analyst agent that reads loan
documents and writes a credit memo, then explore an underwriting agent that
applies lending policy and records a decision.

**Lab guide:** https://neelsengupta.github.io/snowflake-agentic-lending-lab/

## Setup

You need a Snowflake trial account. Setup takes about two minutes.

1. In a SQL file in Snowsight, run:

   ```sql
   CREATE API INTEGRATION LAB_GIT_API
       API_PROVIDER = git_https_api
       API_ALLOWED_PREFIXES = ('https://github.com/neelsengupta/')
       ENABLED = TRUE;
   ```

2. In **Projects » Workspaces**, open the workspace menu and select
   **From Git repository**. Paste this repository's URL, leave the name as it
   is, select **LAB_GIT_API** and **Public repository**, then **Create**.
3. In the new workspace, open `setup.sql` and select **Run All**. The last
   result reads `Setup complete`.

The lab guide walks through each step.

## What is here

| Path | What it is |
|---|---|
| `setup.sql` | Creates everything the lab uses. Run once. |
| `lab.sql` | The SQL you run during the modules. |
| `cortex_project/` | The agent definitions, as YAML. |
| `utils/` | `reset.sql` to start the lab again, `helpful_queries.sql`, and `teardown.sql` to remove everything. |
| `data/` | The applicant documents and the evaluation settings that setup copies. |
