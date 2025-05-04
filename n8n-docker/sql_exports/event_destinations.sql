create table event_destinations
(
    id          varchar(36)                                                    not null
        primary key,
    destination text                                                           not null,
    createdAt   datetime(3) default 'STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')' not null,
    updatedAt   datetime(3) default 'STRFTIME(''%Y-%m-%d %H:%M:%f'', ''NOW'')' not null
);

