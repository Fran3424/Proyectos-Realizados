USE BaseDeDatosCECC
GO

--Estudiantes que no estan matriculados
GO
Create view Estu_No_Mat as
Select NombreEstudiante,ApellidoEstudiante1,ApellidoEstudiante2 from estudiantes E 
left join Matriculas M on E.Carnet=M.Carnet where M.Carnet is null;

--Estudiantes que poseen calificaciones
GO
Create view Estu_Tiene_Nota as
Select NombreEstudiante,ApellidoEstudiante1,ApellidoEstudiante2,Nota1,Nota2,Nota3,CodigoCursoAbierto 
from Estudiantes E left join Calificaciones CA on E.Carnet=CA.Carnet Where CA.Carnet is not null
Group by NombreEstudiante,ApellidoEstudiante1,ApellidoEstudiante2,Nota1,Nota2,Nota3,CodigoCursoAbierto;

--Profesores que tiene vacaciones registradas
GO
Create view Vacaciones_Profesor as
Select NombreProfesor,PrimerApellidoProfesor,SegundoApellidoProfesor 
FROM Profesores P right join Vacaciones V on P.CodigoProfesor = V.CodigoProfesor 
Where V.CodigoProfesor is not null;

--Profesores que  no tienen incapacidades registradas
GO
Create view Incapacidades_Registradas as
Select NombreProfesor,PrimerApellidoProfesor,SegundoApellidoProfesor 
FROM Profesores P RIGHT join Incapacidades I on P.CodigoProfesor = I.CodigoProfesor 
Where I.CodigoProfesor is null;


--Cursos que han  sido matriculados
GO
Create view Incapacidades_Registradas as
Select  NombreDeCurso,GRUPO,ANIO,PERIODO
From     Cursos C INNER JOIN CursosAbiertos CA ON C.CodigoCurso=CA.CodigoCurso
	LEFT  JOIN DetalleDeMatriculas DT  On CA.CodigoCursoAbierto=DT.CodigoCursoAbierto
Where	 DT.CodigoCursoAbierto is not null;

--Horarios  y nombres  de los Profesores que imparten lecciones los viernes
GO
Create View Horario_Nota as
Select NombreProfesor,PrimerApellidoProfesor,SegundoApellidoProfesor,Dia,HoraInicio,HoraFin from Horarios  H inner join CursosAbiertos CA 
ON CA.CodigoCursoAbierto=H.CodigoCursoAbierto  inner join Profesores P 
On CA.CodigoProfesor=P.CodigoProfesor Where Dia='V';



--Group By 

--Profesores que comenzaran a dar clases en una fecha posterior a la fecha actual
GO
Create view Profesores_Dan_Clases as
Select NombreProfesor,PrimerApellidoProfesor,SegundoApellidoProfesor from Profesores P 
left join CursosAbiertos CA ON P.CodigoProfesor=CA.CodigoProfesor Where FechaInicioCurso>Getdate() 
group by NombreProfesor,PrimerApellidoProfesor,SegundoApellidoProfesor;

--Cantidad de Matriculas que tiene un Estudiante
GO
Create view Cant_Mat as
Select NombreEstudiante,ApellidoEstudiante1,ApellidoEstudiante2,count(M.carnet) AS Cantidad_Matricula
from Estudiantes E right join Matriculas M on E.Carnet=M.Carnet Group BY M.Carnet,NombreEstudiante,ApellidoEstudiante1,ApellidoEstudiante2;


--Nombre de profesor,su certificacion y el nombre de curso que podria impartir ese profesor
GO
Create view Nombre_p as
Select NombreProfesor,PrimerApellidoProfesor,SegundoApellidoProfesor,NombreCertificacion,NombreDeCurso  from Profesores P inner join CursosAbiertos CA on CA.CodigoProfesor=P.CodigoProfesor 
inner join Cursos C on CA.CodigoCurso=C.CodigoCurso 
inner join Certificaciones CE ON P.CodigoProfesor=CE.CodigoProfesor 
Where  C.Requisito=CE.NombreCertificacion group by NombreProfesor,PrimerApellidoProfesor,SegundoApellidoProfesor,NombreCertificacion,NombreDeCurso;



--Mostrar la edad de los estudiantes registrados
GO
Create view Estudiantes_Edad as
Select CONCAT(NombreEstudiante,' ',ApellidoEstudiante1,' ',ApellidoEstudiante2) 
	AS NombreCompleto,Datediff(Year,FechaNacimiento,GETDATE()) as Edad from Estudiantes ;


