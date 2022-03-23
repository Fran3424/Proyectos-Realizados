Algoritmo Bingo
Definir carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados5carton4,capturados4carton4 Como Entero
	Dimension capturados[5]    //Se crean muchisimos vectores para llenar cada una de las columnas de los cartones ya que de esa manera me es mas facil controlar que no se repitan numeros
	Dimension capturados2[5] //Cada vector tiene un nombre caracteristico para que no sea dificil indetificarlos y poder meterlos en los cartones,cada nombre hace referencia a que carton ira y cual vector es  
	Dimension capturados3[5] //Los vectores se llaman capturados por que hacen referencia a que se estan capturando 5 numeros  distintos en cada una de las columnas 
	Dimension capturados4[5] //Cada numero representa a que columna ira cada uno algunos nombres llevan 1 por que asi no se confunde la cantidad de cada columna
	Dimension capturados5[5]
	Dimension capturados1carton2[5]
	Dimension capturados2carton2[5]
	Dimension capturados3carton2[5]
	Dimension capturados4carton2[5]
	Dimension capturados5carton2[5]
	Dimension capturados1carton3[5]
	Dimension capturados2carton3[5]
	Dimension capturados3carton3[5]
	Dimension capturados4carton3[5]
	Dimension capturados5carton3[5]
	Dimension capturados1carton4[5]
	Dimension capturados2carton4[5]
	Dimension capturados3carton4[5]
	Dimension capturados4carton4[5]
	Dimension capturados5carton4[5]
	Dimension carton1[5,5]
	Dimension carton2[5,5]
	Dimension carton3[5,5]
	Dimension carton4[5,5]
	iniciarcarton(carton1)
	iniciarcarton(carton2)
	iniciarcarton(carton3)
	iniciarcarton(carton4)
	iniciarvector(capturados)
	iniciarvector(capturados2)
	iniciarvector(capturados3)
	iniciarvector(capturados4)
	iniciarvector(capturados5)
	iniciarvector(capturados1carton2)
	iniciarvector(capturados2carton2)
	iniciarvector(capturados3carton2)
	iniciarvector(capturados4carton2)
	iniciarvector(capturados5carton2)
	iniciarvector(capturados1carton3)
	iniciarvector(capturados2carton3)
	iniciarvector(capturados3carton3)
	iniciarvector(capturados4carton3)
	iniciarvector(capturados5carton3)
	iniciarvector(capturados1carton4)
	iniciarvector(capturados2carton4)
	iniciarvector(capturados3carton4)
	iniciarvector(capturados4carton4)
	iniciarvector(capturados5carton4)
	recursivo1(capturados)
	recursivo1(capturados1carton2)
	recursivo1(capturados1carton3)
	recursivo1(capturados1carton4)
	recursivo2(capturados2)
	recursivo2(capturados2carton2)
	recursivo2(capturados2carton3)
	recursivo2(capturados2carton4)
	recursivo3(capturados3)
	recursivo3(capturados3carton2)
	recursivo3(capturados3carton3)
	recursivo3(capturados3carton4)
	recursivo4(capturados4)
	recursivo4(capturados4carton2)
	recursivo4(capturados4carton3)
	recursivo4(capturados4carton4)
	recursivo5(capturados5)
	recursivo5(capturados5carton2)
	recursivo5(capturados5carton3)
	recursivo5(capturados5carton4)
	Limpiar Pantalla
	menu(carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4)
	//Se enviara al primer menu para preguntar si se quiere jugar o salir
FinAlgoritmo
SubProceso recursivo1(c) //nombre descriptivo llamado recursivo para que se sepa que hace
	Definir num1,num2,num3,num4,num5 Como Entero
	num1=Aleatorio(1,15) //Se le asignara a la variable num1 un numero entre 1 y 15 
	num2=Aleatorio(1,15) //Se le asignara a la variable num2 un numero entre 1 y 15 
	num3=Aleatorio(1,15) //Se le asignara a la variable num3 un numero entre 1 y 15 
	num4=Aleatorio(1,15) //Se le asignara a la variable num4 un numero entre 1 y 15 
	num5=Aleatorio(1,15) //Se le asignara a la variable num5 un numero entre 1 y 15 

	Si num1<>num2 y num1<>num3 y num1<>num4 y num1<>num5 y num2<>num3 y num2<>num4 y num2<>num5 y num3<>num4 y num3<>num5 y num4 <>num5 //Si el numero aleatorio de cada una de las variables no es el mismo se asignaran la variables al vector
		c[0]=num1 //Se le asignara num1 a la posicion 0 del vector
		c[1]=num2 //Se le asignara num2 a la posicion 1 del vector
		c[2]=num3 //Se le asignara num3 a la posicion 2 del vector
		c[3]=num4 //Se le asignara num4 a la posicion 3 del vector
		c[4]=num5 //Se le asignara num5 a la posicion 4 del vector
	SiNo 
	recursivo1(c) //Si la condicion no se cumple repetira el subproceso para asegurar que se asignen numeros distintos
