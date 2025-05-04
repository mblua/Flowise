create table execution_annotations
(
    id          integer                                                    not null
        primary key autoincrement,
    executionId integer                                                    not null
        constraint FK_97f863fa83c4786f19565084960
            references execution_entity
            on delete cascade,
    vote        varchar(6),
    note        text,
    createdAt   datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt   datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null
);

create unique index IDX_97f863fa83c4786f1956508496
    on execution_annotations (executionId);

