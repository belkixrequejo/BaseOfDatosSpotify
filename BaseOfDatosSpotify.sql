create database Spotify;
use Spotify;

create table Rol(
Id_Rol int not null auto_increment,
Nombre varchar(50),
primary key(Id_Rol)
)engine=InnoDB;

create table Login(
Id_Login int not null auto_increment,
Correo_Electronico varchar(50),
Password_U varchar(50),
Reset_Password varchar(50),
primary key(Id_Login)
)engine=InnoDB;

create table Restricion(
Id_Restricion int not null auto_increment,
Nombre_Restricion varchar(50),
Descripcion_Restricion varchar(100),
Id_Rol int not null,
primary key(Id_Restricion),
constraint Id_Rol foreign key(Id_Rol) references Rol(Id_Rol)
);

create table Usuario(
Id_Usuario int not null auto_increment,
Nombre_Usuario varchar(50),
Apellido_Usuario varchar(50),
Fecha_Creacion date,
Id_Rol int not null,
Foto blob not null,
Id_Login int not null,
primary key(Id_Usuario),
constraint Id_Rols foreign key(Id_Rol) references Rol(Id_Rol),
constraint Id_Login foreign key(Id_Login) references Login(Id_Login)
)engine=InnoDB;

create table Seguidor(
Id_Seguidor int not null auto_increment,
Id_Usuario int not null,
primary key(Id_Seguidor),
constraint Id_Usuarios foreign key(Id_Usuario) references Usuario(Id_Usuario)
)engine=InnoDB;

create table Lista_Reproduccion(
Id_LR int not null auto_increment,
Nombre_LR varchar(50),
Id_Usuario int not null,
primary key(Id_LR),
constraint Id_User foreign key(Id_Usuario) references Usuario(Id_Usuario)
)engine=InnoDB;

create table Pago(
Id_Pago int not null auto_increment,
Id_Usuario int not null,
Nombre_PTarjeta varchar(100),
Numero_Tarjeta varchar(20),
Fecha_Vencimiento date,
codigo_Seguridad_ varchar(3),
primary key(Id_Pago),
constraint Id_Users foreign key(Id_Usuario) references Usuario(Id_Usuario)
);

create table Artistas(
Id_Artista int not null auto_increment,
Nombre_Artista varchar(50),
Apellido_Artista varchar(50),
Nombre_Artistico varchar(100),
Fecha_Nacimiento date,
Nacionalidad varchar(50),
Genero varchar(50),
NumeroSeguidores integer not null,
Foto blob not null,
primary key(Id_Artista)
)engine=InnoDB;
select*from Artistas;

create table Disco(
Id_Disco int not null auto_increment,
Nombre_Disco varchar(50),
N_Canciones int,
Id_Artista int not null,
Fecha_Lansamiento date,
Descripcion_Disco varchar(50),
primary key(Id_Disco),
constraint Id_Artista foreign key(Id_Artista) references Artistas(Id_Artista)
)engine=InnoDB;

create table Cancion(
Id_Cancion int not null auto_increment,
Nombre_Cancion varchar(50),
Numero_Visitas int not null,
Duracion_Cancion int not null,
Descripcion_Cancion varchar(50),
primary key(Id_Cancion),
Id_Disco int not null,
constraint Id_Disco foreign key(Id_Disco) references Disco(Id_Disco)
)engine=InnoDB;

create table Sugerencia_Canciones(
Id_Sugerencia int not null auto_increment,
Nombre_Sugerencia varchar(60),
Id_LR int not null,
Id_Cancion int not null,
primary key(Id_Sugerencia),
constraint Id_LR foreign key(Id_LR) references Lista_Reproduccion(Id_LR),
constraint Id_CancionS foreign key(Id_Cancion) references Cancion(Id_Cancion)
);

create table Favorito(
Id_Favorito int not null auto_increment,
Id_Usuario int not null,
Id_Cancion int not null,
primary key(Id_Favorito),
constraint Id_Usuario foreign key(Id_Usuario) references Usuario(Id_Usuario),
constraint Id_Cancion foreign key(Id_Cancion) references Cancion(Id_Cancion)
);
USE Spotify;
create table Cancion_Escuchada(
Id_CE int not null auto_increment,
Duracion_CE time,
Id_Usuario int not null,
Id_Cancion int not null,
primary key(Id_CE),
constraint Id_Usuario_CE foreign key(Id_Usuario) references Usuario(Id_Usuario),
constraint Id_Cancion_CE foreign key(Id_Cancion) references Cancion(Id_Cancion)
);

create table Auditoria(
Id_Auditoria int not null auto_increment,
Procedimiento varchar(50),
Entrada time,
Salida time,
primary key(Id_Auditoria)
)engine=InnoDB;

USE Spotify;
insert into Rol(Nombre)
VALUES('Invitado');
insert into Rol ( Nombre) 
values ( 'Premiun');
insert into Rol ( Nombre) 
values ('Administrador');
insert into Rol (Nombre) 
values ('Artista');
USE Spotify;
select * from Rol;
USE Spotify;
alter table Auditoria modify Entrada datetime;
alter table Auditoria modify Salida datetime;
ALTER TABLE Auditoria ADD Id_Usuario int ;
USE Spotify;
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (1, 'tdulanty0@topsy.com', 'd2nLXbZ2', 'd2nLXbZ2');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (2, 'hbesset1@paginegialle.it', '3XjJ6kW7k', '3XjJ6kW7k');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (3, 'bdunk2@ibm.com', 'rukE6XC3bC', 'rukE6XC3bC');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (4, 'mwipfler3@miibeian.gov.cn', 'n6vbnWjBBINA', 'n6vbnWjBBINA');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (5, 'osincock4@hao123.com', 'svMPeayeAQwW', 'svMPeayeAQwW');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (6, 'bbrosoli5@stumbleupon.com', 'Wkke5kz9fNH', 'Wkke5kz9fNH');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (7, 'psherme6@cafepress.com', 'K8p1Yv57ToS', 'K8p1Yv57ToS');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (8, 'kgregan7@amazon.de', 'ETB0CQPQb', 'ETB0CQPQb');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (9, 'araven8@youtube.com', 'RQ3AXl8PFiw', 'RQ3AXl8PFiw');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (10, 'nchat9@symantec.com', '5jlo68', '5jlo68');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (11, 'vsparkwella@engadget.com', 'YXJMKr', 'YXJMKr');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (12, 'vangellb@netlog.com', '88RaittA0aoO', '88RaittA0aoO');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (13, 'lpaylorc@google.it', 'FZlZ6WhJIhF', 'FZlZ6WhJIhF');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (14, 'dondrasekd@weibo.com', 'adUYnyYAurDm', 'adUYnyYAurDm');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (15, 'tbeazleighe@cbslocal.com', 'U08wvaHW', 'U08wvaHW');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (16, 'hawdryf@deviantart.com', 'UqLRrCkM', 'UqLRrCkM');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (17, 'kwarrickerg@mapy.cz', 'rW0fLMuf6EhJ', 'rW0fLMuf6EhJ');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (18, 'etadlowh@g.co', 's98SS43B3w', 's98SS43B3w');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (19, 'mrubenovi@joomla.org', '3oxIZNq', '3oxIZNq');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (20, 'wnicolj@liveinternet.ru', 'E9C0e4FYTtc', 'E9C0e4FYTtc');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (21, 'mferryk@cocolog-nifty.com', 'wHVmlyBLYQ6', 'wHVmlyBLYQ6');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (22, 'jpopleel@opensource.org', 'bVwQi3zN8', 'bVwQi3zN8');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (23, 'phigfordm@fc2.com', 'dpigw9bLMe', 'dpigw9bLMe');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (24, 'cdegiorgion@dell.com', '4irKne', '4irKne');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (25, 'cleggato@people.com.cn', 'Z2YxIBI93oxc', 'Z2YxIBI93oxc');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (26, 'dlancetterp@etsy.com', 'VpgZW9', 'VpgZW9');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (27, 'koyleyq@amazon.de', 'dxllO8Q0o', 'dxllO8Q0o');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (28, 'bmabbottr@nyu.edu', 'gfyq6gEAJb', 'gfyq6gEAJb');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (29, 'epeppards@1und1.de', 'YjMn8d', 'YjMn8d');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (30, 'msperskit@smugmug.com', 'cMMiqwsxl3J', 'cMMiqwsxl3J');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (31, 'vverekeru@drupal.org', '59xw98', '59xw98');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (32, 'vharstonv@twitter.com', 'nbX3OpeR', 'nbX3OpeR');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (33, 'llutmanw@columbia.edu', 'U1hdKPOli6', 'U1hdKPOli6');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (34, 'ekeelingex@wordpress.org', 'k02KKxrLQr', 'k02KKxrLQr');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (35, 'mvannary@ebay.com', 'MnGOrUQOZpM', 'MnGOrUQOZpM');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (36, 'aphillipsonz@furl.net', 'JwtYf9BUy', 'JwtYf9BUy');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (37, 'msprouls10@omniture.com', 'CQJQuFz', 'CQJQuFz');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (38, 'jpaolini11@cloudflare.com', 'UeMP1htsB8', 'UeMP1htsB8');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (39, 'dhubberstey12@scribd.com', 'qleVQ1cvn', 'qleVQ1cvn');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (40, 'hwanley13@bing.com', 'Ii9wQFMpOK3', 'Ii9wQFMpOK3');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (41, 'rbidder14@usgs.gov', 'puSvrL3c', 'puSvrL3c');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (42, 'acaghy15@mayoclinic.com', '9dVMcf9tq', '9dVMcf9tq');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (43, 'jsurfleet16@wordpress.com', 'rptc3WAB', 'rptc3WAB');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (44, 'bbelshaw17@arizona.edu', 'QfbWSVSPr', 'QfbWSVSPr');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (45, 'kmation18@ustream.tv', 'Fp1PCKjeenJg', 'Fp1PCKjeenJg');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (46, 'pbertenshaw19@is.gd', '1l71dhw', '1l71dhw');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (47, 'sseathwright1a@forbes.com', 'qLNXURPjqILb', 'qLNXURPjqILb');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (48, 'gnemchinov1b@phoca.cz', '4IgAdSQKG', '4IgAdSQKG');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (49, 'asibbert1c@pcworld.com', 'CpFMJmo9', 'CpFMJmo9');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (50, 'vdinsale1d@blogtalkradio.com', 'fErotS62e', 'fErotS62e');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (51, 'mmowat1e@prnewswire.com', 'csE8Lgy', 'csE8Lgy');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (52, 'awallman1f@skyrock.com', 'l0wsqswTOZH', 'l0wsqswTOZH');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (53, 'chofner1g@shinystat.com', 'CAHKHBJTuFn', 'CAHKHBJTuFn');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (54, 'dburgan1h@weibo.com', 'OBrriFi', 'OBrriFi');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (55, 'tsabie1i@nba.com', 'Fs2kneAAIdoR', 'Fs2kneAAIdo');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (56, 'dsavery1j@google.fr', 'PKqnYdV9XZ', 'PKqnYdV9XZ');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (57, 'jfarndon1k@nymag.com', '8TnbSeDHwH', '8TnbSeDHwH');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (58, 'ckingaby1l@accuweather.com', 'no9Zxt', 'no9Zxt');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (59, 'sadamthwaite1m@godaddy.com', 'yaB6tM', 'yaB6tM');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (60, 'ssponer1n@bing.com', 'iShjYkQJMgKY', 'iShjYkQJMgKY');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (61, 'gdilnot1o@ow.ly', 'ZzKuUE69v', 'ZzKuUE69v');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (62, 'kfant1p@ycombinator.com', 'OpqOL2KAykO', 'OpqOL2KAykO');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (63, 'bwilliment1q@amazon.co.uk', 'AMlAgZBEfVb', 'AMlAgZBEfVb');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (64, 'zdarke1r@google.com.hk', '794fHCT', '794fHCT');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (65, 'jsinderland1s@photobucket.com', 'nNjgtZc', 'nNjgtZc');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (66, 'kpriestner1t@washington.edu', 'OSy4iGA7ixKn', 'OSy4iGA7ixKn');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (67, 'kcowland1u@about.me', 'TqFFj5Y', 'TqFFj5Y');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (68, 'lleverette1v@infoseek.co.jp', 'sUXjFsB', 'sUXjFsB');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (69, 'tdudson1w@mapy.cz', 'KBCcT1G', 'KBCcT1G');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (70, 'lloade1x@elegantthemes.com', 'Qy6vCd8zK', 'Qy6vCd8zK');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (71, 'abladesmith1y@businesswire.com', 'UGgy3Vkrdv', 'UGgy3Vkrdv');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (72, 'bdongles1z@nasa.gov', 'hIIUV0LbgJiC', 'hIIUV0LbgJiC');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (73, 'mmetterick20@dagondesign.com', 'VJXrwAg', 'VJXrwAg');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (74, 'clum21@amazon.com', 'gwuFt9tkfOpK', 'gwuFt9tkfOpK');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (75, 'dstrathe22@ca.gov', 'q8JOmps', 'q8JOmps');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (76, 'rstichel23@deviantart.com', 'OzogdUdoMR', 'OzogdUdoMR');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (77, 'dditty24@biglobe.ne.jp', 'IekmZoTk', 'IekmZoTk');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (78, 'jbehne25@springer.com', 'jWLITuOY', 'jWLITuOY');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (79, 'anorthwood26@joomla.org', 'xHrnlX9Vp5', 'xHrnlX9Vp5');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (80, 'avanderweedenburg27@theatlantic.com', 'wppvPxaSV', 'wppvPxaSV');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (81, 'rkliesl28@imageshack.us', 'ciK6WVtY', 'ciK6WVtY');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (82, 'dharrowing29@ustream.tv', 'zM4KmsP', 'zM4KmsP');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (83, 'aoneill2a@zimbio.com', 'ZW3VNm1Zs', 'ZW3VNm1Zs');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (84, 'abachshell2b@dyndns.org', 'mmaP2cUByr1f', 'mmaP2cUByr1f');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (85, 'opo2c@theguardian.com', 'uo9g3gB', 'uo9g3gB');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (86, 'lknocker2d@about.com', 'blEdJG7HkX', 'blEdJG7HkX');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (87, 'btick2e@omniture.com', 'M3FHsj', 'M3FHsj');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (88, 'scurreen2f@hubpages.com', 'Wvhqhw', 'Wvhqhw');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (89, 'ttirrell2g@reference.com', 'QQMJEj0iPco', 'QQMJEj0iPco');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (90, 'jvoas2h@bing.com', 'SkCyfB', 'SkCyfB');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (91, 'afarndale2i@ocn.ne.jp', 'fWsTHjW6yBG', 'fWsTHjW6yBG');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (92, 'spurshouse2j@simplemachines.org', 'XBOwPnBpIG4z', 'XBOwPnBpIG4z');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (93, 'kskerme2k@shutterfly.com', 'zwKtpsBZ', 'zwKtpsBZ');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (94, 'gmiguet2l@nature.com', 'm8CJgeZYdqd', 'm8CJgeZYdqd');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (95, 'skemwall2m@chronoengine.com', 'fdno5j1dmWeO', 'fdno5j1dmWeO');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (96, 'btern2n@engadget.com', 'WyT26WAX', 'WyT26WAX');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (97, 'amarlen2o@yellowpages.com', 'sGTjMnGiT', 'sGTjMnGiT');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (98, 'pdilkes2p@1688.com', 'o9s225CnTOd', 'o9s225CnTOd');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (99, 'dcathro2q@tripadvisor.com', 'MIw1EdReapaS', 'MIw1EdReapaS');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password) values (100, 'tosullivan2r@flavors.me', 'cdIMLtE', 'cdIMLtE');
select * from Restricion;

