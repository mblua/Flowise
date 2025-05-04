create table installed_nodes
(
    name          char(200) not null
        primary key,
    type          char(200) not null,
    latestVersion INTEGER default 1,
    package       char(214) not null
        references installed_packages
            on update cascade on delete cascade
);