FinSi
FinSubProceso
SubProceso recursivo2(c) //nombre descriptivo llamado recursivo para que se sepa que hace
	Definir num1,num2,num3,num4,num5 Como Entero
	num1=Aleatorio(16,30) //Se le asignara a la variable num1 un numero entre 16 y 30 
	num2=Aleatorio(16,30) //Se le asignara a la variable num2 un numero entre 16 y 30 
	num3=Aleatorio(16,30) //Se le asignara a la variable num3 un numero entre 16 y 30 
	num4=Aleatorio(16,30) //Se le asignara a la variable num4 un numero entre 16 y 30 
	num5=Aleatorio(16,30) //Se le asignara a la variable num5 un numero entre 16 y 30 
	
	Si num1<>num2 y num1<>num3 y num1<>num4 y num1<>num5 y num2<>num3 y num2<>num4 y num2<>num5 y num3<>num4 y num3<>num5 y num4 <>num5 //Si el numero aleatorio de cada una de las variables no es el mismo se asignaran la variables al vector
		c[0]=num1 //Se le asignara num1 a la posicion 0 del vector
		c[1]=num2 //Se le asignara num2 a la posicion 1 del vector
		c[2]=num3 //Se le asignara num3 a la posicion 2 del vector
		c[3]=num4 //Se le asignara num4 a la posicion 3 del vector
		c[4]=num5 //Se le asignara num5 a la posicion 4 del vector
	SiNo 
		recursivo2(c) //Si la condicion no se cumple repetira el subproceso para asegurar que se asignen numeros distintos
	FinSi
FinSubProceso
SubProceso recursivo3(c) //nombre descriptivo llamado recursivo para que se sepa que hace
	Definir num1,num2,num3,num4,num5 Como Entero
	num1=Aleatorio(31,45) //Se le asignara a la variable num1 un numero entre 31 y 45 
	num2=Aleatorio(31,45) //Se le asignara a la variable num2 un numero entre 31 y 45 
	num3=Aleatorio(31,45) //Se le asignara a la variable num3 un numero entre 31 y 45 
	num4=Aleatorio(31,45) //Se le asignara a la variable num4 un numero entre 31 y 45 
	num5=Aleatorio(31,45) //Se le asignara a la variable num5 un numero entre 31 y 45 
	
	Si num1<>num2 y num1<>num3 y num1<>num4 y num1<>num5 y num2<>num3 y num2<>num4 y num2<>num5 y num3<>num4 y num3<>num5 y num4 <>num5 //Si el numero aleatorio de cada una de las variables no es el mismo se asignaran la variables al vector
		c[0]=num1 //Se le asignara num1 a la posicion 0 del vector
		c[1]=num2 //Se le asignara num2 a la posicion 1 del vector
		c[2]=num3 //Se le asignara num3 a la posicion 2 del vector
		c[3]=num4 //Se le asignara num4 a la posicion 3 del vector
		c[4]=num5 //Se le asignara num5 a la posicion 4 del vector
	SiNo 
		recursivo3(c) //Si la condicion no se cumple repetira el subproceso para asegurar que se asignen numeros distintos
	FinSi
