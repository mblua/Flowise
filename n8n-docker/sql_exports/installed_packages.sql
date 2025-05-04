create table installed_packages
(
    packageName      char(214)                                                      not null
        primary key,
    installedVersion char(50)                                                       not null,
    authorName       char(70),
    authorEmail      char(70),
    createdAt        datetime(3) default 'STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')' not null,
    updatedAt        datetime(3) default 'STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')' not null
);

