drop table Oferta;
drop table Valoracion;
drop table Compra;
drop table Juego;
drop table Empresa;
drop table Consumidor;

create table Empresa(
	idEmpresa char(12),
	nombre char(20),
	telefono char(20),
	password char(20),
	email char(20),
	primary key (idEmpresa)
);

create table Consumidor(
	idConsumidor char(7),
	password char(20),
	email char(20),
	fechaNac date,
	apellidos char(20),
	nombre char(20),
	direccionFact char(20),
	tarjeta char(20) UNIQUE,
	primary key (idConsumidor)
);

create table Juego(
	id char(10),
	idEmpresa char(12),
	precio double,
	descripcion char(100),
	requisitos char(100),
	nombre char(100),
	primary key(id),
	foreign key (idEmpresa) references Empresa(idEmpresa)

);
create table Compra(
	idCompra char(5),
	idConsumidor char(7),
	id char(10),
	fechaCompra date,
	precioCompra float,
	descuento float,
	primary key (idCompra),
	foreign key(idConsumidor) references Consumidor(idConsumidor),
	foreign key(id) references Juego(id)
);

create table Oferta(
	idOferta char(7),
	id char(10),
	fechaFin date,
	descuento float,
	primary key (idOferta),
	foreign key(id) references Juego(id)
);
create table Valoracion(
	idValoracion char(9),
	idCompra char(5),
	fecha date,
	puntuacion int,
	comentario char(50),
	primary key (idValoracion),
	foreign key (idCompra) references Compra(idCompra)
);

insert into Empresa values('SQUARE', 'Square-Enix', '1234567', 'facil', 'facil@empresa');
insert into Empresa values('NINTENDO', 'Nintendo inc', '1234567', 'facil', 'facil@empresa');
insert into Empresa values('ROCKSTAR', 'RockStar Games', '1234567', 'facil', 'facil@empresa');
insert into Empresa values('EA', 'EA Games', '1234567', 'facil', 'facil@empresa');
insert into Empresa values('ACTIVISION', 'Activision', '1234567', 'facil', 'facil@empresa');
insert into Empresa values('UBISOFT', 'Ubisoft', '1234567', 'facil', 'facil@empresa');

insert into Consumidor values('123457', 'facil', 'facil@usuario', '1980-04-02', 'Garcia', 'Luis', 'Calle Serrano', '987654');
insert into Consumidor values('123458', 'facil', 'facil@usuario', '1990-03-02', 'Perez', 'Lorena', 'Calle Serrano', '947654');
insert into Consumidor values('123459', 'facil', 'facil@usuario', '2000-08-07', 'Smith', 'Kevin', 'Calle Serrano', '987634');
insert into Consumidor values('123450', 'facil', 'facil@usuario', '2001-03-08', 'Rodriguez', 'Alberto', 'Calle Serrano', '987214');

insert into Juego values('00000000', 'SQUARE', 89.99, 'Hitman3 El Agente 47 regresa en HITMAN3 el espectacular cierre del Mundo del asesinato','PC Interl i7','HITMAN 3');
insert into Juego values('00000001', 'ROCKSTAR', 19.99, 'GTA IV: El cuarto Grand Theft Auto vuelve a Liberty City la historia de Niko Belic','PC Intel i5','GTA IV');
insert into Juego values('00000002', 'ROCKSTAR', 9.99, 'GTA Vice City La historia es en 1986 en la ciudad de Vice City, protagonizada por Tommy Vercetti','PC Intel Pentium 3','GTA VC');
insert into Juego values('00000004', 'ROCKSTAR', 39.99, 'GTA V: Aventura de acción con multitud de misiones en la que encarnamos a tres personajes distintos','PC Intel i7','GTA V');
insert into Juego values('00000005', 'ROCKSTAR', 14.99, 'GTA San Andreas: El GTA de esta generación lleva la acción a la zona de California y Las Vegas','PC Intel Pentium 4','GTA SA');
insert into Juego values('00000006', 'UBISOFT', 59.99, 'Assassins Creed Vahalla: Ponte en la piel de una leyenda vikinga en busca de gloria.','PC Intel i5','Assassin VA');
insert into Juego values('00000007', 'ACTIVISION', 49.99, 'Call Of Duty WWII: Una experiencia sobrecogedora que redefine la Segunda Guerra Mundial','PC Intel i5','COD WW2');
insert into Juego values('00000008', 'NINTENDO', 29.99, 'SuperMario Odyssey: ¡Acompaña a Mario en un nuevo viaje inolvidable!','PC Intel i5','SM ODYSSEY');
insert into Juego values('00000009', 'NINTENDO', 29.99, 'The Legend of Zelda: Breath of the Wild te sumergirá en un mundo de descubrimiento','PC Intel i5','Zelda');

insert into Compra values('00000', '123457', '00000000', '2021-02-05', 89.99 ,null);
insert into Compra values('00001', '123457', '00000006', '2020-02-05', 49.99 ,null);

insert into Oferta values('000000', '00000001', '2021-10-12', 4.99);
insert into Oferta values('000001', '00000002', '2021-10-12', 1.99);