FinSubProceso
SubProceso recursivo4(c) //nombre descriptivo llamado recursivo para que se sepa que hace
	Definir num1,num2,num3,num4,num5 Como Entero
	num1=Aleatorio(46,60) //Se le asignara a la variable num1 un numero entre 46 y 60 
	num2=Aleatorio(46,60) //Se le asignara a la variable num2 un numero entre 46 y 60 
	num3=Aleatorio(46,60) //Se le asignara a la variable num3 un numero entre 46 y 60 
	num4=Aleatorio(46,60) //Se le asignara a la variable num4 un numero entre 46 y 60 
	num5=Aleatorio(46,60) //Se le asignara a la variable num5 un numero entre 46 y 60 
	
	Si num1<>num2 y num1<>num3 y num1<>num4 y num1<>num5 y num2<>num3 y num2<>num4 y num2<>num5 y num3<>num4 y num3<>num5 y num4 <>num5 //Si el numero aleatorio de cada una de las variables no es el mismo se asignaran la variables al vector
		c[0]=num1 //Se le asignara num1 a la posicion 0 del vector
		c[1]=num2 //Se le asignara num2 a la posicion 1 del vector
		c[2]=num3 //Se le asignara num3 a la posicion 2 del vector
		c[3]=num4 //Se le asignara num4 a la posicion 3 del vector
		c[4]=num5 //Se le asignara num5 a la posicion 4 del vector
	SiNo 
		recursivo4(c) //Si la condicion no se cumple repetira el subproceso para asegurar que se asignen numeros distintos
	FinSi
FinSubProceso

SubProceso recursivo5(c) //nombre descriptivo llamado recursivo para que se sepa que hace
	Definir num1,num2,num3,num4,num5 Como Entero
	num1=Aleatorio(61,75) //Se le asignara a la variable num1 un numero entre 61 y 75
	num2=Aleatorio(61,75) //Se le asignara a la variable num2 un numero entre 61 y 75 
	num3=Aleatorio(61,75) //Se le asignara a la variable num3 un numero entre 61 y 75 
	num4=Aleatorio(61,75) //Se le asignara a la variable num4 un numero entre 61 y 75 
	num5=Aleatorio(61,75) //Se le asignara a la variable num5 un numero entre 61 y 75 
	
	Si num1<>num2 y num1<>num3 y num1<>num4 y num1<>num5 y num2<>num3 y num2<>num4 y num2<>num5 y num3<>num4 y num3<>num5 y num4 <>num5 //Si el numero aleatorio de cada una de las variables no es el mismo se asignaran la variables al vector
		c[0]=num1 //Se le asignara num1 a la posicion 0 del vector
		c[1]=num2 //Se le asignara num2 a la posicion 1 del vector
		c[2]=num3 //Se le asignara num3 a la posicion 2 del vector
		c[3]=num4 //Se le asignara num4 a la posicion 3 del vector
		c[4]=num5 //Se le asignara num5 a la posicion 4 del vector
	SiNo 
		recursivo5(c) //Si la condicion no se cumple repetira el subproceso para asegurar que se asignen numeros distintos
	FinSi
FinSubProceso


SubProceso iniciarvector(c)
	Definir i,j Como Entero
	para i=0 hasta 4 
		 c[i]=0	
	FinPara
FinSubProceso

	
SubProceso iniciarcarton(carton)
	Definir i,j Como Entero
	para i=0 hasta 4 hacer
		Para j=0 hasta 4 hacer	
			carton[i,j]=0	
		FinPara
	FinPara
FinSubProceso
//carton2
SubProceso llenarcarton(c,c1,c2,c3,c4,c5,cualcarton) //Subproceso para llenar cada carton segun sea el caso
	Definir i,j Como Entero
	Escribir "                  Carton ",cualcarton
	Escribir "       B         I          N         G        O"
	para i=0 hasta 4 hacer
		Para j=0 hasta 4 hacer	//Cada vector ira en su colunma correspondiente
			c[i,0]=c1[i] 
			c[i,1]=c2[i]
			c[i,2]=c3[i]
			c[i,3]=c4[i]
			c[i,4]=c5[i]
			c[2,2]=0 // dejar el centro libre ya que asi son los cartones de bingo
			
			Si c[i,j]<10
				Escribir "   |   " c[i,j],"  " Sin Saltar
			SiNo
				Escribir "   |   " c[i,j]," " Sin Saltar
			FinSi
		FinPara
		Escribir ""
	FinPara
	Escribir ""
FinSubProceso
//************************************************************* modos y seleccion********************************************************************************************************************************************************************************************
SubProceso menu(carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4)
	Definir respuesta ,i,j Como Entero
	respuesta=0
	


Limpiar Pantalla
	Hacer
		Escribir "Seleccione una opcion para comenzar" //Menu para comenzar el juego
		Escribir "1. Comenzar a jugar" //Opcion De Jugaqr
		Escribir "2. salir" //Opcion de Salir
		Leer respuesta // Se lee la respuesta
		Limpiar Pantalla
	Mientras Que (respuesta<1 o respuesta>2)	
	Segun respuesta 
	
	1:Seleccionmododejuego(carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4)
		
		
	2:Escribir "(Gracias por utilizar mi bingo)"
		
		
		

	FinSegun

