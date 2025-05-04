create table sqlite_master
(
    type     TEXT,
    name     TEXT,
    tbl_name TEXT,
    rootpage INT,
    sql      TEXT
);

INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'migrations', 'migrations', 2, 'CREATE TABLE "migrations" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "timestamp" bigint NOT NULL, "name" varchar NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'sqlite_sequence', 'sqlite_sequence', 3, 'CREATE TABLE sqlite_sequence(name,seq)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'role', 'role', 26, 'CREATE TABLE "role" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(32) NOT NULL, "scope" varchar NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), CONSTRAINT "UQ_5b49d0f504f7ef31045a1fb2eb8" UNIQUE ("scope", "name"))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_role_1', 'role', 27, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'settings', 'settings', 37, 'CREATE TABLE "settings" ("key"	TEXT NOT NULL,"value"	TEXT NOT NULL DEFAULT '''',"loadOnStartup"	boolean NOT NULL default false,PRIMARY KEY("key"))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_settings_1', 'settings', 38, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'installed_packages', 'installed_packages', 8, 'CREATE TABLE "installed_packages" ("packageName"	char(214) NOT NULL,"installedVersion"	char(50) NOT NULL,"authorName"	char(70) NULL,"authorEmail"	char(70) NULL,"createdAt"	datetime(3) NOT NULL DEFAULT ''STRFTIME(''''%Y-%m-%d %H:%M:%f'''', ''''NOW'''')'',"updatedAt"	datetime(3) NOT NULL DEFAULT ''STRFTIME(''''%Y-%m-%d %H:%M:%f'''', ''''NOW'''')'',PRIMARY KEY("packageName"))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_installed_packages_1', 'installed_packages', 39, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'installed_nodes', 'installed_nodes', 41, 'CREATE TABLE "installed_nodes" ("name"	char(200) NOT NULL,"type"	char(200) NOT NULL,"latestVersion"	INTEGER DEFAULT 1,"package"	char(214) NOT NULL,PRIMARY KEY("name"),FOREIGN KEY("package") REFERENCES "installed_packages"("packageName") ON DELETE CASCADE ON UPDATE CASCADE)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_installed_nodes_1', 'installed_nodes', 42, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'event_destinations', 'event_destinations', 46, 'CREATE TABLE "event_destinations" ("id"	varchar(36) PRIMARY KEY NOT NULL,"destination" text NOT NULL,"createdAt"	datetime(3) NOT NULL DEFAULT ''STRFTIME(''''%Y-%m-%d %H:%M:%f'''', ''''NOW'''')'',"updatedAt"	datetime(3) NOT NULL DEFAULT ''STRFTIME(''''%Y-%m-%d %H:%M:%f'''', ''''NOW'''')'')');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_event_destinations_1', 'event_destinations', 47, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'auth_identity', 'auth_identity', 11, 'CREATE TABLE "auth_identity" (
				"userId" VARCHAR(36) REFERENCES "user" (id),
				"providerId" VARCHAR(64) NOT NULL,
				"providerType" VARCHAR(32) NOT NULL,
				"createdAt" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
				"updatedAt" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
				PRIMARY KEY("providerId", "providerType")
			)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_auth_identity_1', 'auth_identity', 21, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'auth_provider_sync_history', 'auth_provider_sync_history', 23, 'CREATE TABLE "auth_provider_sync_history" (
				"id" INTEGER PRIMARY KEY AUTOINCREMENT,
				"providerType" VARCHAR(32) NOT NULL,
				"runMode" TEXT NOT NULL,
				"status" TEXT NOT NULL,
				"startedAt" DATETIME NOT NULL,
				"endedAt" DATETIME NOT NULL,
				"scanned" INTEGER NOT NULL,
				"created" INTEGER NOT NULL,
				"updated" INTEGER NOT NULL,
				"disabled" INTEGER NOT NULL,
				"error" TEXT
				
			)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'tag_entity', 'tag_entity', 19, 'CREATE TABLE "tag_entity" ("id" varchar(36) PRIMARY KEY NOT NULL, "name" varchar(24) NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_tag_entity_1', 'tag_entity', 55, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'workflows_tags', 'workflows_tags', 10, 'CREATE TABLE "workflows_tags" ("workflowId" varchar(36) NOT NULL, "tagId" integer NOT NULL, CONSTRAINT "FK_workflows_tags_workflow_entity" FOREIGN KEY ("workflowId") REFERENCES "workflow_entity" ("id") ON DELETE CASCADE ON UPDATE NO ACTION, CONSTRAINT "FK_workflows_tags_tag_entity" FOREIGN KEY ("tagId") REFERENCES "tag_entity" ("id") ON DELETE CASCADE ON UPDATE NO ACTION, PRIMARY KEY ("workflowId", "tagId"))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_workflows_tags_1', 'workflows_tags', 14, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_workflows_tags_tag_id', 'workflows_tags', 15, 'CREATE INDEX "idx_workflows_tags_tag_id" ON "workflows_tags" ("tagId")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_workflows_tags_workflow_id', 'workflows_tags', 16, 'CREATE INDEX "idx_workflows_tags_workflow_id" ON "workflows_tags" ("workflowId")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'workflow_statistics', 'workflow_statistics', 17, 'CREATE TABLE "workflow_statistics" (
				"count" INTEGER DEFAULT 0,
				"latestEvent" DATETIME,
				"name" VARCHAR(128) NOT NULL,
				"workflowId" VARCHAR(36),
				PRIMARY KEY("workflowId", "name"),
				FOREIGN KEY("workflowId") REFERENCES "workflow_entity"("id") ON DELETE CASCADE
			)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_workflow_statistics_1', 'workflow_statistics', 18, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'webhook_entity', 'webhook_entity', 32, 'CREATE TABLE "webhook_entity" ("workflowId" varchar(36) NOT NULL, "webhookPath" varchar NOT NULL, "method" varchar NOT NULL, "node" varchar NOT NULL, "webhookId" varchar, "pathLength" integer, PRIMARY KEY ("webhookPath", "method"))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_webhook_entity_1', 'webhook_entity', 33, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_webhook_entity_webhook_path_method', 'webhook_entity', 9, 'CREATE INDEX "idx_webhook_entity_webhook_path_method" ON "webhook_entity" ("webhookId","method","pathLength")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'variables', 'variables', 36, 'CREATE TABLE "variables" (
				id varchar(36) PRIMARY KEY NOT NULL,
				"key" TEXT NOT NULL,
				"type" TEXT NOT NULL DEFAULT (''string''),
				value TEXT,
				UNIQUE("key")
			)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_variables_1', 'variables', 56, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_variables_2', 'variables', 57, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_variables_key', 'variables', 24, 'CREATE UNIQUE INDEX "idx_variables_key" ON "variables" ("key")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'execution_data', 'execution_data', 25, 'CREATE TABLE "execution_data" (
				"executionId" int PRIMARY KEY NOT NULL,
				"workflowData" text NOT NULL,
				"data" text NOT NULL,
				FOREIGN KEY("executionId") REFERENCES "execution_entity" ("id") ON DELETE CASCADE
			)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_execution_data_1', 'execution_data', 58, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_8f949d7a3a984759044054e89b', 'tag_entity', 59, 'CREATE UNIQUE INDEX "IDX_8f949d7a3a984759044054e89b" ON "tag_entity" ("name") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'workflow_history', 'workflow_history', 64, 'CREATE TABLE "workflow_history" ("versionId" varchar(36) PRIMARY KEY NOT NULL, "workflowId" varchar(36) NOT NULL, "authors" varchar(255) NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "nodes" text NOT NULL, "connections" text NOT NULL, CONSTRAINT "FK_1e31657f5fe46816c34be7c1b4b" FOREIGN KEY ("workflowId") REFERENCES "workflow_entity" ("id") ON DELETE CASCADE ON UPDATE NO ACTION)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_workflow_history_1', 'workflow_history', 65, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_1e31657f5fe46816c34be7c1b4', 'workflow_history', 7, 'CREATE INDEX "IDX_1e31657f5fe46816c34be7c1b4" ON "workflow_history" ("workflowId") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'credentials_entity', 'credentials_entity', 4, 'CREATE TABLE "credentials_entity" ("id" varchar(36) PRIMARY KEY NOT NULL, "name" varchar(128) NOT NULL, "data" text NOT NULL, "type" varchar(32) NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "isManaged" BOOLEAN NOT NULL DEFAULT 0)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_credentials_entity_1', 'credentials_entity', 70, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_credentials_entity_type', 'credentials_entity', 51, 'CREATE INDEX "idx_credentials_entity_type" ON "credentials_entity" ("type") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'project_relation', 'project_relation', 71, 'CREATE TABLE "project_relation" ("projectId" varchar(36) NOT NULL, "userId" varchar NOT NULL, "role" varchar NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), CONSTRAINT "FK_61448d56d61802b5dfde5cdb002" FOREIGN KEY ("projectId") REFERENCES "project" ("id") ON DELETE CASCADE, CONSTRAINT "FK_5f0643f6717905a05164090dde7" FOREIGN KEY ("userId") REFERENCES "user" ("id") ON DELETE CASCADE, PRIMARY KEY ("projectId", "userId"))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_project_relation_1', 'project_relation', 72, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_61448d56d61802b5dfde5cdb00', 'project_relation', 74, 'CREATE INDEX "IDX_61448d56d61802b5dfde5cdb00" ON "project_relation" ("projectId") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_5f0643f6717905a05164090dde', 'project_relation', 75, 'CREATE INDEX "IDX_5f0643f6717905a05164090dde" ON "project_relation" ("userId") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'shared_credentials', 'shared_credentials', 77, 'CREATE TABLE "shared_credentials" ("credentialsId" varchar(36) NOT NULL, "projectId" varchar(36) NOT NULL, "role" text NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), CONSTRAINT "FK_416f66fc846c7c442970c094ccf" FOREIGN KEY ("credentialsId") REFERENCES "credentials_entity" ("id") ON DELETE CASCADE, CONSTRAINT "FK_812c2852270da1247756e77f5a4" FOREIGN KEY ("projectId") REFERENCES "project" ("id") ON DELETE CASCADE, PRIMARY KEY ("credentialsId", "projectId"))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_shared_credentials_1', 'shared_credentials', 78, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'shared_workflow', 'shared_workflow', 45, 'CREATE TABLE "shared_workflow" ("workflowId" varchar(36) NOT NULL, "projectId" varchar(36) NOT NULL, "role" text NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), CONSTRAINT "FK_daa206a04983d47d0a9c34649ce" FOREIGN KEY ("workflowId") REFERENCES "workflow_entity" ("id") ON DELETE CASCADE, CONSTRAINT "FK_a45ea5f27bcfdc21af9b4188560" FOREIGN KEY ("projectId") REFERENCES "project" ("id") ON DELETE CASCADE, PRIMARY KEY ("workflowId", "projectId"))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_shared_workflow_1', 'shared_workflow', 53, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'execution_metadata', 'execution_metadata', 61, 'CREATE TABLE "execution_metadata" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "executionId" integer NOT NULL, "key" varchar(255) NOT NULL, "value" text NOT NULL, CONSTRAINT "FK_31d0b4c93fb85ced26f6005cda3" FOREIGN KEY ("executionId") REFERENCES "execution_entity" ("id") ON DELETE CASCADE)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_cec8eea3bf49551482ccb4933e', 'execution_metadata', 62, 'CREATE UNIQUE INDEX "IDX_cec8eea3bf49551482ccb4933e" ON "execution_metadata" ("executionId", "key") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'invalid_auth_token', 'invalid_auth_token', 49, 'CREATE TABLE "invalid_auth_token" ("token" varchar(512) PRIMARY KEY NOT NULL, "expiresAt" datetime(3) NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_invalid_auth_token_1', 'invalid_auth_token', 50, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'execution_annotations', 'execution_annotations', 12, 'CREATE TABLE "execution_annotations" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "executionId" integer NOT NULL, "vote" varchar(6), "note" text, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), CONSTRAINT "FK_97f863fa83c4786f19565084960" FOREIGN KEY ("executionId") REFERENCES "execution_entity" ("id") ON DELETE CASCADE)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_97f863fa83c4786f1956508496', 'execution_annotations', 31, 'CREATE UNIQUE INDEX "IDX_97f863fa83c4786f1956508496" ON "execution_annotations" ("executionId") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'annotation_tag_entity', 'annotation_tag_entity', 34, 'CREATE TABLE "annotation_tag_entity" ("id" varchar(16) PRIMARY KEY NOT NULL, "name" varchar(24) NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_annotation_tag_entity_1', 'annotation_tag_entity', 35, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_ae51b54c4bb430cf92f48b623f', 'annotation_tag_entity', 44, 'CREATE UNIQUE INDEX "IDX_ae51b54c4bb430cf92f48b623f" ON "annotation_tag_entity" ("name") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'execution_annotation_tags', 'execution_annotation_tags', 5, 'CREATE TABLE "execution_annotation_tags" ("annotationId" integer NOT NULL, "tagId" varchar(24) NOT NULL, CONSTRAINT "FK_c1519757391996eb06064f0e7c8" FOREIGN KEY ("annotationId") REFERENCES "execution_annotations" ("id") ON DELETE CASCADE, CONSTRAINT "FK_a3697779b366e131b2bbdae2976" FOREIGN KEY ("tagId") REFERENCES "annotation_tag_entity" ("id") ON DELETE CASCADE, PRIMARY KEY ("annotationId", "tagId"))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_execution_annotation_tags_1', 'execution_annotation_tags', 79, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_a3697779b366e131b2bbdae297', 'execution_annotation_tags', 80, 'CREATE INDEX "IDX_a3697779b366e131b2bbdae297" ON "execution_annotation_tags" ("tagId") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_c1519757391996eb06064f0e7c', 'execution_annotation_tags', 81, 'CREATE INDEX "IDX_c1519757391996eb06064f0e7c" ON "execution_annotation_tags" ("annotationId") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'user', 'user', 86, 'CREATE TABLE "user" (
					id varchar PRIMARY KEY,
					email VARCHAR(255) UNIQUE,
					"firstName" VARCHAR(32),
					"lastName" VARCHAR(32),
					password VARCHAR,
					"personalizationAnswers" TEXT,
					"createdAt" DATETIME(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')),
					"updatedAt" DATETIME(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')),
					settings TEXT,
					disabled BOOLEAN DEFAULT FALSE NOT NULL,
					"mfaEnabled" BOOLEAN DEFAULT FALSE NOT NULL,
					"mfaSecret" TEXT,
					"mfaRecoveryCodes" TEXT,
					role TEXT NOT NULL
			)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_user_1', 'user', 87, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_user_2', 'user', 88, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'execution_entity', 'execution_entity', 13, 'CREATE TABLE "execution_entity" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "workflowId" varchar(36) NOT NULL, "finished" boolean NOT NULL, "mode" varchar NOT NULL, "retryOf" varchar, "retrySuccessId" varchar, "startedAt" datetime, "stoppedAt" datetime, "waitTill" datetime, "status" varchar NOT NULL, "deletedAt" datetime(3), "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), CONSTRAINT "FK_c4d999a5e90784e8caccf5589de" FOREIGN KEY ("workflowId") REFERENCES "workflow_entity" ("id") ON DELETE CASCADE ON UPDATE NO ACTION)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_execution_entity_stoppedAt', 'execution_entity', 30, 'CREATE INDEX "IDX_execution_entity_stoppedAt" ON "execution_entity" ("stoppedAt") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_execution_entity_deletedAt', 'execution_entity', 48, 'CREATE INDEX "IDX_execution_entity_deletedAt" ON "execution_entity" ("deletedAt") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'processed_data', 'processed_data', 60, 'CREATE TABLE "processed_data" ("workflowId" varchar(36) NOT NULL, "context" varchar(255) NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "value" text NOT NULL, CONSTRAINT "FK_06a69a7032c97a763c2c7599464" FOREIGN KEY ("workflowId") REFERENCES "workflow_entity" ("id") ON DELETE CASCADE ON UPDATE NO ACTION, PRIMARY KEY ("workflowId", "context"))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_processed_data_1', 'processed_data', 67, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'project', 'project', 28, 'CREATE TABLE "project" ("id" varchar(36) PRIMARY KEY NOT NULL, "name" varchar(255) NOT NULL, "type" varchar(36) NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "icon" text)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_project_1', 'project', 29, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'test_definition', 'test_definition', 76, 'CREATE TABLE "test_definition" ("id" varchar(36) PRIMARY KEY NOT NULL, "name" varchar(255) NOT NULL, "workflowId" varchar(36) NOT NULL, "evaluationWorkflowId" varchar(36), "annotationTagId" varchar(16), "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "description" text, "mockedNodes" JSON DEFAULT (''[]'') NOT NULL, CONSTRAINT "FK_test_definition_annotation_tag" FOREIGN KEY ("annotationTagId") REFERENCES "annotation_tag_entity" ("id") ON DELETE SET NULL ON UPDATE NO ACTION, CONSTRAINT "FK_test_definition_evaluation_workflow_entity" FOREIGN KEY ("evaluationWorkflowId") REFERENCES "workflow_entity" ("id") ON DELETE SET NULL ON UPDATE NO ACTION, CONSTRAINT "FK_test_definition_workflow_entity" FOREIGN KEY ("workflowId") REFERENCES "workflow_entity" ("id") ON DELETE CASCADE ON UPDATE NO ACTION)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_test_definition_1', 'test_definition', 43, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_test_definition_workflow_id', 'test_definition', 52, 'CREATE INDEX "idx_test_definition_workflow_id" ON "test_definition" ("workflowId")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_test_definition_evaluation_workflow_id', 'test_definition', 66, 'CREATE INDEX "idx_test_definition_evaluation_workflow_id" ON "test_definition" ("evaluationWorkflowId")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'test_metric', 'test_metric', 68, 'CREATE TABLE "test_metric" ("id" varchar(36) PRIMARY KEY NOT NULL, "name" varchar(255) NOT NULL, "testDefinitionId" varchar(36) NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), CONSTRAINT "FK_3a4e9cf37111ac3270e2469b475" FOREIGN KEY ("testDefinitionId") REFERENCES "test_definition" ("id") ON DELETE CASCADE)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_test_metric_1', 'test_metric', 90, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_3a4e9cf37111ac3270e2469b47', 'test_metric', 91, 'CREATE INDEX "IDX_3a4e9cf37111ac3270e2469b47" ON "test_metric" ("testDefinitionId") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'test_run', 'test_run', 92, 'CREATE TABLE "test_run" ("id" varchar(36) PRIMARY KEY NOT NULL, "testDefinitionId" varchar(36) NOT NULL, "status" varchar NOT NULL, "runAt" datetime(3), "completedAt" datetime(3), "metrics" text, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "totalCases" INT CHECK(
				CASE
					WHEN status = ''new'' THEN "totalCases" IS NULL
					WHEN status in (''cancelled'', ''error'') THEN "totalCases" IS NULL OR "totalCases" >= 0
					ELSE "totalCases" >= 0
				END
			), "passedCases" INT CHECK(
				CASE
					WHEN status = ''new'' THEN "passedCases" IS NULL
					WHEN status in (''cancelled'', ''error'') THEN "passedCases" IS NULL OR "passedCases" >= 0
					ELSE "passedCases" >= 0
				END
			), "failedCases" INT CHECK(
				CASE
					WHEN status = ''new'' THEN "failedCases" IS NULL
					WHEN status in (''cancelled'', ''error'') THEN "failedCases" IS NULL OR "failedCases" >= 0
					ELSE "failedCases" >= 0
				END
			), "errorCode" VARCHAR(255), "errorDetails" TEXT, CONSTRAINT "FK_3a81713a76f2295b12b46cdfcab" FOREIGN KEY ("testDefinitionId") REFERENCES "test_definition" ("id") ON DELETE CASCADE)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_test_run_1', 'test_run', 93, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_3a81713a76f2295b12b46cdfca', 'test_run', 94, 'CREATE INDEX "IDX_3a81713a76f2295b12b46cdfca" ON "test_run" ("testDefinitionId") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'test_case_execution', 'test_case_execution', 96, 'CREATE TABLE "test_case_execution" ("id" varchar(36) PRIMARY KEY NOT NULL, "testRunId" varchar(36) NOT NULL, "pastExecutionId" integer, "executionId" integer, "evaluationExecutionId" integer, "status" varchar NOT NULL, "runAt" datetime(3), "completedAt" datetime(3), "errorCode" varchar, "errorDetails" text, "metrics" text, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), CONSTRAINT "FK_8e4b4774db42f1e6dda3452b2af" FOREIGN KEY ("testRunId") REFERENCES "test_run" ("id") ON DELETE CASCADE, CONSTRAINT "FK_258d954733841d51edd826a562b" FOREIGN KEY ("pastExecutionId") REFERENCES "execution_entity" ("id") ON DELETE SET NULL, CONSTRAINT "FK_e48965fac35d0f5b9e7f51d8c44" FOREIGN KEY ("executionId") REFERENCES "execution_entity" ("id") ON DELETE SET NULL, CONSTRAINT "FK_dfbe194e3ebdfe49a87bc4692ca" FOREIGN KEY ("evaluationExecutionId") REFERENCES "execution_entity" ("id") ON DELETE SET NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_test_case_execution_1', 'test_case_execution', 97, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_8e4b4774db42f1e6dda3452b2a', 'test_case_execution', 98, 'CREATE INDEX "IDX_8e4b4774db42f1e6dda3452b2a" ON "test_case_execution" ("testRunId") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'folder', 'folder', 99, 'CREATE TABLE "folder" ("id" varchar(36) PRIMARY KEY NOT NULL, "name" varchar(128) NOT NULL, "parentFolderId" varchar(36), "projectId" varchar(36) NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), CONSTRAINT "FK_a8260b0b36939c6247f385b8221" FOREIGN KEY ("projectId") REFERENCES "project" ("id") ON DELETE CASCADE, CONSTRAINT "FK_804ea52f6729e3940498bd54d78" FOREIGN KEY ("parentFolderId") REFERENCES "folder" ("id") ON DELETE CASCADE)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_folder_1', 'folder', 100, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_14f68deffaf858465715995508', 'folder', 101, 'CREATE UNIQUE INDEX "IDX_14f68deffaf858465715995508" ON "folder" ("projectId", "id") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'folder_tag', 'folder_tag', 102, 'CREATE TABLE "folder_tag" ("folderId" varchar(36) NOT NULL, "tagId" varchar(36) NOT NULL, CONSTRAINT "FK_94a60854e06f2897b2e0d39edba" FOREIGN KEY ("folderId") REFERENCES "folder" ("id") ON DELETE CASCADE, CONSTRAINT "FK_dc88164176283de80af47621746" FOREIGN KEY ("tagId") REFERENCES "tag_entity" ("id") ON DELETE CASCADE, PRIMARY KEY ("folderId", "tagId"))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_folder_tag_1', 'folder_tag', 103, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'workflow_entity', 'workflow_entity', 109, 'CREATE TABLE "workflow_entity" ("id" varchar(36) PRIMARY KEY NOT NULL, "name" varchar(128) NOT NULL, "active" boolean NOT NULL, "nodes" text, "connections" text, "settings" text, "staticData" text, "pinData" text, "versionId" varchar(36), "triggerCount" integer DEFAULT (0), "meta" text, "parentFolderId" varchar(36), "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), CONSTRAINT "FK_04a4db5906fbc5606c71448d912" FOREIGN KEY ("parentFolderId") REFERENCES "folder" ("id") ON DELETE CASCADE)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_workflow_entity_1', 'workflow_entity', 110, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_e10425f6ab9964c4c1623a4a03', 'workflow_entity', 111, 'CREATE INDEX "IDX_e10425f6ab9964c4c1623a4a03" ON "workflow_entity" ("name") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'insights_metadata', 'insights_metadata', 6, 'CREATE TABLE "insights_metadata" ("metaId" integer PRIMARY KEY NOT NULL, "workflowId" varchar(16), "projectId" varchar(36), "workflowName" varchar(128) NOT NULL, "projectName" varchar(255) NOT NULL, CONSTRAINT "FK_1d8ab99d5861c9388d2dc1cf733" FOREIGN KEY ("workflowId") REFERENCES "workflow_entity" ("id") ON DELETE SET NULL, CONSTRAINT "FK_2375a1eda085adb16b24615b69c" FOREIGN KEY ("projectId") REFERENCES "project" ("id") ON DELETE SET NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_1d8ab99d5861c9388d2dc1cf73', 'insights_metadata', 63, 'CREATE UNIQUE INDEX "IDX_1d8ab99d5861c9388d2dc1cf73" ON "insights_metadata" ("workflowId") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'insights_raw', 'insights_raw', 104, 'CREATE TABLE "insights_raw" ("id" integer PRIMARY KEY NOT NULL, "metaId" integer NOT NULL, "type" integer NOT NULL, "value" integer NOT NULL, "timestamp" datetime(0) NOT NULL DEFAULT (CURRENT_TIMESTAMP), CONSTRAINT "FK_6e2e33741adef2a7c5d66befa4e" FOREIGN KEY ("metaId") REFERENCES "insights_metadata" ("metaId") ON DELETE CASCADE)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'insights_by_period', 'insights_by_period', 106, 'CREATE TABLE "insights_by_period" ("id" integer PRIMARY KEY NOT NULL, "metaId" integer NOT NULL, "type" integer NOT NULL, "value" integer NOT NULL, "periodUnit" integer NOT NULL, "periodStart" datetime(0) DEFAULT (CURRENT_TIMESTAMP), CONSTRAINT "FK_6414cfed98daabbfdd61a1cfbc0" FOREIGN KEY ("metaId") REFERENCES "insights_metadata" ("metaId") ON DELETE CASCADE)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'IDX_60b6a84299eeb3f671dfec7693', 'insights_by_period', 107, 'CREATE UNIQUE INDEX "IDX_60b6a84299eeb3f671dfec7693" ON "insights_by_period" ("periodStart", "type", "periodUnit", "metaId") ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'user_api_keys', 'user_api_keys', 108, 'CREATE TABLE "user_api_keys" ("id" varchar(36) PRIMARY KEY NOT NULL, "userId" varchar NOT NULL, "label" varchar(100) NOT NULL, "apiKey" varchar NOT NULL, "createdAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "updatedAt" datetime(3) NOT NULL DEFAULT (STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')), "scopes" text, CONSTRAINT "UQ_1ef35bac35d20bdae979d917a36" UNIQUE ("apiKey"), CONSTRAINT "UQ_63d7bbae72c767cf162d459fccd" UNIQUE ("userId", "label"), CONSTRAINT "FK_e131705cbbc8fb589889b02d457" FOREIGN KEY ("userId") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE NO ACTION)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_user_api_keys_1', 'user_api_keys', 69, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_user_api_keys_2', 'user_api_keys', 112, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_user_api_keys_3', 'user_api_keys', 113, null);
