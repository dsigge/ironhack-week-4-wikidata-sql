create table wikipedia_date (
month datetime primary key,
YEAR INT
);

alter table wikipedia_data_de add foreign key (month) references wikipedia_date(month);

alter table wikipedia_data_en add foreign key (month) references wikipedia_date(month);

alter table wikipedia_data_fr add foreign key (month) references wikipedia_date(month);