FinSubProceso
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++Selecciondemododejuego++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SubProceso Seleccionmododejuego(carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4)
  Definir modo1 Como Entero
Hacer
	Escribir "Seleccione el modo de juego deseado"
	Escribir "1. Forma L" //Mandara al subproceso ValidarjugadasModoL Para comenzar a jugar ese modo
	Escribir "2. Forma U"//Mandara al subproceso ValidarjugadasModoU Para comenzar a jugar ese modo
	Escribir "3. Forma C"//Mandara al subproceso ValidarjugadasModoC Para comenzar a jugar ese modo
	Escribir "4. Cartón completo"//Mandara al subproceso ValidarjugadasModoCompleto Para comenzar a jugar ese modo
	Leer modo1
Mientras Que (modo1<1 o modo1>4)	
Segun modo1
	
	1:ValidarjugadasmodoL(carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4 ) 
		//comenzar a jugar la forma L
	2:ValidarjugadasmodoU(carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4 )
		//Comenzar a jugar la forma U
	3:ValidarjugadasmodoC(carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4)
		//Comenzar a jugar la forma C
	4: ValidarjugadasmodoCompleto(carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4)	
		//Comenzar a jugar la forma de juego con el carton completo
FinSegun

FinSubProceso

SubProceso ValidarjugadasmodoL(carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4)
	Limpiar Pantalla

	llenarcarton(carton1,capturados,capturados2,capturados3,capturados4,capturados5,1) //llenamos el carton 1 para poderlo utilizar posteriormente y lo mostramos
	//Se usan muchos parametros ya que cada carton llevara en cada columna un vector distinto
	llenarcarton(carton2,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,2) //llenamos el carton 2 para poderlo utilizar posteriormente y lo mostramos
	//Se usan muchos parametros ya que cada carton llevara en cada columna un vector distinto
	llenarcarton(carton3,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,3) //llenamos el carton 3 para poderlo utilizar posteriormente y lo mostramos
	//Se usan muchos parametros ya que cada carton llevara en cada columna un vector distinto
	llenarcarton(carton4,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4,4) //llenamos el carton 4 para poderlo utilizar posteriormente y lo mostramos
	Escribir "Presione una tecla para continuar"
	Esperar tecla
	comenzarajugarmodol(carton1,carton2,carton3,carton4) //Se llama a jugadar el modo L