--Calcular Notas finales de los estudiantes
GO
Create view Notas_Finales as
Select NombreEstudiante,ApellidoEstudiante1,ApellidoEstudiante2,(Nota1+Nota2+Nota3)/3 as NotaFinal 
FROM Estudiantes E inner join Calificaciones Cl ON E.Carnet=Cl.Carnet;


-- Cantidad de Cursos que imparte cada profesor
GO
Create view Cantidad_Puntos_Imparte_Profe as
Select NombreProfesor,PrimerApellidoProfesor,SegundoApellidoProfesor,Count(CodigoCursoAbierto) 
	as CantidadCursos from Profesores P INNER JOIN CursosAbiertos CA 
	ON CA.CodigoProfesor=P.CodigoProfesor
Group By NombreProfesor,PrimerApellidoProfesor,SegundoApellidoProfesor;

--Profesores que tengan mas de 3 certificaciones
GO
Create view Profesores_3_Certificaciones as
Select NombreProfesor,PrimerApellidoProfesor,SegundoApellidoProfesor 
from Profesores P 
inner join Certificaciones CE on P.CodigoProfesor=CE.CodigoProfesor 
group by NombreProfesor,PrimerApellidoProfesor,SegundoApellidoProfesor having count(CE.CodigoProfesor)>3;

--Estudiantes que tengan mas de 3 materias con nombre concatenado
GO
Create view Estudiantes_3_Materias as
Select Concat(NombreEstudiante,' ',ApellidoEstudiante1,' ',ApellidoEstudiante2) as NombreCompleto
From Estudiantes E Inner join Matriculas M ON M.Carnet=E.Carnet  
	 Group by	 NombreEstudiante,ApellidoEstudiante1,ApellidoEstudiante2 
	 having Count(M.Carnet)<3;



--ORDER BY

--Nombre de los estudiantes con la primera nota ordenado de manera descendiente

Select NombreEstudiante,ApellidoEstudiante1,ApellidoEstudiante2,Nota1 
from Estudiantes E inner join Calificaciones CL on E.Carnet=CL.Carnet 
order by NombreEstudiante desc

--Ordenar el nombre de los estudiantes por fecha de matricula de manera ascendente

Select Num_Recibo,NombreEstudiante,ApellidoEstudiante1,ApellidoEstudiante2,FechaDeMatricula  
from Estudiantes E inner join Matriculas M 
ON E.Carnet=M.Carnet order by FechaDeMatricula asc


--Subquery

Select NombreDeCurso,NombreEstudiante,ApellidoEstudiante1,ApellidoEstudiante2  from CursosAbiertos CA 
Inner join DetalleDeMatriculas DT 
on DT.CodigoCursoAbierto=CA.CodigoCurso 
Inner join Matriculas MA on Ma.Num_Recibo=DT.Num_Recibo inner join Cursos C 
ON CA.CodigoCurso=C.CodigoCurso inner join Estudiantes E on MA.Carnet=E.Carnet
Where exists (Select CA.CodigoCursoAbierto from CursosAbiertos inner join DetalleDeMatriculas DT on DT.CodigoCursoAbierto=CA.CodigoCursoAbierto Inner join Cursos C)



--Triggers



--Trigger de estudiantes para que no se pueda ingresar un estudiante menor de 18 años a la institucion
Go
Create or alter Trigger TR_FI_Estudiantes
On Estudiantes
instead of insert
as
BEGIN
	Declare 
	        @IdentificacionEstudiante int=(Select IdentificacionEstudiante from inserted), --Se declaran las variables para posteriormente insertarlas
			@NombreEstudiante varchar(50)=(Select NombreEstudiante from inserted),
			@Apellido1 varchar(50)=(Select ApellidoEstudiante1 from inserted),
			@Apellido2 varchar(50) =(Select ApellidoEstudiante2 from inserted),
			@Estatus varchar(3)=(Select Estatus from inserted),
			@FechaIngreso date = (Select FechaIngreso from inserted),
			@FechaNacimiento date =(Select FechaNacimiento from inserted),
			@Telefono varchar(50)=(Select TelefonoEstudiante from inserted),
			@EmailEstudiante varchar(150)=(Select EmailEstudiante from inserted),
			@Direccion varchar(200)=(Select Direccion from inserted)

	If ( exists ( select  FechaNacimiento from INSERTED where datediff (year,FechaNacimiento,GETDATE())<18 )) -- Si la diferencia entre la fecha de nacimiento y la fecha actual en años es menor a 18 
	begin
		Print 'Estudiante muy joven'	--Se indica que el estudiante es muy joven y no se insertara
	END
	
	Else
	BEGIN
		Insert into Estudiantes(IdentificacionEstudiante,NombreEstudiante,ApellidoEstudiante1,ApellidoEstudiante2,TelefonoEstudiante,EmailEstudiante,Estatus,FechaIngreso,FechaNacimiento,Direccion)
		Values(@IdentificacionEstudiante,@NombreEstudiante,@Apellido1,@Apellido2,@Telefono,@EmailEstudiante,@Estatus,@FechaIngreso,@FechaNacimiento,@Direccion) --Si el estudiante tiene mas de 18 años si se insertara
	END
