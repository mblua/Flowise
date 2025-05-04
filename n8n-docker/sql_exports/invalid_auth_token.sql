create table invalid_auth_token
(
    token     varchar(512) not null
        primary key,
    expiresAt datetime(3)  not null
);