FinSubProceso
//++++++++++++++++++++++++++++++++++++++++++Validacion de jugadas Modo L++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SubProceso comenzarajugarmodol(carton1,carton2,carton3,carton4)
	Definir nombre1,nombre2,nombre3,nombre4 Como Caracter // se definen los nombres como variables
	Definir Tombola,i,j,respuesta Como Entero //Define la tombola i,j y respuesta como entero ya que el usuario debera poner un 1 para cambiar la tombola y ver las jugadas
	Definir gano Como Logico //Variable gano como logico para controlar el ciclo
	gano=falso //Se inicializa gano como falso para que el ciclo comienze y no se detenga si no cambia a Verdadero
	respuesta=0 //Se inicializa respuesta con un cero
	
	Escribir "Escribe tu nombre jugador 1 se te asignara el carton 1" //Se pide el nombre del primer jugador que tendra el carton 1
	leer nombre1
	Escribir "Escribe tu nombre jugador 2 se te asignara el carton 2"//Se pide el nombre del segundo jugador que tendra el carton 2
	leer nombre2
	Escribir "Escribe tu nombre jugador 3 se te asignara el carton 3" //Se pide el nombre del tercer jugador que tendra el carton 3
	leer nombre3
	Escribir "Escribe tu nombre jugador 4 se te asignara el carton 4" //Se pide el nombre del cuarto jugador que tendra el carton 4
	leer nombre4
	Limpiar Pantalla
	Hacer
		Escribir "Porfavor maximiza la ventana para que puedas ver los cartones y la tombola" //Instruccion para que el usuario pueda Ver todo el juego completo
		Escribir "Escribe 1 para continuar" //Instruccion para proceda a la siguiente jugada
		leer respuesta //Leera la respuesta dada por el usuario
		si respuesta=1 //Siempre y cuando la respuesta sea 1 comenzara a hacer lo siguiente
			Tombola=azar(75)+1 //Cada iteracion Dara un numero aleatorio de 1 entre 75
			Limpiar Pantalla //Limpiara la pantalla para que se muestre todas las jugadas nuevas y la nueva tombola
			Escribir "Tombola=",Tombola //Arriba se indicara el numero que ha salido en la Tombola
			marcarconcero(carton1,Tombola) //Este subproceso es para comparar el carton 1 con la tombola y si uno de sus elemento es el mismo que el que salio en la tombola lo marcara con un cero
			marcarconcero(carton2,Tombola) //Este subproceso es para comparar el carton 2 con la tombola y si uno de sus elemento es el mismo que el que salio en la tombola lo marcara con un cero
			marcarconcero(carton3,Tombola) //Este subproceso es para comparar el carton 3 con la tombola y si uno de sus elemento es el mismo que el que salio en la tombola lo marcara con un cero
			marcarconcero(carton4,Tombola) //Este subproceso es para comparar el carton 4 con la tombola y si uno de sus elemento es el mismo que el que salio en la tombola lo marcara con un cero
			mostrarcartonmarcado(carton1,1)//Este subproceso es para mostrar el carton 1 con el numero ya marcado si es el caso
			mostrarcartonmarcado(carton2,2)//Este subproceso es para mostrar el carton 2 con el numero ya marcado si es el caso
			mostrarcartonmarcado(carton3,3)//Este subproceso es para mostrar el carton 3 con el numero ya marcado si es el caso
			mostrarcartonmarcado(carton4,4)//Este subproceso es para mostrar el carton 4 con el numero ya marcado si es el caso
			revisacarton(carton1,1,gano,nombre1)//Este subproceso es para verificar si el carton 1 cumple con las condiciones para ganar
			revisacarton(carton2,2,gano,nombre2)//Este subproceso es para verificar si el carton 2 cumple con las condiciones para ganar
			revisacarton(carton3,3,gano,nombre3)//Este subproceso es para verificar si el carton 3 cumple con las condiciones para ganar
			revisacarton(carton4,4,gano,nombre4)//Este subproceso es para verificar si el carton 4 cumple con las condiciones para ganar
			Escribir "Tombola=",Tombola
			
			
	FinSi
	Mientras Que gano=falso //El ciclo se repetira si la variable gano es falsa osea si ninguno a ganado
	Limpiar Pantalla
FinSubProceso

SubProceso marcarconcero(carton,Tombola)
	Definir i,j Como Entero
	Para  i=0 Hasta 4
		Para j=0 hasta 4
			
			Si Tombola=carton[i,j] //Si un elmento del carton coincide con la tombola
				carton[i,j]=0 // marcar el numero con un cero para ir validando las jugadas
				
			FinSi
		FinPara
	FinPara	
	
	
FinSubProceso
SubProceso mostrarcartonmarcado(c,cualcarton) //C y cual carton cambiara al ser llamado dependiendo de que carton se va a mostrar
	Definir i,j Como Entero //Se definen los subindices como enteros
	Escribir "                  Carton ",cualcarton //Escribira arriba del carton que numero de carton es
	Escribir "       B         I          N         G        O"
	Para  i=0 Hasta 4
		Para j=0 hasta 4
			Si c[i,j]<10 //Para que se vea bien alineado se mostrara distinto si los numeros son mayores a 10 
				Escribir "   |   " c[i,j],"  " Sin Saltar
			SiNo
				Escribir "   |   " c[i,j]," " Sin Saltar
			FinSi
			
		FinPara
		Escribir ""
	FinPara
	Escribir ""
FinSubProceso
SubProceso revisacarton(carton,cualcarton,gano Por Referencia,nombre)
	Si carton[0,0]=0 y carton[1,0]=0 y carton[2,0]=0 y carton[3,0]=0 y carton[4,0]=0 y Carton[4,1]=0 y Carton[4,2]=0 y Carton[4,3] =0 y Carton[4,4]=0 
		gano=Verdadero//La Variable cambiara a Verdadero Si hay un cero en cada una de las coordenadas que hacen una L en el carton
		Escribir "Gano el carton ",cualcarton //Se dira que carton gano con su respectivo numero
		Escribir "El ganador es ",nombre //Se mostrar el nombre del jugador al cual se le asigno ese Carton
		Esperar Tecla //Esperara una tecla para poder ver el mensaje
	FinSi
	
