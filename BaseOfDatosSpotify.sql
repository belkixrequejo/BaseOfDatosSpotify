create database spotify;
use spotify;

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
N_Seguidores int,
primary key(Id_Artista)
)engine=InnoDB;

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
alter table Cancion modify Duracion_Cancion time;

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

create table Auditoria(
Id_Auditoria int not null auto_increment,
Procedimiento varchar(50),
Entrada time,
Salida time,
primary key(Id_Auditoria)
)engine=InnoDB;

#insertar datos en la tabla Rol 
insert into Rol (Id_Rol, Nombre) values (1, 'Invitado');
insert into Rol (Id_Rol, Nombre) values (2, 'Premiun');
insert into Rol (Id_Rol, Nombre) values (3, 'Administrador');
insert into Rol (Id_Rol, Nombre) values (4, 'Artista');

#insertar datos en la tabla Login
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (1, 'taldiss0@ox.ac.uk', 'mS6lss', 'LnEZ1K');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (2, 'wkiernan1@spotify.com', 'S9Cc8AL0evzX', 'gxhlYm9WAyg');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (3, 'oholliar2@geocities.com', 'COgAlppZgK6f', 'ESfSEMDO');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (4, 'rralls3@sphinn.com', 'FWJob1wTS', '9N2elh4N');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (5, 'mdearnley4@dailymotion.com', 'VHpKynzKO', 'neEfWw');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (6, 'kohrtmann5@marketwatch.com', 'GhEbq8z', 'NRtxSd');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (7, 'vpaulou6@parallels.com', '3ZiPcU2YEqw9', 'AG0wEWrF8ei');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (8, 'njust7@ed.gov', 'quH6cn', 'ioDGfHzZ1HAP');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (9, 'mandrejs8@yahoo.com', '8Pn8Gyo', 'GV5i5zThXu');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (10, 'cboykett9@amazon.co.jp', 'OThlgnwhmA', 'Dd1SiT5i');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (11, 'cmacgeffena@sphinn.com', 'JnzTC6', 'uBEejH0UtIF');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (12, 'hsinkinsonb@gmpg.org', 'IdkOQvwd5', 'D3b4MBgqSC3');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (13, 'kaaronc@home.pl', 'tiVLRZ5', 'YWfAoR4');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (14, 'jtestind@chronoengine.com', '3mD2sfcXl', 'oE4aDVY0Ka');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (15, 'rsangoe@upenn.edu', 'gGv7Vyvuy', 'Y7KX0KeTz');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (16, 'vcolqueranf@redcross.org', 'z4nYJS0qdL', 'pilg5GQ9fve');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (17, 'tstreetingg@hc360.com', 'kbxzsk4BB', 'pumd69');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (18, 'cgiottoh@state.gov', 'tUDomXbk1Ix', 'UpP5LdrQlQDj');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (19, 'kgildroyi@goodreads.com', 'Q7NZQPhazeoV', 'OsuC4m');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (20, 'eschurckej@alibaba.com', 'uVvLFDfhSv', 'I29m2D8MGYN5');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (21, 'caubryk@printfriendly.com', 'QPzHjivj9', 'gmoQomUx');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (22, 'aclemsonl@dmoz.org', 'ZHrdE4k', 'vnUBe8yu');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (23, 'kfillanm@utexas.edu', '7gprhakfqk', 'CCwlDfZyI');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (24, 'mdawleyn@slashdot.org', 'bGMPFPBGkVNG', 'NZrGidVw');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (25, 'hjaneczeko@army.mil', 'ehVVNSm', 'VWDU8sUUtVRy');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (26, 'asutterp@theglobeandmail.com', 'yythiU', 'mqH4Z6wL');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (27, 'pmuroq@usnews.com', 'uiV15t', 'JtH5oJ');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (28, 'zboatrightr@loc.gov', 'bYhtNs', '1BCJgfq6wx');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (29, 'phulances@auda.org.au', '84GrFZpz', 'OFvcnjcqt');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (30, 'tdeldellot@booking.com', 'jXzTdd94umD', 'Tj00Y8Vg');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (31, 'ehileyu@msn.com', 'swX1jqrW', 'EZgFG8sGxwVk');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (32, 'creingerv@fc2.com', 'tWUrGPZgA', 'nbwaAx8VO');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (33, 'cquerrardw@blogs.com', 'Z0WF4jD0i1B', 'dPxIobq');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (34, 'sphilipeaux@google.fr', 'rnIv2COWjIMP', 'YiwLn89kK');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (35, 'sarnelly@auda.org.au', '9FUSO0fL', 'x85hdSwp');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (36, 'jchardinz@nationalgeographic.com', '4cKMAedctltT', 'VwheXK');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (37, 'bbrinsford10@sakura.ne.jp', 'U6XuUzXYODlI', 'w1T3dS');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (38, 'cmeads11@cdbaby.com', '2EdbW4NdX2ll', 'meqLukl');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (39, 'abooeln12@cbc.ca', 'ixPIShlUXvB', 'KeK574VH');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (40, 'bwimlett13@etsy.com', 'M4uS0QL6Z0', 'H6uuytWKT');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (41, 'nhuske14@unicef.org', 'nHPdAqASjLI', 'c65YM1vvJ2');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (42, 'tsavill15@dot.gov', 'yuKhid', 'VxkrcTz');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (43, 'lkinnock16@whitehouse.gov', '697cnPExK', '1UZzEHd1');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (44, 'flambal17@unesco.org', 'OKh0M0sY', 'ZJjGSqs7i');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (45, 'esiebert18@yelp.com', 'BfgXJ9x', 'zaqGLfR');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (46, 'tindge19@wired.com', '0o8p4L1X', 'LseJUiWNV');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (47, 'eslyford1a@uol.com.br', 'w7RdeAX', 'OWRTgfHjoVj');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (48, 'rlowrey1b@adobe.com', 'FyP7FYdMBAQ', 'sSWEDL');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (49, 'dtrolley1c@nydailynews.com', 'xOTcmqlr5gF', 'q1Le8K');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (50, 'mkuhne1d@virginia.edu', 'l1gSZV5', 'dYcC0P2Uo');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (51, 'ascrafton1e@facebook.com', 'sw5ulrGLl3', 'zDmaeaA65KTF');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (52, 'ameus1f@jugem.jp', 'wBm97kY8', 'TFUxcn3DzV5');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (53, 'afredy1g@nps.gov', 'XaHULdsNCl', 'TBvuD1');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (54, 'dforre1h@spiegel.de', 'oA7qXRb7j', 'E97IiwC2RUS6');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (55, 'cborsnall1i@livejournal.com', '60Kcjf', 'LK0wto');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (56, 'kkleehuhler1j@indiatimes.com', 's2Ll3H', 'O3UJRHbM');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (57, 'gabel1k@wordpress.org', '30sC9x3mkOSw', '2cikeLjwSM');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (58, 'xtarbin1l@constantcontact.com', 'Cyd9wGEZnff', 'DgvdCZrhad');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (59, 'hnossent1m@discovery.com', 'tPkbe8', 'iGofua67Y');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (60, 'sthorlby1n@craigslist.org', '1U66ggO6g', 'pg6e6JEVir2');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (61, 'nolivia1o@examiner.com', 'CUyBV7', 'HP6EJMDKMR');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (62, 'fballance1p@yahoo.co.jp', 'tugNMf', 'kd5ryn3Pn');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (63, 'bklejna1q@harvard.edu', 'h8RSq85UIR2D', 'qtjdVA');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (64, 'cwinston1r@yahoo.com', 'B8gkBRF', 'FqaFn09Q1cml');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (65, 'ytreves1s@yellowpages.com', 'sR1OKM', 'Htp0QXR');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (66, 'nhalkyard1t@umn.edu', 't592is53H', 'yRyKSEf');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (67, 'vshailer1u@shareasale.com', 'V3SDON6lpKgo', 'kdDEfA');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (68, 'lkubecka1v@elpais.com', 'bAky0Ku2Dk', '36FecSm');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (69, 'aritter1w@examiner.com', 'xwmfjr53eJ', 'sMscjdl5HN');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (70, 'mgravey1x@ask.com', 'tcdpSN', 'tlh8cRi');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (71, 'sferney1y@reuters.com', 'YN63Ye', 'wzKduS');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (72, 'ahayball1z@skyrock.com', 'kh8KCoJvcue', '91OvFA');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (73, 'kgovini20@google.de', 'oTGG8k', 'VzMEGcwx');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (74, 'cgrix21@intel.com', '8job03Ez7F', 'ioEjbEYc4u5c');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (75, 'kphethean22@g.co', 't7yfCbollp', 'iBywCXuvv57d');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (76, 'dfroment23@rambler.ru', 'ZnrsKZquHuP2', 'oXxAur');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (77, 'nparnell24@accuweather.com', 'h9blxWfZ', '8jCDxO00lep');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (78, 'ksanper25@booking.com', 'IrXN80sx9w', 'ZMENC7pZu');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (79, 'jcracoe26@technorati.com', 'E1JWDh', '8nFFwsjHV');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (80, 'dlandrieu27@chronoengine.com', 't7xwwF', 'O7VAToyU40');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (81, 'ejacklings28@amazonaws.com', 'J0MQnbzQ', 'NIQSA2Apo');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (82, 'aharverson29@tinypic.com', 'MFn8FY7pqe', 'kAduoYlngKIQ');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (83, 'swetwood2a@hp.com', 'OodXpVXYto7', '3lsmuO0');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (84, 'llyles2b@posterous.com', 'aIjXgMtSbNYC', 'DX5gVSVDxE');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (85, 'cmegarrell2c@mac.com', 'HJCcioZn', 'Qt2t2f2YIt');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (86, 'gsertin2d@umn.edu', 'DQ26FwL', 'J1qlY5');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (87, 'nesland2e@seattletimes.com', 'X0Y8NbU', 'MfRaTz');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (88, 'tisland2f@google.com.au', 'pcwmlr5', 'cyqsHg79LBRw');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (89, 'bburgott2g@csmonitor.com', 'ayunOoLcK2X', 'AXqtIp5g4h');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (90, 'beisig2h@youtube.com', 'UUm6RDk08v', 'A5u2ZlTjOT');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (91, 'hsindall2i@free.fr', 'Gr3VhkHN', 'YLvXqzp');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (92, 'dbeekmann2j@sina.com.cn', 'fAPNu6nyp9w', 'bHFqZ6ZXH9q6');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (93, 'eblakiston2k@buzzfeed.com', 'KMsDUbpi', 'TqiiHb4xE6');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (94, 'edemars2l@nsw.gov.au', '3aNXUSkT', 'FgR1UA');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (95, 'jrichter2m@vkontakte.ru', 'wWpPFpLVK', 'agJxiZPD85');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (96, 'kpicknett2n@chicagotribune.com', '1Pn6Mw', 'lgfpm2I');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (97, 'efranceschielli2o@vk.com', 'lS0XMPda', 'ZIMV8CAD');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (98, 'mhewins2p@t-online.de', 'xHuWsNody0', 'zYoNiMJwGxLS');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (99, 'amclarens2q@tinyurl.com', 'sottiejpUv', 'qoBQ1wxNtKH');
insert into Login (Id_Login, Correo_Electronico, Password_U, Reset_Password ) values (100, 'jshaxby2r@stumbleupon.com', 'syGvyDwuCWOU', 'Cn6m61VP');


