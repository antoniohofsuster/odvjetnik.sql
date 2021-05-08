drop database if exists odvjetnik;
create database odvjetnik;
use odvjetnik;
create table osoba(
	sifra int not null primary key auto_increment,
	ime varchar(30) not null,
	prezime varchar(30) not null
);
create table odvjetnik(
	sifra int not null primary key auto_increment,
	ime varchar(30) not null,
	prezime varchar(30) not null,
	iban varchar(40) not null
);
create table klijent(
	sifra int not null primary key auto_increment,
	osoba int not null
);
create table usluge obrane(
	sifra int not null primary key auto_increment,
	opis varchar(200),
	cijena decimal(14,2)
);
create table sudska rasprava(
	klijent int not null,
	odvjetnik int not null,
	usluga obrane int not null
);

alter table odvjetnik
	add foreign key (osoba) references osoba(sifra);
	
alter table klijent
	add foreign key osoba references osoba(sifra);
	
alter table sudska rasprava
	add foreign key (klijent) references klijent(sifra);

alter table sudska rasprava
	add foreign key (odvjetnik) references odvjetnik(sifra);

alter table sudska rasprava
	add foreign key (usluge obrane) references usluge obrane(sifra);