FinSubProceso

//++++++++++++++++++++++++++++++++++++++++++++++++++modoU+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SubProceso ValidarjugadasmodoU(carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4)
	Limpiar Pantalla
	
	llenarcarton(carton1,capturados,capturados2,capturados3,capturados4,capturados5,1) //llenamos el carton 1 para poderlo utilizar posteriormente
	//Se usan muchos parametros ya que cada carton llevara en cada columna un vector distinto
	
	llenarcarton(carton2,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,2) //llenamos el carton 2 para poderlo utilizar posteriormente
	//Se usan muchos parametros ya que cada carton llevara en cada columna un vector distinto
	llenarcarton(carton3,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,3) //llenamos el carton 3 para poderlo utilizar posteriormente
	//Se usan muchos parametros ya que cada carton llevara en cada columna un vector distinto
	llenarcarton(carton4,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4,4) //llenamos el carton 4 para poderlo utilizar posteriormente
	Escribir "Bienvenido al Modo U"
	Escribir "Presione una tecla para continuar"
	Esperar tecla
	comenzarajugarmodoU(carton1,carton2,carton3,carton4) //Se llama a la validacion de jugadas del modo U el nombre es ganocarton2 por que el modo U es el modo 2 y gano carton hace referencia a que se jugara y se validara hasta que un carton gane
FinSubProceso
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++ValidandoModoU++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

SubProceso comenzarajugarmodoU(carton1,carton2,carton3,carton4)
	Definir nombre1,nombre2,nombre3,nombre4 Como Caracter
	Definir Tombola,i,j,respuesta Como Entero
	Definir gano Como Logico
	gano=falso
	respuesta=0
	
	Escribir "Escribe tu nombre jugador 1 se te asignara el carton 1" //Se pide el nombre del primer jugador que tendra el carton 1
	leer nombre1
	Escribir "Escribe tu nombre jugador 2 se te asignara el carton 2" //Se pide el nombre del segundo jugador que tendra el carton 2
	leer nombre2
	Escribir "Escribe tu nombre jugador 3 se te asignara el carton 3" //Se pide el nombre del tercer jugador que tendra el carton 3
	leer nombre3
	Escribir "Escribe tu nombre jugador 4 se te asignara el carton 4" //Se pide el nombre del cuarto jugador que tendra el carton 4
	leer nombre4
	Limpiar Pantalla
	Hacer
		Escribir "Porfavor maximiza la ventana para que puedas ver los cartones y la tombola"
		Escribir "Escribe 1 para continuar"
		leer respuesta
		si respuesta=1
			Tombola=azar(75)+1
			Limpiar Pantalla
			Escribir "Tombola=",Tombola
			marcarconcero(carton1,Tombola)
			marcarconcero(carton2,Tombola)
			marcarconcero(carton3,Tombola)
			marcarconcero(carton4,Tombola)
			mostrarcartonmarcado(carton1,1)
			mostrarcartonmarcado(carton2,2)
			mostrarcartonmarcado(carton3,3)
			mostrarcartonmarcado(carton4,4)
			revisacartonU(carton1,1,gano,nombre1)
			revisacartonU(carton2,2,gano,nombre2)
			revisacartonU(carton3,3,gano,nombre3)
			revisacartonU(carton4,4,gano,nombre4)
			Escribir "Tombola=",Tombola
		FinSi
	Mientras Que gano=falso
FinSubProceso

SubProceso revisacartonU(carton,cualcarton,gano Por Referencia,nombre)
	Si carton[0,0]=0 y carton[1,0]=0 y carton[2,0]=0 y carton[3,0]=0 y carton[4,0]=0 y Carton[4,1]=0 y Carton[4,2]=0 y Carton[4,3] =0 y Carton[4,4]=0 y Carton[3,4]=0 y Carton[2,4]=0 y Carton[1,4]=0 y Carton[0,4]=0
		gano=Verdadero
		Escribir "Gano el carton ",cualcarton
		Escribir "El ganador es ",nombre
		Esperar Tecla
	FinSi
FinSubProceso

//+++++++++++++++++++++++++++++++++++++++++++++++++++ModoC++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

