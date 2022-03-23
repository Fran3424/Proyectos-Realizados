Create Database BaseDeDatosCECC --Se crea la base de datos de CECC
GO
Use BaseDeDatosCECC --Se especifica que se debe utilizar la base de datos de CECC
GO

--Se procede a crear las tablas en orden de prioridad

Create Table Programas( --La tabla de programas vendra el nombre y su codigo
	CodigoPrograma varchar(20) primary key Not Null,  --Se utilizara el CodigoPrograma Como llave primaria
	NombreDePrograma varchar(100) Not Null -- Se pondran los nombres de los programas
);
--No se requieren restricciones para la tabla Programas

--indice
Create index IDX_Programas on Programas(NombreDePrograma)

Create Table Cursos( --La tabla de cursos estara relacionada con programas ya que un programa tiene cursos
	CodigoCurso varchar(20) primary key Not Null, --Codigo de curso llave primaria
	CodigoPrograma varchar(20) Not Null, --Codigo Programa para crear relacion con el programa 
	NombreDeCurso varchar (120) Not Null, --Nombre del curso en cuestion 
	EliminadoCurso bit default 0 Not Null, --No eliminado=0 Eliminado = 1 predeterminado 0
	Requisito varchar(100),--Requisito de ceritificacion para impartir el curso
	PrecioCurso money,--Precio  del curso (Nuevo Campo necesario por error de Diseño)
	HorasCurso int not null,--Duracion del curso (Nuevo Campo necesario por error de Diseño)
);

--Restriccion
Alter table Cursos
Add constraint CHK_Requisito Check (Requisito in ('LICENCIATURA', 'BACHILLERATO','DIPLOMADO','MAESTRIA'))--(Constraint para el nuevo campo)

Create Table Profesores( --La tabla profesores esta administra todos los datos personales importantes del profesor
	CodigoProfesor int identity primary key Not Null, --Codigo de profesor sera la llave primaria y esta sera un identity ya para mejorar la integridad
	identificacionProfesor varchar(25) unique  Not Null,
	NombreProfesor	varchar(25) Not Null, 
	PrimerApellidoProfesor	varchar(20) Not Null,
	SegundoApellidoProfesor	varchar(20) Not Null, 
	EmailProfesor varchar(150), -- El email del profesor puede ser nulo
	TelefonoProfesor varchar(11) Not Null, 
	EliminadoProfesor BIT default 0 Not Null, --Se utilizara para evitar mostrar un profesor que no este activo
	Estatus	varchar(3) default 'ACT' Not Null --El estatus llevara predeterminado el estatus de activo
);

--Restricciones
Alter table Profesores
Add constraint CHK_EstatusProfesor Check  (Estatus='INA' OR Estatus='ACT'); --Restriccion para que solo se pueda insertar valores de activo o inactivo

Create Table Estudiantes(
	Carnet int identity primary key  Not Null, --El carnet de estudiante sera la llave primaria y sera identity para mejorar la integridad
	IdentificacionEstudiante varchar(20) unique Not Null, --Identificacion nacional del estudiante
	NombreEstudiante varchar(30) Not Null, 
	ApellidoEstudiante1	varchar(20) Not Null,
	ApellidoEstudiante2	varchar(20) Not Null,
	TelefonoEstudiante	Varchar(20) Not Null,
	EmailEstudiante	varchar(150),
	FechaIngreso Date Not Null default getdate(), --Fecha en la que ingreso el estudiante al sistema
	Estatus	varchar(3) default 'ACT' Not Null, --Estatus del alumno sera predeterminado como activo
	EliminadoEstudiante	BIT Default 0 Not Null, --Elminado=1 No Eliminado=0 Predeterminado es 0
	Direccion varchar(300) Not Null ,
	FechaNacimiento Date Not Null
);

--Restricciones
Alter table Estudiantes
Add constraint CHK_FechaIngreso Check (FechaIngreso>=getdate()); --Fecha de ingreso del estudiante debe ser mayor o igual a la fecha actual

Alter table Estudiantes
Add constraint CHK_EstatusEstudiante Check (Estatus='INA' OR Estatus='ACT'); --El estado del estudiante debe ser activo o inactivo


