create table execution_metadata
(
    id          integer      not null
        primary key autoincrement,
    executionId integer      not null
        constraint FK_31d0b4c93fb85ced26f6005cda3
            references execution_entity
            on delete cascade,
    key         varchar(255) not null,
    value       text         not null
);

create unique index IDX_cec8eea3bf49551482ccb4933e
    on execution_metadata (executionId, key);