#insertar datos en la tabla Artista
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (1, 'Celia', 'Francisco', 'cschaben0', '2019/08/22', 'Ecuador', 'Male', 1, 'https://robohash.org/estestinventore.jpg?size=50x50&set=set1', 1);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (2, 'Tandie', 'Guthry', 'tcornhill1', '2020/03/09', 'Ecuador', 'Male', 2, 'https://robohash.org/omnisaspernaturprovident.jpg?size=50x50&set=set1', 2);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (3, 'Berenice', 'Rodie', 'bscawton2', '2019/11/21', 'Ecuador', 'Female', 3, 'https://robohash.org/idrepellatut.jpg?size=50x50&set=set1', 3);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (4, 'Trula', 'Derk', 'tgoulding3', '2020/03/09', 'Ecuador', 'Male', 4, 'https://robohash.org/quiaccusamusconsectetur.jpg?size=50x50&set=set1', 4);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (5, 'Dara', 'Jerrie', 'dmuris4', '2020/01/10', 'Ecuador', 'Male', 5, 'https://robohash.org/dolorumculpareiciendis.jpg?size=50x50&set=set1', 5);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (6, 'April', 'Sioux', 'arosenwasser5', '2019/07/31', 'Ecuador', 'Female', 6, 'https://robohash.org/nonilloaccusamus.jpg?size=50x50&set=set1', 6);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (7, 'Elnora', 'Odie', 'edooley6', '2019/07/02', 'Ecuador', 'Male', 7, 'https://robohash.org/corporisdistinctiodeserunt.jpg?size=50x50&set=set1', 7);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (8, 'Winne', 'Reade', 'wdearsley7', '2020/03/20', 'Ecuador', 'Male', 8, 'https://robohash.org/estsolutadelectus.jpg?size=50x50&set=set1', 8);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (9, 'Shaina', 'Albie', 'shalloran8', '2019/10/04', 'Ecuador', 'Male', 9, 'https://robohash.org/totamipsamexpedita.jpg?size=50x50&set=set1', 9);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (10, 'Margaretha', 'Lorin', 'mdebruyne9', '2019/06/02', 'Ecuador', 'Male', 10, 'https://robohash.org/quisnihilmolestiae.jpg?size=50x50&set=set1', 10);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (11, 'Rosanna', 'Siegfried', 'rswyersexeya', '2019/12/23', 'Ecuador', 'Male', 11, 'https://robohash.org/dictainventoresit.jpg?size=50x50&set=set1', 11);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (12, 'Calida', 'Lombard', 'ctreadawayb', '2019/08/06', 'Ecuador', 'Male', 12, 'https://robohash.org/quisquaminventoreet.jpg?size=50x50&set=set1', 12);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (13, 'Emiline', 'Ephrayim', 'epurnellc', '2019/10/08', 'Ecuador', 'Male', 13, 'https://robohash.org/quiexercitationemofficiis.jpg?size=50x50&set=set1', 13);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (14, 'Krystyna', 'Junina', 'kletfordd', '2020/02/14', 'Ecuador', 'Female', 14, 'https://robohash.org/reprehenderitquidolores.jpg?size=50x50&set=set1', 14);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (15, 'Atlanta', 'Glen', 'agwatkinse', '2020/03/18', 'Ecuador', 'Male', 15, 'https://robohash.org/sitquisea.jpg?size=50x50&set=set1', 15);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (16, 'Zahara', 'Philippe', 'zeykelf', '2019/08/06', 'Ecuador', 'Female', 16, 'https://robohash.org/autemadoloribus.jpg?size=50x50&set=set1', 16);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (17, 'Jorrie', 'Elton', 'jarnsong', '2020/05/21', 'Ecuador', 'Male', 17, 'https://robohash.org/reprehenderitdoloribusquo.jpg?size=50x50&set=set1', 17);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (18, 'Nisse', 'Madalyn', 'nspurrh', '2019/12/26', 'Ecuador', 'Female', 18, 'https://robohash.org/adipiscitotamdolorem.jpg?size=50x50&set=set1', 18);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (19, 'Abbye', 'Verina', 'asarveri', '2020/03/04', 'Ecuador', 'Female', 19, 'https://robohash.org/cumqueeaquequo.jpg?size=50x50&set=set1', 19);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (20, 'Livvyy', 'Art', 'lsemeredj', '2019/12/27', 'Ecuador', 'Male', 20, 'https://robohash.org/remsequiatque.jpg?size=50x50&set=set1', 20);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (21, 'Tomi', 'Jewel', 'truggsk', '2020/03/10', 'Ecuador', 'Female', 21, 'https://robohash.org/quivoluptatemsuscipit.jpg?size=50x50&set=set1', 21);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (22, 'Shani', 'Isis', 'smcgawnl', '2020/05/21', 'Ecuador', 'Female', 22, 'https://robohash.org/cumdoloressint.jpg?size=50x50&set=set1', 22);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (23, 'Brett', 'Lusa', 'bstallworthym', '2019/08/20', 'Ecuador', 'Female', 23, 'https://robohash.org/aspernaturquamreiciendis.jpg?size=50x50&set=set1', 23);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (24, 'Emogene', 'Ahmad', 'emifflinn', '2020/01/17', 'Ecuador', 'Male', 24, 'https://robohash.org/velcumquerecusandae.jpg?size=50x50&set=set1', 24);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (25, 'Lelah', 'Derby', 'lweldeno', '2020/03/17', 'Ecuador', 'Male', 25, 'https://robohash.org/quiaerrorest.jpg?size=50x50&set=set1', 25);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (26, 'Tuesday', 'Alfons', 'tkirkpatrickp', '2020/03/30', 'Ecuador', 'Male', 26, 'https://robohash.org/sitlaboriosamneque.jpg?size=50x50&set=set1', 26);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (27, 'Rozalin', 'Clem', 'rinkpenq', '2019/10/20', 'Ecuador', 'Female', 27, 'https://robohash.org/eiusaccusantiumeos.jpg?size=50x50&set=set1', 27);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (28, 'Nedda', 'Bertine', 'nwardellr', '2020/01/26', 'Ecuador', 'Female', 28, 'https://robohash.org/sitenimbeatae.jpg?size=50x50&set=set1', 28);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (29, 'Robbyn', 'Kacie', 'rrickarseys', '2019/09/11', 'Ecuador', 'Female', 29, 'https://robohash.org/quaenatusoccaecati.jpg?size=50x50&set=set1', 29);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (30, 'Carma', 'Nickie', 'cdorgont', '2019/12/02', 'Ecuador', 'Male', 30, 'https://robohash.org/iustocorporisconsectetur.jpg?size=50x50&set=set1', 30);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (31, 'Claudia', 'Murdoch', 'churburtu', '2020/02/23', 'Ecuador', 'Male', 31, 'https://robohash.org/repellendusintenetur.jpg?size=50x50&set=set1', 31);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (32, 'Charo', 'Abbe', 'ceaseyv', '2020/01/10', 'Ecuador', 'Female', 32, 'https://robohash.org/estquoddeserunt.jpg?size=50x50&set=set1', 32);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (33, 'Shandie', 'Nettle', 'sflaxmanw', '2019/10/05', 'Ecuador', 'Female', 33, 'https://robohash.org/voluptatemveniamsapiente.jpg?size=50x50&set=set1', 33);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (34, 'Elissa', 'Jamey', 'elernihanx', '2019/06/18', 'Ecuador', 'Male', 34, 'https://robohash.org/aliasperspiciatiset.jpg?size=50x50&set=set1', 34);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (35, 'Devina', 'Melosa', 'dtorresiy', '2019/09/22', 'Ecuador', 'Female', 35, 'https://robohash.org/nostrumofficiisconsectetur.jpg?size=50x50&set=set1', 35);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (36, 'Devan', 'Herta', 'ddraiseyz', '2020/02/21', 'Ecuador', 'Female', 36, 'https://robohash.org/quidemsedea.jpg?size=50x50&set=set1', 36);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (37, 'Giana', 'Amerigo', 'gwollen10', '2019/06/15', 'Ecuador', 'Male', 37, 'https://robohash.org/blanditiislaudantiumdolores.jpg?size=50x50&set=set1', 37);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (38, 'Bird', 'Levy', 'bteissier11', '2020/05/03', 'Ecuador', 'Male', 38, 'https://robohash.org/voluptatumquiaet.jpg?size=50x50&set=set1', 38);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (39, 'Mildrid', 'Billy', 'mharriagn12', '2019/12/12', 'Ecuador', 'Female', 39, 'https://robohash.org/autemenimnisi.jpg?size=50x50&set=set1', 39);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (40, 'Toby', 'Axe', 'talden13', '2019/10/15', 'Ecuador', 'Male', 40, 'https://robohash.org/consequaturinciduntsint.jpg?size=50x50&set=set1', 40);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (41, 'Madelle', 'Dar', 'mpurvis14', '2019/09/10', 'Ecuador', 'Male', 41, 'https://robohash.org/sitnequeratione.jpg?size=50x50&set=set1', 41);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (42, 'Brandice', 'Hedi', 'bpresidey15', '2019/11/25', 'Ecuador', 'Female', 42, 'https://robohash.org/corporiseaquaerat.jpg?size=50x50&set=set1', 42);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (43, 'Kristien', 'Erhart', 'kparslow16', '2019/07/15', 'Ecuador', 'Male', 43, 'https://robohash.org/velitidperferendis.jpg?size=50x50&set=set1', 43);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (44, 'Dorisa', 'Russ', 'dlemoir17', '2019/06/21', 'Ecuador', 'Male', 44, 'https://robohash.org/velsapientenumquam.jpg?size=50x50&set=set1', 44);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (45, 'Etta', 'Leslie', 'ecreser18', '2019/07/25', 'Ecuador', 'Female', 45, 'https://robohash.org/adipiscidignissimosexpedita.jpg?size=50x50&set=set1', 45);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (46, 'Loretta', 'Deeanne', 'lsigart19', '2020/01/20', 'Ecuador', 'Female', 46, 'https://robohash.org/nihilutquia.jpg?size=50x50&set=set1', 46);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (47, 'Rianon', 'Vallie', 'rwaterhowse1a', '2020/03/26', 'Ecuador', 'Female', 47, 'https://robohash.org/omniseumiste.jpg?size=50x50&set=set1', 47);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (48, 'Meryl', 'Giffard', 'mbittleson1b', '2020/05/02', 'Ecuador', 'Male', 48, 'https://robohash.org/inestmollitia.jpg?size=50x50&set=set1', 48);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (49, 'Marissa', 'Irv', 'mingraham1c', '2019/08/23', 'Ecuador', 'Male', 49, 'https://robohash.org/estrationeminus.jpg?size=50x50&set=set1', 49);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (50, 'Viola', 'Karoly', 'vpeer1d', '2019/11/19', 'Ecuador', 'Female', 50, 'https://robohash.org/porrovoluptatesadipisci.jpg?size=50x50&set=set1', 50);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (51, 'Prisca', 'Somerset', 'ptubridy1e', '2019/09/12', 'Ecuador', 'Male', 51, 'https://robohash.org/voluptasvoluptatemdignissimos.jpg?size=50x50&set=set1', 51);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (52, 'Constantina', 'George', 'ccundict1f', '2019/06/29', 'Ecuador', 'Female', 52, 'https://robohash.org/aliassedofficia.jpg?size=50x50&set=set1', 52);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (53, 'Kacie', 'Davon', 'kdrewett1g', '2019/11/29', 'Ecuador', 'Male', 53, 'https://robohash.org/quosdebitistemporibus.jpg?size=50x50&set=set1', 53);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (54, 'Imogen', 'Ring', 'ihartas1h', '2019/08/25', 'Ecuador', 'Male', 54, 'https://robohash.org/architectoutlabore.jpg?size=50x50&set=set1', 54);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (55, 'Pearla', 'Miof mela', 'pgammill1i', '2019/07/26', 'Ecuador', 'Female', 55, 'https://robohash.org/estetodit.jpg?size=50x50&set=set1', 55);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (56, 'Carla', 'Nerte', 'croughey1j', '2019/12/20', 'Ecuador', 'Female', 56, 'https://robohash.org/rerumquisquamnisi.jpg?size=50x50&set=set1', 56);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (57, 'Jessa', 'Keenan', 'jbigmore1k', '2019/07/27', 'Ecuador', 'Male', 57, 'https://robohash.org/adexpeditarepellat.jpg?size=50x50&set=set1', 57);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (58, 'Milicent', 'Addison', 'mbriscoe1l', '2020/02/12', 'Ecuador', 'Male', 58, 'https://robohash.org/culpaaperiamaspernatur.jpg?size=50x50&set=set1', 58);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (59, 'Angy', 'Luca', 'aguillard1m', '2019/06/09', 'Ecuador', 'Male', 59, 'https://robohash.org/molestiaeomnisaccusamus.jpg?size=50x50&set=set1', 59);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (60, 'Ardis', 'Dun', 'aausher1n', '2019/12/16', 'Ecuador', 'Male', 60, 'https://robohash.org/quasomnisenim.jpg?size=50x50&set=set1', 60);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (61, 'Saidee', 'Ike', 'sscotland1o', '2019/12/17', 'Ecuador', 'Male', 61, 'https://robohash.org/repudiandaecommodirepellat.jpg?size=50x50&set=set1', 61);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (62, 'Doralyn', 'Roobbie', 'dmegarry1p', '2019/10/05', 'Ecuador', 'Female', 62, 'https://robohash.org/cupiditateducimusaliquam.jpg?size=50x50&set=set1', 62);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (63, 'Marci', 'Tobi', 'mraoux1q', '2019/07/03', 'Ecuador', 'Female', 63, 'https://robohash.org/etsitreprehenderit.jpg?size=50x50&set=set1', 63);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (64, 'Kissie', 'Brear', 'kgooddy1r', '2020/02/15', 'Ecuador', 'Female', 64, 'https://robohash.org/nullasuscipitsed.jpg?size=50x50&set=set1', 64);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (65, 'Tallulah', 'Robby', 'twadley1s', '2020/02/24', 'Ecuador', 'Female', 65, 'https://robohash.org/porroeteius.jpg?size=50x50&set=set1', 65);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (66, 'Blondell', 'Jordan', 'bcraske1t', '2019/08/22', 'Ecuador', 'Male', 66, 'https://robohash.org/similiqueautvelit.jpg?size=50x50&set=set1', 66);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (67, 'Roseline', 'Vinnie', 'rgrimston1u', '2019/06/28', 'Ecuador', 'Male', 67, 'https://robohash.org/occaecatiidlaborum.jpg?size=50x50&set=set1', 67);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (68, 'Mareah', 'Calla', 'mclowton1v', '2019/11/19', 'Ecuador', 'Female', 68, 'https://robohash.org/temporenequemagnam.jpg?size=50x50&set=set1', 68);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (69, 'Stephenie', 'Dominick', 'smacneice1w', '2019/07/01', 'Ecuador', 'Male', 69, 'https://robohash.org/quasiestdicta.jpg?size=50x50&set=set1', 69);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (70, 'Zondra', 'Dara', 'znorgate1x', '2019/11/25', 'Ecuador', 'Female', 70, 'https://robohash.org/reprehenderitetpossimus.jpg?size=50x50&set=set1', 70);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (71, 'Cammie', 'Sileas', 'civanilov1y', '2019/11/02', 'Ecuador', 'Female', 71, 'https://robohash.org/mollitiavoluptateducimus.jpg?size=50x50&set=set1', 71);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (72, 'Zabrina', 'Pren', 'zweldrake1z', '2019/08/21', 'Ecuador', 'Male', 72, 'https://robohash.org/voluptasmolestiaedistinctio.jpg?size=50x50&set=set1', 72);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (73, 'Rivy', 'Whitaker', 'rdeetlof20', '2019/06/17', 'Ecuador', 'Male', 73, 'https://robohash.org/sitinin.jpg?size=50x50&set=set1', 73);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (74, 'Lydia', 'Noni', 'lsoeiro21', '2019/11/23', 'Ecuador', 'Female', 74, 'https://robohash.org/hicculpaaut.jpg?size=50x50&set=set1', 74);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (75, 'Ramonda', 'Glenn', 'rcroft22', '2019/09/08', 'Ecuador', 'Male', 75, 'https://robohash.org/liberoducimusdolorem.jpg?size=50x50&set=set1', 75);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (76, 'Fredrika', 'Devinne', 'fpaulusch23', '2019/10/28', 'Ecuador', 'Female', 76, 'https://robohash.org/vitaeinquia.jpg?size=50x50&set=set1', 76);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (77, 'Charis', 'Melonie', 'cskrzynski24', '2019/07/18', 'Ecuador', 'Female', 77, 'https://robohash.org/evenietrerumqui.jpg?size=50x50&set=set1', 77);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (78, 'Helenelizabeth', 'Jeffy', 'hgagan25', '2019/08/17', 'Ecuador', 'Male', 78, 'https://robohash.org/ataliquamiure.jpg?size=50x50&set=set1', 78);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (79, 'Ninnetta', 'Frasquito', 'nlarham26', '2020/02/09', 'Ecuador', 'Male', 79, 'https://robohash.org/sitestut.jpg?size=50x50&set=set1', 79);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (80, 'Rozamond', 'Krysta', 'rvasile27', '2020/04/06', 'Ecuador', 'Female', 80, 'https://robohash.org/voluptatemsintest.jpg?size=50x50&set=set1', 80);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (81, 'Dorita', 'Lindie', 'dtonkinson28', '2019/12/12', 'Ecuador', 'Female', 81, 'https://robohash.org/etquiquia.jpg?size=50x50&set=set1', 81);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (82, 'Ddene', 'Jesselyn', 'dscola29', '2020/04/20', 'Ecuador', 'Female', 82, 'https://robohash.org/illumvoluptasexplicabo.jpg?size=50x50&set=set1', 82);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (83, 'Rozanna', 'West', 'rpawlaczyk2a', '2019/10/22', 'Ecuador', 'Male', 83, 'https://robohash.org/expeditacorporisfugit.jpg?size=50x50&set=set1', 83);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (84, 'Kali', 'Jonas', 'kkubyszek2b', '2019/10/25', 'Ecuador', 'Male', 84, 'https://robohash.org/voluptatemsuntquis.jpg?size=50x50&set=set1', 84);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (85, 'Paula', 'Kiley', 'prout2c', '2019/07/30', 'Ecuador', 'Male', 85, 'https://robohash.org/inomniseum.jpg?size=50x50&set=set1', 85);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (86, 'Darby', 'Stanislaw', 'dpellitt2d', '2019/11/04', 'Ecuador', 'Male', 86, 'https://robohash.org/quambeataererum.jpg?size=50x50&set=set1', 86);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (87, 'Dinnie', 'Lothario', 'dmackintosh2e', '2019/11/05', 'Ecuador', 'Male', 87, 'https://robohash.org/pariaturmolestiasplaceat.jpg?size=50x50&set=set1', 87);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (88, 'Bambi', 'Evie', 'bbrack2f', '2020/03/05', 'Ecuador', 'Female', 88, 'https://robohash.org/adipisciquaeratlibero.jpg?size=50x50&set=set1', 88);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (89, 'Nedda', 'Chrissie', 'ncrockford2g', '2020/05/05', 'Ecuador', 'Male', 89, 'https://robohash.org/blanditiisdictadoloremque.jpg?size=50x50&set=set1', 89);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (90, 'Ag', 'Brooke', 'ahugo2h', '2019/07/22', 'Ecuador', 'Male', 90, 'https://robohash.org/suntaccusantiummolestiae.jpg?size=50x50&set=set1', 90);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (91, 'Dix', 'Edita', 'dwhitman2i', '2020/05/26', 'Ecuador', 'Female', 91, 'https://robohash.org/molestiasdolorummagni.jpg?size=50x50&set=set1', 91);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (92, 'Emmeline', 'Jeanie', 'eewens2j', '2019/05/31', 'Ecuador', 'Female', 92, 'https://robohash.org/etculpaquis.jpg?size=50x50&set=set1', 92);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (93, 'Mil', 'Elfreda', 'mdaingerfield2k', '2019/11/24', 'Ecuador', 'Female', 93, 'https://robohash.org/consequaturplaceatharum.jpg?size=50x50&set=set1', 93);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (94, 'Dulcy', 'Ethel', 'dsoles2l', '2019/06/28', 'Ecuador', 'Female', 94, 'https://robohash.org/mollitiaassumendaquia.jpg?size=50x50&set=set1', 94);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (95, 'Chanda', 'Sidonnie', 'cdrain2m', '2020/05/25', 'Ecuador', 'Female', 95, 'https://robohash.org/voluptasconsequaturvoluptates.jpg?size=50x50&set=set1', 95);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (96, 'Luella', 'Travers', 'lcorradino2n', '2020/01/13', 'Ecuador', 'Male', 96, 'https://robohash.org/fugitnequeunde.jpg?size=50x50&set=set1', 96);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (97, 'Gwenore', 'Freeman', 'gmaffiotti2o', '2019/12/01', 'Ecuador', 'Male', 97, 'https://robohash.org/commodinesciuntquo.jpg?size=50x50&set=set1', 97);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (98, 'Selma', 'Cleo', 'scoatsworth2p', '2020/03/14', 'Ecuador', 'Female', 98, 'https://robohash.org/autemaccusantiumoccaecati.jpg?size=50x50&set=set1', 98);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (99, 'Colline', 'Claiborne', 'csaville2q', '2019/11/22', 'Ecuador', 'Male', 99, 'https://robohash.org/voluptatemmaximequo.jpg?size=50x50&set=set1', 99);
insert into Artistas (Id_Artista, Nombre_Artista, Apellido_Artista, Nombre_Artistico, Fecha_Nacimiento, Nacionalidad, Genero, NumeroSeguidores, Foto, N_Seguidores) values (100, 'Millicent', 'Brandice', 'mroads2r', '2020/04/18', 'Ecuador', 'Female', 100, 'https://robohash.org/sintmagniincidunt.jpg?size=50x50&set=set1', 100);

