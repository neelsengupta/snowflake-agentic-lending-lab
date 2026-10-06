-- ============================================================
-- Reset script
-- Run this if you want to start the lab again from scratch.
-- Select all and press Cmd+Return (Mac) or Ctrl+Enter (Windows).
-- ============================================================


-- ── Step 1: clear all memos and decisions ────────────────────────────────────

DELETE FROM LENDING.LOANS.CREDIT_MEMO;

DELETE FROM LENDING.LOANS.UNDERWRITING_LOG;

DELETE FROM LENDING.LOANS.APPLICATIONS
WHERE APPLICANT_ID IN ('APP_1001','APP_1002','APP_1003','APP_1004','APP_1005','APP_1006');

INSERT INTO LENDING.LOANS.APPLICATIONS
    (APPLICANT_ID, FIRST_NAME, LAST_NAME, CREDIT_SCORE, ANNUAL_INCOME,
     DEBT_TO_INCOME_RATIO, REQUESTED_AMOUNT, LOAN_PURPOSE, EMPLOYMENT_STATUS,
     YEARS_EMPLOYED, APPLICATION_DATE, STATUS)
VALUES
    ('APP_1001','Diane','Whitfield',      776,142000.00,0.24,45000.00,'home improvement',  'employed',     11,'2026-07-17','PENDING'),
    ('APP_1002','Marcus','Adeyemi',       611, 88500.00,0.44,32000.00,'debt consolidation','employed',      6,'2026-07-18','PENDING'),
    ('APP_1003','Priya','Adeyemi',        752,119000.00,0.21,    0.00,'co-applicant',      'employed',      9,'2026-07-18','PENDING'),
    ('APP_1004','Grant','Kelleher',       771,163000.00,0.19,75000.00,'debt consolidation','self-employed', 7,'2026-07-16','PENDING'),
    ('APP_1005','Tobias','Renner',        648, 57400.00,0.47,24000.00,'auto',              'self-employed', 2,'2026-07-19','PENDING'),
    ('APP_1006','Yolanda','Castellanos',  694,101000.00,0.39,40000.00,'small business',    'self-employed', 4,'2026-07-15','PENDING');


-- ── Step 2: drop the credit analyst baseline agent ───────────────────────────
-- You rebuild this in Module 3 Step 3.1.1.
-- CREDIT_ANALYST_AGENT_IMPROVED, UNDERWRITING_AGENT and
-- UNDERWRITER_WITH_DELEGATION_AGENT are pre-provisioned and do not need dropping.

DROP AGENT IF EXISTS LENDING.LOANS.CREDIT_ANALYST_AGENT_BASELINE;


-- ── Step 3: optional section cleanup ─────────────────────────────────────────
-- Only needed if you ran the optional stream and task section.

DROP TASK IF EXISTS LENDING.LOANS.UNDERWRITE_ON_ARRIVAL;
DROP STREAM IF EXISTS LENDING.LOANS.NEW_APPLICATIONS;
DELETE FROM LENDING.LOANS.APPLICATIONS   WHERE APPLICANT_ID = 'APP_2001';
DELETE FROM LENDING.LOANS.UNDERWRITING_LOG WHERE APPLICANT_ID = 'APP_2001';


-- ── Step 4: restore workspace files ──────────────────────────────────────────
-- Restores the agent YAML placeholders and SQL files to their original state.

COPY FILES
    INTO snow://workspace/LENDING.PUBLIC.COCO_LAB/versions/live/cortex_project/
    FROM @LENDING.LOANS.LAB_STAGE/workspace_seed/
    FILES = ('cortex-project.yaml', 'CREDIT_ANALYST_AGENT_BASELINE.agent.yaml',
             'CREDIT_ANALYST_AGENT_IMPROVED.agent.yaml',
             'UNDERWRITING_AGENT.agent.yaml',
             'UNDERWRITER_WITH_DELEGATION_AGENT.agent.yaml');

COPY FILES
    INTO snow://workspace/LENDING.PUBLIC.COCO_LAB/versions/live/
    FROM @LENDING.LOANS.LAB_STAGE/workspace_seed/
    FILES = ('lab.sql');

COPY FILES
    INTO snow://workspace/LENDING.PUBLIC.COCO_LAB/versions/live/utils/
    FROM @LENDING.LOANS.LAB_STAGE/workspace_seed/
    FILES = ('reset.sql', 'helpful_queries.sql');
