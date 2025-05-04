create table user
(
    id                     varchar
        primary key,
    email                  VARCHAR(255)
        unique,
    firstName              VARCHAR(32),
    lastName               VARCHAR(32),
    password               VARCHAR,
    personalizationAnswers TEXT,
    createdAt              DATETIME(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    updatedAt              DATETIME(3) default (STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW')) not null,
    settings               TEXT,
    disabled               BOOLEAN     default FALSE                                  not null,
    mfaEnabled             BOOLEAN     default FALSE                                  not null,
    mfaSecret              TEXT,
    mfaRecoveryCodes       TEXT,
    role                   TEXT                                                       not null
);

INSERT INTO user (id, email, firstName, lastName, password, personalizationAnswers, createdAt, updatedAt, settings, disabled, mfaEnabled, mfaSecret, mfaRecoveryCodes, role) VALUES ('6adcf742-22ae-4c9f-8764-5118fd9b0e55', 'mariano.blua@gmail.com', 'Mariano', 'Blua', '$2a$10$Zif.5aQ/nvw6XELt7b2UAOFQzvNIuR3eJ5AjJ3t9irrpjWD0LVzli', '{"version":"v4","personalization_survey_submitted_at":"2025-05-03T23:39:43.205Z","personalization_survey_n8n_version":"1.90.2","companyType":"personal","reportedSource":"youtube"}', '2025-05-03 23:38:22.787', '2025-05-04 02:23:04.630', '{"userActivated":false,"easyAIWorkflowOnboarded":true}', 0, 0, null, null, 'global:owner');
