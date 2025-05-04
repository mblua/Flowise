create table auth_identity
(
    userId       VARCHAR(36)
        references user,
    providerId   VARCHAR(64)                         not null,
    providerType VARCHAR(32)                         not null,
    createdAt    timestamp default CURRENT_TIMESTAMP not null,
    updatedAt    timestamp default CURRENT_TIMESTAMP not null,
    primary key (providerId, providerType)
);

