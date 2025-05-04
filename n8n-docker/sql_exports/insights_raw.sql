create table insights_raw
(
    id        integer                               not null
        primary key,
    metaId    integer                               not null
        constraint FK_6e2e33741adef2a7c5d66befa4e
            references insights_metadata
            on delete cascade,
    type      integer                               not null,
    value     integer                               not null,
    timestamp datetime(0) default CURRENT_TIMESTAMP not null
);