Alter table Estudiantes
Add constraint CHK_FechaNacimiento Check (FechaNacimiento<getdate()); --Fecha de nacimiento debe ser menor a la fecha actual por obvias razones


Create Table CursosAbiertos( --Cursos abiertos aqui se registraran los cursos que se abren al publico se relacionara con la tabla de Cursos 
	CodigoCursoAbierto varchar(20) primary key Not Null, --Codigo del curso abierto
	CodigoProfesor int  Not Null, --Codigo del profesor que lo imparte
	CodigoCurso	varchar(20) Not Null, --Codigo del curso que se registrara como abierto
	Grupo Tinyint Not Null , --El grupo del curso
	Cupo tinyint Not Null, --La cantidad de almunos en el grupo
	Costo money  Not Null, -- El costo del curso
	Periodo	Tinyint Not Null, --El periodo del año  en donde se Imparte el curso
	Anio smallint not Null, --El año en el que se imparte el curso
	FechaInicioCurso date default getdate() not null, --La fecha de inicio del curso
	Aula int not null --aula en la que se imparte el curso
);

--indice
Create index IDX_CursosAbiertos_Cupos_Grupos on CursosAbiertos(Grupo,Cupo)


--Restricciones

Alter table CursosAbiertos
Add Constraint CHK_Cupo Check (Cupo>6 or Cupo<10); --Restriccion para que el cupo no pueda ser mayor a 10 y menor a 6

Alter table CursosAbiertos
Add constraint CHK_Aula Check (Aula>0 or Aula<10) --Restriccion para que solo se pueda insertar un aula del 1 al 10 por que es el limite de aulas disponibles en la institucion 

Create Table  Matriculas(
	Num_Recibo	Varchar(20) primary key Not Null, --Numero del recibo de la matricula
	Carnet	int Not Null, --El carnet del estudiante que matricula
	Monto	money Not Null, --El monto a pagar de la matricula
	Estatus	Varchar(3) Not Null, --Indica si la matricula se encuentra activa
	DescripcionDeMatricula	Varchar(250) Not Null, --describe detalles de la matricula no es obligatorio
	FechaDeMatricula date default getdate(),
	UsuarioDeMatricula	Varchar(25) Not null,
	Descuento int default 0 not null, --descuento puede ser de 0 o 50 debido a la 
	Pagado bit default 1 not null --Nuevo campo 1=no pagado 0= pagado
);


--Restricciones

Alter table Matriculas
add constraint CHK_Estatus Check (Estatus='ACT' or Estatus='INA') --Restriccion para que solo se pueda ingresar que el estatus es activo o inactivo


Alter table Matriculas
Add constraint CHK_Descuento check (Descuento=0 or descuento=50) --El descuento puede ser de 0 ya que el estudiante puede pagar todo el monto o puede ser de 50 ya que el estudiante puede pagar solo la mitad al principio


Create Table DetalleDeMatriculas( --Detalle de matriculas tabla intermedia ya que pueden haber varias matriculas en varios cursos
	Num_Recibo	Varchar(20) Not Null,
	CodigoCursoAbierto	varchar(20) Not Null,
);


--Restricciones

Alter Table DetalleDeMatriculas
Add constraint PKS_DetalleDeMatriculas Primary key(Num_Recibo,CodigoCursoAbierto) -- Restriccion para definir los 2 atributos como llaves primarias 

Create Table Horarios( -- Tabla horarios aqui se registran los dias y las horas en las que se imparte el curso
	CodigoCursoAbierto	Varchar(20) Not Null, --El codigo del curso abierto el cual tiene el horario
	Dia 	varchar(1) Not Null, --El dia de la semana del horario
	HoraInicio	Time Not Null, --La hora donde comienzan a impartir las clases
	HoraFin	Time Not Null, --La hora en la que terminan de impartir las clases
	AnioHorario smallint not null, --El año en el que se da el horario
);
-- Restricciones
Alter Table Horarios
Add constraint PKS_Horarios primary key (CodigoCursoAbierto,Dia,HoraInicio,HoraFin,AnioHorario) --Restriccion para hacer todas llaves compuestas ya que ningun atributo funcionaria por si solo como llave

