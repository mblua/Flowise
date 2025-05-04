create table execution_annotation_tags
(
    annotationId integer     not null
        constraint FK_c1519757391996eb06064f0e7c8
            references execution_annotations
            on delete cascade,
    tagId        varchar(24) not null
        constraint FK_a3697779b366e131b2bbdae2976
            references annotation_tag_entity
            on delete cascade,
    primary key (annotationId, tagId)
);

create index IDX_a3697779b366e131b2bbdae297
    on execution_annotation_tags (tagId);

create index IDX_c1519757391996eb06064f0e7c
    on execution_annotation_tags (annotationId);