END
GO

------Trigger de Certificaciones Convertir al profesor activo si se ingresa un titulo
GO
Create or alter trigger FI_Certificaciones
On certificaciones
for insert
AS 
Begin
	Declare @CodigoProfesor int=(Select CodigoProfesor from inserted)

	IF (exists (Select 1 from profesores where CodigoProfesor= @CodigoProfesor and Estatus='INA')) --Si el Profesor esta inactivo y se le ingresa un tituloi
		Begin
			Update  profesores set Estatus='ACT' where CodigoProfesor=@CodigoProfesor --El profesor pasara a activo
		END
END 
GO
---------Trigger de la tabla de profesores-----------------------------------------------
GO
Create or alter trigger TR_IU_Profesores
ON Profesores
Instead of update
AS
Begin
Declare @CodigoProfesor int=(Select CodigoProfesor from inserted),
		@Nombre varchar(200)=(Select NombreProfesor from inserted),
		@Apellido1 Varchar(50)=(Select PrimerApellidoProfesor from inserted),
		@Apellido2 Varchar(50)=(Select SegundoApellidoProfesor from inserted),
		@Email varchar(150)=(Select EmailProfesor from inserted),
		@Telefono varchar(150)=(Select TelefonoProfesor from inserted),
		@Eliminado varchar(150)=(Select EliminadoProfesor from inserted),
		@Estatus1 varchar(3)=(Select Estatus from inserted),
		@Estatus2 varchar(3)=(Select Estatus from deleted)

	If(Exists (Select estatus from deleted  where @Estatus1 <> @Estatus2 and Exists (Select 1 from CursosAbiertos where CodigoProfesor=@CodigoProfesor))) --Si se intenta cambiar el estatus de un profesor que esta impartiendo
		Begin
			print	'No se puede actualizar el estatus de un profesor que esta dando un curso' --No lo permitira y mostrara un mensaje
		End


	Else

	   Begin --En caso contrario cambiara todo lo demas
			Update profesores set NombreProfesor=@Nombre Where CodigoProfesor=@CodigoProfesor
			Update profesores set PrimerApellidoProfesor=@Apellido1 Where CodigoProfesor=@CodigoProfesor
			Update profesores set SegundoApellidoProfesor=@Apellido2 Where CodigoProfesor=@CodigoProfesor
			Update profesores set EmailProfesor=@Email Where CodigoProfesor=@CodigoProfesor
			Update profesores set TelefonoProfesor=@Telefono Where CodigoProfesor=@CodigoProfesor
			Update profesores set EliminadoProfesor=@Eliminado Where CodigoProfesor=@CodigoProfesor
			Update profesores set Estatus=@Estatus1 Where CodigoProfesor=@CodigoProfesor
		End

END
GO

--Trigger de CursosAbiertos

Create or alter trigger TR_FI_Cursos_Abiertos_Curso
On CursosAbiertos
instead of insert
AS
Begin try
Begin
 Declare @CodigoCurso int =(Select CodigoCurso from inserted),
		@MSJ VARCHAR(20)
	IF (Not exists (Select 1 from Cursos where CodigoCurso=@CodigoCurso)) --Si no existe el codigo de curso que se quiere ingresar
	Begin
	print 'El Curso no existe ' --indicar que no existe
	Set @MSJ=ERROR_MESSAGE()
	End

	Else  --En caso contrario
		Begin
		insert into CursosAbiertos(CodigoCursoAbierto,CodigoProfesor,CodigoCurso,Grupo,Cupo,Costo,Periodo,Anio,FechaInicioCurso,Aula)
			Select* from inserted --Se inserta todo lo que se iba a insertar
		End

END
End try
Begin Catch
	print error_message()
	rollback
	PRINT @MSJ
End Catch


--------------------------------------------------------