Alter table Horarios
Add constraint CHK_Dia Check (Dia='L' OR Dia='K' OR Dia='M' OR Dia='J' OR Dia='V' OR Dia='S') --Restriccion para que solo se puedan ingresar las letras que representan los dias de la semana cuando se inserta un horario de un curso



Create Table Vacaciones( --Tabla Vacaciones aqui se registran las vacaciones de todo el año de los profesores
	CodigoVacaciones Varchar(35) primary key Not Null,
	CodigoProfesor	int Not Null,
	FechaInicio	Date Not Null,
	FechaFin Date Not Null, --Fecha Fin(Nuevo Campo Necesario Por error de diseño)
	Descripcion	Varchar(300) Not Null
);



Create Table Calificaciones( --Tabla calificaciones aqui se registran las calificaciones de los estudiantes 
	CodigoCalificacion	Varchar(20) primary key Not Null, --El codigo de calificacion que es llave primaria
	CodigoCursoAbierto	varchar(20) Not Null, --El codigo del curso al que pertenece la nota
	Carnet	int Not Null, -- El carnet del estudiante que tiene las notas
	Nota1	Float Not Null, --Se registra una primera nota 
	Nota2	Float Not Null, --Se registra una segunda nota
	Nota3	Float Not Null, --Se registra una tercera nota 
	EstadoCurso varchar(3) not null --Se registra el estado del estudiante si aprobo o no
); -- las notas se usaran para calcular un promedio final

--Restricciones 
Alter Table Calificaciones
Add constraint CHK_EstadoCurso check(EstadoCurso='ACT' OR EstadoCurso='INA' OR EstadoCurso='APR' OR EstadoCurso='REP') --Restriccion para que el estado de curso solo pueda ser Activo,Inactivo,Reprobado,Aprobado


Alter Table Calificaciones
Add constraint CHK_Nota1 check(Nota1 >= 0 AND Nota1<=100) --Restriccion para que la nota 1 no supere el 100 y no sea menos de 0

Alter Table Calificaciones
Add constraint CHK_Nota2 check(Nota2 >= 0 AND Nota2<=100) --Restriccion para que la nota 2 no supere el 100 y no sea menos de 0

Alter Table Calificaciones
Add constraint CHK_Nota3 check(Nota3 >= 0 AND Nota3<=100) --Restriccion para que la nota 3 no supere el 100 y no sea menos de 0



Create table Certificaciones( --Aqui  se registran las certificaciones de los profesores las cuales son necesarias para definir si son aptos de impartir cursos
	CodigoCertificacion Varchar(35) primary key Not Null,
	CodigoProfesor int Not Null,
	NombreCertificacion varchar(100) Not Null,
	Descripcion varchar(150) Not Null,
);

Alter table Certificaciones
Add constraint CHK_NombreCertificacion Check (NombreCertificacion in ('LICENCIATURA', 'BACHILLERATO','DIPLOMADO','MAESTRIA')) --Restricion para que solo se puedan insertar certificaciones con los nombres de LICENCIATURA, BACHILLERATO,'DIPLOMADO',MAESTRIA

Create table Incapacidades( --Tabla incapacidades aqui se registran las fechas de las incapacidades de los profesores ademas de un motivo de la incapacidad
	CodigoIncapacidad Varchar(30) primary key Not Null,
	CodigoProfesor int Not Null,
	FechaInicio Date Not Null,
	FechaFin date Not null, --Fecha Fin (Nuevo Campo Necesario por error de Diseño)
	Motivo varchar(250) Not Null
);

Create table Feriados( --Tabla Feriados aqui en se registran los dias feriados del año
CodigoFeriado varchar(30) primary key Not Null,
CodigoProfesor int Not Null,
FechaFeriado date Not Null,
);




--Relaciones
Alter table Cursos -- Se altera la tabla cursos
Add constraint FK_Cursos_Programas --Relacion entre cursos y programas
Foreign key (CodigoPrograma) References Programas(CodigoPrograma) --Union de llave foranea (codigo programa) 
	On delete no action
	On update no action; --Reglas de integridad de cascada


Alter table Calificaciones -- Se altera la tabla calificaciones
Add Constraint FK_Calificaciones_Estudiantes --Relacion entre Califcaciones y Estudiantes --2
Foreign key (Carnet) references Estudiantes(Carnet) --Union de llave foranea (Carnet)
	On delete no action
	On update no action; --Reglas de integridad de cascada