USE Spotify;
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (1, 'Cardify', 'Unspecified injury of muscle', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (2, 'Fix San', 'Other osteonecrosis of radius', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (3, 'Duobam', 'Unspecified open wound of forearm', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (4, 'Veribet', 'Unspecified juvenile rheumatoid ', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (5, 'Toughjoyfax', 'Unspecified internal', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (6, 'Greenlam', 'Nondisplaced comminuted s', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (7, 'Mat Lam Tam', 'Luxation of globe, bilateral', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (8, 'Rank', 'Band keratopathy, right eye', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (9, 'Mat Lam Tam', 'Nondisplaced segmental ', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (10, 'Tampflex', 'Other injury due to accident ', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (11, 'Opela', 'Displaced fracture of acromial', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (12, 'Flowdesk', 'Unspecified injury of axillary ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (13, 'Zaam-Dox', 'Rheumatoid arthritis without ', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (14, 'Greenlam', 'Subluxation and dislocation ', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (15, 'Sonsing', 'Other displaced fracture of upper ', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (16, 'Bamity', 'Minor laceration of femoral vein at hip ,', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (17, 'Duobam', 'Burn of unspecified degree of left ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (18, 'Temp', 'Laceration with foreign body of penis', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (19, 'Alphazap', 'Acute bronchitis due to Hemophilus ', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (20, 'Konklux', 'Puncture wound without foreign body l', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (21, 'Lotstring', 'Displaced fracture of lateral ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (22, 'Quo Lux', 'Nondisplaced fracture of medial', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (23, 'Flexidy', 'Unspecified injury of blood vessel r', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (24, 'Viva', 'Burn of unspecified degree of buttock', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (25, 'Veribet', 'Other injury of superior mesenteric ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (26, 'Zontrax', 'Nondisplaced fracture of lateral ', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (27, 'Daltfresh', 'Poisoning by antiviral drugs', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (28, 'Biodex', 'Unspecified sprain of left elbow, sequela', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (29, 'Rank', 'Unspecified injury of liver', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (30, 'Pannier', 'Discitis, unspecified, cervical region', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (31, 'Fixflex', 'Posterior dislocation of left acromioclavicular joint', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (32, 'Zaam-Dox', 'Injury of acoustic nerve, left side', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (33, 'Duobam', 'Burn of first degree of left wrist, initial encounter', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (34, 'Bigtax', 'Other subluxation of right patella, sequela', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (35, 'Gembucket', 'Burn of first degree of right forearm, sequela', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (36, 'Latlux', 'Unspecified fracture of unspecified acetabulum', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (37, 'Stim', 'Panic disorder [episodic paroxysmal anxiety] ', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (38, 'Cardguard', 'Terrorism involving other explosions', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (39, 'Redhold', 'Nondisplaced fracture of base of other ', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (40, 'Wrapsafe', 'Displaced transverse fracture of shaft ', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (41, 'Prodder', 'Unspecified fracture of shaft of right ulna', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (42, 'Transcof', 'Adverse effect of angiotensin-convertings', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (43, 'Regrant', 'Injury of carotid artery of neck', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (44, 'Pannier', 'Nondisplaced fracture of shaft of second metacarpal bone', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (45, 'Lotstring', 'Unspecified injury of unspecified blood ', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (46, 'Biodex', 'Other fracture of shaft of unspecified tibia', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (47, 'Prodder', 'Hemiplegia and hemiparesis following ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (48, 'Fix San', 'Homonymous bilateral field defects', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (49, 'Bigtax', 'Underdosing of thrombolytic drugs', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (50, 'Job', 'Nondisplaced unspecified fracture of unspecified ', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (51, 'Ronstring', 'Corrosion of second degree of right thigh', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (52, 'Home Ing', 'Fall into other water striking bottom', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (53, 'Hatity', 'Other specified injuries of left elbow, subsequent encounter', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (54, 'Zamit', 'Underdosing of other hormones and synthetic ', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (55, 'Zoolab', 'Pressure ulcer of contiguous site of back', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (56, 'Matsoft', 'Cyclical vomiting, not intractable', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (57, 'Rank', 'Corrosion of third degree of shoulder and upper', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (58, 'Keylex', 'Adverse effect of other narcotics', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (59, 'Regrant', 'Unspecified injury of other flexor muscle', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (60, 'Konklux', 'Nondisplaced segmental fracture of shaft ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (61, 'Lotlux', 'Fall from babystroller, initial encounter', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (62, 'Regrant', 'Subsequent non-ST elevation (NSTEMI) ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (63, 'Sonair', 'Poisoning by vitamins, assault, sequela', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (64, 'Latlux', 'Nondisplaced comminuted fracture of right patellar ', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (65, 'Konklab', 'Nondisplaced transverse fracture of shaft of humerus', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (66, 'Stronghold', 'Subluxation of distal interphalangeal joint ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (67, 'Duobam', 'Pre-existing hypertensive chronic kidney disease ', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (68, 'Asoka', 'War operations involving friendly fire', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (69, 'Tin', 'Injury of plantar artery of foot', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (70, 'Zamit', 'Radiological procedure and radiotherapy as the cause ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (71, 'Tres-Zap', 'Burn of unspecified degree of unspecified wrist', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (72, 'Namfix', 'Pain in hip', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (73, 'Stim', 'Abnormal cytological findings in specimens ', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (74, 'Alpha', 'Toxic effect of unspecified spider venom', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (75, 'Zathin', 'Glossitis', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (76, 'Alpha', 'Breakdown (mechanical) of other ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (77, 'Vagram', 'Pedestrian on foot injured r', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (78, 'Stringtough', 'Exposure to industrial wiring', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (79, 'Matsoft', 'Burn of unspecified degree  ', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (80, 'Sonsing', 'Postthrombotic syndrome with ', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (81, 'Tin', 'Fracture of humerus following insertiont', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (82, 'Vagram', 'Nondisplaced articular fracture ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (83, 'Span', 'Intermittent hydrarthrosis, left hip', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (84, 'Opela', 'Nondisplaced fracture of left ulna ', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (85, 'Sonair', 'Poisoning by saline and osmotic', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (86, 'Gembucket', 'Stress fracture, left hand', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (87, 'Bitchip', 'Age-related osteoporosis with current ', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (88, 'Trippledex', 'Encounter for routine  ', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (89, 'Overhold', 'Displaced comminuted fracture m', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (90, 'Zathin', 'Puncture wound with ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (91, 'Zathin', 'External constriction ', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (92, 'Sub-Ex', 'Contact with hot drinks', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (93, 'Prodder', 'Lumbar spina bifida without', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (94, 'Prodder', 'Acute hematogenous osteomyelitis', 4);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (95, 'Cookley', 'Complete traumatic amputation  ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (96, 'Prodder', 'Encounter for supervision ', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (97, 'Bamity', 'Unspecified injury of greater saphenous vein ', 2);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (98, 'Bitwolf', 'Other fracture of second thoracic vertebra', 3);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (99, 'Bamity', 'Injury, poisoning and certain  ', 1);
insert into Restricion (Id_Restricion , Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (100, 'Transcof', 'Other secondary chronic gout', 2);
select * from Usuario;

USE Spotify;
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (1, 'Corette', 'Royall', '2020-05-04', 1, 'http://dummyimage.com/223x152.bmp/ff4444/ffffff', 1);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (2, 'Marie-ann', 'Dietmar', '2019-09-17', 2, 'http://dummyimage.com/225x240.png/cc0000/ffffff', 2);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (3, 'Hedi', 'Riddles', '2019-07-25', 3, 'http://dummyimage.com/141x205.png/5fa2dd/ffffff', 3);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (4, 'Chilton', 'Scutts', '2019-12-19', 4, 'http://dummyimage.com/143x243.jpg/dddddd/000000', 4);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (5, 'Johnathon', 'McIntosh', '2019-11-21', 1, 'http://dummyimage.com/193x230.bmp/ff4444/ffffff', 5);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (6, 'Carina', 'Hovel', '2019-09-28', 2, 'http://dummyimage.com/168x208.png/ff4444/ffffff', 6);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (7, 'Alfonso', 'Jaeggi', '2019-07-04', 3, 'http://dummyimage.com/133x226.jpg/5fa2dd/ffffff', 7);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (8, 'Ulrike', 'Spenton', '2020-02-04', 4, 'http://dummyimage.com/181x151.bmp/cc0000/ffffff', 8);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (9, 'Rip', 'Gini', '2019-06-13', 1, 'http://dummyimage.com/147x194.png/ff4444/ffffff', 9);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (10, 'Krysta', 'Coviello', '2019-11-11', 1, 'http://dummyimage.com/109x171.png/ff4444/ffffff', 10);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (11, 'Marcelo', 'Regan', '2020-04-04', 1, 'http://dummyimage.com/201x115.png/5fa2dd/ffffff', 11);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (12, 'Calhoun', 'Lascell', '2019-11-03', 1, 'http://dummyimage.com/123x201.png/dddddd/000000', 12);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (13, 'Holly-anne', 'Hassey', '2019-08-09', 1, 'http://dummyimage.com/166x149.jpg/ff4444/ffffff', 13);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (14, 'Aggi', 'Hopkyns', '2019-11-16', 1, 'http://dummyimage.com/115x146.jpg/ff4444/ffffff', 14);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (15, 'Conny', 'Crampin', '2019-07-22', 1, 'http://dummyimage.com/128x244.png/cc0000/ffffff', 15);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (16, 'Salvador', 'Garmey', '2019-11-08', 1, 'http://dummyimage.com/225x144.bmp/dddddd/000000', 16);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (17, 'Stuart', 'Bycraft', '2019-09-11', 1, 'http://dummyimage.com/203x141.png/cc0000/ffffff', 17);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (18, 'Lorna', 'Aidler', '2020-03-29', 1, 'http://dummyimage.com/150x249.jpg/5fa2dd/ffffff', 18);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (19, 'Darnall', 'Sadler', '2019-10-07', 1, 'http://dummyimage.com/130x126.bmp/dddddd/000000', 19);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (20, 'Ame', 'Garriock', '2019-06-20', 2, 'http://dummyimage.com/208x154.png/dddddd/000000', 20);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (21, 'Esme', 'Danihelka', '2019-11-01', 2, 'http://dummyimage.com/186x150.jpg/cc0000/ffffff', 21);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (22, 'Aymer', 'Almak', '2020-04-05', 2, 'http://dummyimage.com/124x226.bmp/ff4444/ffffff', 22);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (23, 'Thomasine', 'Annies', '2020-01-04', 2, 'http://dummyimage.com/204x138.png/cc0000/ffffff', 23);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (24, 'Nikolas', 'Reffe', '2019-08-17', 2, 'http://dummyimage.com/115x107.jpg/dddddd/000000', 24);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (25, 'Sander', 'Trusty', '2020-03-05', 2, 'http://dummyimage.com/140x234.jpg/5fa2dd/ffffff', 25);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (26, 'Rasia', 'Alfonsetto', '2020-05-07', 2, 'http://dummyimage.com/194x198.bmp/ff4444/ffffff', 26);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (27, 'Dewey', 'Wendover', '2020-01-13', 2, 'http://dummyimage.com/134x155.jpg/cc0000/ffffff', 27);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (28, 'David', 'MacLoughlin', '2019-09-22', 2, 'http://dummyimage.com/133x222.jpg/cc0000/ffffff', 28);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (29, 'Noby', 'Littledyke', '2020-03-06', 2, 'http://dummyimage.com/163x192.png/5fa2dd/ffffff', 29);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (30, 'Vittoria', 'Carvill', '2019-07-15', 3, 'http://dummyimage.com/157x138.jpg/dddddd/000000', 30);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (31, 'Salomi', 'Wetwood', '2019-08-18', 3, 'http://dummyimage.com/232x232.jpg/ff4444/ffffff', 31);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (32, 'Merle', 'Pressnell', '2020-04-27', 3, 'http://dummyimage.com/112x234.jpg/5fa2dd/ffffff', 32);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (33, 'Neville', 'Milksop', '2020-01-04', 3, 'http://dummyimage.com/224x245.png/cc0000/ffffff', 33);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (34, 'Janella', 'Machin', '2020-03-10', 3, 'http://dummyimage.com/109x239.jpg/ff4444/ffffff', 34);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (35, 'Hyacinth', 'Wartnaby', '2019-09-18', 3, 'http://dummyimage.com/219x185.jpg/dddddd/000000', 35);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (36, 'Elicia', 'Panther', '2019-11-21', 3, 'http://dummyimage.com/231x113.jpg/dddddd/000000', 36);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (37, 'Waldon', 'McGarahan', '2019-12-30', 3, 'http://dummyimage.com/193x108.png/5fa2dd/ffffff', 37);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (38, 'Christin', 'Kobiela', '2019-08-12', 3, 'http://dummyimage.com/178x117.jpg/ff4444/ffffff', 38);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (39, 'Chryste', 'Mayworth', '2019-11-10', 3, 'http://dummyimage.com/219x250.jpg/cc0000/ffffff', 39);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (40, 'Phaidra', 'Frowen', '2020-02-18', 4, 'http://dummyimage.com/211x123.png/cc0000/ffffff', 40);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (41, 'Padraic', 'Bresnahan', '2019-10-06', 4, 'http://dummyimage.com/223x231.jpg/dddddd/000000', 41);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (42, 'Marya', 'Andrzej', '2020-03-13', 4, 'http://dummyimage.com/193x178.png/ff4444/ffffff', 42);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (43, 'Aindrea', 'Habercham', '2019-12-25', 4, 'http://dummyimage.com/188x169.png/cc0000/ffffff', 43);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (44, 'Griz', 'Laurenty', '2019-08-14', 4, 'http://dummyimage.com/194x247.png/ff4444/ffffff', 44);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (45, 'Wini', 'Zylberdik', '2020-05-03', 4, 'http://dummyimage.com/193x188.png/cc0000/ffffff', 45);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (46, 'Tye', 'Jakubiak', '2020-03-01', 4, 'http://dummyimage.com/212x187.bmp/5fa2dd/ffffff', 46);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (47, 'Charissa', 'Petriello', '2019-07-03', 4, 'http://dummyimage.com/104x126.bmp/5fa2dd/ffffff', 47);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (48, 'Nelson', 'Clew', '2020-03-05', 4, 'http://dummyimage.com/155x207.bmp/dddddd/000000', 48);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (49, 'Janos', 'Mariotte', '2019-11-02', 4, 'http://dummyimage.com/118x116.jpg/5fa2dd/ffffff', 49);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (50, 'Henry', 'Corcoran', '2019-07-07', 1, 'http://dummyimage.com/210x162.bmp/dddddd/000000', 50);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (51, 'Rivkah', 'Snowden', '2019-11-06', 2, 'http://dummyimage.com/177x168.bmp/5fa2dd/ffffff', 51);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (52, 'Brittne', 'Kidgell', '2020-01-05', 3, 'http://dummyimage.com/242x171.png/dddddd/000000', 52);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (53, 'Margaretha', 'Van Ross', '2020-02-15', 4, 'http://dummyimage.com/194x170.png/dddddd/000000', 53);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (54, 'Glen', 'Waye', '2020-05-12', 2, 'http://dummyimage.com/245x160.jpg/dddddd/000000', 54);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (55, 'Max', 'Bucknell', '2020-03-07', 1, 'http://dummyimage.com/237x196.bmp/ff4444/ffffff', 55);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (56, 'Ranice', 'Dik', '2020-01-27', 2, 'http://dummyimage.com/143x248.jpg/5fa2dd/ffffff', 56);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (57, 'Ashlin', 'Westmerland', '2020-01-30', 3, 'http://dummyimage.com/170x135.bmp/cc0000/ffffff', 57);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (58, 'Johann', 'Kingshott', '2020-05-05', 4, 'http://dummyimage.com/159x239.jpg/dddddd/000000', 58);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (59, 'Nealon', 'Wyllis', '2020-05-16', 1, 'http://dummyimage.com/126x150.png/dddddd/000000', 59);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (60, 'Ransell', 'Endecott', '2019-08-30', 1, 'http://dummyimage.com/124x244.bmp/dddddd/000000', 60);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (61, 'Meredithe', 'Santore', '2020-01-12', 3, 'http://dummyimage.com/103x201.png/5fa2dd/ffffff', 61);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (62, 'Bobette', 'Roberds', '2019-08-10', 1, 'http://dummyimage.com/138x247.jpg/dddddd/000000', 62);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (63, 'Bridget', 'Adolthine', '2019-10-24', 2, 'http://dummyimage.com/149x208.jpg/5fa2dd/ffffff', 63);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (64, 'Lark', 'McBrearty', '2019-07-22', 3, 'http://dummyimage.com/106x187.png/dddddd/000000', 64);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (65, 'Farleigh', 'Darling', '2020-04-20', 4, 'http://dummyimage.com/168x143.bmp/dddddd/000000', 65);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (66, 'Carson', 'Ronan', '2019-09-20', 1, 'http://dummyimage.com/193x131.bmp/cc0000/ffffff', 66);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (67, 'Adan', 'Kiljan', '2019-09-08', 1, 'http://dummyimage.com/243x182.bmp/cc0000/ffffff', 67);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (68, 'Freida', 'Purchall', '2019-07-18', 1, 'http://dummyimage.com/249x186.bmp/ff4444/ffffff', 68);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (69, 'Aindrea', 'Olivelli', '2020-03-01', 3, 'http://dummyimage.com/227x152.bmp/dddddd/000000', 69);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (70, 'Nial', 'Edwinson', '2019-12-09', 4, 'http://dummyimage.com/133x241.bmp/dddddd/000000', 70);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (71, 'Alexia', 'Rizzello', '2019-12-17', 1, 'http://dummyimage.com/128x156.jpg/5fa2dd/ffffff', 71);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (72, 'Emelyne', 'Covelle', '2019-10-15', 2, 'http://dummyimage.com/245x145.png/cc0000/ffffff', 72);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (73, 'Joellyn', 'Guyon', '2019-07-19', 3, 'http://dummyimage.com/161x141.png/ff4444/ffffff', 73);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (74, 'Ellerey', 'Huguenet', '2020-02-08', 4, 'http://dummyimage.com/135x196.jpg/cc0000/ffffff', 74);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (75, 'Shaine', 'Palek', '2019-10-02', 2, 'http://dummyimage.com/123x218.jpg/cc0000/ffffff', 75);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (76, 'Tamar', 'Rings', '2019-11-19', 1, 'http://dummyimage.com/150x164.png/5fa2dd/ffffff', 76);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (77, 'Bearnard', 'Sprosson', '2019-12-05', 4, 'http://dummyimage.com/170x237.bmp/5fa2dd/ffffff', 77);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (78, 'Zabrina', 'Petrazzi', '2020-01-21', 4, 'http://dummyimage.com/222x130.jpg/dddddd/000000', 78);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (79, 'Cirilo', 'Rettie', '2020-01-03', 4, 'http://dummyimage.com/218x124.jpg/ff4444/ffffff', 79);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (80, 'Germain', 'Banbrick', '2020-04-13', 2, 'http://dummyimage.com/124x125.jpg/5fa2dd/ffffff', 80);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (81, 'Sammie', 'Antoniottii', '2020-04-03', 1, 'http://dummyimage.com/207x243.png/ff4444/ffffff', 81);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (82, 'Mose', 'Hutchinges', '2020-04-29', 2, 'http://dummyimage.com/154x205.png/5fa2dd/ffffff', 82);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (83, 'Dionis', 'Yeudall', '2019-11-01', 3, 'http://dummyimage.com/191x244.bmp/dddddd/000000', 83);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (84, 'Ivan', 'Watling', '2020-05-18', 4, 'http://dummyimage.com/124x157.bmp/dddddd/000000', 84);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (85, 'Stephannie', 'Addekin', '2020-04-02', 1, 'http://dummyimage.com/140x105.bmp/dddddd/000000', 85);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (86, 'Iver', 'Fake', '2019-06-01', 3, 'http://dummyimage.com/118x116.bmp/ff4444/ffffff', 86);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (87, 'Cristobal', 'Fooks', '2020-03-13', 2, 'http://dummyimage.com/139x139.jpg/ff4444/ffffff', 87);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (88, 'Lora', 'Colly', '2019-06-29', 2, 'http://dummyimage.com/214x104.bmp/ff4444/ffffff', 88);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (89, 'Ferne', 'Linscott', '2020-05-08', 4, 'http://dummyimage.com/206x212.png/ff4444/ffffff', 89);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (90, 'Demetrius', 'Northam', '2019-06-04', 2, 'http://dummyimage.com/168x176.bmp/ff4444/ffffff', 90);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (91, 'Annadiane', 'Durdy', '2019-08-18', 1, 'http://dummyimage.com/233x226.jpg/cc0000/ffffff', 91);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (92, 'Zia', 'Culcheth', '2019-12-24', 3, 'http://dummyimage.com/120x155.jpg/ff4444/ffffff', 92);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (93, 'Elsbeth', 'Blazi', '2019-11-09', 4, 'http://dummyimage.com/126x109.jpg/ff4444/ffffff', 93);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (94, 'Paule', 'Boller', '2020-05-20', 2, 'http://dummyimage.com/132x226.bmp/ff4444/ffffff', 94);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (95, 'Karlens', 'Syphus', '2020-03-24', 1, 'http://dummyimage.com/237x191.png/cc0000/ffffff', 95);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (96, 'Che', 'Rozzell', '2019-08-16', 2, 'http://dummyimage.com/210x183.png/ff4444/ffffff', 96);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (97, 'Marley', 'Dudeney', '2019-11-15', 3, 'http://dummyimage.com/222x213.bmp/5fa2dd/ffffff', 97);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (98, 'Mariann', 'Halversen', '2019-08-29', 4, 'http://dummyimage.com/146x105.jpg/5fa2dd/ffffff', 98);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (99, 'Gnni', 'Meharg', '2019-08-22', 1, 'http://dummyimage.com/237x237.png/5fa2dd/ffffff', 99);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Id_Rol,  Foto, Id_Login) values (100, 'Misti', 'Maior', '2019-06-08', 4, 'http://dummyimage.com/214x190.jpg/ff4444/ffffff', 100);
USE Spotify;
insert into Seguidor (Id_Seguidor, Id_Usuario) values (1, 1);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (2, 2);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (3, 3);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (4, 4);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (5, 5);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (6, 6);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (7, 7);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (8, 8);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (9, 9);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (10, 10);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (11, 11);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (12, 12);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (13, 13);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (14, 14);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (15, 15);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (16, 16);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (17, 17);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (18, 18);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (19, 19);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (20, 20);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (21, 21);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (22, 22);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (23, 23);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (24, 24);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (25, 25);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (26, 26);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (27, 27);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (28, 28);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (29, 29);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (30, 30);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (31, 31);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (32, 32);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (33, 33);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (34, 34);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (35, 35);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (36, 36);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (37, 37);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (38, 38);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (39, 39);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (40, 40);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (41, 41);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (42, 42);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (43, 43);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (44, 44);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (45, 45);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (46, 46);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (47, 47);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (48, 48);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (49, 49);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (50, 50);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (51, 51);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (52, 52);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (53, 53);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (54, 54);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (55, 55);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (56, 56);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (57, 57);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (58, 58);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (59, 59);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (60, 60);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (61, 61);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (62, 62);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (63, 63);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (64, 64);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (65, 65);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (66, 66);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (67, 67);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (68, 68);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (69, 69);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (70, 70);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (71, 71);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (72, 72);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (73, 73);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (74, 74);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (75, 75);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (76, 76);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (77, 77);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (78, 78);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (79, 79);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (80, 80);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (81, 81);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (82, 82);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (83, 83);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (84, 84);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (85, 85);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (86, 86);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (87, 87);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (88, 88);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (89, 89);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (90, 90);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (91, 91);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (92, 92);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (93, 93);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (94, 94);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (95, 95);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (96, 96);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (97, 97);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (98, 98);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (99, 99);
insert into Seguidor (Id_Seguidor, Id_Usuario) values (100, 100);

USE Spotify;
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (1, 'ileare0', 1);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (2, 'djohann1', 2);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (3, 'otheodore2', 3);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (4, 'szambon3', 4);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (5, 'hswayland4', 5);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (6, 'bferrie5', 6);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (7, 'rmcavinchey6', 7);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (8, 'kbaugh7', 8);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (9, 'hattril8', 9);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (10, 'mdionisio9', 10);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (11, 'nparamorea', 11);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (12, 'abambrughb', 12);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (13, 'pzorenerc', 13);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (14, 'mtadmand', 14);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (15, 'tjoinsone', 15);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (16, 'mdemongeotf', 16);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (17, 'adrainsg', 17);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (18, 'gcawsbyh', 18);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (19, 'nmarklewi', 19);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (20, 'mtreverj', 20);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (21, 'kshoebrookk', 21);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (22, 'kflemmingl', 22);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (23, 'mgilliardm', 23);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (24, 'gridholen', 24);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (25, 'sdykao', 25);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (26, 'eandreevp', 26);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (27, 'apardonq', 27);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (28, 'gbromheadr', 28);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (29, 'crupkes', 29);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (30, 'bduthiet', 30);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (31, 'tpattinsonu', 31);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (32, 'sroumierv', 32);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (33, 'shindesw', 33);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (34, 'gpyecroftx', 34);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (35, 'lbukacy', 35);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (36, 'kantukz', 36);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (37, 'hrodmell10', 37);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (38, 'brudiger11', 38);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (39, 'bolivello12', 39);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (40, 'cbaptist13', 40);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (41, 'mwedmore14', 41);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (42, 'alagden15', 42);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (43, 'qoates16', 43);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (44, 'htiffany17', 44);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (45, 'emansion18', 45);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (46, 'dmerit19', 46);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (47, 'aveljes1a', 47);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (48, 'jdepport1b', 48);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (49, 'jconre1c', 49);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (50, 'gmetzing1d', 50);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (51, 'rkenninghan1e', 51);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (52, 'mdelaharpe1f', 52);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (53, 'agullen1g', 53);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (54, 'efolkard1h', 54);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (55, 'pwickerson1i', 55);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (56, 'tgilfoyle1j', 56);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (57, 'kmessiter1k', 57);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (58, 'brutty1l', 58);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (59, 'scrimpe1m', 59);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (60, 'jsparshett1n', 60);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (61, 'vsabbins1o', 61);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (62, 'kodrought1p', 62);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (63, 'dchalcraft1q', 63);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (64, 'rboater1r', 64);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (65, 'hgaskall1s', 65);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (66, 'farnow1t', 66);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (67, 'etritten1u', 67);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (68, 'akenen1v', 68);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (69, 'fmargetts1w', 69);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (70, 'klindmark1x', 70);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (71, 'cbewly1y', 71);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (72, 'rfeakins1z', 72);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (73, 'ddewes20', 73);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (74, 'hkid21', 74);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (75, 'ebelfrage22', 75);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (76, 'pyukhtin23', 76);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (77, 'khalden24', 77);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (78, 'amadison25', 78);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (79, 'zbright26', 79);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (80, 'ehenworth27', 80);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (81, 'pcastana28', 81);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (82, 'asnipe29', 82);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (83, 'cburgoin2a', 83);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (84, 'sathowe2b', 84);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (85, 'pscotchmore2c', 85);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (86, 'rbefroy2d', 86);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (87, 'lpownall2e', 87);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (88, 'pbandt2f', 88);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (89, 'kferns2g', 89);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (90, 'bkrammer2h', 90);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (91, 'mmatteini2i', 91);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (92, 'tnestor2j', 92);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (93, 'tfrewer2k', 93);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (94, 'ocorbin2l', 94);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (95, 'gbeaver2m', 95);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (96, 'kmacdonald2n', 96);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (97, 'dcusiter2o', 97);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (98, 'hhinchon2p', 98);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (99, 'mkall2q', 99);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (100, 'mbrislan2r', 100);

USE Spotify;
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (1, 1, 'lledes0', '633416459036313496', '2020-01-28');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (2, 2, 'ajordin1', '3575298620369172', '2019-08-13');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (3, 3, 'wdebruijn2', '374288278324263', '2019-10-01');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (4, 4, 'bsailes3', '3571917275035739', '2019-10-31');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (5, 5, 'rtelford4', '670645110517689608', '2020-04-27');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (6, 6, 'wpaulusch5', '5108757333088040', '2019-05-30');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (7, 7, 'psimic6', '3548488403697972', '2020-01-30');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (8, 8, 'irogan7', '6771376394349722', '2020-03-22');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (9, 9, 'mchaloner8', '3528624639612161', '2020-05-22');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (10, 10, 'iudden9', '56022252074664700', '2020-05-07');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (11, 11, 'lleyntona', '5227814885413179', '2020-01-02');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (12, 12, 'asolesburyb', '6380377314737239', '2019-08-27');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (13, 13, 'laspyc', '4844727007296858', '2019-09-29');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (14, 14, 'lgreenalfd', '5602254803806193', '2019-09-09');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (15, 15, 'gmcbradye', '67067928637194888', '2020-01-13');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (16, 16, 'aerbainf', '5475934466496192', '2019-11-15');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (17, 17, 'gmechemg', '5410251707543544', '2020-03-30');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (18, 18, 'hvolageh', '3573539747769170', '2019-12-20');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (19, 19, 'nbummfreyi', '5602257498774865', '2020-01-16');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (20, 20, 'glennonj', '3564207560667415', '2019-12-31');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (21, 21, 'jjestek', '30075567920281', '2020-02-29');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (22, 22, 'bbudgenl', '3570130612785856', '2020-04-28');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (23, 23, 'savrahmm', '30531891382796', '2019-12-27');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (24, 24, 'wflaunen', '67719998592231951', '2019-09-22');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (25, 25, 'dknivetono', '3556314556042270', '2019-12-27');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (26, 26, 'tskermerp', '5152584161530512', '2019-08-22');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (27, 27, 'rdunnicoq', '374283978943009', '2019-11-13');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (28, 28, 'cwoodusr', '36789234108328', '2019-10-03');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (29, 29, 'tquerrees', '3548359506290736', '2019-09-07');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (30, 30, 'klattint', '6759622256380347', '2019-06-29');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (31, 31, 'btybaltu', '3578136060080015', '2020-02-23');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (32, 32, 'jsavaagev', '4041376105658188', '2019-07-25');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (33, 33, 'ccolview', '3585007419856473', '2019-11-29');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (34, 34, 'fbessex', '3538923837995008', '2019-10-28');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (35, 35, 'rperriy', '6377547001527565', '2019-11-27');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (36, 36, 'jkelbermanz', '3570613737641088', '2020-01-22');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (37, 37, 'bbuer10', '337941645219725', '2019-12-05');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (38, 38, 'mvaan11', '30467805923245', '2019-06-09');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (39, 39, 'tcubin12', '3555240145472523', '2020-01-11');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (40, 40, 'pgoward13', '30343567484702', '2020-04-21');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (41, 41, 'cjorczyk14', '6759332394310684635', '2019-07-17');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (42, 42, 'sbolzen15', '3567462890728570', '2019-07-16');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (43, 43, 'csmaleman16', '56101552951200484', '2020-05-25');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (44, 44, 'sstrowger17', '374622275558533', '2020-04-12');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (45, 45, 'jhanlon18', '3585992349254271', '2020-03-21');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (46, 46, 'blanyon19', '3570808667851604', '2020-04-18');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (47, 47, 'adibdall1a', '6763947851184900206', '2019-10-06');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (48, 48, 'cdulwich1b', '5598898077131443', '2019-11-03');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (49, 49, 'myoslowitz1c', '349635882812749', '2019-10-22');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (50, 50, 'gsiderfin1d', '3549952086328493', '2020-04-03');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (51, 51, 'dcasellas1e', '3553420050751713', '2020-03-20');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (52, 52, 'prooksby1f', '3557519229702345', '2019-09-22');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (53, 53, 'grunnacles1g', '0604639517872755', '2020-01-26');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (54, 54, 'bjepensen1h', '5610551577706412', '2019-12-06');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (55, 55, 'scrocumbe1i', '3576003711051500', '2019-11-06');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (56, 56, 'bsnawden1j', '3567764129856894', '2020-01-13');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (57, 57, 'wballing1k', '5108754184158071', '2019-11-01');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (58, 58, 'lchadband1l', '3554167590127339', '2019-08-30');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (59, 59, 'cpeyton1m', '3566243730298623', '2019-11-12');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (60, 60, 'sgilbey1n', '3545485849442339', '2019-09-05');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (61, 61, 'rtwelves1o', '201816770141634', '2020-02-05');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (62, 62, 'cducrow1p', '491176678439494578', '2020-05-05');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (63, 63, 'ngarvill1q', '4936907917209514389', '2019-11-05');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (64, 64, 'bhaistwell1r', '3533377944281361', '2019-10-16');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (65, 65, 'bcaskey1s', '3584523022147648', '2019-10-10');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (66, 66, 'anoddle1t', '201650215427146', '2019-10-02');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (67, 67, 'aveivers1u', '5486532521230577', '2019-12-12');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (68, 68, 'bhartin1v', '5602224944983078', '2019-06-15');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (69, 69, 'mgush1w', '3534534444692187', '2019-10-16');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (70, 70, 'dconkling1x', '3528951824793179', '2020-05-13');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (71, 71, 'rsawforde1y', '501840213839500642', '2019-10-02');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (72, 72, 'marons1z', '374622051302486', '2019-10-19');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (73, 73, 'mdyer20', '5571969190012678', '2019-07-04');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (74, 74, 'bluchetti21', '3572123813349810', '2020-04-24');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (75, 75, 'lshireff22', '5610598072620317', '2019-06-29');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (76, 76, 'cewan23', '4508220945242835', '2020-01-28');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (77, 77, 'proutham24', '372301660191448', '2019-09-05');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (78, 78, 'wbault25', '4017952952059', '2019-07-03');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (79, 79, 'lbutts26', '3554181119395335', '2019-12-17');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (80, 80, 'ugirhard27', '3546786316454627', '2020-04-03');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (81, 81, 'fbarrett28', '3537278738966249', '2019-12-25');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (82, 82, 'ggiovannoni29', '3570060729731099', '2019-12-06');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (83, 83, 'mfilson2a', '3554904043372637', '2020-01-26');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (84, 84, 'lchidler2b', '4913356498995210', '2019-10-18');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (85, 85, 'rbrayshay2c', '3531333547069689', '2020-05-15');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (86, 86, 'rwalework2d', '3559661683625741', '2019-06-06');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (87, 87, 'cviall2e', '374283029932134', '2019-12-09');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (88, 88, 'slindback2f', '3547965965035049', '2019-10-25');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (89, 89, 'jtiffney2g', '564182690956466984', '2019-11-13');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (90, 90, 'llakenton2h', '060464674312198984', '2019-06-21');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (91, 91, 'dblackaller2i', '5602220577574457', '2019-10-13');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (92, 92, 'gsagg2j', '3538028166415543', '2019-08-07');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (93, 93, 'tchildrens2k', '3583706903291467', '2019-10-15');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (94, 94, 'tkewzick2l', '5602213377610464029', '2019-10-22');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (95, 95, 'idondon2m', '3556221212537835', '2020-02-20');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (96, 96, 'blosel2n', '3569198250524450', '2019-09-10');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (97, 97, 'lgadsdon2o', '201669291093325', '2020-04-22');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (98, 98, 'sdollard2p', '5108753884416250', '2020-01-16');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (99, 99, 'gfewings2q', '3583867179001244', '2019-06-23');
insert into Pago (Id_Pago, Id_Usuario, Nombre_PTarjeta, Numero_Tarjeta, Fecha_Vencimiento) values (100, 100, 'ebraunston2r', '5641828291118884353', '2020-03-13');
select*from Artistas;

USE Spotify;
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (1, 'Oswell', 'Gallyon', 'Suki Gallyon', '2020-03-12', 'Suki', 42, 'http://dummyimage.com/181x242.png/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (2, 'Roscoe', 'Janota', 'Edin Janota', '2020-03-20', 'Edin', 46, 'http://dummyimage.com/179x184.jpg/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (3, 'Osmond', 'Moubray', 'Martynne Moubray', '2020-02-24', 'Martynne', 69, 'http://dummyimage.com/192x104.jpg/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (4, 'Tracie', 'Gladwell', 'Minny Gladwell', '2020-05-05', 'Minny', 9, 'http://dummyimage.com/212x179.png/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (5, 'Cyrille', 'Nevill', 'Melina Nevill', '2020-01-06', 'Melina', 39, 'http://dummyimage.com/114x118.jpg/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (6, 'Cornelia', 'Wingfield', 'Glenna Wingfield', '2019-09-02', 'Glenna', 57, 'http://dummyimage.com/242x219.jpg/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (7, 'Cornell', 'Hearty', 'Lissie Hearty', '2019-10-28', 'Lissie', 84, 'http://dummyimage.com/131x153.jpg/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (8, 'Mackenzie', 'Adlam', 'Lena Adlam', '2019-12-09', 'Lena', 1, 'http://dummyimage.com/157x238.jpg/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (9, 'Ernaline', 'Gretton', 'Mollee Gretton', '2020-05-16', 'Mollee', 57, 'http://dummyimage.com/119x191.jpg/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (10, 'Friedrich', 'McLeary', 'Violet McLeary', '2019-11-13', 'Violet', 75, 'http://dummyimage.com/115x121.png/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (11, 'Mahala', 'Humpage', 'Neila Humpage', '2019-08-24', 'Neila', 41, 'http://dummyimage.com/235x133.jpg/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (12, 'Gerry', 'Nequest', 'Margareta Nequest', '2020-01-23', 'Margareta', 59, 'http://dummyimage.com/188x246.bmp/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (13, 'Freddie', 'Joberne', 'Angie Joberne', '2019-12-24', 'Angie', 43, 'http://dummyimage.com/232x225.jpg/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (14, 'Barr', 'Larrat', 'Blinni Larrat', '2019-10-24', 'Blinni', 68, 'http://dummyimage.com/171x108.png/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (15, 'Marijn', 'Tapton', 'Jordan Tapton', '2019-07-30', 'Jordan', 6, 'http://dummyimage.com/209x216.bmp/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (16, 'Jackquelin', 'Eyckel', 'Claudie Eyckel', '2020-03-07', 'Claudie', 58, 'http://dummyimage.com/120x190.png/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (17, 'Verge', 'Dedon', 'Alexi Dedon', '2019-11-23', 'Alexi', 64, 'http://dummyimage.com/132x225.png/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (18, 'Tabby', 'L''Episcopio', 'Kimberlee L''Episcopio', '2019-07-19', 'Kimberlee', 86, 'http://dummyimage.com/168x185.jpg/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (19, 'Raviv', 'Elvins', 'Griselda Elvins', '2020-03-11', 'Griselda', 16, 'http://dummyimage.com/199x109.png/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (20, 'Sadye', 'Nissle', 'Tressa Nissle', '2019-11-17', 'Tressa', 92, 'http://dummyimage.com/188x217.bmp/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (21, 'Madelin', 'Walasik', 'Camella Walasik', '2020-02-04', 'Camella', 58, 'http://dummyimage.com/192x169.png/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (22, 'Lauraine', 'Dingate', 'Honor Dingate', '2019-11-09', 'Honor', 5, 'http://dummyimage.com/177x230.png/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (23, 'Kimmie', 'Earngy', 'Julieta Earngy', '2019-06-23', 'Julieta', 43, 'http://dummyimage.com/123x191.jpg/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (24, 'Eziechiele', 'Upston', 'Carley Upston', '2019-11-10', 'Carley', 59, 'http://dummyimage.com/173x230.bmp/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (25, 'Hinda', 'Pascho', 'Johannah Pascho', '2019-07-14', 'Johannah', 26, 'http://dummyimage.com/220x195.jpg/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (26, 'Frans', 'Wardley', 'Neile Wardley', '2020-05-22', 'Neile', 23, 'http://dummyimage.com/248x223.png/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (27, 'Concettina', 'Vokins', 'Jeane Vokins', '2019-06-09', 'Jeane', 24, 'http://dummyimage.com/190x237.bmp/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (28, 'Keenan', 'Sheryne', 'Lorinda Sheryne', '2020-02-28', 'Lorinda', 25, 'http://dummyimage.com/120x209.png/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (29, 'Jacobo', 'Konrad', 'Lynda Konrad', '2019-12-29', 'Lynda', 43, 'http://dummyimage.com/144x107.png/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (30, 'Romona', 'Cowle', 'Ariela Cowle', '2019-12-17', 'Ariela', 33, 'http://dummyimage.com/233x172.jpg/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (31, 'Karola', 'Burdon', 'Dolli Burdon', '2019-09-12', 'Dolli', 46, 'http://dummyimage.com/199x192.jpg/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (32, 'Cinda', 'Brownstein', 'Karleen Brownstein', '2020-04-29', 'Karleen', 16, 'http://dummyimage.com/184x189.jpg/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (33, 'Rogers', 'Blaine', 'Josephina Blaine', '2019-07-23', 'Josephina', 13, 'http://dummyimage.com/211x142.jpg/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (34, 'Karlyn', 'Eke', 'Lilla Eke', '2019-11-28', 'Lilla', 21, 'http://dummyimage.com/231x123.bmp/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (35, 'Maye', 'Ruskin', 'Sadye Ruskin', '2019-08-31', 'Sadye', 89, 'http://dummyimage.com/166x144.png/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (36, 'Calida', 'Spaldin', 'Corenda Spaldin', '2019-10-20', 'Corenda', 31, 'http://dummyimage.com/106x176.png/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (37, 'Nancie', 'Ryce', 'Karry Ryce', '2019-12-14', 'Karry', 55, 'http://dummyimage.com/115x154.bmp/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (38, 'Tatiania', 'Mankor', 'Cherlyn Mankor', '2019-10-22', 'Cherlyn', 11, 'http://dummyimage.com/211x125.bmp/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (39, 'Willamina', 'Shevlin', 'Hedda Shevlin', '2019-10-24', 'Hedda', 72, 'http://dummyimage.com/157x161.jpg/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (40, 'Marcy', 'McMychem', 'Merrie McMychem', '2019-12-08', 'Merrie', 93, 'http://dummyimage.com/209x116.bmp/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (41, 'Tully', 'Blois', 'Tomasine Blois', '2019-12-29', 'Tomasine', 18, 'http://dummyimage.com/136x127.png/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (42, 'Ashien', 'Scowen', 'Chandal Scowen', '2020-04-10', 'Chandal', 75, 'http://dummyimage.com/106x211.png/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (43, 'Lee', 'Kelsall', 'Angelina Kelsall', '2020-03-25', 'Angelina', 75, 'http://dummyimage.com/226x213.bmp/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (44, 'Odelle', 'Epsly', 'Danyelle Epsly', '2020-04-10', 'Danyelle', 94, 'http://dummyimage.com/146x240.jpg/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (45, 'Gwendolin', 'Bernardotte', 'Kimberlyn Bernardotte', '2019-06-28', 'Kimberlyn', 43, 'http://dummyimage.com/154x185.jpg/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (46, 'Lexy', 'Bagwell', 'Leese Bagwell', '2019-06-14', 'Leese', 47, 'http://dummyimage.com/214x106.bmp/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (47, 'Bartholomew', 'Fowles', 'Stacy Fowles', '2020-04-07', 'Stacy', 17, 'http://dummyimage.com/217x145.jpg/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (48, 'Aleen', 'Hindrich', 'Tiffany Hindrich', '2020-05-12', 'Tiffany', 17, 'http://dummyimage.com/107x203.bmp/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (49, 'Dehlia', 'Brockton', 'Josefa Brockton', '2020-03-12', 'Josefa', 25, 'http://dummyimage.com/125x210.bmp/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (50, 'Hercules', 'Mottram', 'Christal Mottram', '2020-01-28', 'Christal', 81, 'http://dummyimage.com/115x140.bmp/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (51, 'Geri', 'Surpliss', 'Danielle Surpliss', '2020-03-15', 'Danielle', 63, 'http://dummyimage.com/174x230.png/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (52, 'Kristopher', 'MacClenan', 'Irita MacClenan', '2020-04-04', 'Irita', 96, 'http://dummyimage.com/109x150.png/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (53, 'Milty', 'Aaronson', 'Kip Aaronson', '2020-05-01', 'Kip', 70, 'http://dummyimage.com/247x134.bmp/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (54, 'Allys', 'Rikard', 'Adela Rikard', '2019-09-13', 'Adela', 70, 'http://dummyimage.com/210x231.png/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (55, 'Hugo', 'Wharin', 'Louisette Wharin', '2020-03-20', 'Louisette', 79, 'http://dummyimage.com/239x173.jpg/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (56, 'Karla', 'Postins', 'Sonnnie Postins', '2019-07-06', 'Sonnnie', 43, 'http://dummyimage.com/249x244.jpg/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (57, 'Benedetto', 'Arndtsen', 'Arabela Arndtsen', '2019-08-06', 'Arabela', 84, 'http://dummyimage.com/142x202.bmp/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (58, 'Hortensia', 'Marcos', 'Lauraine Marcos', '2020-04-27', 'Lauraine', 63, 'http://dummyimage.com/165x106.jpg/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (59, 'Ruprecht', 'Roseblade', 'Arabelle Roseblade', '2019-10-24', 'Arabelle', 100, 'http://dummyimage.com/197x161.jpg/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (60, 'Kristopher', 'Pervoe', 'Tiffany Pervoe', '2019-09-09', 'Tiffany', 47, 'http://dummyimage.com/138x190.bmp/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (61, 'Anitra', 'Wintour', 'Clerissa Wintour', '2019-10-28', 'Clerissa', 58, 'http://dummyimage.com/189x215.png/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (62, 'Norbert', 'Dalley', 'Brenn Dalley', '2019-05-29', 'Brenn', 67, 'http://dummyimage.com/201x231.jpg/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (63, 'Eamon', 'Raincin', 'Carmel Raincin', '2019-08-30', 'Carmel', 97, 'http://dummyimage.com/126x219.bmp/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (64, 'Warren', 'Barthot', 'Rosamund Barthot', '2019-07-29', 'Rosamund', 3, 'http://dummyimage.com/208x162.bmp/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (65, 'Britt', 'Bent', 'Britt Bent', '2020-04-10', 'Britt', 15, 'http://dummyimage.com/207x213.jpg/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (66, 'Ravi', 'Trinkwon', 'Coreen Trinkwon', '2020-04-20', 'Coreen', 77, 'http://dummyimage.com/200x173.bmp/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (67, 'Bogart', 'Weadick', 'Saloma Weadick', '2019-11-29', 'Saloma', 66, 'http://dummyimage.com/212x212.png/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (68, 'Erastus', 'Lambe', 'Dulcie Lambe', '2020-03-08', 'Dulcie', 6, 'http://dummyimage.com/105x249.bmp/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (69, 'Rosabel', 'Kienzle', 'Tracy Kienzle', '2019-07-02', 'Tracy', 17, 'http://dummyimage.com/166x116.bmp/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (70, 'Lexis', 'Lukasik', 'Alayne Lukasik', '2020-01-08', 'Alayne', 79, 'http://dummyimage.com/236x167.jpg/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (71, 'Jonathon', 'Bloxsom', 'Jami Bloxsom', '2019-11-18', 'Jami', 79, 'http://dummyimage.com/131x170.bmp/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (72, 'Mycah', 'Lewin', 'Winnifred Lewin', '2020-01-18', 'Winnifred', 5, 'http://dummyimage.com/105x169.bmp/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (73, 'Tracie', 'Viste', 'Madlin Viste', '2019-08-17', 'Madlin', 1, 'http://dummyimage.com/250x144.png/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (74, 'Amalea', 'Houdmont', 'Belita Houdmont', '2019-12-25', 'Belita', 88, 'http://dummyimage.com/171x177.jpg/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (75, 'Dorise', 'Bissiker', 'Mariya Bissiker', '2019-12-08', 'Mariya', 38, 'http://dummyimage.com/118x182.jpg/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (76, 'Moe', 'Paradis', 'Shanie Paradis', '2019-08-30', 'Shanie', 99, 'http://dummyimage.com/109x120.bmp/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (77, 'Melisandra', 'Ducastel', 'Isidora Ducastel', '2019-08-30', 'Isidora', 58, 'http://dummyimage.com/103x179.jpg/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (78, 'Korney', 'Vequaud', 'Renata Vequaud', '2019-06-12', 'Renata', 37, 'http://dummyimage.com/154x129.png/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (79, 'Ingelbert', 'Dorset', 'Gaye Dorset', '2019-09-18', 'Gaye', 66, 'http://dummyimage.com/157x230.png/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (80, 'Andeee', 'Hurley', 'Genny Hurley', '2020-05-16', 'Genny', 73, 'http://dummyimage.com/120x175.jpg/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (81, 'Merwin', 'Sissot', 'Vivyan Sissot', '2019-11-09', 'Vivyan', 93, 'http://dummyimage.com/215x120.png/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (82, 'Clyve', 'Vernham', 'Goldi Vernham', '2019-10-13', 'Goldi', 18, 'http://dummyimage.com/216x218.jpg/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (83, 'Athene', 'Leblanc', 'Philomena Leblanc', '2019-12-08', 'Philomena', 60, 'http://dummyimage.com/147x138.png/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (84, 'Law', 'Aseef', 'Rhodie Aseef', '2019-10-05', 'Rhodie', 54, 'http://dummyimage.com/190x153.png/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (85, 'Cinda', 'Jaram', 'Joeann Jaram', '2020-03-10', 'Joeann', 55, 'http://dummyimage.com/152x245.bmp/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (86, 'Ugo', 'Jentgens', 'Max Jentgens', '2019-09-25', 'Max', 74, 'http://dummyimage.com/228x116.png/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (87, 'Gilburt', 'O''Cassidy', 'Cari O''Cassidy', '2019-08-18', 'Cari', 9, 'http://dummyimage.com/213x178.bmp/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (88, 'Drucill', 'Brailsford', 'Benni Brailsford', '2020-03-28', 'Benni', 23, 'http://dummyimage.com/134x224.png/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (89, 'Faye', 'Sworder', 'Torey Sworder', '2019-09-22', 'Torey', 61, 'http://dummyimage.com/193x218.jpg/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (90, 'Drona', 'Pammenter', 'Valencia Pammenter', '2019-05-30', 'Valencia', 71, 'http://dummyimage.com/203x204.bmp/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (91, 'Lynnett', 'Ofener', 'Ardis Ofener', '2020-01-06', 'Ardis', 47, 'http://dummyimage.com/230x217.png/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (92, 'Noelani', 'Jurs', 'Felita Jurs', '2019-05-31', 'Felita', 85, 'http://dummyimage.com/209x112.png/dddddd/000000');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (93, 'Myrah', 'Malim', 'Sophronia Malim', '2020-03-28', 'Sophronia', 51, 'http://dummyimage.com/111x188.png/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (94, 'Thor', 'Andrivot', 'Raf Andrivot', '2019-06-19', 'Raf', 30, 'http://dummyimage.com/235x193.png/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (95, 'Vonnie', 'Takle', 'Lucky Takle', '2019-11-23', 'Lucky', 26, 'http://dummyimage.com/183x104.bmp/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (96, 'Otha', 'Burcher', 'Lynnell Burcher', '2020-02-17', 'Lynnell', 100, 'http://dummyimage.com/143x175.png/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (97, 'Aundrea', 'Banbrigge', 'Gisela Banbrigge', '2020-04-28', 'Gisela', 71, 'http://dummyimage.com/164x221.bmp/cc0000/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (98, 'Drusilla', 'ducarme', 'Coletta ducarme', '2020-03-08', 'Coletta', 2, 'http://dummyimage.com/235x125.bmp/5fa2dd/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (99, 'Barby', 'Yakovlev', 'Georgianna Yakovlev', '2020-03-06', 'Georgianna', 39, 'http://dummyimage.com/196x127.png/ff4444/ffffff');
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, NumeroSeguidores, Foto) values (100, 'Bettine', 'Pennigar', 'Inez Pennigar', '2019-06-08', 'Inez', 38, 'http://dummyimage.com/246x171.png/cc0000/ffffff');

USE Spotify;
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (1, 'mguichard0', 66, 54, '2020-02-15', 'Repl pacem w dual-cham');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (2, 'sdegliabbati1', 100, 56, '2019-07-23', 'Lap robotic assist proc');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (3, 'sporker2', 31, 8, '2020-05-13', 'Suture of artery');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (4, 'iheintze3', 65, 38, '2019-11-19', 'Rem epiretinal prosth');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (5, 'nsteer4', 86, 19, '2019-10-22', 'Forced limb extension');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (6, 'lmckelvie5', 86, 96, '2020-05-01', 'Cl reduc disloc-shoulder');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (7, 'rbecom6', 53, 20, '2020-02-15', 'Spine tract w skull dev');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (8, 'jeldritt7', 27, 29, '2019-07-24', 'Endo ins/re brnc val,mul');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (9, 'agraser8', 81, 63, '2019-12-24', 'Periton pneumogram NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (10, 'jscholtis9', 26, 42, '2019-08-08', 'Dilation of rectum');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (11, 'dheavensa', 35, 48, '2020-01-22', 'Rem crtd sinus stm lead');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (12, 'msudddardb', 76, 73, '2019-05-28', 'Classical c-section');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (13, 'cgennrichc', 51, 79, '2019-07-16', 'Cesarean section NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (14, 'fsaleryd', 27, 8, '2019-09-23', 'Scrotum & tunica i & d');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (15, 'kdehavene', 34, 5, '2020-01-24', 'Skin defect tattooing');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (16, 'arewcastlef', 75, 42, '2020-04-21', 'Rectal resection NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (17, 'cjaggg', 89, 82, '2020-01-27', 'C.A.T. scan of kidney');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (18, 'sblonfieldh', 69, 97, '2020-05-17', 'Clos pharynx fistula NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (19, 'hravenscrafti', 27, 90, '2019-12-04', 'Yellow fever vaccination');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (20, 'mgrievej', 100, 7, '2020-05-12', 'Exploratory laparotomy');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (21, 'rradmerk', 87, 60, '2019-10-31', 'Tibia & fibula biopsy');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (22, 'inorquoyl', 29, 41, '2019-09-24', 'Mouth repair NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (23, 'abarnhamm', 85, 74, '2019-09-08', 'Parasitology NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (24, 'btackettn', 32, 15, '2020-02-02', 'Int insert 1-cham, non');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (25, 'rlogano', 51, 43, '2019-11-14', 'Arthroplas metacarp wit');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (26, 'mmapesp', 53, 95, '2019-11-01', 'Laparoscopy');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (27, 'amccarverq', 50, 75, '2020-05-10', 'Closed aortic valvotomy');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (28, 'cechalierr', 59, 27, '2019-07-05', 'Other heart/pericard ops');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (29, 'bcecils', 48, 4, '2020-02-03', 'Anterior remov vitreous');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (30, 'tkoubekt', 17, 86, '2019-07-25', 'Loc exc bone lesion NOS');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (31, 'aarelesu', 47, 37, '2020-01-31', 'Uvula and soft palate bx');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (32, 'hceneyv', 8, 30, '2020-01-13', 'Thorac interposition NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (33, 'azaniniw', 14, 67, '2019-11-23', 'Pineal gland incision');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (34, 'itapsfieldx', 76, 10, '2019-10-04', 'Exc wound debridement');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (35, 'tbirwhistley', 19, 15, '2019-08-17', 'Replac m/s immob dev NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (36, 'bagerz', 100, 6, '2019-08-27', 'Closed renal biopsy');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (37, 'fkinker10', 52, 84, '2020-02-28', 'Magnet removal cornea FB');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (38, 'cridsdole11', 57, 11, '2019-06-07', 'Vessel resect/replac NOS');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (39, 'mosmond12', 3, 89, '2019-07-17', 'Intracran vessel excis');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (40, 'frillstone13', 3, 51, '2019-10-15', 'Lap unilat oophorectomy');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (41, 'agarfirth14', 95, 54, '2020-03-19', 'Transab cerclage cervix');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (42, 'ucudbird15', 87, 86, '2019-10-10', 'Part adrenalectomy NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (43, 'ahannam16', 6, 43, '2019-08-01', 'Open renal biopsy');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (44, 'gbilt17', 53, 78, '2020-01-04', 'Total ostectomy-humerus');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (45, 'rberthelet18', 72, 11, '2019-06-05', 'Replace ureteral stimul');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (46, 'jlines19', 48, 86, '2019-10-07', 'Micro exam-femal gen NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (47, 'nbooij1a', 20, 13, '2019-09-27', 'Patellar stabilization');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (48, 'emenear1b', 37, 37, '2020-03-09', 'Create cutanperiton fist');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (49, 'kackwood1c', 95, 67, '2019-10-14', 'Urethral meatotomy');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (50, 'zemerine1d', 42, 85, '2019-07-23', 'Gas hysterosalpingogram');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (51, 'ekrout1e', 31, 40, '2019-09-20', 'Head/neck ves incis NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (52, 'kpayle1f', 52, 79, '2020-01-22', 'Vaginal operation NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (53, 'fosuaird1g', 31, 82, '2020-02-21', 'Conduit left ventr-aorta');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (54, 'gcrassweller1h', 67, 30, '2019-11-14', 'Ex cereb meningeal les');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (55, 'kseamark1i', 12, 78, '2020-03-07', 'Ther ult peripheral ves');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (56, 'rclowney1j', 20, 77, '2019-09-05', 'Lung vol reduction surg');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (57, 'lcommusso1k', 75, 48, '2020-02-26', 'Vaginal douche');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (58, 'dgrishin1l', 13, 56, '2020-02-15', 'Tot repair tetral fallot');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (59, 'rluparto1m', 52, 92, '2019-08-08', 'Polio vaccine administra');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (60, 'dtowll1n', 62, 44, '2019-09-11', 'Destruc-hand jt les NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (61, 'kheddan1o', 12, 18, '2020-02-07', 'Repair colovagin fistula');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (62, 'wgwyer1p', 72, 90, '2019-07-09', 'Thorac lobectomy lung');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (63, 'menterle1q', 97, 44, '2020-05-19', 'Scrotal les destruction');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (64, 'hdarco1r', 54, 68, '2019-09-27', 'Drsl/drslumb fus ant/ant');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (65, 'ghymers1s', 29, 51, '2019-09-30', 'Musc or tend stretching');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (66, 'mjeste1t', 60, 24, '2020-01-30', 'Ophth counsel & instruct');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (67, 'gtottman1u', 63, 12, '2020-03-01', 'Cell blk/pap-lower urin');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (68, 'kivamy1v', 21, 50, '2019-07-18', 'Total ankle replacement');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (69, 'rlittlejohn1w', 17, 47, '2020-05-08', 'Destruct-hip lesion NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (70, 'dvillaret1x', 10, 86, '2019-12-29', 'Skin & subq incision NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (71, 'cmcgeown1y', 96, 75, '2019-08-24', 'Oth exc/dest intvrt disc');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (72, 'droocroft1z', 97, 82, '2019-07-14', 'Venous cutdown');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (73, 'cnewis20', 6, 85, '2019-07-03', 'Open biopsy soft tissue');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (74, 'bjickells21', 39, 19, '2019-12-06', 'Remov other genit device');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (75, 'mdunham22', 25, 98, '2020-02-12', 'Stereo radiosurgery NOS');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (76, 'pshillam23', 65, 36, '2020-03-12', 'CAS w fluoroscopy');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (77, 'fglidder24', 19, 13, '2019-09-27', 'Other suture of tendon');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (78, 'cvella25', 94, 47, '2019-07-25', 'Tot face bone ostect NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (79, 'vheisman26', 87, 8, '2019-12-19', 'Gastroscopy NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (80, 'ahowen27', 29, 64, '2019-08-04', 'Manual rupt joint adhes');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (81, 'slinne28', 45, 72, '2020-05-01', 'Pancreatic heterotranspl');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (82, 'blaudham29', 16, 57, '2020-02-22', 'Radical mastoidectomy');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (83, 'mestcot2a', 61, 15, '2019-06-18', 'Oth remove remain ovary');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (84, 'yscurlock2b', 83, 97, '2020-04-12', 'Intra-amnion inj for ab');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (85, 'dolden2c', 79, 18, '2019-07-05', 'Ureterostomy closure');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (86, 'crichardon2d', 84, 80, '2020-04-10', 'Large bowel fixation NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (87, 'rsouthward2e', 3, 73, '2019-08-25', 'Carotid sinus stiumlat');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (88, 'npottinger2f', 49, 86, '2020-05-14', 'Lacrim sac/passage excis');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (89, 'afarr2g', 28, 70, '2019-12-18', 'Chalazion excision');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (90, 'bvassano2h', 62, 42, '2019-10-09', 'Hemorrhoid procedure NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (91, 'apalfrie2i', 49, 81, '2019-06-14', 'Remov retroperiton drain');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (92, 'icolliar2j', 52, 5, '2020-04-15', 'Inj/inf platelet inhibit');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (93, 'orichold2k', 48, 31, '2020-02-08', 'Laryngeal fistula clos');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (94, 'ttetlow2l', 76, 40, '2020-02-20', 'Dilat frontonasal duct');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (95, 'egreenig2m', 36, 35, '2020-04-07', 'Cervical dx procedur NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (96, 'bmowles2n', 79, 38, '2020-05-07', 'Complete thyroidectomy');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (97, 'fshirrell2o', 51, 8, '2020-04-22', 'Open robotic assist proc');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (98, 'bdeluze2p', 45, 19, '2020-01-29', 'Posterior rect resection');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (99, 'rcoyte2q', 45, 35, '2020-05-05', 'Digestive tract xray NEC');
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Id_Artista, Fecha_Lansamiento , Descripcion_Disco ) values (100, 'ejiricka2r', 13, 40, '2019-07-17', 'Bone graft to skull');

USE Spotify;
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (1, 'vriden0', 20, 75, 'Vaginal vault obliterat', 1);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (2, 'tmallalieu1', 6, 39, 'Urethral sphincter emg', 2);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (3, 'wkarpman2', 56, 39, 'Botulism antitoxin admin', 3);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (4, 'ppaige3', 86, 55, 'Injection into tendon', 4);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (5, 'jridgewell4', 82, 52, 'Stretching of fascia', 5);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (6, 'wumney5', 62, 48, 'Impl intraoc telesc pros', 6);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (7, 'ehillin6', 53, 28, 'Tot repair tetral fallot', 7);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (8, 'akliment7', 75, 24, 'Replace nephrostomy tube', 8);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (9, 'estrevens8', 45, 64, 'Other dx pt procedure', 9);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (10, 'lhearle9', 97, 86, 'Other hydrotherapy', 10);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (11, 'rwardena', 52, 86, 'Upper limb lymphangiogrm', 11);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (12, 'ecarstairsb', 34, 84, 'Open cereb meninges bx', 12);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (13, 'latterleyc', 98, 75, 'Fit below knee prosthes', 13);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (14, 'cdunriged', 75, 87, 'Replac m/s immob dev NEC', 14);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (15, 'bgrishankove', 89, 62, 'Exc/des hrt les,endovasc', 15);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (16, 'dswinfenf', 16, 79, 'Adm neuroprotective agnt', 16);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (17, 'ktoulchg', 68, 76, 'Papillary muscle ops', 17);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (18, 'cswinfordh', 17, 81, 'Culture-endocrine', 18);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (19, 'cdonnellani', 95, 68, 'Type 5 tympanoplasty', 19);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (20, 'sdowdenj', 25, 58, 'Other arthrotomy NOS', 20);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (21, 'baudreyk', 82, 90, 'Abdominal proctopexy', 21);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (22, 'tdeavillel', 34, 63, 'Arth/pros rem wo rep-hip', 22);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (23, 'njeffersm', 34, 1, 'Retinal tear xenon coag', 23);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (24, 'rcranmoren', 77, 24, 'Destruct-hip lesion NEC', 24);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (25, 'ptiddo', 27, 78, 'Close red-int fix finger', 25);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (26, 'dmarkingp', 93, 92, 'Chorioret les radiother', 26);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (27, 'hquinnellyq', 26, 44, 'Conjunctivocystorhinost', 27);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (28, 'mbouetter', 38, 95, 'Amputation thru forearm', 28);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (29, 'thovells', 91, 91, 'Percu gastrojejunostomy', 29);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (30, 'rcliffet', 20, 66, 'Prosthet/orthot training', 30);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (31, 'bfloweru', 46, 97, 'Perirectal tissue biopsy', 31);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (32, 'htuerv', 92, 23, 'Hemispherectomy', 32);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (33, 'blardnarw', 55, 54, 'Irrigation of ear', 33);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (34, 'agoslandx', 35, 99, 'Debrid opn fx-toe', 34);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (35, 'eimeseny', 93, 77, 'Lap abd rep-diaphr hern', 35);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (36, 'channafordz', 15, 79, 'Imp/repl brain pulse gen', 36);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (37, 'adalgliesh10', 91, 9, 'Polio vaccine administra', 37);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (38, 'amcfee11', 6, 85, 'Indwell cath irrig NEC', 38);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (39, 'hkinnach12', 41, 39, 'Injection into testes', 39);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (40, 'aarrow13', 20, 72, 'Operation on orbit NEC', 40);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (41, 'dcochran14', 71, 19, 'Small bowel suture NEC', 41);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (42, 'whaining15', 93, 4, 'Semin ves dx proced NEC', 42);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (43, 'hsandes16', 36, 51, 'Corneal repair NEC', 43);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (44, 'esherrum17', 10, 28, 'Nasal sinus transillumin', 44);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (45, 'pcurson18', 53, 13, 'Osteoclasis-radius/ulna', 45);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (46, 'rwellington19', 91, 84, 'Pressurized treat graft', 46);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (47, 'kapple1a', 5, 70, 'Thumb amputation', 47);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (48, 'gpetrowsky1b', 44, 14, 'Thoracostomy closure', 48);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (49, 'rdantuoni1c', 70, 69, 'C & s NEC', 49);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (50, 'vmosson1d', 24, 89, 'Cryosurg lid epilation', 50);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (51, 'ksherar1e', 95, 42, 'Reattach amputated ear', 51);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (52, 'ahaldin1f', 27, 63, 'Iridectomy NEC', 52);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (53, 'ijelkes1g', 38, 46, 'Linear craniectomy', 53);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (54, 'smellem1h', 9, 53, 'Open bx saliv gland/duct', 54);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (55, 'itemperley1i', 9, 27, 'Reconstruction of penis', 55);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (56, 'bgivens1j', 75, 48, 'Patellar stabilization', 56);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (57, 'alynch1k', 45, 6, 'Procedure-four+ vessels', 57);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (58, 'cwarren1l', 29, 100, 'Amnioinfusion', 58);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (59, 'htestin1m', 28, 5, 'Closed biopsy larynx', 59);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (60, 'anucator1n', 9, 16, 'Comb alcohol/drug detox', 60);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (61, 'rlambol1o', 77, 23, 'Sut gastric ulcer site', 61);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (62, 'rcurtoys1p', 69, 30, 'Electrocoag rect les NEC', 62);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (63, 'sharlock1q', 63, 97, 'Sequestrectomy NOS', 63);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (64, 'twinders1r', 36, 72, 'Unilat breast implant', 64);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (65, 'hhaspineall1s', 8, 71, 'Culture-eye', 65);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (66, 'rmccusker1t', 4, 47, 'Trabecul carneae cord op', 66);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (67, 'rwane1u', 53, 96, 'Excision of urachus', 67);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (68, 'hcardero1v', 26, 89, 'Common duct exploration', 68);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (69, 'bissit1w', 10, 78, 'Closed prostatic biopsy', 69);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (70, 'rrapley1x', 21, 88, 'Bilateral vulvectomy', 70);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (71, 'aadao1y', 48, 78, 'Nasal biopsy', 71);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (72, 'nsedworth1z', 26, 16, 'Tot ostect-tibia/fibula', 72);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (73, 'ktorfin20', 15, 44, 'Skel xray-thigh/knee/leg', 73);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (74, 'sbeesey21', 93, 7, 'Esophagoscopy NEC', 74);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (75, 'mhaquin22', 57, 100, 'Bact smear-bili/pancreas', 75);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (76, 'krogier23', 27, 91, 'Vaccination NEC', 76);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (77, 'gcaughte24', 3, 41, 'Anal/perian dx proc NEC', 77);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (78, 'cmarkson25', 38, 45, 'Mri musculoskeletal', 78);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (79, 'dkays26', 36, 57, 'Cell blk/pap NEC', 79);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (80, 'lcorish27', 54, 69, 'Bact smear NOS', 80);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (81, 'bkarczinski28', 65, 22, 'Local perfusion liver', 81);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (82, 'vspivie29', 60, 8, 'Wide exc bony palate les', 82);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (83, 'rlucy2a', 80, 8, 'Per cardiopulmon bypass', 83);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (84, 'akincla2b', 40, 44, 'Applic ext fix dev NEC', 84);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (85, 'bpaye2c', 86, 78, 'Excision hand joint NEC', 85);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (86, 'pdimitriades2d', 71, 72, 'Psychol mental stat NOS', 86);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (87, 'hhagard2e', 81, 83, 'Cholecystostomy NEC', 87);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (88, 'sofeeny2f', 56, 69, 'Repl joint of foot, toe', 88);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (89, 'awash2g', 8, 51, 'Contr thor arteriogr NEC', 89);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (90, 'lalltimes2h', 55, 79, 'Vag susp/fix w grft/pros', 90);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (91, 'bcrimin2i', 39, 60, 'Radical orbitomaxillect', 91);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (92, 'awhitfield2j', 21, 79, 'Thor abltn lung les/tiss', 92);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (93, 'ggrange2k', 6, 89, 'Pituitary gland incision', 93);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (94, 'mveque2l', 33, 73, 'Contrast bronchogram NEC', 94);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (95, 'cstandbrook2m', 5, 46, 'Shorten 1 extraoc musc', 95);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (96, 'cpfeffle2n', 73, 5, 'Insert othr spin device', 96);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (97, 'rlongshaw2o', 75, 80, 'Anal biopsy', 97);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (98, 'cvatini2p', 56, 10, 'Oth transmyo revascular', 98);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (99, 'gbirt2q', 91, 43, 'Tiss adj to valv ops NEC', 99);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (100, 'dhulke2r', 25, 17, 'Synovectomy-site NEC', 100);

USE Spotify;
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (1, 'Sherri', 1, 1);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (2, 'Elspeth', 2, 2);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (3, 'Mal', 3, 3);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (4, 'Gan', 4, 4);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (5, 'Maurizia', 5, 5);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (6, 'Karla', 6, 6);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (7, 'Rafaello', 7, 7);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (8, 'Ailsun', 8, 8);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (9, 'Von', 9, 9);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (10, 'Ruthe', 10, 10);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (11, 'Amalee', 11, 11);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (12, 'Winnah', 12, 12);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (13, 'Chiquia', 13, 13);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (14, 'Maribelle', 14, 14);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (15, 'Waiter', 15, 15);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (16, 'Jasun', 16, 16);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (17, 'Joel', 17, 17);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (18, 'Kalli', 18, 18);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (19, 'Cathy', 19, 19);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (20, 'Philipa', 20, 20);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (21, 'Niels', 21, 21);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (22, 'Laurette', 22, 22);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (23, 'Kerr', 23, 23);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (24, 'Allan', 24, 24);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (25, 'Hannis', 25, 25);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (26, 'Cacilia', 26, 26);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (27, 'Vikki', 27, 27);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (28, 'Annnora', 28, 28);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (29, 'Valina', 29, 29);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (30, 'Nevsa', 30, 30);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (31, 'Angeline', 31, 31);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (32, 'Elianora', 32, 32);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (33, 'Eloise', 33, 33);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (34, 'Daron', 34, 34);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (35, 'Crystal', 35, 35);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (36, 'Halimeda', 36, 36);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (37, 'Clevie', 37, 37);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (38, 'Derby', 38, 38);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (39, 'Winona', 39, 39);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (40, 'Truman', 40, 40);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (41, 'Allene', 41, 41);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (42, 'Inglis', 42, 42);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (43, 'Kerwin', 43, 43);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (44, 'Julianne', 44, 44);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (45, 'Taffy', 45, 45);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (46, 'Tynan', 46, 46);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (47, 'Branden', 47, 47);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (48, 'Vivie', 48, 48);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (49, 'Henrie', 49, 49);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (50, 'Adrien', 50, 50);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (51, 'Trudy', 51, 51);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (52, 'Donny', 52, 52);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (53, 'Zaccaria', 53, 53);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (54, 'Pen', 54, 54);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (55, 'Maxi', 55, 55);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (56, 'Mufinella', 56, 56);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (57, 'Paulina', 57, 57);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (58, 'Fawnia', 58, 58);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (59, 'Alphonse', 59, 59);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (60, 'Ganny', 60, 60);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (61, 'Corrine', 61, 61);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (62, 'Isidor', 62, 62);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (63, 'Ruthe', 63, 63);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (64, 'Moll', 64, 64);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (65, 'Manda', 65, 65);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (66, 'Franz', 66, 66);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (67, 'Bettye', 67, 67);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (68, 'Ricky', 68, 68);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (69, 'Carr', 69, 69);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (70, 'Sancho', 70, 70);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (71, 'Roby', 71, 71);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (72, 'Marchall', 72, 72);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (73, 'Gayle', 73, 73);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (74, 'Che', 74, 74);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (75, 'Petra', 75, 75);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (76, 'Mae', 76, 76);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (77, 'Tabitha', 77, 77);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (78, 'Angela', 78, 78);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (79, 'Wolfgang', 79, 79);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (80, 'Anneliese', 80, 80);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (81, 'Gerda', 81, 81);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (82, 'Kane', 82, 82);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (83, 'Timofei', 83, 83);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (84, 'Sibilla', 84, 84);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (85, 'Wilmette', 85, 85);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (86, 'Tedmund', 86, 86);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (87, 'Julissa', 87, 87);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (88, 'Petey', 88, 88);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (89, 'Zacharias', 89, 89);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (90, 'Tanny', 90, 90);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (91, 'Justina', 91, 91);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (92, 'Claudette', 92, 92);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (93, 'Paton', 93, 93);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (94, 'Rhetta', 94, 94);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (95, 'Tiphany', 95, 95);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (96, 'Reggy', 96, 96);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (97, 'Cassie', 97, 97);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (98, 'Rutter', 98, 98);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (99, 'Ilse', 99, 99);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (100, 'Teodoro', 100, 100);

USE Spotify;
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (1, 1, 1);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (2, 2, 2);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (3, 3, 3);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (4, 4, 4);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (5, 5, 5);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (6, 6, 6);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (7, 7, 7);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (8, 8, 8);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (9, 9, 9);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (10, 10, 10);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (11, 11, 11);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (12, 12, 12);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (13, 13, 13);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (14, 14, 14);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (15, 15, 15);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (16, 16, 16);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (17, 17, 17);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (18, 18, 18);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (19, 19, 19);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (20, 20, 20);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (21, 21, 21);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (22, 22, 22);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (23, 23, 23);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (24, 24, 24);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (25, 25, 25);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (26, 26, 26);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (27, 27, 27);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (28, 28, 28);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (29, 29, 29);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (30, 30, 30);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (31, 31, 31);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (32, 32, 32);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (33, 33, 33);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (34, 34, 34);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (35, 35, 35);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (36, 36, 36);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (37, 37, 37);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (38, 38, 38);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (39, 39, 39);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (40, 40, 40);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (41, 41, 41);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (42, 42, 42);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (43, 43, 43);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (44, 44, 44);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (45, 45, 45);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (46, 46, 46);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (47, 47, 47);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (48, 48, 48);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (49, 49, 49);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (50, 50, 50);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (51, 51, 51);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (52, 52, 52);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (53, 53, 53);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (54, 54, 54);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (55, 55, 55);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (56, 56, 56);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (57, 57, 57);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (58, 58, 58);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (59, 59, 59);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (60, 60, 60);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (61, 61, 61);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (62, 62, 62);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (63, 63, 63);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (64, 64, 64);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (65, 65, 65);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (66, 66, 66);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (67, 67, 67);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (68, 68, 68);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (69, 69, 69);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (70, 70, 70);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (71, 71, 71);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (72, 72, 72);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (73, 73, 73);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (74, 74, 74);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (75, 75, 75);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (76, 76, 76);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (77, 77, 77);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (78, 78, 78);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (79, 79, 79);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (80, 80, 80);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (81, 81, 81);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (82, 82, 82);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (83, 83, 83);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (84, 84, 84);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (85, 85, 85);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (86, 86, 86);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (87, 87, 87);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (88, 88, 88);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (89, 89, 89);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (90, 90, 90);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (91, 91, 91);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (92, 92, 92);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (93, 93, 93);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (94, 94, 94);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (95, 95, 95);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (96, 96, 96);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (97, 97, 97);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (98, 98, 98);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (99, 99, 99);
insert into Favorito (Id_Favorito, Id_Usuario , Id_Cancion) values (100, 100, 100);

USE Spotify;
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (1, 'Complete glossectomy', '2019-11-28 14:25:01', '2020-01-18 18:11:57', 1);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (2, 'Contrast vasogram', '2019-11-01 20:56:14', '2020-03-08 05:02:58', 2);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (3, 'Parasitol-spleen/marrow', '2020-05-01 09:34:53', '2020-02-15 01:59:54', 3);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (4, 'Implt cardiodefib genatr', '2020-01-21 15:06:07', '2020-01-02 16:40:24', 4);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (5, 'Abd vein resect w replac', '2019-07-13 00:09:58', '2020-05-31 10:19:47', 5);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (6, 'Barium swallow', '2020-05-03 04:16:11', '2019-06-30 11:35:16', 6);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (7, 'Lap adhesiolys ova/tube', '2020-05-02 00:16:13', '2020-04-22 05:18:19', 7);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (8, 'Radical cystectomy', '2019-07-24 20:15:40', '2020-03-07 20:46:20', 8);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (9, 'Hemorr contrl post T & A', '2019-06-13 16:29:55', '2020-05-18 03:51:46', 9);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (10, 'Anal sphincterotomy NEC', '2019-11-23 18:01:47', '2019-08-11 01:06:55', 10);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (11, 'Perirectal excision', '2019-09-30 11:06:34', '2019-08-20 12:51:05', 11);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (12, 'Spine meningocele repair', '2019-11-06 10:47:27', '2019-07-06 10:07:43', 12);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (13, 'Remov pros mat post seg', '2020-03-07 06:46:58', '2019-06-21 05:18:58', 13);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (14, 'Excise femur for graft', '2019-08-29 00:17:19', '2020-06-10 14:34:00', 14);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (15, 'Removal vas ligature', '2020-02-05 23:47:58', '2019-06-16 19:24:46', 15);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (16, 'Attach pedicle graft NEC', '2020-01-07 14:19:33', '2020-05-31 06:02:06', 16);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (17, 'Other femoral incision', '2019-08-21 02:05:02', '2020-04-16 06:58:59', 17);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (18, 'Intravascul imaging NOS', '2019-11-29 10:50:15', '2020-03-21 00:46:59', 18);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (19, 'Remov peritoneal drain', '2019-09-14 01:48:30', '2020-01-05 03:58:48', 19);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (20, 'Arterial pressure monit', '2019-08-05 02:24:09', '2020-01-07 09:08:59', 20);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (21, 'Insert disc pros NOS', '2019-10-19 00:56:46', '2020-01-25 02:35:41', 21);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (22, 'Remov abdom wall suture', '2019-07-28 03:59:01', '2019-08-04 12:54:22', 22);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (23, 'Cystostomy closure', '2020-01-12 06:12:23', '2020-05-10 01:53:44', 23);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (24, 'Ins spin disc pros thor', '2019-12-29 19:54:22', '2019-11-15 02:26:11', 24);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (25, 'Endosc inser stent bile', '2019-08-11 19:28:56', '2020-05-08 02:29:27', 25);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (26, 'Other thymus ops NOS', '2019-07-29 10:20:23', '2019-09-27 18:12:11', 26);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (27, 'Local destruc trach les', '2020-05-08 10:26:17', '2020-03-28 04:42:31', 27);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (28, 'Insert 3 vascular stents', '2020-04-26 05:52:28', '2019-08-01 23:48:19', 28);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (29, 'Mech vitrectomy NEC', '2020-04-26 06:38:14', '2020-01-23 19:29:52', 29);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (30, 'High gastric bypass', '2019-06-18 23:30:26', '2020-02-27 21:26:23', 30);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (31, 'Revise lg bowel anastom', '2020-05-14 19:38:16', '2020-03-13 15:48:28', 31);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (32, 'Internal fix-patella', '2019-11-23 03:56:56', '2020-03-05 01:21:23', 32);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (33, 'Endarterectomy of aorta', '2020-01-18 10:45:58', '2019-12-05 09:10:07', 33);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (34, 'Excision of iris lesion', '2019-10-09 13:38:19', '2019-07-06 04:08:14', 34);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (35, 'Fallop tube repair NEC', '2020-01-06 20:13:46', '2019-07-08 08:34:27', 35);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (36, 'Part gast w jej transpos', '2019-11-19 01:55:41', '2020-05-26 22:29:19', 36);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (37, 'Radical cystectomy', '2019-11-05 19:10:28', '2019-08-23 17:03:47', 37);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (38, 'Loc destr renal les NEC', '2020-05-01 00:03:20', '2019-10-25 05:55:58', 38);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (39, 'Lobotomy & tractotomy', '2019-12-31 08:54:28', '2020-04-27 11:59:57', 39);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (40, 'Bone marrow ops NEC', '2020-04-30 01:33:52', '2019-08-17 19:16:36', 40);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (41, 'Other spinal dx proc', '2020-05-14 02:56:49', '2020-03-31 09:07:52', 41);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (42, 'Uterus/adnexa repair NEC', '2020-04-15 22:02:20', '2019-10-28 21:09:25', 42);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (43, 'Parathyroid scan', '2019-11-06 02:42:31', '2019-09-20 20:24:36', 43);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (44, 'Percut prostatic aspirat', '2020-02-10 22:37:18', '2019-11-18 09:49:06', 44);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (45, 'Conduit artium-pulm art', '2020-05-04 09:03:03', '2019-08-13 04:35:40', 45);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (46, 'Percutaneous pyelogram', '2019-06-22 18:03:17', '2019-11-03 23:35:42', 46);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (47, 'Vaginal repair NEC', '2020-02-08 17:02:03', '2019-08-08 01:14:22', 47);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (48, 'Small-to-large bowel NEC', '2019-11-10 13:42:44', '2020-05-21 20:17:54', 48);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (49, 'Limb lengthen-tib/fibula', '2019-07-06 10:27:56', '2019-06-29 15:43:15', 49);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (50, 'Pineal field exploration', '2019-10-01 00:31:19', '2019-09-29 15:38:12', 50);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (51, 'Excise femur for graft', '2020-06-10 07:00:34', '2019-10-25 02:52:11', 51);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (52, 'Perirectal excision', '2019-10-13 02:08:21', '2019-08-17 23:19:11', 52);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (53, 'Lid lacer rx-prt th NEC', '2019-07-03 03:56:14', '2019-07-04 13:52:16', 53);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (54, 'Lap umbilical hernia NEC', '2020-04-13 11:56:30', '2020-02-07 21:10:13', 54);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (55, 'Revis cutan ileoureteros', '2019-10-23 13:18:34', '2019-11-26 07:04:36', 55);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (56, 'Perirectal tissue biopsy', '2019-11-16 07:57:21', '2020-03-12 00:56:23', 56);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (57, 'Part adrenalectomy NEC', '2020-06-02 20:00:52', '2019-11-02 21:26:54', 57);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (58, 'Mesenteric repair NEC', '2020-04-17 01:17:49', '2020-05-27 22:16:54', 58);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (59, 'Pericardiotomy', '2019-11-05 01:00:35', '2019-11-08 14:12:39', 59);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (60, 'Cholecystectomy', '2020-05-05 00:11:10', '2020-04-13 15:06:53', 60);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (61, 'Ant segment dx proc NEC', '2019-09-05 11:30:02', '2020-02-07 07:03:39', 61);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (62, 'Micro exam-eye NEC', '2020-02-14 02:28:53', '2019-11-19 11:25:52', 62);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (63, 'Loc exc bony palate les', '2019-09-02 21:53:47', '2019-09-14 05:01:58', 63);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (64, 'Goniotomy', '2020-01-10 15:33:34', '2020-01-19 10:58:59', 64);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (65, 'Open reduc-hip dislocat', '2019-07-13 03:32:32', '2020-02-20 18:29:44', 65);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (66, 'Peritoneal lavage', '2019-07-31 05:58:37', '2020-03-14 11:25:46', 66);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (67, 'Foot & toe joint biopsy', '2020-02-29 13:59:29', '2019-09-14 23:34:43', 67);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (68, 'Stern esophagocolos NEC', '2019-09-24 16:25:30', '2020-03-27 12:31:50', 68);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (69, 'Amputation NOS', '2019-07-27 22:31:13', '2020-05-31 21:13:34', 69);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (70, 'Oth salpingo-oophoroplas', '2020-04-18 14:45:28', '2019-12-15 08:25:22', 70);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (71, 'Closed spleen biopsy', '2019-09-08 01:07:01', '2019-12-22 07:12:07', 71);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (72, 'Cervical repair NEC', '2019-10-24 02:46:04', '2020-01-25 17:04:26', 72);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (73, 'Opn bx larynx or trachea', '2019-08-14 21:17:00', '2019-07-14 10:14:57', 73);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (74, 'Oth chest cage ostectomy', '2019-10-30 13:48:16', '2019-11-09 10:10:31', 74);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (75, 'Platelet transfusion', '2020-03-05 20:16:44', '2019-07-02 06:09:05', 75);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (76, 'Vaginal biopsy', '2020-06-06 06:50:15', '2020-05-16 18:50:17', 76);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (77, 'Perc ins intracran stent', '2019-10-31 11:46:08', '2020-03-21 08:18:26', 77);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (78, 'Incise bartholin''s gland', '2019-10-27 02:22:56', '2019-06-22 16:51:51', 78);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (79, 'Other lacrimal gland ops', '2020-04-10 15:09:44', '2020-05-27 22:16:51', 79);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (80, 'Routine chest x-ray', '2020-01-01 16:10:48', '2020-04-28 00:38:43', 80);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (81, 'Suture of artery', '2019-08-01 01:36:21', '2019-07-23 07:43:32', 81);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (82, 'C & s-op wound', '2019-10-07 06:05:41', '2020-04-14 05:54:41', 82);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (83, 'Cervical lymphangiogram', '2020-06-01 11:55:32', '2019-10-21 18:34:43', 83);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (84, 'Patellar sequestrectomy', '2020-02-26 17:49:48', '2019-09-30 13:06:07', 84);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (85, 'Applic ext fix-humerus', '2019-10-31 06:55:24', '2020-04-08 04:34:40', 85);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (86, 'Decompress trigem root', '2019-12-30 13:30:42', '2020-01-21 12:17:00', 86);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (87, 'Other tracheal operation', '2020-04-13 18:44:00', '2020-05-08 10:48:28', 87);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (88, 'Aspiration of breast', '2020-03-25 04:03:21', '2020-01-27 16:37:06', 88);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (89, 'Toe injury operation NOS', '2020-05-07 11:08:08', '2019-07-22 06:08:56', 89);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (90, 'Subtotal mastectomy', '2019-11-30 22:01:20', '2019-08-25 02:43:57', 90);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (91, 'Osteoclasis-patella', '2019-10-19 10:11:54', '2020-03-02 20:33:20', 91);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (92, 'Exten buccolabial/sulcus', '2020-01-16 11:32:39', '2019-07-30 06:58:30', 92);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (93, 'Remove gastric bubble', '2020-05-09 20:01:03', '2019-09-17 06:39:33', 93);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (94, 'Excision of shoulder NEC', '2020-01-24 01:04:16', '2020-04-07 20:45:30', 94);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (95, 'Coronary bld flow monit', '2020-03-10 09:04:53', '2020-06-11 06:18:32', 95);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (96, 'Retinal tear cryotherapy', '2019-11-05 08:36:19', '2020-06-04 18:33:25', 96);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (97, 'Culture NEC', '2020-04-01 11:57:18', '2019-07-12 14:51:09', 97);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (98, 'Lumb/lmbsac fus ant/post', '2020-01-04 03:30:46', '2019-11-23 09:23:56', 98);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (99, 'Pt exercise NEC', '2019-06-22 03:18:10', '2020-05-11 03:28:42', 99);
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida, Id_Usuario) values (100, 'Humerus injury op NOS', '2020-01-21 14:06:46', '2019-09-18 03:17:43', 100);


USE Spotify;
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (1, '10:23:20', 1, 1);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (2, '9:10:26', 2, 2);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (3, '10:19:51', 3, 3);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (4, '7:46:26', 4, 4);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (5, '23:05:08', 5, 5);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (6, '12:06:00', 6, 6);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (7, '5:53:49', 7, 7);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (8, '17:25:26', 8, 8);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (9, '12:19:00', 9, 9);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (10, '21:28:17', 10, 10);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (11, '20:32:11', 11, 11);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (12, '1:15:31', 12, 12);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (13, '9:12:38', 13, 13);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (14, '9:44:52', 14, 14);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (15, '9:46:28', 15, 15);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (16, '9:59:50', 16, 16);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (17, '2:31:14', 17, 17);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (18, '9:53:44', 18, 18);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (19, '18:25:03', 19, 19);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (20, '3:20:02', 20, 20);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (21, '13:20:56', 21, 21);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (22, '17:09:18', 22, 22);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (23, '18:49:31', 23, 23);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (24, '6:54:48', 24, 24);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (25, '0:16:35', 25, 25);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (26, '13:53:10', 26, 26);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (27, '23:02:28', 27, 27);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (28, '19:24:41', 28, 28);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (29, '19:03:28', 29, 29);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (30, '22:38:46', 30, 30);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (31, '13:10:49', 31, 31);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (32, '3:01:31', 32, 32);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (33, '10:50:17', 33, 33);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (34, '17:39:56', 34, 34);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (35, '12:21:34', 35, 35);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (36, '22:48:47', 36, 36);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (37, '23:41:17', 37, 37);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (38, '10:17:06', 38, 38);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (39, '18:03:34', 39, 39);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (40, '15:04:37', 40, 40);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (41, '16:01:16', 41, 41);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (42, '8:52:17', 42, 42);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (43, '10:45:49', 43, 43);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (44, '19:05:41', 44, 44);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (45, '6:58:14', 45, 45);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (46, '22:46:23', 46, 46);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (47, '1:52:14', 47, 47);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (48, '17:33:46', 48, 48);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (49, '22:45:48', 49, 49);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (50, '0:33:49', 50, 50);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (51, '11:56:01', 51, 51);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (52, '9:20:27', 52, 52);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (53, '16:32:53', 53, 53);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (54, '13:52:28', 54, 54);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (55, '1:21:19', 55, 55);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (56, '20:29:54', 56, 56);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (57, '8:31:08', 57, 57);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (58, '20:31:20', 58, 58);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (59, '2:30:33', 59, 59);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (60, '18:51:58', 60, 60);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (61, '0:20:05', 61, 61);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (62, '8:55:14', 62, 62);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (63, '11:13:04', 63, 63);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (64, '6:16:16', 64, 64);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (65, '11:24:19', 65, 65);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (66, '22:53:31', 66, 66);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (67, '3:26:01', 67, 67);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (68, '13:27:37', 68, 68);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (69, '2:06:05', 69, 69);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (70, '7:05:21', 70, 70);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (71, '8:23:59', 71, 71);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (72, '14:54:24', 72, 72);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (73, '0:57:17', 73, 73);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (74, '5:56:35', 74, 74);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (75, '1:22:03', 75, 75);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (76, '18:42:40', 76, 76);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (77, '19:15:05', 77, 77);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (78, '20:25:30', 78, 78);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (79, '23:48:53', 79, 79);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (80, '21:37:29', 80, 80);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (81, '9:18:27', 81, 81);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (82, '4:15:42', 82, 82);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (83, '7:21:07', 83, 83);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (84, '6:52:57', 84, 84);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (85, '12:40:33', 85, 85);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (86, '22:54:59', 86, 86);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (87, '21:47:50', 87, 87);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (88, '12:34:16', 88, 88);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (89, '14:08:08', 89, 89);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (90, '16:14:39', 90, 90);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (91, '8:04:46', 91, 91);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (92, '22:00:22', 92, 92);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (93, '18:27:41', 93, 93);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (94, '3:27:28', 94, 94);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (95, '18:08:39', 95, 95);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (96, '3:58:11', 96, 96);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (97, '7:39:22', 97, 97);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (98, '0:49:12', 98, 98);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (99, '15:13:27', 99, 99);
insert into Cancion_Escuchada (Id_CE, Duracion_CE, Id_Usuario, Id_Cancion) values (100, '13:26:32', 100, 100);

select * from Auditoria;
#reporte de los usuarios ingresado
USE Spotify;
CREATE VIEW ReporteIngresoUsuarios AS
SELECT Usuario.Nombre_Usuario, Max(Auditoria.entrada)as Ultimo_Ingreso, count(Auditoria.Id_Usuario) as Cantidad_Ingreso
FROM Usuario, Auditoria
WHERE Auditoria.Procedimiento='Login' and Usuario.Id_Usuario=Auditoria.Id_Usuario and Auditoria.Id_Usuario group by  Auditoria.Id_Usuario;

#las canciones escuchado
USE Spotify;
CREATE VIEW Canciones_Mas_Escuchados AS
SELECT DISTINCT Nombre_Cancion, Nombre_Disco, Nombre_Artista, Numero_Visitas, Cancion_Escuchada.Id_Usuario
FROM Cancion, Disco, Artistas, Usuario, Cancion_Escuchada
WHERE Cancion.Id_Disco = Disco.Id_Disco  AND Artistas.Id_Artista = Disco.Id_Artista AND Usuario.Id_Usuario = Cancion_Escuchada.Id_Usuario
GROUP BY Nombre_Cancion ORDER BY Numero_Visitas DESC LIMIT 3;

#Lista reproducion por usuarios con las canciones de sugerencias por cado uno
USE Spotify;
CREATE VIEW Reproducion_Cancion_Usuario AS
SELECT Usuario.Nombre_Usuario, Lista_Reproduccion.Nombre_LR, Sugerencia_Canciones.Nombre_Sugerencia, Cancion.Nombre_Cancion
FROM Usuario, Lista_Reproduccion,Sugerencia_Canciones,Cancion WHERE Usuario.Id_Usuario=Lista_Reproduccion.Id_Usuario and Cancion.Id_Cancion=Sugerencia_Canciones.Id_Cancion;



