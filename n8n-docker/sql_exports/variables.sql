create table variables
(
    id    varchar(36)           not null
        primary key,
    key   TEXT                  not null
        unique,
    type  TEXT default 'string' not null,
    value TEXT
);

create unique index idx_variables_key
    on variables (key);

