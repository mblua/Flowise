create table annotation_tag_entity
(
    id        varchar(16)                                                not null
        primary key,
    name      varchar(24)                                                not null,
    createdAt datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null
);

create unique index IDX_ae51b54c4bb430cf92f48b623f
    on annotation_tag_entity (name);

