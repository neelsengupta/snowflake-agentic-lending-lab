-- Agentic lending lab: bootstrap
--
-- Paste this whole file into a new SQL worksheet in Snowsight and choose
-- Run All. It takes several minutes to run.
--
-- It connects your account to the lab's public GitHub repository and runs
-- setup/setup.sql from it. That script creates the LENDING database, the lab
-- data, the search service, the agents and the COCO_LAB workspace.

USE ROLE ACCOUNTADMIN;

CREATE OR REPLACE API INTEGRATION LAB_GIT_API
    API_PROVIDER = git_https_api
    API_ALLOWED_PREFIXES = ('https://github.com/neelsengupta/')
    ENABLED = TRUE;

CREATE DATABASE IF NOT EXISTS LAB_SETUP;

CREATE OR REPLACE GIT REPOSITORY LAB_SETUP.PUBLIC.LAB_REPO
    API_INTEGRATION = LAB_GIT_API
    ORIGIN = 'https://github.com/neelsengupta/snowflake-agentic-lending-lab.git';

EXECUTE IMMEDIATE FROM @LAB_SETUP.PUBLIC.LAB_REPO/branches/main/setup/setup.sql;
