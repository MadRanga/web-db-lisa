drop table RouteLinker;
drop table Users;
drop table Routes;
drop table Stops;

create table Users (
	username varchar(30) primary key,
	password varchar(30),
	roles varchar(64) not null,
	constraint usernameLength check (length(username) >= 4),
	constraint passwordLength check (length(password) >= 8)
);

create table Routes (
	id varchar(6) primary key,
	routeName varchar(31) not null
);

create table Stops (
	stopNo varchar(6),
	interchange number(1),
	streetNo varchar(7),
	streetName varchar(40),
	suburb varchar(31),
	postcode varchar(4),
	primary key (stopNo, streetName, suburb)
);

create table RouteLinker (
	routeId varchar(6) references Routes(id),
	stopNo varchar(6),
	streetName varchar(40),
	suburb varchar(31),
	time number(3),
	stopsOrder number(3),
	foreign key (stopNo, streetName, suburb) references Stops(stopNo, streetName, suburb)
);

commit;