Alter table Calificaciones --Se altera la tabla calificaciones
Add Constraint FK_Calificaciones_CursosAbiertos --Relacion entre Calificaciones y CursosAbiertos
Foreign key (CodigoCursoAbierto) references CursosAbiertos(CodigoCursoAbierto) --Union de llave foranea (CodigoCursoAbierto) 
	On delete no action
	On update no action; --Reglas de integridad de cascada

Alter table CursosAbiertos --Se altera la tabla CursosAbiertos
Add Constraint FK_CursosAbiertos_Cursos --Relacion entre CursosAbiertos y Cursos
Foreign key (CodigoCurso) references Cursos(CodigoCurso) --Union de llave foranea (CodigoCurso) 
	On delete no action
	On update no action; --Reglas de integridad de cascada

Alter table CursosAbiertos --Se altera la tabla Cursos Abiertos
Add Constraint FK_CursosAbiertos_Profesores --Relacion entre CursosAbiertos y Profesores
Foreign key (CodigoProfesor) references Profesores(CodigoProfesor) --Union de llave foranea (CodigoProfesor) 
	On delete no action
	On update no action; --Reglas de integridad de cascada


Alter table Horarios --Se altera la tabla Horarios
Add Constraint FK_Horarios_CursosAbiertos --Relacion entre Horarios y CursosAbiertos
Foreign key (CodigoCursoAbierto) references CursosAbiertos(CodigoCursoAbierto) -- Union de llave foranea (CodigoCursoAbierto) 
	On delete no action
	On update no action; --Reglas de integridad de cascada


Alter table Certificaciones -- Se altera la tabla Certificaciones
Add Constraint FK_Certificaciones_Profesores --Relacion entre Certificaciones y Profesores
Foreign key (CodigoProfesor) references Profesores(CodigoProfesor) -- Union de llave foranea (CodigoProfesor) 
	On delete no action
	On update no action; --Reglas de integridad de cascada

Alter table Vacaciones --Se altera la tabla Vacaciones
Add Constraint FK_Vacaciones_Profesores --Relacion entre Vacaciones y Profesores
Foreign key (CodigoProfesor) references Profesores(CodigoProfesor) --Union de llave foranea (CodigoProfesor) 
	On delete no action
	On update no action; --Reglas de integridad de cascada

Alter table Incapacidades --Se altera la tabla incapacidades
Add Constraint FK_Incapacidades_Profesores --Relacion entre Incapacidades y Profesores 
Foreign key (CodigoProfesor) references Profesores(CodigoProfesor) --Union de llave foranea (Codigo Profesor) 
	On delete no action
	On update no action; --Reglas de integridad de cascada

Alter table Matriculas --Se altera la tabla Matriculas
Add Constraint FK_Matriculas_Estudiantes --Relacion entre Matriculas y Estudiantes
Foreign key (Carnet) references Estudiantes(Carnet) --Union de llave foranea (Carnet) 
	On delete no action
	On update no action; --Reglas de integridad de cascada


Alter table DetalleDeMatriculas --Se altera la tabla DetalleDeMatriculas
Add Constraint FK_DetalleDeMatriculas_Matriculas --Relacion entre Detalle de matriculas y matriculas
Foreign key (Num_Recibo) references Matriculas(Num_Recibo) --Union de llave foranea (Num_Recibo) 
	On delete no action
	On update no action;--Reglas de integridad de cascada



Alter table DetalleDeMatriculas --Se altera la tabla DetalleDeMatriculas
Add Constraint FK_DetalledeMatriculas --Relacion entre DetalleDeMatriculas
Foreign key (CodigoCursoAbierto) references CursosAbiertos(CodigoCursoAbierto) --Union de llave foranea (CodigoCursoAbierto)
	On delete no action
	On update no action; --Reglas de integridad de cascada 


Alter table Feriados
Add Constraint FK_Feriados_Profesores
Foreign key (CodigoProfesor) references Profesores(CodigoProfesor)
	On delete no action
	On update no action; --Reglas de integridad de cascada



---Insertar Registros a las tablas

