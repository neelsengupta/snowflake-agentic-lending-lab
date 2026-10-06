-- Agentic lending lab: teardown
--
-- Removes everything setup.sql created. Run as ACCOUNTADMIN.
--
-- The snowflake-agentic-lending-lab workspace is yours, not the lab's. Delete
-- it from the workspace menu if you no longer want it, then run the last
-- statement, which removes the integration the workspace used to reach GitHub.

USE ROLE ACCOUNTADMIN;

DROP DATABASE IF EXISTS LENDING;
DROP WAREHOUSE IF EXISTS LENDING_WH;

-- DROP API INTEGRATION IF EXISTS LAB_GIT_API;