go
Create or alter trigger TR_FD_Matriculas_Estudiante_No_Borrado
On Matriculas
After delete
as
Begin
Declare @Carnet int =(Select Carnet from  inserted )
IF (exists(Select 1 from Estudiantes where Carnet=@Carnet )) 
	Begin
		Update Estudiantes set EliminadoEstudiante=1 --Si se borrra
		Update Estudiantes set Estatus='INA'
	End
	
End

GO

go
Create or alter trigger TR_FI_Detalle_Matricula
ON DetalleDeMatriculas
Instead of insert 
AS
Declare @CodigoCursoAbierto int =(Select CodigoCursoAbierto from  inserted)
Begin
IF ( not exists (Select 1 from Horarios where CodigoCursoAbierto=@CodigoCursoAbierto)) --Si el curso a ingresar no tiene un horario
		Begin
			Print 'No hay un Horario para tal curso' --Indicar que no tiene un horario
		end
Else 
	Begin
		insert into DetalleDeMatriculas(num_recibo,CodigoCursoAbierto) --En caso contrario ingresar todo
		select*from inserted
	end
end
go

Go
Create or alter trigger TR_Vacaciones_Profesor_Activo
On Vacaciones
Instead of insert
AS
	Begin
		IF(Exists(Select 1 from Profesores where Estatus='INA')) --Si el profesor esta inactivo no se agrega el registro en vacaciones
		Print 'El profesor no esta activo'
	Else
		Begin
			Insert into Vacaciones --En caso Contrario se Agrega todo
			Select * from inserted
		end
end


Go
Create or alter trigger TR_Incapacidades_Profesor_Activo
On Incapacidades
Instead of insert
AS
Begin
		
		IF(Exists(Select 1 from Profesores where Estatus='INA')) --Si el profesor esta inactivo no se agrega el registro en incapacidades
			BEGIN
				Print 'El profesor no esta activo'
			end
	Else
		Begin
			Insert into Incapacidades --De lo  contrario si lo hara
			Select * from inserted
		end

	

end



------------------------------------------------------------------------------------------------------------------------








---------------------------------------------------------------------------------------------------

GO
Create or alter procedure SP_ABRIR_CURS0( @CodigoCursoAbierto varchar(20) , --Se agregan todos los parametros necesarios para abrir el curso
										  @CodigoProfesor int ,
										  @CodigoCurso varchar(20) ,
										  @Grupo int ,
										  @Cupo int ,
										  @Costo int ,
										  @Periodo int ,
										  @Anio smallint,
										  @FechaInicioCurso date,
										  @Aula int,
										  @Dia varchar(1),
										  @HoraInicio time,
										 @HoraFin time,
										@CodigoVacacion int,
										@CodigoIncapacidad int ,
										@CodigoFeriado int)
													
AS
 
BEGIN
Declare @retorno1 int,@retorno2 int,@retorno3 int ,@FechaFinal date
	 IF (EXISTS(Select 1 from CursosAbiertos  Where CodigoCurso=@CodigoCurso  and Anio=@Anio and CodigoProfesor=@CodigoProfesor and @Periodo=Periodo)) OR --Se verifica si no hay un curso abierto el mismo año periodo y con el mismo profesor
		(Exists(Select 1 from Cursos Where CodigoCurso=@CodigoCurso and PrecioCurso<>@Costo))--Se verifica si el costo del curso no coincide con el costo establecido en la tabla cursos
		Begin
			
			PRINT 'No se puede abrir ese curso' --se indica que no se puede abrir curso si todo lo anterior se cumple
		
		END

	Else 

			Set @retorno1 =DBO.FN_Profesor_Apto(@retorno1,@CodigoProfesor,@CodigoCurso) --Se llama a la funcion de verificar si el profesor es apto
			Set @retorno2 =DBO.FN_Horario_Apto(@retorno2,@Dia,@HoraInicio ,@HoraFin,@CodigoProfesor,@Anio)--Se llama a la funcion de verificar si no hay choque de horario
			Print @retorno1
			Print @retorno2
		IF (@retorno1=1 and @retorno2=1) --Si las 2 funciones retornan un 1
			Begin
				
				insert into CursosAbiertos(CodigoCursoAbierto,CodigoProfesor,CodigoCurso,Grupo,Cupo,Costo,Periodo,Anio,FechaInicioCurso,Aula)
				Values(@CodigoCursoAbierto,@CodigoProfesor,@CodigoCurso,@Grupo,@Cupo,@Costo,@Periodo,@Anio,@FechaInicioCurso,@Aula) --Se insertara todo en la tabla de cursos abiertos

				Insert into Horarios(CodigoCursoAbierto,Dia,HoraInicio,HoraFin,AnioHorario)
				Values(@CodigoCursoAbierto,@Dia,@HoraInicio,@HoraFin,@Anio) --Se insertara todo en la tabla de horarios

				EXEC	DBO.SP_Fecha_Final @Dia,@CodigoCursoAbierto , @CodigoVacacion ,@CodigoIncapacidad  ,@CodigoFeriado ,@CodigoProfesor ,@FechaInicioCurso,@CodigoCurso,@HoraInicio,@HoraFin --Se ejecuta el procedimiento almcenado para sacar la fecha
				
		
			END