#insertar datos en la tabla Usuario
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (1, 'Nathalie', 'Logan', '2020/02/10', 'https://robohash.org/esseeiusducimus.jpg?size=50x50&set=set1', 1, 1);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (2, 'Elene', 'Brett', '2019/08/27', 'https://robohash.org/minimavitaeearum.jpg?size=50x50&set=set1', 2, 2);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (3, 'Darleen', 'Valaree', '2020/02/24', 'https://robohash.org/praesentiumoditsint.jpg?size=50x50&set=set1', 3, 3);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (4, 'Cassandra', 'Sherrie', '2020/03/27', 'https://robohash.org/nullaomnissapiente.jpg?size=50x50&set=set1', 4, 4);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (5, 'Gunilla', 'Lemuel', '2019/12/15', 'https://robohash.org/quasiutomnis.jpg?size=50x50&set=set1', 1, 5);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (6, 'Ciel', 'Dorene', '2020/05/13', 'https://robohash.org/nisiexplicaboest.jpg?size=50x50&set=set1', 2, 6);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (7, 'Batsheva', 'Michal', '2019/09/13', 'https://robohash.org/sapienteperspiciatisfugit.jpg?size=50x50&set=set1', 4, 7);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (8, 'Julie', 'Velvet', '2020/03/22', 'https://robohash.org/ipsumprovidentdolorem.jpg?size=50x50&set=set1', 1, 8);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (9, 'Sam', 'Janeta', '2019/05/29', 'https://robohash.org/architectosuscipitquis.jpg?size=50x50&set=set1', 4, 9);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (10, 'Sherline', 'Arlyn', '2019/07/27', 'https://robohash.org/idautiste.jpg?size=50x50&set=set1', 1, 10);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (11, 'Colly', 'Vergil', '2019/08/07', 'https://robohash.org/aeiusvel.jpg?size=50x50&set=set1', 1, 11);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (12, 'Ginelle', 'Gussi', '2019/12/10', 'https://robohash.org/estomnisnostrum.jpg?size=50x50&set=set1', 2, 12);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (13, 'Lynne', 'Mallory', '2019/08/28', 'https://robohash.org/velitsaepesed.jpg?size=50x50&set=set1', 1, 13);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (14, 'Nichole', 'Ardath', '2020/01/31', 'https://robohash.org/undelaboriosamcum.jpg?size=50x50&set=set1', 4, 14);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (15, 'Rosalinde', 'Aron', '2019/10/20', 'https://robohash.org/abinciduntsimilique.jpg?size=50x50&set=set1', 1, 15);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (16, 'Lesya', 'Odessa', '2019/11/16', 'https://robohash.org/voluptaseumquia.jpg?size=50x50&set=set1', 1, 16);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (17, 'Ryann', 'Clarke', '2019/12/22', 'https://robohash.org/verocommodiperferendis.jpg?size=50x50&set=set1', 1, 17);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (18, 'Vanda', 'Raymund', '2019/08/01', 'https://robohash.org/evenietnullamolestiae.jpg?size=50x50&set=set1', 1, 18);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (19, 'Kate', 'Catherina', '2019/06/01', 'https://robohash.org/ullamdoloremqui.jpg?size=50x50&set=set1', 1, 19);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (20, 'Andromache', 'Hartwell', '2019/08/08', 'https://robohash.org/perferendisliberodolorum.jpg?size=50x50&set=set1', 2, 20);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (21, 'Aeriel', 'Larisa', '2019/09/07', 'https://robohash.org/solutavoluptatesexcepturi.jpg?size=50x50&set=set1', 1, 21);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (22, 'Gaye', 'Kyrstin', '2019/12/17', 'https://robohash.org/facerecorruptiet.jpg?size=50x50&set=set1', 2, 22);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (23, 'Mellie', 'Anallise', '2019/12/17', 'https://robohash.org/nemoeaquenulla.jpg?size=50x50&set=set1', 2, 23);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (24, 'Cathe', 'Rodolph', '2019/07/26', 'https://robohash.org/sintrepellendusenim.jpg?size=50x50&set=set1', 4, 24);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (25, 'Lorry', 'Cyrill', '2020/03/16', 'https://robohash.org/quiquidemconsequuntur.jpg?size=50x50&set=set1', 2, 25);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (26, 'Sheri', 'Darice', '2019/08/26', 'https://robohash.org/errorutvel.jpg?size=50x50&set=set1', 2, 26);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (27, 'Louise', 'Karena', '2020/01/20', 'https://robohash.org/minimaisteut.jpg?size=50x50&set=set1', 2, 27);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (28, 'Kirstyn', 'Pegeen', '2020/04/27', 'https://robohash.org/mollitiavoluptasassumenda.jpg?size=50x50&set=set1', 2, 28);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (29, 'Magdaia', 'Nicoli', '2020/01/20', 'https://robohash.org/molestiaeofficialabore.jpg?size=50x50&set=set1', 2, 29);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (30, 'Ondrea', 'Neila', '2020/03/15', 'https://robohash.org/suscipitetdoloremque.jpg?size=50x50&set=set1', 2, 30);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (31, 'Jillayne', 'Roseanne', '2019/10/25', 'https://robohash.org/eosevenietofficia.jpg?size=50x50&set=set1', 1, 31);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (32, 'Debora', 'Lila', '2020/01/15', 'https://robohash.org/natusametomnis.jpg?size=50x50&set=set1', 2, 32);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (33, 'Anallise', 'Kaylil', '2019/05/27', 'https://robohash.org/commodirerumfuga.jpg?size=50x50&set=set1', 2, 33);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (34, 'Maryanne', 'Ardis', '2019/07/26', 'https://robohash.org/velitconsequunturqui.jpg?size=50x50&set=set1', 4, 34);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (35, 'Helsa', 'Stevena', '2020/05/15', 'https://robohash.org/commodirationequam.jpg?size=50x50&set=set1', 2, 35);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (36, 'Yoko', 'Reginald', '2020/01/04', 'https://robohash.org/repudiandaeinciduntcumque.jpg?size=50x50&set=set1', 2, 36);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (37, 'Zena', 'Lidia', '2020/03/18', 'https://robohash.org/necessitatibusaliquamdolor.jpg?size=50x50&set=set1', 2, 37);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (38, 'Janetta', 'Emmey', '2019/08/07', 'https://robohash.org/modiquasadipisci.jpg?size=50x50&set=set1', 2, 38);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (39, 'Cheslie', 'Joelle', '2019/07/25', 'https://robohash.org/nihiletminima.jpg?size=50x50&set=set1', 2, 39);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (40, 'Jen', 'Rosalia', '2020/02/06', 'https://robohash.org/fugaperferendismaiores.jpg?size=50x50&set=set1', 4, 40);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (41, 'Chastity', 'Guido', '2020/03/06', 'https://robohash.org/eligendieummagnam.jpg?size=50x50&set=set1', 1, 41);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (42, 'Susanne', 'Jarrad', '2019/11/26', 'https://robohash.org/solutaconsequaturaut.jpg?size=50x50&set=set1', 2, 42);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (43, 'Hermina', 'Celestyna', '2020/01/03', 'https://robohash.org/aututdeleniti.jpg?size=50x50&set=set1', 4, 43);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (44, 'Tersina', 'Sayre', '2019/08/26', 'https://robohash.org/illoconsequunturaccusamus.jpg?size=50x50&set=set1', 4, 44);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (45, 'Noni', 'Penni', '2019/07/23', 'https://robohash.org/harumoccaecaticulpa.jpg?size=50x50&set=set1', 4, 45);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (46, 'Tammie', 'Leonard', '2019/09/16', 'https://robohash.org/cupiditatedistinctiosed.jpg?size=50x50&set=set1', 4, 46);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (47, 'Issy', 'Kylila', '2019/07/04', 'https://robohash.org/enimfugiatanimi.jpg?size=50x50&set=set1', 4, 47);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (48, 'Britni', 'Sarina', '2019/10/22', 'https://robohash.org/consecteturmaioresest.jpg?size=50x50&set=set1', 4, 48);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (49, 'Kania', 'Hammad', '2019/06/06', 'https://robohash.org/rerumquicupiditate.jpg?size=50x50&set=set1', 4, 49);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (50, 'Elana', 'Aurlie', '2020/02/29', 'https://robohash.org/inrerumdebitis.jpg?size=50x50&set=set1', 3, 50);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (51, 'Karrie', 'Kimble', '2020/04/04', 'https://robohash.org/cumnonquos.jpg?size=50x50&set=set1', 1, 51);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (52, 'Clareta', 'Peder', '2020/01/15', 'https://robohash.org/quiaetaut.jpg?size=50x50&set=set1', 2, 52);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (53, 'Caritta', 'Darice', '2019/12/16', 'https://robohash.org/dictacorruptimagnam.jpg?size=50x50&set=set1', 4, 53);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (54, 'Marna', 'Alleen', '2020/01/02', 'https://robohash.org/excepturisimiliqueet.jpg?size=50x50&set=set1', 4, 54);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (55, 'Lolly', 'Chaim', '2019/11/04', 'https://robohash.org/quiaaliquameligendi.jpg?size=50x50&set=set1', 4, 55);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (56, 'Fredra', 'Hyacinth', '2019/08/10', 'https://robohash.org/quiaquamquis.jpg?size=50x50&set=set1', 4, 56);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (57, 'Doralynn', 'Roxanne', '2020/04/05', 'https://robohash.org/officiisdoloremiure.jpg?size=50x50&set=set1', 4, 57);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (58, 'Rosita', 'Lotta', '2019/08/12', 'https://robohash.org/accusamusutofficiis.jpg?size=50x50&set=set1', 4, 58);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (59, 'Jobi', 'Leia', '2020/01/29', 'https://robohash.org/remrepellatipsa.jpg?size=50x50&set=set1', 4, 59);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (60, 'Glenine', 'Roley', '2019/08/23', 'https://robohash.org/etsitdebitis.jpg?size=50x50&set=set1', 4, 60);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (61, 'Tina', 'Fionnula', '2019/08/28', 'https://robohash.org/estrepudiandaeeum.jpg?size=50x50&set=set1', 1, 61);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (62, 'Rebecca', 'Padgett', '2019/06/14', 'https://robohash.org/quiavelitillum.jpg?size=50x50&set=set1', 2, 62);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (63, 'Elizabeth', 'Scotty', '2020/02/08', 'https://robohash.org/inventorenisisit.jpg?size=50x50&set=set1', 1, 63);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (64, 'Carolynn', 'Hertha', '2019/08/17', 'https://robohash.org/magniatempore.jpg?size=50x50&set=set1', 4, 64);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (65, 'Carmencita', 'Ulysses', '2019/07/08', 'https://robohash.org/delenitidelectusaperiam.jpg?size=50x50&set=set1', 1, 65);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (66, 'Livia', 'Tarrance', '2020/03/09', 'https://robohash.org/verofacilisdeleniti.jpg?size=50x50&set=set1', 1, 66);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (67, 'Kaylee', 'Ethel', '2020/04/14', 'https://robohash.org/etlaborumaut.jpg?size=50x50&set=set1', 1, 67);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (68, 'Myrilla', 'Wilhelm', '2020/05/16', 'https://robohash.org/voluptasducimuset.jpg?size=50x50&set=set1', 1, 68);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (69, 'Cassaundra', 'Obidiah', '2020/01/19', 'https://robohash.org/aperiamatlaborum.jpg?size=50x50&set=set1', 1, 69);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (70, 'Aleen', 'Nancee', '2020/05/15', 'https://robohash.org/expeditaoptioqui.jpg?size=50x50&set=set1', 1, 70);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (71, 'Brigit', 'Raynor', '2019/07/13', 'https://robohash.org/aspernaturfugaexplicabo.jpg?size=50x50&set=set1', 1, 71);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (72, 'Shayla', 'Gare', '2020/01/18', 'https://robohash.org/cumquealiquidminus.jpg?size=50x50&set=set1', 2, 72);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (73, 'Leoline', 'Phaedra', '2019/12/31', 'https://robohash.org/sintametdistinctio.jpg?size=50x50&set=set1', 2, 73);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (74, 'Erina', 'Daria', '2019/09/14', 'https://robohash.org/quaeomnisquia.jpg?size=50x50&set=set1', 4, 74);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (75, 'Ange', 'Gertrud', '2019/07/05', 'https://robohash.org/utlaboriosamex.jpg?size=50x50&set=set1', 2, 75);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (76, 'Melli', 'Brianne', '2019/06/26', 'https://robohash.org/recusandaeanimiquam.jpg?size=50x50&set=set1', 2, 76);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (77, 'Meagan', 'Gwenny', '2020/02/09', 'https://robohash.org/estnecessitatibusullam.jpg?size=50x50&set=set1', 2, 77);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (78, 'Harriet', 'Ilse', '2020/01/15', 'https://robohash.org/voluptasperferendismagni.jpg?size=50x50&set=set1', 2, 78);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (79, 'Kelsey', 'Hanan', '2020/05/02', 'https://robohash.org/assumendautsunt.jpg?size=50x50&set=set1', 2, 79);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (80, 'Kalina', 'Dennis', '2020/03/08', 'https://robohash.org/minimaeumut.jpg?size=50x50&set=set1', 2, 80);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (81, 'Guenna', 'Duffie', '2020/01/21', 'https://robohash.org/insitdelectus.jpg?size=50x50&set=set1', 1, 81);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (82, 'Idelle', 'Norbert', '2019/08/04', 'https://robohash.org/officiaquoquia.jpg?size=50x50&set=set1', 2, 82);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (83, 'Demetria', 'Maighdiln', '2020/03/16', 'https://robohash.org/dignissimosquibusdamillum.jpg?size=50x50&set=set1', 4, 83);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (84, 'Camile', 'Pavel', '2019/12/07', 'https://robohash.org/saepevoluptasnecessitatibus.jpg?size=50x50&set=set1', 4, 84);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (85, 'Hazel', 'Loria', '2020/05/11', 'https://robohash.org/corruptiundepariatur.jpg?size=50x50&set=set1', 4, 85);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (86, 'Daisy', 'Lesley', '2020/03/23', 'https://robohash.org/mollitiaautsaepe.jpg?size=50x50&set=set1', 4, 86);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (87, 'Aurelie', 'Brooke', '2019/08/03', 'https://robohash.org/praesentiumcupiditatererum.jpg?size=50x50&set=set1', 4, 87);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (88, 'Cayla', 'Luis', '2019/08/26', 'https://robohash.org/quaeratperspiciatisdolor.jpg?size=50x50&set=set1', 4, 88);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (89, 'Dulcine', 'Rhetta', '2019/12/08', 'https://robohash.org/sitfugitiste.jpg?size=50x50&set=set1', 4, 89);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (90, 'Christiana', 'Hillie', '2019/11/07', 'https://robohash.org/atdolorad.jpg?size=50x50&set=set1', 4, 90);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (91, 'Valentina', 'Eugenius', '2019/12/06', 'https://robohash.org/laboriosamquasiodio.jpg?size=50x50&set=set1', 1, 91);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (92, 'Carline', 'Ruthie', '2019/10/15', 'https://robohash.org/ettotamsint.jpg?size=50x50&set=set1', 2, 92);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (93, 'Min', 'Russ', '2019/07/08', 'https://robohash.org/errorlaudantiumvoluptas.jpg?size=50x50&set=set1', 1, 93);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (94, 'Erminie', 'Phil', '2020/01/11', 'https://robohash.org/excepturiquiavelit.jpg?size=50x50&set=set1', 4, 94);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (95, 'Arden', 'Bell', '2019/09/12', 'https://robohash.org/natusconsequaturaut.jpg?size=50x50&set=set1', 1, 95);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (96, 'Moreen', 'Lucho', '2020/05/04', 'https://robohash.org/cupiditatevoluptatemnon.jpg?size=50x50&set=set1', 1, 96);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (97, 'Nina', 'Lorne', '2019/07/12', 'https://robohash.org/ullamautemdolorem.jpg?size=50x50&set=set1', 1, 97);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (98, 'Thea', 'Leonardo', '2019/07/25', 'https://robohash.org/architectoeosporro.jpg?size=50x50&set=set1', 1, 98);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (99, 'Jena', 'Zarah', '2020/05/09', 'https://robohash.org/etteneturratione.jpg?size=50x50&set=set1', 1, 99);
insert into Usuario (Id_Usuario, Nombre_Usuario, Apellido_Usuario, Fecha_Creacion, Foto, Id_Rol, Id_Login) values (100, 'Kiah', 'Fred', '2020/05/19', 'https://robohash.org/velitconsequunturet.jpg?size=50x50&set=set1', 1, 100);


