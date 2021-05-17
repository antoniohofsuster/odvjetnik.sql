drop database if exists odvjetnik1;


create database odvjetnik1;
use odvjetnik1;


create table osoba(
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	oib char(11)
);

create table odvjetnik(
	sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(50)
);

create table klijent(
	sifra int not null primary key auto_increment,
	osoba int not null,
	datum_rodjenja date
);

create table usluge_obrane(
	sifra int not null primary key auto_increment,
	naziv_sudskog_procesa varchar(50),
	opis varchar(200),
	cijena decimal(14,2)
);

create table sudska_rasprava(
	klijent int not null,
	odvjetnik int not null,
	usluge_obrane int not null
);

create table suradnik(
	sifra int not null primary key auto_increment,
	osoba int not null,
	usluge_obrane int not null
);


alter table odvjetnik add foreign key (osoba) references osoba(sifra);

alter table klijent add foreign key (osoba) references osoba(sifra);

alter table sudska_rasprava add foreign key (odvjetnik) references odvjetnik(sifra);

alter table sudska_rasprava add foreign key (klijent) references klijent(sifra);

alter table sudska_rasprava add foreign key (usluge_obrane) references usluge_obrane(sifra);

alter table suradnik add foreign key (usluge_obrane) references usluge_obrane(sifra);

alter table suradnik add foreign key (osoba) references osoba(sifra);

 


	
	
	