END
GO

--Llamado al procedimiento Almacenado

USE [BaseDeDatosCECC]
GO

DECLARE @RC int
DECLARE @CodigoCursoAbierto int =1245
DECLARE @CodigoProfesor int=1
DECLARE @CodigoCurso varchar(20)=22
DECLARE @Grupo int=34
DECLARE @Cupo int=12
DECLARE @Costo int=345000
DECLARE @Periodo int=2
DECLARE @Anio smallint=2021
DECLARE @FechaInicioCurso date='20211112'
DECLARE @Aula int=2
DECLARE @Dia varchar(1)='V'
DECLARE @HoraInicio time(7)='11:40'
DECLARE @HoraFin time(7)='13:30'
DECLARE @CodigoVacacion int=10
DECLARE @CodigoIncapacidad int=30
DECLARE @CodigoFeriado int=1


EXECUTE @RC = [dbo].[SP_ABRIR_CURS0] 
   @CodigoCursoAbierto
  ,@CodigoProfesor
  ,@CodigoCurso
  ,@Grupo
  ,@Cupo
  ,@Costo
  ,@Periodo
  ,@Anio
  ,@FechaInicioCurso
  ,@Aula
  ,@Dia
  ,@HoraInicio
  ,@HoraFin
  ,@CodigoVacacion
  ,@CodigoIncapacidad
  ,@CodigoFeriado
GO


Delete from CursosAbiertos Where CodigoCursoAbierto=1245
Delete from Horarios WHERE CodigoCursoAbierto=1245

--Comprobar Profesor
GO
Create or alter function FN_Profesor_Apto(@retorno int,@CodigoProfesor int,@CodigoCurso Varchar(20))
Returns int as


Begin


	If (exists (SELECT 1 from Cursos C  WHERE C.CodigoCurso = @CodigoCurso AND C.Requisito IN 
				(Select NombreCertificacion from Certificaciones CE inner join Profesores P  ON CE. CodigoProfesor=P.CodigoProfesor --Si el requisito de curso no es el mismo que el que tiene el profesor no podra dar el curso
				WHERE CE. CodigoProfesor = @CodigoProfesor and Estatus<>'INA' and EliminadoProfesor<>1) ) )

		Begin
			Set @retorno=1 --Si se cumplen los factores de que el profesor es apto y no esta eliminado ni inactivo entonces retorno sera 1
		End

	Else
		Begin
			Set @retorno=0
		END

	return @retorno

END

---Comprobar Horario

GO
Create or alter function FN_Horario_Apto(@retorno2 int,@Dia varchar(1) ,@HoraInicio time,@HoraFin time,@CodigoProfesor int,@Anio smallint)
Returns int as

Begin


	If (Exists(Select 1 from Horarios H right join CursosAbiertos CA ON H.CodigoCursoAbierto=CA.CodigoCursoAbierto  --Se verifica si el profesor ya tiene un horario en el mismo dia fe
	    where CA.CodigoProfesor=@CodigoProfesor AND @HoraInicio between HoraInicio and HoraFin and Dia=@Dia) OR
		(EXISTS (SELECT 1 from Horarios H INNER JOIN CursosAbiertos CA on H.CodigoCursoAbierto=CA.CodigoCursoAbierto  --Se verifica si son menos de 8 horas 
		WHERE @Dia='S' or DATEDIFF(HOUR,@HoraInicio,@HoraFin)>5)) OR
			(EXISTS (SELECT 1 from Horarios H INNER JOIN CursosAbiertos CA on H.CodigoCursoAbierto=CA.CodigoCursoAbierto  
		WHERE @Dia='S' or DATEDIFF(HOUR,@HoraInicio,@HoraFin)<2)) OR --verifica si son mas de dos horas en el horario
		(exists (Select 1 from Horarios H right join CursosAbiertos CA ON H.CodigoCursoAbierto=CA.CodigoCursoAbierto  
		where CA.CodigoProfesor=@CodigoProfesor and Dia=@Dia AND @HoraFin between HoraInicio and HoraFin and AnioHorario=@Anio))) --Se verifica si el profesor ya tiene un horario en el mismo rango de horas el mismo dia y el mismo año

		Begin
			Set @retorno2=0 --Si lo anterior se cumple se convierte en o el retorno2
		End

	Else
		Begin
			Set @retorno2=1 --Si lo anterior no se cumple se convierte en 1 el retorno2
		END

	return @retorno2 --se devuelve el retorno 2