#insertar datos en la tabla Seguidores
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

#insertar datos en la tabla Restricion
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (1, 'Ms', 'Disp fx of prox phalanx of l less toe(s), 7thD', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (2, 'Mrs', 'Occlusion and stenosis of right carotid artery', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (3, 'Ms', 'Injury of digital nerve of right ring finger', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (4, 'Rev', 'Poisoning by oth nonsteroid anti-inflam drugs, undetermined', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (5, 'Mr', 'Toxic effect of coral snake venom, undetermined, init encntr', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (6, 'Mrs', 'Sltr-haris Type III physl fx low end r femr, 7thD', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (7, 'Mrs', 'Salter-Harris Type III physeal fracture of r calcaneus, 7thD', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (8, 'Mr', 'Non-follic lymphoma, unsp, nodes of head, face, and neck', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (9, 'Honorable', 'Nondisp fx of med phalanx of l lit fngr, 7thD', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (10, 'Mr', 'Posterior subluxation of right radial head, subs encntr', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (11, 'Honorable', 'Open bite of unsp great toe with damage to nail, init encntr', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (12, 'Dr', 'Underdosing of other drugs acting on muscles', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (13, 'Mrs', 'Venous engorgement, bilateral', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (14, 'Mr', 'Spontaneous bacterial peritonitis', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (15, 'Honorable', 'Laceration with foreign body of right wrist, init encntr', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (16, 'Honorable', 'Unsp injury of blood vessel of left little finger, sequela', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (17, 'Rev', 'Senile ectropion of unspecified eye, unspecified eyelid', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (18, 'Mrs', 'Idiopathic aseptic necrosis of right tibia', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (19, 'Honorable', 'Thromboembolism in the puerperium', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (20, 'Mrs', 'Displ transverse fx shaft of l fibula, 7thH', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (21, 'Mr', 'Laceration of vein at forearm level, unsp arm, sequela', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (22, 'Honorable', 'Rheumatoid bursitis, unspecified hand', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (23, 'Mr', 'Other secondary gout, right elbow', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (24, 'Honorable', 'Driver of pk-up/van injured in clsn w 2/3-whl mv in traf', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (25, 'Mrs', 'Strain of intrinsic msl/tnd at ank/ft level, r foot, init', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (26, 'Honorable', 'Laceration of ovary, unilateral, sequela', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (27, 'Mrs', 'Furuncle of foot', 27);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (28, 'Ms', 'Poisoning by other topical agents, undetermined', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (29, 'Ms', 'Hemorrhage due to internal orthopedic prosth dev/grft, subs', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (30, 'Honorable', 'Nondisplaced oblique fracture of shaft of right radius', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (31, 'Mrs', 'Disp fx of lateral epicondyl of unsp humer, 7thD', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (32, 'Rev', 'Occupant (driver) of pk-up/van injured in oth transport acc', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (33, 'Rev', 'Subacute osteomyelitis, right shoulder', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (34, 'Mr', 'Paranoid personality disorder', 34);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (35, 'Dr', 'Passenger in hv veh injured in clsn w nonmtr vehicle nontraf', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (36, 'Rev', 'Occ of 3-whl mv injured in trnsp acc w miltry vehicle, init', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (37, 'Mr', 'Adherent leukoma, unspecified eye', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (38, 'Mrs', 'Urticaria due to cold and heat', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (39, 'Mr', 'Sltr-haris Type II physeal fx upper end of unsp fibula', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (40, 'Rev', 'Poisn by mineralocorticoids and antag, self-harm, sequela', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (41, 'Mrs', 'Assault by airgun discharge', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (42, 'Rev', 'Oth fracture of unsp lum vertebra, subs for fx w delay heal', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (43, 'Mr', 'Contact with sharp glass, undetermined intent, subs encntr', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (44, 'Dr', 'Impingement syndrome of unspecified shoulder', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (45, 'Dr', 'Other calcification of muscle, left upper arm', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (46, 'Ms', 'Other specified congenital malformations of face and neck', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (47, 'Dr', 'Subluxation of tarsometatarsal joint of left foot, sequela', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (48, 'Mrs', 'Drown due to fall/jump fr crushed passenger ship, init', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (49, 'Honorable', 'Fetomaternal placental transfusion syndrome', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (50, 'Mrs', 'Toxic effect of noxious substances eaten as food, acc, subs', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (51, 'Ms', 'Struck by duck, initial encounter', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (52, 'Mr', 'Nondisp seg fx shaft of r fibula, 7thJ', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (53, 'Honorable', 'Monteggia''s fx r ulna, 7thF', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (54, 'Ms', 'Dislocation of C7/T1 cervical vertebrae, sequela', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (55, 'Rev', 'Burn of unspecified degree of left shoulder, sequela', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (56, 'Rev', 'Epidermolysis bullosa due to drug', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (57, 'Dr', 'Exposure to other noise, sequela', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (58, 'Rev', 'Inflammatory disease of cervix uteri', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (59, 'Mrs', 'Other superficial bite of scrotum and testes, subs encntr', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (60, 'Mr', 'Bartonellosis', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (61, 'Honorable', 'Unsp inj great saph at low leg level, right leg, sequela', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (62, 'Rev', 'Encounter for antibody response examination', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (63, 'Mrs', 'Other effects of deprivation, sequela', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (64, 'Rev', 'Fracture of ramus of left mandible, 7thK', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (65, 'Dr', 'Asphyx due to being trapped in a car trunk, acc, sequela', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (66, 'Ms', 'Oth fx shaft of rad, right arm, subs for clos fx w nonunion', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (67, 'Rev', 'Disp fx of less tuberosity of r humer, 7thG', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (68, 'Dr', 'Contus/lac/hem brainstem w LOC >24 hr w/o ret consc w surv', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (69, 'Dr', 'Unsp open wound of left index finger with damage to nail', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (70, 'Dr', 'Disorders of globe', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (71, 'Ms', 'Dislocation of T1/T2 thoracic vertebra, sequela', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (72, 'Ms', 'Laceration with foreign body of right shoulder, init encntr', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (73, 'Mrs', 'Displaced fracture of lesser tuberosity of left humerus', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (74, 'Ms', 'Leakage of ventricular intracranial shunt, subs', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (75, 'Ms', 'Unsp inj flexor musc/fasc/tend l mid fngr at forarm lv, subs', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (76, 'Ms', 'Chr emblsm and thombos unsp deep veins of prox low extrm, bi', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (77, 'Ms', 'I/I react d/t implanted urn nstim dev, initial encounter', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (78, 'Mrs', 'Intermittent hydrarthrosis, ankle and foot', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (79, 'Mrs', 'Unspecified superficial injury of left little finger', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (80, 'Dr', 'Patient''s intentl undrdose of meds regimen for oth reason', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (81, 'Rev', 'Disp fx of dist phalanx of right great toe, init for opn fx', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (82, 'Dr', 'Disp fx of med malleolus of unsp tibia, 7thM', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (83, 'Rev', 'Other cerebrovascular disease', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (84, 'Ms', 'Fragile X chromosome', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (85, 'Honorable', 'Injury of unspecified nerve at shoulder and upper arm level', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (86, 'Rev', 'Epidermolysis bullosa', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (87, 'Rev', 'Subluxation of L2/L3 lumbar vertebra, initial encounter', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (88, 'Rev', 'Corrosion of second degree of right axilla, init encntr', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (89, 'Ms', 'Torus fracture of lower end of left tibia, sequela', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (90, 'Mr', 'Laceration of splenic vein', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (91, 'Mr', 'Postimmunization arthropathy, unspecified ankle and foot', 1);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (92, 'Rev', 'Abnormal results of function studies of eye', 2);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (93, 'Mr', 'Poisoning by alpha-adrenocpt antagonists, self-harm, sequela', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (94, 'Rev', 'Follicular lymphoma grade I, intrathoracic lymph nodes', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (95, 'Mrs', 'Bucket-hndl tear of medial mensc, crnt inj, unsp knee, init', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (96, 'Dr', 'Nondisp fx of proximal third of navic bone of r wrist, init', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (97, 'Mrs', 'Athscl autol vein bypass of extrm w intrmt claud, bi legs', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (98, 'Rev', 'Nondisp fx of greater trochanter of left femur, sequela', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (99, 'Mr', 'Partial traumatic amputation of unsp breast, init encntr', 4);
insert into Restricion (Id_Restricion, Nombre_Restricion, Descripcion_Restricion, Id_Rol) values (100, 'Dr', 'Gastric contents in trachea causing oth injury, init encntr', 4);

#insertar datos en la tabla Lista_Reproduccion
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (1, 'Mrs', 1);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (2, 'Mr', 2);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (3, 'Mrs', 3);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (4, 'Honorable', 4);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (5, 'Dr', 5);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (6, 'Honorable', 6);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (7, 'Dr', 7);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (8, 'Mr', 8);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (9, 'Rev', 9);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (10, 'Mrs', 10);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (11, 'Honorable', 11);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (12, 'Rev', 12);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (13, 'Ms', 13);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (14, 'Mr', 14);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (15, 'Honorable', 15);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (16, 'Mrs', 16);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (17, 'Rev', 17);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (18, 'Honorable', 18);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (19, 'Dr', 19);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (20, 'Honorable', 20);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (21, 'Rev', 21);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (22, 'Mr', 22);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (23, 'Dr', 23);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (24, 'Honorable', 24);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (25, 'Honorable', 25);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (26, 'Honorable', 26);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (27, 'Dr', 27);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (28, 'Dr', 28);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (29, 'Mrs', 29);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (30, 'Rev', 30);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (31, 'Ms', 31);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (32, 'Dr', 32);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (33, 'Honorable', 33);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (34, 'Mr', 34);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (35, 'Dr', 35);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (36, 'Dr', 36);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (37, 'Ms', 37);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (38, 'Mr', 38);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (39, 'Mr', 39);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (40, 'Rev', 40);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (41, 'Mr', 41);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (42, 'Rev', 42);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (43, 'Mr', 43);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (44, 'Honorable', 44);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (45, 'Rev', 45);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (46, 'Mr', 46);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (47, 'Honorable', 47);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (48, 'Rev', 48);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (49, 'Mr', 49);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (50, 'Mrs', 50);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (51, 'Mr', 51);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (52, 'Dr', 52);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (53, 'Mr', 53);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (54, 'Dr', 54);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (55, 'Mr', 55);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (56, 'Mr', 56);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (57, 'Ms', 57);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (58, 'Ms', 58);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (59, 'Mr', 59);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (60, 'Dr', 60);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (61, 'Honorable', 61);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (62, 'Mr', 62);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (63, 'Rev', 63);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (64, 'Rev', 64);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (65, 'Rev', 65);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (66, 'Ms', 66);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (67, 'Ms', 67);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (68, 'Dr', 68);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (69, 'Ms', 69);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (70, 'Mr', 70);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (71, 'Ms', 71);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (72, 'Mrs', 72);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (73, 'Mrs', 73);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (74, 'Honorable', 74);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (75, 'Ms', 75);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (76, 'Honorable', 76);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (77, 'Rev', 77);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (78, 'Ms', 78);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (79, 'Mr', 79);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (80, 'Mr', 80);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (81, 'Rev', 81);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (82, 'Ms', 82);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (83, 'Honorable', 83);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (84, 'Dr', 84);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (85, 'Mr', 85);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (86, 'Rev', 86);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (87, 'Dr', 87);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (88, 'Mrs', 88);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (89, 'Ms', 89);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (90, 'Honorable', 90);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (91, 'Rev', 91);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (92, 'Rev', 92);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (93, 'Ms', 93);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (94, 'Dr', 94);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (95, 'Ms', 95);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (96, 'Honorable', 96);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (97, 'Dr', 97);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (98, 'Dr', 98);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (99, 'Rev', 99);
insert into Lista_Reproduccion (Id_LR, Nombre_LR, Id_Usuario) values (100, 'Mr', 100);

#insertar datos en la tabla Auditoria
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (1, 'Mr', '7:19', '17:32');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (2, 'Dr', '17:50', '8:09');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (3, 'Rev', '6:36', '5:29');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (4, 'Honorable', '1:35', '10:44');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (5, 'Ms', '3:51', '18:29');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (6, 'Honorable', '11:41', '3:32');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (7, 'Rev', '3:09', '9:38');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (8, 'Mrs', '21:34', '0:54');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (9, 'Mr', '14:31', '12:08');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (10, 'Mr', '12:58', '3:08');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (11, 'Rev', '18:25', '7:10');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (12, 'Mr', '2:19', '0:40');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (13, 'Mrs', '20:43', '18:34');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (14, 'Mrs', '10:29', '15:47');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (15, 'Ms', '1:35', '16:00');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (16, 'Rev', '6:12', '11:21');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (17, 'Dr', '21:02', '19:21');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (18, 'Ms', '12:29', '3:12');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (19, 'Rev', '22:57', '19:48');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (20, 'Rev', '23:50', '1:26');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (21, 'Rev', '10:58', '18:00');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (22, 'Ms', '18:05', '0:32');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (23, 'Dr', '19:22', '12:11');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (24, 'Mrs', '1:32', '13:00');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (25, 'Mrs', '0:36', '19:00');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (26, 'Dr', '10:49', '12:13');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (27, 'Mrs', '9:12', '11:16');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (28, 'Mrs', '9:45', '17:21');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (29, 'Rev', '5:24', '15:30');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (30, 'Rev', '22:11', '7:35');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (31, 'Ms', '1:57', '16:29');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (32, 'Ms', '18:39', '2:02');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (33, 'Rev', '15:12', '2:19');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (34, 'Honorable', '18:35', '19:38');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (35, 'Ms', '3:25', '9:55');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (36, 'Dr', '5:53', '4:18');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (37, 'Mrs', '14:02', '5:12');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (38, 'Mrs', '21:07', '14:32');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (39, 'Mr', '0:29', '20:25');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (40, 'Mrs', '18:03', '16:53');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (41, 'Honorable', '14:31', '10:55');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (42, 'Mrs', '3:08', '0:57');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (43, 'Mr', '5:07', '20:05');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (44, 'Rev', '7:09', '8:07');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (45, 'Rev', '15:38', '20:23');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (46, 'Rev', '4:41', '5:08');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (47, 'Honorable', '13:04', '7:17');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (48, 'Honorable', '10:30', '4:56');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (49, 'Mrs', '19:15', '22:15');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (50, 'Honorable', '12:42', '13:26');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (51, 'Mrs', '7:52', '23:11');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (52, 'Mrs', '18:05', '0:01');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (53, 'Mr', '9:52', '5:35');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (54, 'Mrs', '5:46', '10:40');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (55, 'Mr', '16:42', '6:17');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (56, 'Mrs', '12:39', '23:26');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (57, 'Ms', '14:23', '8:24');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (58, 'Dr', '3:41', '2:50');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (59, 'Mr', '4:19', '0:15');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (60, 'Mrs', '23:20', '15:18');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (61, 'Honorable', '23:54', '20:34');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (62, 'Mr', '14:27', '14:17');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (63, 'Mrs', '0:04', '22:16');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (64, 'Dr', '12:45', '6:40');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (65, 'Dr', '7:53', '8:03');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (66, 'Honorable', '18:44', '1:46');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (67, 'Rev', '8:57', '15:12');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (68, 'Mr', '21:00', '13:28');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (69, 'Rev', '19:13', '0:22');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (70, 'Mrs', '18:53', '11:16');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (71, 'Honorable', '23:37', '5:44');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (72, 'Mr', '17:47', '9:14');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (73, 'Mrs', '10:24', '7:11');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (74, 'Dr', '11:56', '13:14');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (75, 'Honorable', '0:34', '22:44');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (76, 'Mrs', '18:43', '11:30');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (77, 'Rev', '17:11', '19:00');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (78, 'Honorable', '21:05', '11:21');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (79, 'Mrs', '16:56', '5:12');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (80, 'Ms', '22:09', '7:44');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (81, 'Mrs', '14:22', '3:00');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (82, 'Mrs', '6:11', '14:53');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (83, 'Honorable', '14:27', '7:20');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (84, 'Mrs', '20:17', '5:17');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (85, 'Dr', '16:50', '15:46');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (86, 'Ms', '6:07', '21:48');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (87, 'Honorable', '1:11', '19:20');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (88, 'Mrs', '17:08', '5:07');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (89, 'Dr', '4:57', '20:05');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (90, 'Rev', '11:55', '6:17');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (91, 'Honorable', '5:01', '15:34');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (92, 'Honorable', '15:50', '22:30');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (93, 'Rev', '14:09', '6:06');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (94, 'Mr', '0:29', '3:01');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (95, 'Mrs', '18:57', '8:01');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (96, 'Honorable', '20:35', '6:41');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (97, 'Dr', '11:31', '10:16');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (98, 'Mrs', '9:14', '16:35');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (99, 'Mrs', '0:43', '13:52');
insert into Auditoria (Id_Auditoria, Procedimiento, Entrada, Salida) values (100, 'Dr', '10:37', '8:22');

#insertar datos en la tabla Disco
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (1, 'Sangre de mi sangre (Padre Nuestro)', 1, '2019/11/18', 1);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (2, 'All American Chump', 2, '2019/09/27', 2);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (3, 'Red River', 3, '2020/05/01', 3);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (4, 'Man of the West', 4, '2019/11/23', 4);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (5, 'Flicka', 5, '2019/08/14', 5);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (6, 'Bill Burr: Why Do I Do This?', 6, '2019/09/25', 6);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (7, 'Thunderbirds', 7, '2020/01/29', 7);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (8, 'Barrens, The', 8, '2019/06/17', 8);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (9, 'Take Her, She''s Mine', 9, '2020/05/07', 9);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (10, 'Uninvited, The', 10, '2019/10/13', 10);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (11, 'Renegades', 11, '2020/03/18', 11);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (12, 'Interstate 60', 12, '2020/04/27', 12);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (13, 'Vengo', 13, '2019/11/24', 13);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (14, 'Paper Moon', 14, '2019/09/25', 14);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (15, 'Joni''s Promise', 15, '2020/05/10', 15);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (16, 'Cimarron Kid, The', 16, '2020/01/22', 16);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (17, 'Theory of Everything, The', 17, '2019/10/30', 17);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (18, 'Manhattan Melodrama', 18, '2020/01/12', 18);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (19, 'The Chumscrubber', 19, '2019/12/07', 19);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (20, '...All the Marbles (California Dolls, The)', 20, '2019/06/10', 20);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (21, 'Waterloo', 21, '2020/01/25', 21);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (22, 'Mephisto', 22, '2019/07/14', 22);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (23, 'Wedding Crashers', 23, '2019/12/10', 23);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (24, 'Head', 24, '2020/03/16', 24);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (25, 'Lost Weekend, The', 25, '2020/01/29', 25);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (26, 'Legend of Zorro, The', 26, '2020/01/23', 26);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (27, 'Under Capricorn', 27, '2019/09/15', 27);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (28, 'Invention of Lying, The', 28, '2019/12/20', 28);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (29, 'OKA!', 29, '2020/03/15', 29);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (30, 'Me tulemme taas', 30, '2019/11/16', 30);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (31, 'Across the Sea of Time', 31, '2020/02/23', 31);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (32, 'Hori Smoku Sailor Jerry: The Life of Norman K. Collins ', 32, '2019/12/14', 32);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (33, 'Red Riding Hood', 33, '2019/11/15', 33);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (34, 'Lords of Salem, The', 34, '2020/05/14', 34);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (35, 'Low Life, The', 35, '2019/07/23', 35);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (36, 'Package, The', 36, '2019/08/17', 36);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (37, 'Will', 37, '2020/03/03', 37);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (38, 'Just Like a Woman', 38, '2019/10/30', 38);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (39, 'Expecting a Miracle', 39, '2020/05/21', 39);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (40, 'Nicotina', 40, '2020/05/14', 40);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (41, 'Replacements, The', 41, '2020/01/06', 41);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (42, 'I Am Legend', 42, '2019/06/10', 42);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (43, 'Brothers, The', 43, '2019/10/27', 43);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (44, 'Wilde', 44, '2019/12/30', 44);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (45, 'King Solomon''s Mines', 45, '2020/04/09', 45);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (46, 'Doppelganger', 46, '2019/11/12', 46);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (47, 'Meshes of the Afternoon', 47, '2019/08/31', 47);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (48, 'Casanova', 48, '2019/07/07', 48);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (49, 'Trash', 49, '2020/05/07', 49);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (50, 'Days of Glory', 50, '2019/08/20', 50);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (51, 'Day After, The', 51, '2020/03/06', 51);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (52, 'Ask Me Anything', 52, '2019/08/22', 52);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (53, 'Live Free or Die', 53, '2019/11/08', 53);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (54, 'Short Circuit', 54, '2020/03/08', 54);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (55, 'Hardcover', 55, '2019/08/02', 55);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (56, 'Sunfish, The (Klumpfisken)', 56, '2019/06/28', 56);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (57, 'Back to School with Franklin', 57, '2020/01/09', 57);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (58, 'Great Balls of Fire!', 58, '2019/12/12', 58);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (59, 'Hills Run Red, The', 59, '2020/01/30', 59);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (60, 'Margin Call', 60, '2019/06/29', 60);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (61, 'Freaky Friday', 61, '2019/09/08', 61);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (62, 'River, The (He liu)', 62, '2019/12/21', 62);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (63, 'Legend of Bigfoot, The', 63, '2019/07/08', 63);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (64, 'Yankee Doodle Dandy', 64, '2020/02/12', 64);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (65, 'Iron Monkey (Siu nin Wong Fei-hung ji: Tit Ma Lau)', 65, '2020/02/20', 65);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (66, 'Saratoga', 66, '2019/08/12', 66);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (67, 'Conversation with Gregory Peck, A', 67, '2019/12/29', 67);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (68, 'Frankenstein', 68, '2020/01/10', 68);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (69, 'Eye, The', 69, '2019/06/12', 69);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (70, 'Mogambo', 70, '2019/09/29', 70);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (71, 'First Nudie Musical, The', 71, '2019/07/25', 71);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (72, 'Late Autumn (Man-choo)', 72, '2019/09/12', 72);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (73, 'Captive Heart: The James Mink Story', 73, '2020/03/19', 73);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (74, 'Election', 74, '2019/06/15', 74);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (75, 'North Beach', 75, '2020/01/25', 75);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (76, 'Taxi 4', 76, '2019/09/30', 76);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (77, 'Welcome to Mooseport', 77, '2020/01/08', 77);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (78, 'Age of Uprising: The Legend of Michael Kohlhaas (Michael Kohlhaas)', 78, '2019/06/21', 78);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (79, 'Battery, The', 79, '2020/02/25', 79);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (80, 'Wolf Man, The', 80, '2019/05/30', 80);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (81, 'The Dark Horse', 81, '2019/12/25', 81);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (82, 'My Boy Jack', 82, '2020/02/22', 82);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (83, 'Dark House, The (Dom zly)', 83, '2020/04/25', 83);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (84, 'This Girl''s Life', 84, '2019/08/27', 84);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (85, 'Captain America', 85, '2020/03/20', 85);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (86, 'Brice Man, The (Brice de Nice)', 86, '2020/01/30', 86);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (87, 'Agnes Browne', 87, '2019/07/18', 87);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (88, 'Terror Beneath the Sea, The (Kaitei daisensô)', 88, '2019/09/01', 88);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (89, 'Chaos', 89, '2020/05/25', 89);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (90, 'An American Hippie in Israel', 90, '2020/03/07', 90);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (91, 'Sophie Scholl: The Final Days (Sophie Scholl - Die letzten Tage)', 91, '2020/05/04', 91);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (92, 'Man to Man', 92, '2020/02/08', 92);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (93, 'Sharky''s Machine', 93, '2019/10/27', 93);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (94, 'Scary Movie', 94, '2020/05/20', 94);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (95, 'Shenandoah', 95, '2020/05/07', 95);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (96, 'Die Hard 2', 96, '2020/01/27', 96);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (97, 'Five Weeks in a Balloon', 97, '2019/06/12', 97);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (98, 'Tenderness (Hellyys)', 98, '2020/04/21', 98);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (99, 'Taking Care of Business', 99, '2019/11/19', 99);
insert into Disco (Id_Disco, Nombre_Disco, N_Canciones, Fecha_Lansamiento, Id_Artista) values (100, 'Character (Karakter)', 100, '2019/07/02', 100);

#insertar datos en la tabla Cancion
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (1, 'Never Too Young to Die', 1, '22:18', 'Cashback', 1);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (2, 'Herbie Rides Again', 2, '14:50', 'Street Trash', 2);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (3, 'Choose Me', 3, '10:54', 'Wanda Sykes: Sick and Tired', 3);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (4, 'Eden', 4, '17:03', 'Maiden Heist, The', 4);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (5, 'Deadly Companions, The', 5, '14:44', 'Whatever Works', 5);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (6, 'Main Prem Ki Diwani Hoon', 6, '21:10', 'Barbershop', 6);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (7, 'Vertical Limit', 7, '17:24', 'The Hunchback of Paris', 7);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (8, 'Treasure of the Sierra Madre, The', 8, '5:13', '27 Missing Kisses', 8);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (9, 'Guest of Cindy Sherman', 9, '17:29', 'Goldfish Memory', 9);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (10, 'Caretakers, The', 10, '6:49', 'While She Was Out', 10);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (11, 'Irene, Go Home! (Irena do domu!)', 11, '3:24', 'Bedtime Stories', 11);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (12, 'Becoming Jane', 12, '13:11', 'Love! Valour! Compassion!', 12);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (13, 'Calling Dr. Death', 13, '18:51', 'Conjuring, The', 13);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (14, 'Atlas Shrugged: Who Is John Galt? (Atlas Shrugged: Part III)', 14, '14:04', 'Cat Came Back, The', 14);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (15, 'Stray Dogs', 15, '13:50', 'Beast from 20,000 Fathoms, The', 15);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (16, 'Union: The Business Behind Getting High, The', 16, '21:01', 'It Follows', 16);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (17, 'Battle of Britain, The (Why We Fight, 4)', 17, '4:01', 'White Dwarf, The (Valkoinen kääpiö)', 17);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (18, 'Dragon Ball Z: Fusion Reborn (Doragon bôru Z 12: Fukkatsu no fyushon!! Gokû to Bejîta)', 18, '22:34', 'Dollman', 18);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (19, 'My Life in Pink (Ma vie en rose)', 19, '22:39', 'Book of Love', 19);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (20, 'Samsara', 20, '0:06', 'Jab We Met', 20);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (21, 'First Monday in October', 21, '16:47', 'Fjorton suger', 21);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (22, 'Chase a Crooked Shadow', 22, '2:42', 'EXPO: Magic of the White City', 22);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (23, 'Bread and Chocolate (Pane e cioccolata)', 23, '16:26', 'Space', 23);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (24, 'Phantom of the Opera, The', 24, '20:05', 'Blot, The', 24);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (25, 'Dear Pillow', 25, '12:57', 'Turbo: A Power Rangers Movie', 25);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (26, 'Whipped', 26, '10:18', 'Norman', 26);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (27, 'Hard Sun', 27, '14:57', 'Far Side of the Moon, The (Face cachée de la lune, La)', 27);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (28, 'Stormbreaker (Alex Rider: Operation Stormbreaker)', 28, '12:28', 'Pelle Svanslös', 28);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (29, 'Presidio, The', 29, '18:52', 'Star Wars: The Clone Wars', 29);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (30, 'Frequencies', 30, '19:56', 'Retribution (Sakebi)', 30);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (31, 'Kozara', 31, '18:50', 'Tom, Tom, the Piper''s Son', 31);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (32, 'Scent of a Woman', 32, '14:29', 'American Addict', 32);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (33, 'American Buffalo', 33, '4:28', 'Rise of the Footsoldier', 33);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (34, 'Starlet', 34, '22:54', 'Poison Ivy II', 34);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (35, 'Great Ecstasy of Woodcarver Steiner, The (Große Ekstase des Bildschnitzers Steiner, Die)', 35, '4:19', 'Report on the Party and the Guests, A (O slavnosti a hostech)', 35);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (36, 'Trippin''', 36, '19:24', 'Child''s Play', 36);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (37, 'Ingeborg Holm', 37, '3:06', 'Oblivion Island: Haruka and the Magic Mirror (Hottarake no shima - Haruka to maho no kagami)', 37);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (38, 'Morning Patrol (Proini peripolos)', 38, '18:20', 'Les Invisibles', 38);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (39, '24 Hours on Craigslist', 39, '6:12', 'Rebel, The', 39);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (40, 'Waste Land', 40, '1:32', 'Münchhausen', 40);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (41, 'Freebie and the Bean', 41, '3:40', 'Pride of the Bowery', 41);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (42, 'Adrift (À Deriva)', 42, '23:28', 'Best Intentions, The (Den goda viljan)', 42);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (43, 'Hovering Over the Water (À Flor do Mar)', 43, '4:06', 'Not My Type', 43);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (44, 'Arcana', 44, '12:44', 'Maps to the Stars', 44);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (45, 'Creepshow', 45, '1:29', 'The Reunion', 45);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (46, 'The Duke of Burgundy', 46, '23:43', 'Infestation', 46);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (47, 'Dadetown', 47, '20:36', 'X', 47);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (48, 'Brazil', 48, '11:25', 'Crusades, The', 48);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (49, 'Slipstream', 49, '12:12', 'Looking for Cheyenne (Oublier Cheyenne)', 49);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (50, 'Mostly Unfabulous Social Life of Ethan Green, The', 50, '11:55', 'Computer Chess', 50);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (51, 'Eiger Sanction, The', 51, '10:38', 'Sudden Manhattan', 51);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (52, 'All the Rage (It''s the Rage)', 52, '4:18', 'Raajneeti', 52);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (53, 'Foreigner, The', 53, '9:06', 'Hypothesis of the Stolen Painting, The (L''hypothèse du tableau volé)', 53);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (54, 'The Beast Kills in Cold Blood', 54, '15:49', 'Basquiat', 54);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (55, 'My Future Boyfriend', 55, '21:31', 'Mars Attacks!', 55);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (56, 'Atomic Cafe, The', 56, '1:40', 'Little Giants', 56);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (57, 'Bring It On', 57, '10:25', 'Cuckoo in a Dark Forest (Kukacka v temném lese) ', 57);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (58, '1939: Hollywood''s Greatest Year', 58, '19:42', 'Fados', 58);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (59, 'Cop Land', 59, '12:27', 'It''s a Free World...', 59);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (60, 'Some Came Running', 60, '2:10', 'What About Dick?', 60);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (61, 'Sgt. Pepper''s Lonely Hearts Club Band', 61, '11:56', 'Bubba Ho-tep', 61);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (62, '17 Girls (17 filles)', 62, '7:17', 'Daniel Deronda', 62);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (63, 'Purge, The', 63, '1:28', 'East is East', 63);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (64, 'Harrison Bergeron', 64, '19:45', 'Cry, The (Grido, Il)', 64);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (65, 'Hamlet', 65, '20:29', 'Tales of Terror (Kaidan Shin Mimibukuro)', 65);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (66, 'Twogether', 66, '17:48', 'Stromberg - Der Film', 66);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (67, 'Celestial Wives of the Meadow Mari (Nebesnye zheny lugovykh mari)', 67, '23:04', 'Our Man in Havana', 67);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (68, 'Dummy', 68, '13:32', 'Electrick Children', 68);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (69, 'A Master Builder', 69, '2:41', 'Death of a Nation - The Timor Conspiracy', 69);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (70, 'Moon Man', 70, '18:22', 'Chinaman (Kinamand)', 70);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (71, 'Fisher King, The', 71, '1:19', 'Widow of St. Pierre, The (Veuve de Saint-Pierre, La)', 71);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (72, 'My Last Day Without You (Nie mehr ohne Dich)', 72, '15:33', 'Laaga Chunari Mein Daag: Journey of a Woman', 72);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (73, 'Wonderful, Horrible Life of Leni Riefenstahl, The (Macht der Bilder: Leni Riefenstahl, Die)', 73, '8:28', 'Like Mike 2: Streetball', 73);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (74, 'Speed & Angels', 74, '2:21', 'First Nudie Musical, The', 74);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (75, 'Left Behind: World at War', 75, '2:31', 'Tap', 75);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (76, 'Pandora''s Box (Pandora''nin kutusu)', 76, '15:07', 'May I Kill U?', 76);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (77, 'Midsummer Night''s Dream, A', 77, '22:09', 'Music Lovers, The', 77);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (78, 'Blondie on a Budget', 78, '6:40', 'Strangers in Good Company', 78);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (79, 'Bride Wars', 79, '18:19', 'Watcher, The', 79);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (80, 'Smokey and the Bandit III', 80, '7:09', 'Bolero', 80);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (81, 'Rollercoaster', 81, '14:18', 'Seven Years Bad Luck', 81);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (82, 'Bicycle, Spoon, Apple (Bicicleta, cullera, poma)', 82, '4:38', 'Good Girl, The', 82);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (83, 'Shamrock Handicap, The', 83, '1:19', 'Reggie Watts: Why Shit So Crazy?', 83);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (84, 'From Beijing with Love', 84, '1:22', 'Charlie Chan at the Olympics', 84);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (85, 'Ink', 85, '10:03', 'Secret Life of Bees, The', 85);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (86, 'Cencoroll', 86, '16:28', 'Deaths of Ian Stone, The', 86);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (87, 'Harder They Fall, The', 87, '1:13', 'Oliver Twist', 87);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (88, 'Double Life, A', 88, '1:22', 'Goonies, The', 88);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (89, 'Kingdom Come', 89, '1:49', 'Eyes Wide Open (Einayim Petukhoth)', 89);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (90, 'Extract', 90, '20:19', 'Piranha 3DD (a.k.a. Piranha DD)', 90);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (91, 'Tenth Man, The', 91, '3:15', 'Freaky Deaky', 91);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (92, 'Verbo', 92, '6:42', 'Virtual JFK: Vietnam If Kennedy Had Lived', 92);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (93, 'Super Capers', 93, '6:55', 'Silent Rage', 93);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (94, 'Life On A String (Bian chang Bian Zou)', 94, '13:53', 'Just a Gigolo', 94);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (95, 'His Name Was Jason: 30 Years of Friday the 13th', 95, '9:13', 'Kagi (Odd Obsession)', 95);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (96, 'Boo to You Too! Winnie the Pooh', 96, '14:46', 'Frankenstein Syndrome, The', 96);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (97, 'Merry Madagascar', 97, '0:17', 'Nowhere in Africa (Nirgendwo in Afrika)', 97);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (98, 'Breakdown', 98, '20:49', 'Messenger of Death', 98);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (99, 'King of Devil''s Island (Kongen av Bastøy) ', 99, '15:04', 'Blue Is the Warmest Color (La vie d''Adèle)', 99);
insert into Cancion (Id_Cancion, Nombre_Cancion, Numero_Visitas, Duracion_Cancion, Descripcion_Cancion, Id_Disco) values (100, 'Plankton', 100, '2:57', 'Prophet''s Prey', 100);


#insertar datos en la tabla Sugerencia_Canciones
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (1, 'Out 1: Spectre', 1, 1);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (2, 'Penguin Pool Murder', 2, 2);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (3, 'Inside: ''Dr. Strangelove or How I Learned to Stop Worrying and Love the Bomb''', 3, 3);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (4, 'Lawnmower Man 2: Beyond Cyberspace', 4, 4);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (5, 'Jawbreaker', 5, 5);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (6, 'Amreeka', 6, 6);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (7, 'People Under the Stairs, The', 7, 7);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (8, 'Kiss Them for Me', 8, 8);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (9, 'Hot Rock, The', 9, 9);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (10, 'Ranma ½: Big Trouble in Nekonron, China (Ranma ½: Chûgoku Nekonron daikessen! Okite yaburi no gekitô hen)', 10, 10);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (11, '3rd Voice, The', 11, 11);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (12, 'Excision', 12, 12);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (13, 'Pronto', 13, 13);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (14, 'High School', 14, 14);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (15, 'Snowblind', 15, 15);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (16, 'Take This Job and Shove It', 16, 16);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (17, 'Good Wife, The', 17, 17);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (18, 'Behind the Sun (Abril Despedaçado)', 18, 18);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (19, 'Honeymoon', 19, 19);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (20, 'Audition (Ôdishon)', 20, 20);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (21, 'He Loves Me... He Loves Me Not (À la folie... pas du tout)', 21, 21);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (22, 'Ninette', 22, 22);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (23, 'Fugly!', 23, 23);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (24, 'When We Were Kings', 24, 24);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (25, 'Sorority House Massacre II', 25, 25);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (26, 'Judas Kiss', 26, 26);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (27, 'Hercules', 27, 27);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (28, 'Raiders of the Lost Ark (Indiana Jones and the Raiders of the Lost Ark)', 28, 28);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (29, '44500 Max', 29, 29);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (30, 'Strapped', 30, 30);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (31, 'Down in the Valley', 31, 31);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (32, 'Wonderful World', 32, 32);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (33, 'Backdraft', 33, 33);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (34, 'Once My Mother', 34, 34);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (35, 'Enigma of Kaspar Hauser, The (a.k.a. Mystery of Kaspar Hauser, The) (Jeder für sich und Gott Gegen Alle)', 35, 35);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (36, 'Outrageous Class (Hababam sinifi)', 36, 36);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (37, 'Tenderness', 37, 37);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (38, 'Jeffrey Dahmer Files, The', 38, 38);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (39, 'Ed Wood', 39, 39);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (40, 'Get Over It', 40, 40);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (41, 'Wasp Woman, The', 41, 41);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (42, 'Brooklyn Rules', 42, 42);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (43, 'Attila (Attila Flagello di Dio)', 43, 43);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (44, 'Six Days Seven Nights', 44, 44);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (45, 'Pretty Maids All in a Row', 45, 45);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (46, 'India: Matri Bhumi', 46, 46);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (47, 'Gay Divorcee, The', 47, 47);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (48, 'Into the Mind', 48, 48);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (49, 'Den sommeren jeg fylte 15', 49, 49);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (50, 'Cooking with Stella', 50, 50);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (51, 'Julia', 51, 51);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (52, 'Bang Boom Bang - Ein todsicheres Ding', 52, 52);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (53, 'Shotgun Stories', 53, 53);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (54, 'Frankie and Alice', 54, 54);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (55, 'Goodfellas', 55, 55);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (56, 'José and Pilar (José e Pilar)', 56, 56);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (57, '1987', 57, 57);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (58, 'Carts of Darkness', 58, 58);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (59, 'Marilyn in Manhattan', 59, 59);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (60, 'Strange Circus (Kimyô na sâkasu)', 60, 60);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (61, 'What''s the Matter with Helen?', 61, 61);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (62, 'Nanook of the North', 62, 62);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (63, 'Legalese', 63, 63);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (64, 'Good Lawyer''s Wife, A (Baramnan gajok)', 64, 64);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (65, 'I Am Santa Claus', 65, 65);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (66, 'Ivanhoe', 66, 66);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (67, 'Sister Street Fighter (Onna hissatsu ken)', 67, 67);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (68, 'Russkies', 68, 68);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (69, 'Human Experience, The', 69, 69);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (70, 'Shanghai Knights', 70, 70);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (71, 'Bend It Like Beckham', 71, 71);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (72, 'Savage Messiah', 72, 72);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (73, 'Last Hangman, The (Pierrepoint)', 73, 73);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (74, 'Enemy at the Gates', 74, 74);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (75, 'Miss Firecracker', 75, 75);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (76, 'Cargo', 76, 76);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (77, 'Hitler''s Madman', 77, 77);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (78, 'Flipper', 78, 78);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (79, 'Amish Murder, An', 79, 79);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (80, 'Mary of Scotland', 80, 80);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (81, 'Turn It Up', 81, 81);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (82, 'Python', 82, 82);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (83, 'Downloading Nancy', 83, 83);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (84, 'Pyramid, The', 84, 84);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (85, 'Sheltering Sky, The', 85, 85);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (86, 'Revenge of the Electric Car', 86, 86);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (87, 'Woman in Red, The', 87, 87);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (88, 'Jab We Met', 88, 88);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (89, 'My Life in Pink (Ma vie en rose)', 89, 89);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (90, 'Clear History', 90, 90);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (91, 'Deliver Us From Evil', 91, 91);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (92, 'Kid, The', 92, 92);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (93, 'Broken City', 93, 93);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (94, 'Watermelon Woman, The', 94, 94);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (95, 'Unspeakable Acts ', 95, 95);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (96, 'Mrs. Palfrey at the Claremont', 96, 96);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (97, 'Li''l Quinquin', 97, 97);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (98, 'Colder Kind of Death, A', 98, 98);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (99, 'Johnny Was', 99, 99);
insert into Sugerencia_Canciones (Id_Sugerencia, Nombre_Sugerencia, Id_LR, Id_Cancion) values (100, 'Man Without a Face, The', 100, 100);