SubProceso ValidarjugadasmodoC(carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4)
	Limpiar Pantalla
	
	llenarcarton(carton1,capturados,capturados2,capturados3,capturados4,capturados5,1)//llenamos el carton 1 para poderlo utilizar posteriormente

	
	llenarcarton(carton2,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,2) //llenamos el carton 2 para poderlo utilizar posteriormente
	
	llenarcarton(carton3,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,3) //llenamos el carton 3 para poderlo utilizar posteriormente
	
	llenarcarton(carton4,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4,4) //llenamos el carton 4 para poderlo utilizar posteriormente
	Escribir "Bienvenido al modo C"
	Escribir "Presione una tecla para continuar"
	Esperar tecla
	
	comenzarajugarmodoC(carton1,carton2,carton3,carton4)
FinSubProceso
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++ValidandoModoC++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

SubProceso comenzarajugarmodoC(carton1,carton2,carton3,carton4)
	Definir Tombola,i,j,respuesta Como Entero
	Definir gano Como Logico
	Definir nombre1,nombre2,nombre3,nombre4 Como Caracter
	gano=falso
	respuesta=0
	Escribir "Escribe tu nombre jugador 1 se te asignara el carton 1"
	leer nombre1
	Escribir "Escribe tu nombre jugador 2 se te asignara el carton 2"
	leer nombre2
	Escribir "Escribe tu nombre jugador 3 se te asignara el carton 3"
	leer nombre3
	Escribir "Escribe tu nombre jugador 4 se te asignara el carton 4"
	leer nombre4
	Limpiar Pantalla
	Hacer
		Escribir "Porfavor maximiza la ventana para que puedas ver los cartones y la tombola"
		Escribir "Escribe 1 para continuar"
		leer respuesta
		si respuesta=1
			Tombola=azar(75)+1
			Limpiar Pantalla
			Escribir "Tombola=",Tombola
			marcarconcero(carton1,Tombola)
			marcarconcero(carton2,Tombola)
			marcarconcero(carton3,Tombola)
			marcarconcero(carton4,Tombola)
			mostrarcartonmarcado(carton1,1)
			mostrarcartonmarcado(carton2,2)
			mostrarcartonmarcado(carton3,3)
			mostrarcartonmarcado(carton4,4)
			revisacartonC(carton1,1,gano,nombre1)
			revisacartonC(carton2,2,gano,nombre2)
			revisacartonC(carton3,3,gano,nombre3)
			revisacartonC(carton4,4,gano,nombre4)
			Escribir "Tombola=",Tombola
		FinSi
	Mientras Que gano=falso
FinSubProceso


SubProceso revisacartonC(carton,cualcarton,gano Por Referencia,nombre)
	Si carton[0,0]=0 y carton[1,0]=0 y carton[2,0]=0 y carton[3,0]=0 y carton[4,0]=0 y Carton[4,1]=0 y Carton[4,2]=0 y Carton[4,3] =0 y Carton[4,4]=0 y Carton[0,1]=0 y Carton[0,2]=0 y Carton[0,3]=0 y Carton[0,4]=0
		gano=Verdadero
		Escribir "Gano el carton ",cualcarton
		Escribir "El ganador es ",nombre
		Esperar Tecla
	FinSi
FinSubProceso
//******************************************************************************ModoCompleto****************************************************************************************
SubProceso ValidarjugadasmodoCompleto(carton1,carton2,carton3,carton4,capturados,capturados2,capturados3,capturados4,capturados5,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4)
	Limpiar Pantalla
	
	llenarcarton(carton1,capturados,capturados2,capturados3,capturados4,capturados5,1) //llenamos el carton 1 para poderlo utilizar posteriormente
	
	
	llenarcarton(carton2,capturados1carton2,capturados2carton2,capturados3carton2,capturados4carton2,capturados5carton2,2) //llenamos el carton 2 para poderlo utilizar posteriormente
	
	llenarcarton(carton3,capturados1carton3,capturados2carton3,capturados3carton3,capturados4carton3,capturados5carton3,3) //llenamos el carton 3 para poderlo utilizar posteriormente
	
	llenarcarton(carton4,capturados1carton4,capturados2carton4,capturados3carton4,capturados4carton4,capturados5carton4,4) //llenamos el carton 4 para poderlo utilizar posteriormente
	Escribir "Bienvenido al modo Completo"
	Escribir "Presione una tecla para continuar"
	Esperar tecla
	
	comenzarajugarmodoCompleto(carton1,carton2,carton3,carton4)
FinSubProceso
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++ValidandoModoCompleto++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