END
GO








-------------------------




GO
Create or Alter Procedure SP_Fecha_Final(			@Dia varchar(1),
													@CodigoCursoAbierto int, 
													@CodigoVacacion int,
													@CodigoIncapacidad int ,
													@CodigoFeriado int,
													@CodigoProfesor int,
													@FechaInicioCurso date out,
													@CodigoCurso varchar(20),
													@HoraInicio time,
													@HoraFin time)
	
AS
begin
	Declare @dia1 int=0, --Se crean variables para guardar los dias y asi comparar y correr los dias cuando lo amerite
		@dia2 int=0,
		@dia3 int=0,
		@dia4 int=0,
		@dia5 int=0,
		@dia6 int=0,
		@dia7 int=0,
		@diaAux int=0,
		@contador int=0,
		@InicioVacacion date=(Select FechaInicio from Vacaciones where CodigoProfesor=@CodigoProfesor),
		@FinVacacion date=(Select FechaFin from Vacaciones where CodigoProfesor=@CodigoProfesor),
		@Transcurso int,
		@Duracion int =(Select HorasCurso from Cursos where CodigoCurso=@CodigoCurso),
		@Diastotales int ,
		@Duraciondia int=(Select(Datediff(hour,@HoraInicio,@HoraFin)))
		
		Set @Diastotales=@Duracion/@Duraciondia


		

		If (exists(Select 1 from horarios where CodigoCursoAbierto=@CodigoCursoAbierto and Dia='L')) --Si el dia es L la variable dia 1 sera 2 pues es el lunes representado en la funcion datepart
			Begin 
				Set @Dia1=2
			END

		If (exists(Select 1 from horarios where CodigoCursoAbierto=@CodigoCursoAbierto and Dia='K'))--Si el dia es K la variable dia 2 sera 3 pues es el Martes representado en la funcion datepart
		Begin 
			Set @Dia2=3
		ENd



		If (exists(Select 1 from horarios where CodigoCursoAbierto=@CodigoCursoAbierto and Dia='M')) --Si el dia es M la variable dia 3 sera 4 pues es el Miercoles representado en la funcion datepart
		Begin 
			Set @Dia3=4
		END


			If (exists(Select 1 from horarios where CodigoCursoAbierto=@CodigoCursoAbierto and Dia='J')) --Si el dia es L la variable dia 4 sera 5 pues es el Jueves representado en la funcion datepart
			Begin 
				Set @Dia4=5
			END


			If (exists(Select 1 from horarios where CodigoCursoAbierto=@CodigoCursoAbierto and Dia='V')) --Si el dia es L la variable dia 5 sera 6 pues es el viernes representado en la funcion datepart
				Begin 
					Set @Dia5=6
				END


			If (exists(Select 1 from horarios where CodigoCursoAbierto=@CodigoCursoAbierto and Dia='S')) --Si el dia es S la variable dia 6 sera 7 pues es el sabado representado en la funcion datepart
				Begin 
					Set @Dia6=7
				end

----------------------------------------------- Posteriormente se Utilizara la variable DiaAux y se asignara el valor de todos los dias que no sean 0

	If (@dia1<>0)
		Begin 
		Set @diaAux=@dia1
		END


	If (@dia2<>0)
		Begin 
		Set @diaAux=@dia2
		END




	If (@dia3<>0)
		Begin 
			Set @diaAux=@dia3
		END

	If (@dia4<>0)
		Begin 
			Set @diaAux=@dia4
		END



	If (@dia5<>0)
		Begin 
			Set @diaAux=@dia5
		END




	If (@dia6<>0)
		Begin 
			Set @diaAux=@dia6
		END

---------------------------------------------------------Posteriormente se le asignara a los dias que son 0 el valor de diaAux para que no haya problemas con el ciclo de calculo de fecha



	If (@dia1=0)
		Begin 
			Set @dia1=@diaAux
		END





	If (@dia2=0)
		Begin 
			Set @dia2=@diaAux
		END




	If (@dia3=0)
		Begin 
			Set @dia3=@diaAux
		END



	If (@dia4=0)
		Begin 
			Set @dia4=@diaAux
		END


	If (@dia5=0)
		Begin 
			Set @dia5=@diaAux
		END


	If (@dia6=0)
		Begin 
			Set @dia6=@diaAux
		END


	If (@dia7=0)
		Begin 
			Set @dia7=@diaAux
		END

