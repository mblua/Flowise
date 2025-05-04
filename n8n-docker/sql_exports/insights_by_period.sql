create table insights_by_period
(
    id          integer not null
        primary key,
    metaId      integer not null
        constraint FK_6414cfed98daabbfdd61a1cfbc0
            references insights_metadata
            on delete cascade,
    type        integer not null,
    value       integer not null,
    periodUnit  integer not null,
    periodStart datetime(0) default CURRENT_TIMESTAMP
);

create unique index IDX_60b6a84299eeb3f671dfec7693
    on insights_by_period (periodStart, type, periodUnit, metaId);

