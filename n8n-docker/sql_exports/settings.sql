create table settings
(
    key           TEXT                  not null
        primary key,
    value         TEXT    default ''    not null,
    loadOnStartup boolean default false not null
);

INSERT INTO settings (key, value, loadOnStartup) VALUES ('userManagement.isInstanceOwnerSetUp', 'true', 1);
INSERT INTO settings (key, value, loadOnStartup) VALUES ('ui.banners.dismissed', '["V1"]', 1);
INSERT INTO settings (key, value, loadOnStartup) VALUES ('features.ldap', '{"loginEnabled":false,"loginLabel":"","connectionUrl":"","allowUnauthorizedCerts":false,"connectionSecurity":"none","connectionPort":389,"baseDn":"","bindingAdminDn":"","bindingAdminPassword":"","firstNameAttribute":"","lastNameAttribute":"","emailAttribute":"","loginIdAttribute":"","ldapIdAttribute":"","userFilter":"","synchronizationEnabled":false,"synchronizationInterval":60,"searchPageSize":0,"searchTimeout":60}', 1);
INSERT INTO settings (key, value, loadOnStartup) VALUES ('features.sourceControl.sshKeys', '{"encryptedPrivateKey":"U2FsdGVkX19IpkBa5CtYX23i1dd67d6xqnx7sRKFSMcxXO13Cm9h6w5DOHbRzyC8iP3RYumjbJqBDAtCkjRmZPRzwkLLPghezGLGSbv2FS2HoFlORBPMG5T9rDpz/wvXrYSBvu92kArCtzqCfDpFC3Rwc8+1g2BBsGHqqfdQ4B6qnm9HUkDheaGATf5TtolXyJYAykU1YbFdKet5Ppjzkt5X+m8Jrv3pTjOmkZ3NNq4UgM5uC3OGSbUjsb5G1NiQbxTBZEkOCmt8aN94hqrM6eQOHCKdhxXkxerb/H+JNaFMAi86DdPNHq+apyg+Vvy3quis3/TQrnzc20wZ9O5ihCrWdW8bhuGTrSRr5to3IZLy1yvJJ9QWI8FxObXViTr47hFvUp4itTPTEdeg3/Msp9LcLu15ClA/YZgyM4brbOjvmQ+pZMbm087fikkGEeK/go31GvBI+MMcOZ5uP9uaGypPQZnJWCB8ayAzdfXP1ZxHkXB9TGsl2IWgH7p+MATHrRRQACGuGO/BP70rL77xsbca9QWaXpyb3qB74mDlcRRaGb9tIwCru3PF5nlOP3zz","publicKey":"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICxuIZYY4/mwXuHulrMi5BHlhcucu8rOM1XgO7I/QUIJ n8n deploy key"}', 1);
INSERT INTO settings (key, value, loadOnStartup) VALUES ('features.sourceControl', '{"branchName":"main","keyGeneratorType":"ed25519"}', 1);