Insert into Programas(CodigoPrograma,NombreDePrograma)
	Values  (123,'Programacion de dispositivos Moviles'),
			(124,'Programación de Sistemas de Escritorio'),
			(125,'Programación de Páginas Web');


Insert into Cursos(CodigoCurso,CodigoPrograma,NombreDeCurso,Requisito,HorasCurso,PrecioCurso)
	Values  (10,123,'Android 01','Bachillerato',120,250000),
			(11,123,'Android 02','Bachillerato',110,240000),
			(12,123,'Android 03','Bachillerato',100,220000),
			(13,123,'Aplicaciones Mixtas','Bachillerato',100,195000),
			(20,124,'Lógica Computacional','Licenciatura',140,225000),
			(21,124,'Introducción a Java','Licenciatura',150,335000),
			(22,124,'POO','Licenciatura',160,345000),
			(30,125,'HTML','Maestria',90,185000),
			(31,125,'CSS','Maestria',60,175000),
			(32,125,'JavaScript','Maestria',70,180000),
			(33,125,'Bootstrap','Maestria',90,185000),
			(34,125,'Node js','Maestria',90,185000),
			(35,125,'Node js','Maestria',90,185000);

Insert into Profesores(identificacionProfesor,NombreProfesor,PrimerApellidoProfesor,SegundoApellidoProfesor,EmailProfesor,TelefonoProfesor,EliminadoProfesor,Estatus) 
	Values	('2098711','Hernan','Cortez','Alvarez','Alvarez18@gmail.com','2245-2946',0,'ACT'),
			('2078718','Juan','Perez','Rodriguez','Prez95@gmail.com','8560-9867',0,'ACT'),
			('2011523','Roberto','Gomez','Bolaños','Gobr78@gmail.com','7656-9845',0,'ACT'),
			('1025789','Maribel','Rojas','Mata','Mat32@gmail.com','8767-9811',0,'ACT'),
			('5671119','Genesis','Lopez','Rojas','lp456@gmail.com','9875-3468',0,'ACT'),
			('4319811','Ramon','Valdez','Muñoz','Muñoz67@gmail.com','2356-8895',0,'ACT'),
			('5678117','Robert','Chavez','Perez','Chav456@gmail.com','7843-7863',0,'ACT'),
			('3456781','Paola','Martinez','Gonzalez','Pap563@gmail.com','8967-3434',0,'ACT'),
			('7867454','Carla','Ramirez','Pacheco','Pach45@gmail.com','8723-4793',0,'ACT'),
			('6789345','Leonardo','Alvarado','Quesada','Quesadilla89@gmail.com','6788-6533',0,'ACT');

		


Insert into Estudiantes(IdentificacionEstudiante,NombreEstudiante,ApellidoEstudiante1,ApellidoEstudiante2,TelefonoEstudiante,EmailEstudiante,FechaIngreso,Estatus,EliminadoEstudiante,Direccion,FechaNacimiento)
	Values ('208110717','Francisco','Paniagua','Pacheco','2445-9876','franciscopan27@gmail.com','20220311','ACT',0,'20 metros sur del super san jeronimo','20001127'),
		   ('293451328','Carlos','Villagran','Alvarado','8895-2956','Villagran67@gmail.com','20210821','ACT',0,'Delegacion 500 metros casa muro rojo','19950318'),
		   ('209120827','Juan','Ramirez','Solorzano','7458-7767','Juanra234@gmail.com','20211015','ACT',0,'100 metros sur del bar la candela','20010524'),
		   ('206540341','Alberto','Monge','Chavez','6345-8845','Mongesac89@gmail.com','20211128','ACT',0,'200 metros norte del tremedal casa con jardin ','19980625'),
		   ('207180678','Marta','Zapata','Martinez','8970-5678','Flor34@gmail.com','20210928','ACT',0,'500 metros oeste de la bomba Santamaria','19990730'),
		   ('208110417','Laura','Jimenez','Matarrita','7898-9945','Ljimenez23@gmail.com','20211022','ACT',0,'200 metros norte de la estacion de buses ','19960730'),
		   ('108210411','Pedro','Hernandez','Cascante','2998-3408','Hcascante23@gmail.com','20210820','ACT',0,'150 metros de la Plaza Occidente','19970526'),
		   ('205250611','Arturo','Vega','Alfaro','6745-8977','Vega11@gmail.com','20211016','ACT',0,'600 metros sur del restaurante Tio Charly','20011215'),
	       ('608920784','Alonso','Aguirre','Mena','8223-9656','Mena567@gmail.com','20211112','ACT',0,'500 metros sur de la delegacion de San Jeronimo','19990811'),
		   ('204110891','Manuel','Rodriguez','Garcia','7892-6856','Manu670@gmail.com','20210917','ACT',0,'700 metros este del banco nacional','19940726');



