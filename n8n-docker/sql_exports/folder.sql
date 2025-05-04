create table folder
(
    id             varchar(36)                                                not null
        primary key,
    name           varchar(128)                                               not null,
    parentFolderId varchar(36)
        constraint FK_804ea52f6729e3940498bd54d78
            references folder
            on delete cascade,
    projectId      varchar(36)                                                not null
        constraint FK_a8260b0b36939c6247f385b8221
            references project
            on delete cascade,
    createdAt      datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt      datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null
);

create unique index IDX_14f68deffaf858465715995508
    on folder (projectId, id);

