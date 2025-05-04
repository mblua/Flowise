create table user_api_keys
(
    id        varchar(36)                                                not null
        primary key,
    userId    varchar                                                    not null
        constraint FK_e131705cbbc8fb589889b02d457
            references user
            on delete cascade,
    label     varchar(100)                                               not null,
    apiKey    varchar                                                    not null
        constraint UQ_1ef35bac35d20bdae979d917a36
            unique,
    createdAt datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt datetime(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    scopes    text,
    constraint UQ_63d7bbae72c767cf162d459fccd
        unique (userId, label)
);