Insert into Vacaciones(CodigoVacaciones,CodigoProfesor,FechaInicio,FechaFin,Descripcion)
Values (10,1,'20211111','20211121','Vacaciones acumuladas del profesor'),
	   (11,2,'20210909','20211122','Vacaciones solicitadas'),
	   (12,3,'20210811','20210926','Vacaciones solicitadas'),
	   (13,4,'20210712','20210918','Vacaciones solicitadas'),
		(14,5,'20210611','20210617','Vacaciones acumuladas del profesor'),
		(15,6,'20210507','20210712','Vacaciones Solicitadas'),
		(16,7,'20210410','20210917','Vacaciones Solicitadas'),
	   (17,8,'20210311','20210415','Vacaciones acumuladas del profesor'),
	  (18,9,'20210211','20210512','Vacaciones acumuladas del profesor'),
	  (19,10,'20210211','20210512','Vacaciones acumuladas del profesor');
	 


Insert into Incapacidades(CodigoIncapacidad,CodigoProfesor,FechaInicio,FechaFin,Motivo)
	Values	(30,1,'20210114','20210307','Emergencia medica importante'),
		    (31,2,'20210220','20210519','Fallecimiento de familiar'),   
			(32,3,'20210320','20210414','Lesion de trabajo'), 
			(33,4,'20210409','20210617','Fallecimiento de familiar'),
			(34,5,'20210520','20210610','Lesion de trabajo'),
			(35,6,'20210608','20210811','Terapia Mental'), 
			(36,7,'20210711','20210911','Terapia Mental'),
			(37,8,'20210805','20211008','Fallecimiento de familiar'),    
			(38,9,'20210921','20211107','Lesion de trabajo'),    
			(39,10,'20210717','20210820','Fallecimiento de familiar');   

Insert into Feriados(CodigoProfesor,CodigoFeriado,FechaFeriado)
Values(1,1,'20210101'),
	  (1,2,'20210401'),
	  (1,3,'20210402'),
	  (1,4,'20210411'),
	  (1,5,'20210503'),
	  (1,6,'20210726'),
	  (1,7,'20210802'),
	  (1,8,'20210913'),
	  (1,9,'20211129'),
	  (1,10,'20211225');




Insert into Certificaciones(CodigoCertificacion,CodigoProfesor,NombreCertificacion,Descripcion)
	Values	(40,1,'Diplomado','Necesario para impartir Programación de Dispositivos Móviles'),
			(41,1,'Bachillerato','Necesario para impartir Programación de Sistemas de Escritorio'),
			(42,5,'Bachillerato','Necesario para impartir Programación de Sistemas de Escritorio'),
			(43,1,'Licenciatura','Necesario para impartir Programación de Páginas Web'),
			(44,2,'Diplomado','Necesario para impartir Programación de Dispositivos Móviles'),
			(45,2,'Bachillerato','Necesario para impartir Programación de Sistemas de Escritorio'),
			(46,3,'Diplomado','Necesario para impartir Programación de Dispositivos Móviles'),
			(47,4,'Diplomado','Necesario para impartir Programación de Dispositivos Móviles'),
			(48,4,'Bachillerato','Necesario para impartir Programación de Sistemas de Escritorio'),
			(49,4,'Licenciatura','Necesario para impartir Programación de Páginas Web'),
			(50,5,'Bachillerato','Necesario para impartir Programación de Sistemas de escritorio'),
			(51,5,'Diplomado','Necesario para impartir Programación de Dispositivos Móviles'),
			(52,6,'Licenciatura','Necesario para impartir Programación de Páginas Web'),
			(53,6,'Diplomado','Necesario para impartir Programación de Dispositivos Móviles'),
			(54,6,'Bachillerato','Necesario para impartir Programación de Sistemas de escritorio'),
			(55,7,'Bachillerato','Necesario para impartir Programación de Sistemas de escritorio'),
			(56,7,'Licenciatura','Necesario para impartir Programación de Páginas Web'),
			(57,8,'Licenciatura','Necesario para impartir Programación de Páginas Web'),
			(58,9,'Diplomado','Necesario para impartir Programación de Dispositivos Móviles'),
			(59,5,'Bachillerato','Necesario para impartir Programación de Sistemas de escritorio');
			