-----------------------------------------------------Sacar Fecha Normal Curso--------------------------------------------------------


	BEGIN 
	WHILE(@contador<@Diastotales)--Mientras que el contador que controla el ciclo sea menor a los dias totales
		Begin
				IF (Exists(Select 1 where DATEpart(DW,@FechaInicioCurso) =@dia1  or  DATEpart(DW,@FechaInicioCurso)= @dia2 or DATEpart(DW,@FechaInicioCurso)=@dia3 --Si en el transcurso de fechas estan los dias que imparte el profesor
				or DATEpart(DW,@FechaInicioCurso)=@dia4 or DATEpart(DW,@FechaInicioCurso)=@dia5 and DATEpart(DW,@FechaInicioCurso)=@dia6 or DATEpart(DW,@FechaInicioCurso)=@dia7))
				begin 
				set @Contador=@contador+1
					--Se cuentan los dias de manera corrida si coincide con los dias que se imparten
				end
	Else
		begin		 --Se sumara un dia a la fecha de inicio del curso en cada iteracion
			set @FechaInicioCurso=dateadd(DAY,1,@FechaInicioCurso)
		End
	set @FechaInicioCurso=dateadd(DAY,1,@FechaInicioCurso)
ENd
 print 'La fecha final de curso es  ' + cast (@FechaInicioCurso as varchar)
end





-----------------------------------------------------Se procede a hacer el calculo con las vacaciones

IF @FechaInicioCurso BETWEEN @InicioVacacion AND @FinVacacion --Si el inicio de curso esta en medio de las vacaiones hara lo siguiente
	Begin
		Set @Transcurso= DATEDIFF(day,@InicioVacacion,@FinVacacion) --Se asignara al transcurso la diferencia de dias entre el inicio de vacacion y el fin de vacacion
	BEGIN 
	WHILE(@contador<@Transcurso)--Mientras que el contador que controla el ciclo sea menor al transcurso
		Begin
				IF (Exists(Select 1 where DATEpart(DW,@FechaInicioCurso) =@dia1  or  DATEpart(DW,@FechaInicioCurso)= @dia2 or DATEpart(DW,@FechaInicioCurso)=@dia3 --Si en el transcurso de fechas estan los dias que imparte el profesor
				or DATEpart(DW,@FechaInicioCurso)=@dia4 or DATEpart(DW,@FechaInicioCurso)=@dia5 and DATEpart(DW,@FechaInicioCurso)=@dia6 or DATEpart(DW,@FechaInicioCurso)=@dia7))
				begin 
				set @Contador=@contador+1
					--Se cuentan los dias de manera corrida si coincide con los dias que se imparten
				end
		Else
			begin		 --Se sumara un dia a la fecha de inicio del curso en cada iteracion
				set @FechaInicioCurso=dateadd(DAY,1,@FechaInicioCurso)
			End

ENd
 print 'La fecha final de curso es  ' + cast (@FechaInicioCurso as varchar)
end
end
end



------------------------------------------------------------------------------------------------
go
Create or alter procedure SP_Matricular_Estudiante(@Num_Recibo int,
													@Carnet int,
													@Monto int ,
													@Estatus varchar(3),
													@Descripcion varchar(150),
													@FechaDeMatricula date,
													@UsuarioDeMatricula Varchar(20),
													@Descuento int,
													@Presupuesto int,
													@CodigoCursoAbierto int	)


AS
Begin
	Declare @Resultado int=1
	Declare @Pagado bit=1
	If(Exists(Select 1 from Estudiantes where EliminadoEstudiante=1))
	Begin
		 print 'Estudiante eliminado no se puede matricular ' --Si el estudiante tiene borrado logico no lo matriculara
	end
Else
	If( Not Exists(Select 1 from Estudiantes where Carnet=@Carnet))
	Begin
		PRINT 'Estudiante no existe' --Si El carnet no existe lo indicara
	End
Else

	Begin
		EXEC  [dbo].[SP_Pagar_Matricula] @Monto,@Presupuesto,@Resultado --Llamado a proceso almacenado para pagar la matricula
	End

IF( @Resultado<>1)
	Begin
		SET @Pagado=0 --Pagado pasa a 0 y este valor se ingresara al final del proceso para indicar que el estudiante pago con exito

	
