Drop database BolsaEmpleo;
CREATE DATABASE BolsaEmpleo;
USE BolsaEmpleo;

CREATE TABLE Empresa (
  idEmpresa int NOT NULL AUTO_INCREMENT ,
  nombre varchar(30) NOT NULL,
  email_Emp varchar(30) NOT NULL,  
  telefono int ,
  descEmp varchar(200),
  localizacion varchar(100) NOT NULL,
  PRIMARY KEY  (idEmpresa),
  UNIQUE KEY(email_Emp)
  );

CREATE TABLE  Puesto (
  idPuesto int NOT NULL  AUTO_INCREMENT,
  descPuest varchar(150) NOT NULL,
  salario int,
  estado tinyint NOT NULL,
  id_Emp int NOT NULL,
  tipo tinyint NOT NULL,
  PRIMARY KEY (idPuesto),
  UNIQUE KEY(descPuest,id_Emp)
);

CREATE TABLE  Caracteristica (
  idCaracteristica int NOT NULL AUTO_INCREMENT,
  descCaract varchar(45) NOT NULL,
  id_CaractPadre int,
  PRIMARY KEY (idCaracteristica)
);

CREATE TABLE  Oferente (
  idOferente int NOT NULL,
  nombre varchar(20) NOT NULL,
  primer_apell varchar(30) NOT NULL,
  telefono int, 
  email_Ofe varchar(60) NOT NULL ,  
  nacionalidad varchar(30) NOT NULL,
  lugar_resi varchar(30) NOT NULL,
  PRIMARY KEY (idOferente),
  UNIQUE KEY(email_Ofe)
);

CREATE TABLE  Nivel_Requerido (
  id_caracteristica int NOT NULL ,
  id_puesto int NOT NULL,
  porcentaje_r int ,
  mes_registro date NULL,
  PRIMARY KEY (id_caracteristica,id_puesto)
);

/*
id_caracteristica int NOT NULL ,
  id_puesto int NOT NULL,
  porcentaje_r int ,
  mes_registro date NOT NULL,
  PRIMARY KEY (id_caracteristica, id_puesto)
*/

CREATE TABLE  Nivel_Habilidad (
  id_caract int NOT NULL ,
  id_oferent int NOT NULL,
  porcentaje_h int ,
  PRIMARY KEY (id_caract,id_oferent)
);

CREATE TABLE  Login (
  identificacion varchar(40) NOT NULL,
  clave varchar(10) NOT NULL,
  autorizado tinyint NOT NULL,
  modo varchar(10) NOT NULL,
  PRIMARY KEY (identificacion),
  UNIQUE KEY (clave)
);

CREATE TABLE  Administrador (
  id_Admi varchar(20) NOT NULL ,
  PRIMARY KEY (id_Admi)
);
/*FOREIGN KEY Implementaciones*/
-------------------------------------------------------------------------
ALTER TABLE Puesto ADD Foreign Key (id_Emp) REFERENCES Empresa(idEmpresa); 

ALTER TABLE Caracteristica ADD Foreign Key (id_CaractPadre) REFERENCES Caracteristica(idCaracteristica);

ALTER TABLE Nivel_Requerido ADD Foreign Key (id_caracteristica) REFERENCES Caracteristica(idCaracteristica);
ALTER TABLE Nivel_Requerido ADD Foreign Key (id_puesto) REFERENCES Puesto(idPuesto);

ALTER TABLE Nivel_Habilidad ADD Foreign Key (id_caract) REFERENCES Caracteristica(idCaracteristica);
ALTER TABLE Nivel_Habilidad ADD Foreign Key (id_oferent) REFERENCES Oferente(idOferente);

ALTER TABLE Administrador ADD Foreign Key (id_Admi) REFERENCES Login(identificacion); 

ALTER TABLE Empresa ADD Foreign Key (email_Emp) REFERENCES Login(identificacion); 

ALTER TABLE Oferente ADD Foreign Key (email_Ofe) REFERENCES Login(identificacion); 
-------------------------------------------------------------------------


/*=====>INSERTS*/
INSERT INTO Login (identificacion,clave,autorizado,modo) VALUES 
 ('intelenterprises@intel.com','I0123',1,'EMP'),
 ('HPentrprises@hp.com','H0123',1,'EMP'),
 ('Taca@tacacr.com','TACA02',1,'EMP'),
 ('mepcr@cr.com','MEP02',0,'EMP');