Insert into CursosAbiertos(CodigoCursoAbierto,CodigoProfesor,CodigoCurso,Grupo,Cupo,Costo,Periodo,Anio,FechaInicioCurso,Aula)
Values	(60,1,10,1,6,250000,1,2021,'20210214',1),
        (61,1,11,1,10,240000,2,2021,'20210510',1),
		(62,1,12,1,7,220000,3,2021,'20210818',2),
		(63,1,13,2,8,220000,1,2022,'20220318',1),
		(64,2,20,2,6,225000,1,2021,'20210414',3),
		(65,2,21,2,6,335000,2,2021,'20210528',4),
		(66,2,22,2,6,345000,3,2021,'20210927',4),
		(67,4,30,3,6,185000,1,2021,'20210222',6),
		(68,4,31,3,6,175000,2,2021,'20210614',6),
		(69,4,32,3,6,180000,3,2021,'20211014',5);
		
		



insert into Matriculas(Num_Recibo,Carnet,Monto,Estatus,DescripcionDeMatricula,UsuarioDeMatricula)
Values	(70,3,250000,'ACT','Matricula del curso Android 01',21213),
		(71,4,250000,'ACT','Matricula del curso Android 01',21214),
		(72,4,225000,'ACT','Matricula del curso Lógica Computacional',21215),
		(73,5,225000,'ACT','Matricula del curso Lógica Computacional',21216),
		(74,5,345000,'ACT','Matricula del curso POO',21217),
		(75,6,345000,'ACT','Matricula del curso POO',21218),
		(76,9,345000,'ACT','Matricula del curso POO',21219),
		(77,10,345000,'ACT','Matricula del curso POO',21220),
		(78,8,250000,'ACT','Matricula del curso Android 01',212121),
		(79,4,250000,'ACT','Matricula del curso Android 01',212122);



Insert into DetalleDeMatriculas(Num_Recibo,CodigoCursoAbierto)
	Values	(70,60),
	        (71,60),
			(72,64),
			(73,64),
			(74,66),
			(75,66),
			(76,66),
			(77,66),
			(78,60),
			(79,60);

insert into Calificaciones(CodigoCalificacion,CodigoCursoAbierto,Carnet,Nota1,Nota2,Nota3,EstadoCurso)
	Values	(80,60,3,78.23,85.80,95.60,'APR'),
			(81,60,4,40.31,50.56,70.99,'REP'),
			(82,64,4,88.10,90.40,97.50,'APR'),
			(83,64,5,37.67,50.44,65.22,'REP'),
			(84,66,5,75.68,68.80,77.60,'APR'),
			(85,66,6,48.45,55.80,40.60,'REP'),
			(86,66,9,78.90,67.80,65.60,'APR'),
			(87,66,10,30.90,65.80,56.60,'REP'),
			(88,60,8,68.90,80.80,78.33,'APR'),
			(89,60,4,78.90,75.80,95.60,'REP');




Insert into Horarios(CodigoCursoAbierto,Dia,HoraInicio,HoraFin,AnioHorario)
	Values (60,'L','7:00','11:25',2021),
			(60,'K','13:30','16:00',2021),
			(60,'V','7:00','11:25',2021),
			(61,'L','7:00','11:25',2021),
			(61,'M','13:30','16:00',2021),
			(61,'J','7:00','11:25',2021),
			(63,'L','7:00','11:25',2022),
			(63,'J','13:30','16:00',2022),
			(63,'K','7:00','11:25',2022),
			(64,'J','13:30','16:00',2021);



	   











