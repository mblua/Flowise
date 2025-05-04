create table test_run
(
    id               varchar(36)                                                not null
        primary key,
    testDefinitionId varchar(36)                                                not null
        constraint FK_3a81713a76f2295b12b46cdfcab
            references test_definition
            on delete cascade,
    status           varchar                                                    not null,
    runAt            datetime(3),
    completedAt      datetime(3),
    metrics          text,
    createdAt        datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt        datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    totalCases       INT,
    passedCases      INT,
    failedCases      INT,
    errorCode        VARCHAR(255),
    errorDetails     TEXT,
    check (CASE
               WHEN status = 'new' THEN "failedCases" IS NULL
               WHEN status in ('cancelled', 'error') THEN "failedCases" IS NULL OR "failedCases" >= 0
               ELSE "failedCases" >= 0
        END),
    check (CASE
               WHEN status = 'new' THEN "passedCases" IS NULL
               WHEN status in ('cancelled', 'error') THEN "passedCases" IS NULL OR "passedCases" >= 0
               ELSE "passedCases" >= 0
        END),
    check (CASE
               WHEN status = 'new' THEN "totalCases" IS NULL
               WHEN status in ('cancelled', 'error') THEN "totalCases" IS NULL OR "totalCases" >= 0
               ELSE "totalCases" >= 0
        END)
);

create index IDX_3a81713a76f2295b12b46cdfca
    on test_run (testDefinitionId);

