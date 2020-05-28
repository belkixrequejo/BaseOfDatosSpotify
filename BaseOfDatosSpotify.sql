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