insert into Matriculas(Num_Recibo,Carnet,Monto,Estatus,DescripcionDeMatricula,FechaDeMatricula,UsuarioDeMatricula,Descuento,Pagado)
Values(@Num_Recibo ,@Carnet,@Monto ,@Estatus ,@Descripcion, @FechaDeMatricula ,@UsuarioDeMatricula ,@Descuento ,@Pagado )--Si todo sale bien se	asigna la matricula

	Insert into DetalleDeMatriculas(Num_Recibo,CodigoCursoAbierto)
	Values(@Num_Recibo,@CodigoCursoAbierto)

end


end





USE [BaseDeDatosCECC]
GO

DECLARE @RC int
DECLARE @Num_Recibo int
DECLARE @Carnet int
DECLARE @Monto int
DECLARE @Estatus varchar(3)
DECLARE @Descripcion varchar(150)
DECLARE @FechaDeMatricula date 
DECLARE @UsuarioDeMatricula varchar(20)
DECLARE @Descuento int
DECLARE @Presupuesto int
Declare @CodigoCursoAbierto varchar(20)

SET @NUM_RECIBO=123		
Set @Carnet=1
Set @monto=4503
Set @Presupuesto=12331
Set @Estatus='ACT'
Set @Descripcion='Matricula xD'
Set @FechaDeMatricula='20210101'
Set @UsuarioDeMatricula='Fran'
Set @Descuento=50
Set @CodigoCursoAbierto=22


EXECUTE @RC = [dbo].[SP_Matricular_Estudiante] 
   @Num_Recibo
  ,@Carnet
  ,@Monto
  ,@Estatus
  ,@Descripcion
  ,@FechaDeMatricula
  ,@UsuarioDeMatricula
  ,@Descuento
  ,@Presupuesto
  ,@CodigoCursoAbierto
GO







GO
Create or Alter Procedure  SP_Pagar_Matricula(	@Monto int,
												@Presupuesto int,												
												@Resultado int out 	)
AS
Declare @minimo int=@monto/2
Begin
	Begin tran
	If (@Presupuesto<@minimo) --Si el pago es menor al minimo que es la mitad del precio
		Begin
			set @Resultado=1 --El resultado sera 1
			Print 'Pago Insuficiente' --SE Indica que el pago es insuficiente
		End

	Else 
		begin
			Set @Resultado=@Presupuesto-@Monto --Se asigna el resultado del presupuesto menos el monto
		End

	Commit tran
	print @Resultado
end
GO



Create or alter procedure SP_Asignar_Matricula_a_Curso(@Carnet int,@CodigoCursoAbierto int,@Num_Recibo int)
AS
Begin
IF(exists(Select 1 from DetalleDeMatriculas DT inner join Matriculas MA ON DT.Num_Recibo=MA.Num_Recibo 
			Where MA.Carnet=@Carnet AND CodigoCursoAbierto=@CodigoCursoAbierto)) --Si ya existe un numero de recibo con el mismo valor y el curso abierto es el mismo
Begin
	Print 'Una Matricula Para Ese Curso Ya existe' --Indicar que ya existe una matricula para ese curso
end

end
	



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--ABRIR UN CURSO
-- PROCEDIMIENTO(
--1 EL CURSO NO ESTA YA ABIERTO
--2 TENER UN CURSO ANTERIOR A ABRIR(PERTENECER A UNA CARRERA )(PRECIO)()
--3 UN PROFE(NO DEBE ESTAR INCAPACITADO O CON VACACIONES)(TENER UN TITULO)(TIENE VACACIONES E INCAPACIDADES)
--4 HORARIO(EL PROFE NO DEBE TENER CLASES EN ESA FRANJA HORARIA)()
--5 MANDAR A MATRICULA (ESTO PUEDE SER EN PROCEDIMIENTO DE MATRICULA)

--TABLAS POR FUERA(CALIFICACIONES,)

--MATRICULAR
--PROCEDIMIENTO(
--TENER UN ESTUDIANTE (TODO SUS DATOS QUE EL ESTUDIANTE NO ESTE INACTIVO)
--TENER UN CURSO ABIERTO PARA MATRICULAR EL ESTUDIANTE(TENER UN CURSO ANTERIOR,PERTENECER A UNA CARRERA,UN PROFE(NO DEBE ESTAR INCAPACITADO O CON VACACIONES)(TENER UN TITULO),EL CURSO MANDADO A MATRICULA,HORARIO NO CHOQUE CON OTRO CURSO O EL PROFE NO CHOQUE )
--INGRESAR DATOS(EN CADA UNO DE LOS ESTUDIANTES QUE SEA ACTIVO))
