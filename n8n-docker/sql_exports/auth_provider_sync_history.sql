create table auth_provider_sync_history
(
    id           INTEGER
        primary key autoincrement,
    providerType VARCHAR(32) not null,
    runMode      TEXT        not null,
    status       TEXT        not null,
    startedAt    DATETIME    not null,
    endedAt      DATETIME    not null,
    scanned      INTEGER     not null,
    created      INTEGER     not null,
    updated      INTEGER     not null,
    disabled     INTEGER     not null,
    error        TEXT
);

