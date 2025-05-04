create table workflow_statistics
(
    count       INTEGER default 0,
    latestEvent DATETIME,
    name        VARCHAR(128) not null,
    workflowId  VARCHAR(36)
        references workflow_entity
            on delete cascade,
    primary key (workflowId, name)
);

INSERT INTO workflow_statistics (count, latestEvent, name, workflowId) VALUES (2, '2025-05-04 02:25:29', 'manual_error', 'h0Vp95lVDp1XNJno');
INSERT INTO workflow_statistics (count, latestEvent, name, workflowId) VALUES (1, '2025-05-04 02:26:31.248', 'data_loaded', 'h0Vp95lVDp1XNJno');
INSERT INTO workflow_statistics (count, latestEvent, name, workflowId) VALUES (6, '2025-05-04 02:30:41', 'manual_success', 'h0Vp95lVDp1XNJno');
INSERT INTO workflow_statistics (count, latestEvent, name, workflowId) VALUES (2, '2025-05-04 02:32:01', 'manual_error', 'iO9xGILabwc4B9i1');
INSERT INTO workflow_statistics (count, latestEvent, name, workflowId) VALUES (31, '2025-05-04 14:16:46', 'manual_success', 'iO9xGILabwc4B9i1');
INSERT INTO workflow_statistics (count, latestEvent, name, workflowId) VALUES (1, '2025-05-04 14:16:40.373', 'data_loaded', 'iO9xGILabwc4B9i1');
INSERT INTO workflow_statistics (count, latestEvent, name, workflowId) VALUES (1, '2025-05-04 18:44:00.477', 'data_loaded', 'KYqQYZoiGyncZDoR');
INSERT INTO workflow_statistics (count, latestEvent, name, workflowId) VALUES (28, '2025-05-04 19:56:10', 'manual_success', 'KYqQYZoiGyncZDoR');
INSERT INTO workflow_statistics (count, latestEvent, name, workflowId) VALUES (9, '2025-05-04 19:56:10', 'manual_error', 'KYqQYZoiGyncZDoR');
