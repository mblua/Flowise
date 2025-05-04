create table shared_workflow
(
    workflowId varchar(36)                                                not null
        constraint FK_daa206a04983d47d0a9c34649ce
            references workflow_entity
            on delete cascade,
    projectId  varchar(36)                                                not null
        constraint FK_a45ea5f27bcfdc21af9b4188560
            references project
            on delete cascade,
    role       text                                                       not null,
    createdAt  datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt  datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    primary key (workflowId, projectId)
);

INSERT INTO shared_workflow (workflowId, projectId, role, createdAt, updatedAt) VALUES ('iO9xGILabwc4B9i1', 'gbVJDY2L7jLFYOHX', 'workflow:owner', '2025-05-04 02:23:04.398', '2025-05-04 02:23:04.398');
INSERT INTO shared_workflow (workflowId, projectId, role, createdAt, updatedAt) VALUES ('h0Vp95lVDp1XNJno', 'gbVJDY2L7jLFYOHX', 'workflow:owner', '2025-05-04 02:25:21.910', '2025-05-04 02:25:21.910');
INSERT INTO shared_workflow (workflowId, projectId, role, createdAt, updatedAt) VALUES ('KYqQYZoiGyncZDoR', 'gbVJDY2L7jLFYOHX', 'workflow:owner', '2025-05-04 18:24:40.074', '2025-05-04 18:24:40.074');