SubProceso comenzarajugarmodoCompleto(carton1,carton2,carton3,carton4)
	Definir nombre1,nombre2,nombre3,nombre4 Como Caracter
	Definir Tombola,i,j,respuesta Como Entero // se define una tombola y los subindices
	Definir gano Como Logico // se define una variable logica para controlar el ciclo posterior
	gano=falso //se inicializa la variable logica como falso para que asi repita el ciclo
	respuesta=0 // se inicializa la variable  de respuesta para que posteriormente cambie
	Escribir "Escribe tu nombre jugador 1 se te asignara el carton 1"
	leer nombre1
	Escribir "Escribe tu nombre jugador 2 se te asignara el carton 2"
	leer nombre2
	Escribir "Escribe tu nombre jugador 3 se te asignara el carton 3"
	leer nombre3
	Escribir "Escribe tu nombre jugador 4 se te asignara el carton 4"
	leer nombre4
	Limpiar Pantalla
	Hacer
		Escribir "Porfavor maximiza la ventana para que puedas ver los cartones y la tombola"
		Escribir "Escribe 1 para continuar" //instruccion para seguir con el procedimiento
		leer respuesta // se lee la respuesta dada por el usuario
		si respuesta=1 // si la respuesta es 1 se ejecutara lo siguiente
			Tombola=azar(75)+1 //se dara un numero al azar entre 1 y 76
			Limpiar Pantalla //se limpiara la pantalla para que no se llene de mensajes
			Escribir "Tombola=",Tombola //Se escribira la variable tombola para que se vea que numero ha salido
			marcarconcero(carton1,Tombola) //se llama a este proceso para verificar si el numero de la tombola esta en el carton 1
			marcarconcero(carton2,Tombola) //se llama a este proceso para verificar si el numero de la tombola esta en el carton 2
			marcarconcero(carton3,Tombola)//se llama a este proceso para verificar si el numero de la tombola esta en el carton 3
			marcarconcero(carton4,Tombola)//se llama a este proceso para verificar si el numero de la tombola esta en el carton 4
			mostrarcartonmarcado(carton1,1) //se mostrara nuevamente el carton 1 para que se vea que numeros van quedando y cuales han coincidido con la tombola
			mostrarcartonmarcado(carton2,2)//se mostrara nuevamente el carton 2 para que se vea que numeros van quedando y cuales han coincidido con la tombola
			mostrarcartonmarcado(carton3,3)//se mostrara nuevamente el carton 3 para que se vea que numeros van quedando y cuales han coincidido con la tombola
			mostrarcartonmarcado(carton4,4)//se mostrara nuevamente el carton 4 para que se vea que numeros van quedando y cuales han coincidido con la tombola
			revisacartonCompleto(carton1,1,gano,nombre1) // Se verificara si el carton 1 es ganador 
			revisacartonCompleto(carton2,2,gano,nombre2) // Se verificara si el carton 2 es ganador 
			revisacartonCompleto(carton3,3,gano,nombre3)// Se verificara si el carton 3 es ganador 
			revisacartonCompleto(carton4,4,gano,nombre4)// Se verificara si el carton 4 es ganador 
			Escribir "Tombola=",Tombola
		FinSi
	Mientras Que gano=falso
	
	
	FinSubProceso


SubProceso revisacartonCompleto(carton,cualcarton,gano Por Referencia,nombre)
	    Si  carton[0,0]=0 y carton[0,1]=0 y carton[0,2]=0 y carton[0,3]=0 y carton[0,4]=0 y carton[1,0]=0 y carton[2,0]=0 y carton[3,0]=0 y carton[4,0]=0 y carton[1,1]=0 y carton[1,2]=0 y carton[1,3]=0 y carton[1,4]=0 y  carton[2,1]=0  y carton[2,2]=0 y carton[2,3]=0 y carton[2,4]=0  y carton[3,1]=0 y carton[3,2]=0 y carton[3,3]=0 y carton[3,4]=0 y carton[4,1]=0 y carton[4,2]=0 y carton[4,3]=0 y carton[4,4]=0
			gano=Verdadero // Si la condicion se cumple es decir si en cada una de las coordenadas del carton estan marcadas con cero el carton ganara
			Escribir "Gano el carton ",cualcarton // Se escribira que carton gano una vez se encuentre un ganador
			Escribir "El ganador es ",nombre //se mostrara el nombre de quien gano
			Esperar Tecla
	    FinSi
FinSubProceso




