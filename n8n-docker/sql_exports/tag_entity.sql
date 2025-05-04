create table tag_entity
(
    id        varchar(36)                                                not null
        primary key,
    name      varchar(24)                                                not null,
    createdAt datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null
);

create unique index IDX_8f949d7a3a984759044054e89b
    on tag_entity (name);

