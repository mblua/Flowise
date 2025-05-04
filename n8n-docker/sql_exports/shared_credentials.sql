create table shared_credentials
(
    credentialsId varchar(36)                                                not null
        constraint FK_416f66fc846c7c442970c094ccf
            references credentials_entity
            on delete cascade,
    projectId     varchar(36)                                                not null
        constraint FK_812c2852270da1247756e77f5a4
            references project
            on delete cascade,
    role          text                                                       not null,
    createdAt     datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt     datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    primary key (credentialsId, projectId)
);

INSERT INTO shared_credentials (credentialsId, projectId, role, createdAt, updatedAt) VALUES ('SBmsMPezCXDA9tAs', 'gbVJDY2L7jLFYOHX', 'credential:owner', '2025-05-03 23:42:45.728', '2025-05-03 23:42:45.728');
INSERT INTO shared_credentials (credentialsId, projectId, role, createdAt, updatedAt) VALUES ('DhQr2s2uFtBQf31l', 'gbVJDY2L7jLFYOHX', 'credential:owner', '2025-05-04 02:33:44.043', '2025-05-04 02:33:44.043');
INSERT INTO shared_credentials (credentialsId, projectId, role, createdAt, updatedAt) VALUES ('jKPxFsKiRtSfyAXy', 'gbVJDY2L7jLFYOHX', 'credential:owner', '2025-05-04 02:38:21.519', '2025-05-04 02:38:21.519');