INSERT INTO Empresa (nombre,email_Emp,telefono,localizacion) VALUES 
 ('Intel','intelenterprises@intel.com',111111,'Heredia'),
 ('HP','HPentrprises@hp.com',222222,'Alajuela'),
 ('TACA','Taca@tacacr.com',333333,'San Jose'),
 ('MEP','mepcr@cr.com',989898,'San Jose');
 INSERT INTO Puesto (descPuest,salario,estado,id_Emp,tipo) VALUES 
 /*1*/('Customer Service',300000,1,3,1),
 /*2*/('Transportista',200000,1,3,0),
 /*3*/('Programador Web',600000,1,1,1),
 /*4*/('BACK END',700000,1,1,1),
 /*5*/('Contabilidad',400000,1,2,1),
 /*6*/('DB Senior',900000,1,2,1),
 /*7*/('IT Manager',1700000,1,2,1),
 /*8*/('Profesor Escolar',480000,1,4,1); 

 
 INSERT INTO Caracteristica (descCaract) VALUES 
 /*1*/('Caracteristicas');
  INSERT INTO Caracteristica (descCaract, id_CaractPadre) VALUES 
 /*2*/('Medio Tiempo',1),
 /*3*/('Tiempo Completo',1),
 /*4*/('Por horas',1),
 /*5*/('Desde casa',1),
 /*6*/('Ventas',1),
 /*7*/('Contabilidad y Finanzas',3),
 /*8*/('Atencion a clientes',2),
 /*9*/('Informatica y telecomunicaciones',3),
 /*10*/('Hosteleria y turismo',4),
 
 /*11*/('Ingieneria en Sistemas',9),
 /*12*/('Enseñanza de Idiomas',8),
 /*13*/('Educacion Primaria',8),
 /*14*/('Tecnologias de la Informacion',9),
 /*15*/('Transporte',10),
 
 /*16*/('Lenguajes de programacion',11),
 /*17*/('Conocimientos en PHP,CSS3 Y HTML',16),
 /*18*/('Conocimientos en Oracle y Mysql',16),
 
 /*19*/('Ingles',12),
 /*20*/('Frances',12),
 /*21*/('Portuges',12);
 
 
 
 
 INSERT INTO Login (identificacion,clave,autorizado,modo) VALUES 
 ('marco@gmail.com','M123',1,'OFE'),
 ('carlosa@gmail.com','C123',1,'OFE');
 INSERT INTO Oferente (idOferente,nombre,primer_apell,email_Ofe,nacionalidad,lugar_resi ) VALUES 
 (11222321,'Marco','Calderon','marco@gmail.com','Costarricense','Heredia'),
 (79797979,'Carlos','Alvarado','carlosa@gmail.com','Costarricense','Heredia');
 
 INSERT INTO Login (identificacion,clave,autorizado,modo) VALUES 
 ('116402782','AD123',1,'ADM');
 INSERT INTO Administrador (id_Admi) VALUES 
 ('116402782');
 
 
 INSERT INTO Nivel_Requerido (id_caracteristica,id_puesto,porcentaje_r,mes_registro) VALUES 
 (3,3,0,curdate()),
 (11,3,0,'2018/02/01'),
 (14,3,0,'2018/02/01'),
 (16,3,40,'2018/02/01'),
 (17,3,40,'2018/02/01'),
 (18,3,40,'2018/02/01'),
 
 (3,6,0,'2018/02/01'),
 (11,6,0,'2018/02/01'),
 (14,6,0,'2018/02/01'),
 (16,6,0,'2018/02/01'),
 (17,6,60,'2018/02/01'),
 (18,6,70,'2018/02/01'),
 
 (8,8,null,'2018/02/01'),
 (12,8,null,'2018/02/01'),
 (13,8,null,'2018/02/01'),
 
 (4,2,60,'2018/02/01'),
 (15,2,0,'2018/02/01');
 
 
 INSERT INTO Nivel_Habilidad (id_caract,id_oferent,porcentaje_h) VALUES 
 (17,11222321,70);
 
 update Login set autorizado=1 where identificacion='116402782';
