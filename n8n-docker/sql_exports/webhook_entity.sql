create table webhook_entity
(
    workflowId  varchar(36) not null,
    webhookPath varchar     not null,
    method      varchar     not null,
    node        varchar     not null,
    webhookId   varchar,
    pathLength  integer,
    primary key (webhookPath, method)
);

create index idx_webhook_entity_webhook_path_method
    on webhook_entity (webhookId, method, pathLength);

