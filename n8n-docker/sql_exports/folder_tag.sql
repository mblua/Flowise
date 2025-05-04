create table folder_tag
(
    folderId varchar(36) not null
        constraint FK_94a60854e06f2897b2e0d39edba
            references folder
            on delete cascade,
    tagId    varchar(36) not null
        constraint FK_dc88164176283de80af47621746
            references tag_entity
            on delete cascade,
    primary key (folderId, tagId)
);

