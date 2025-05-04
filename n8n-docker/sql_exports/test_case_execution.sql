create table test_case_execution
(
    id                    varchar(36)                                                not null
        primary key,
    testRunId             varchar(36)                                                not null
        constraint FK_8e4b4774db42f1e6dda3452b2af
            references test_run
            on delete cascade,
    pastExecutionId       integer
        constraint FK_258d954733841d51edd826a562b
            references execution_entity
            on delete set null,
    executionId           integer
        constraint FK_e48965fac35d0f5b9e7f51d8c44
            references execution_entity
            on delete set null,
    evaluationExecutionId integer
        constraint FK_dfbe194e3ebdfe49a87bc4692ca
            references execution_entity
            on delete set null,
    status                varchar                                                    not null,
    runAt                 datetime(3),
    completedAt           datetime(3),
    errorCode             varchar,
    errorDetails          text,
    metrics               text,
    createdAt             datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt             datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null
);

create index IDX_8e4b4774db42f1e6dda3452b2a
    on test_case_execution (testRunId);

