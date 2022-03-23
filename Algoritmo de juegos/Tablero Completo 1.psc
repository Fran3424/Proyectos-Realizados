Algoritmo tablero 
	Definir tablero1,jugada,fichaperro1,fichaperro2,fichaperro4,fichaperro3,fichazorro,nombreperro,nombrezorro Como Caracter
	Definir posicioni,posicionj,nuevaposicioni,nuevaposicionj,eleccionficha,posicioniz,posicionjz Como Entero
	Definir ganoperros,ganozorro Como Logico
	Dimension tablero1[8,8]
	ganoperros=falso //Se asigna a la variable logica la condicion de falso para que el ciclo siga hasta que ocurra una condicion ganadora
	ganozorro=falso //Se asigna a la variable logica la condicion de falso para que el ciclo siga hasta que ocurra una condicion ganadora
	fichaperro1="X1"//Se le da un signo a la ficha
	fichaperro2="X2"//Se le da un signo a la ficha
	fichaperro3="X3"//Se le da un signo a la ficha
	fichaperro4="X4"//Se le da un signo a la ficha
	fichazorro="*"  //Se le da un signo a la ficha
	iniciartablero(tablero1) 
	llenartablero(tablero1,fichaperro2,fichaperro1,fichaperro3,fichaperro4,fichazorro)
	fichasyjugadores(nombreperro,nombrezorro)
	Hacer
		Eleccionperros(tablero1,posicioni,posicionj,eleccionficha,fichaperro2,jugada,fichaperro1,fichaperro3,fichaperro4,nombreperro,nombrezorro) //Comezara a pedir la eleccion de que hacer por parte del jugador de los perros
		zorro(tablero1,posicioniz,posicionjz,eleccionficha,fichazorro,ganoperros,ganozorro,fichaperro1,fichaperro2,fichaperro3,fichaperro4,nombrezorro,nombreperro) //llamara al turno del zorro para que juegue
	Mientras Que ganoperros=falso y ganozorro=falso
FinAlgoritmo

SubProceso Eleccionperros(tablero1,posicioni Por Referencia,posicionj Por Referencia,eleccionficha Por Referencia,fichaperro2 Por Referencia,jugada Por Referencia,fichaperro1 Por Referencia,fichaperro3 Por Referencia,fichaperro4 Por Referencia,nombreperro Por Referencia,nombrezorro)
	Definir i,j Como Entero
	Limpiar Pantalla
	mostrartablero(tablero1)
	Escribir "Turno del jugador ",nombreperro
	Escribir "Esta jugando con los perros"
	Hacer
	Escribir "Elige la jugada debera ser Derecha o Izquierda"	
	Escribir "Elige la ficha a mover,Escribe 1 o 2 o 3 o 4 para mover la ficha respectiva"
	Escribir "Escribe jugada" // Pedira la jugada al jugador de los perros
	leer jugada //lee la jugada
	Escribir "Que ficha quieres mover" //Preguntara l jugador de los perros que ficha movera 
	Leer eleccionficha //lee la eleccion de ficha
	Si jugada<>"Derecha" y jugada<>"Izquierda"
		eleccionficha=7 //Para controlar que si se da una instruccion diferente de derecha o izquierda no se utilze el numero de ficha y arruine el proceso
	FinSi
	Mientras Que jugada<>"Derecha" y jugada<>"Izquierda" y eleccionficha>4
	mover(tablero1,jugada ,eleccionficha ,fichaperro1,fichaperro2,fichaperro3,fichaperro4,nombreperro,nombrezorro)
	FinSubProceso

SubProceso iniciartablero(tablero1) //iniciara el tablero1
	Definir i,j Como Entero
	Para i=0 hasta 7 Hacer
		Para j=0 Hasta 7 Hacer
			tablero1[i,j]=" "
			
		FinPara
	FinPara
FinSubProceso

SubProceso llenartablero(tablero1,fichaperro2,fichaperro1,fichaperro3,fichaperro4,fichazorro)
	Definir i,j Como Entero
	Para i=0 hasta 7 Hacer
		Para j=0 Hasta 7 Hacer
			
			tablero1[0,1]=fichaperro1 //asignara una posicion inicial para la ficha del perro numero 1
			tablero1[0,3]=fichaperro2//asignara una posicion inicial para la ficha del perro numero 2
			tablero1[0,5]=fichaperro3//asignara una posicion inicial para la ficha del perro numero 3
			tablero1[0,7]=fichaperro4//asignara una posicion inicial para la ficha del perro numero 4
			tablero1[7,5]=fichazorro //asignara una posicion incial para la ficha del zorro
		FinPara
	FinPara
FinSubProceso
SubProceso mostrartablero(t) //mostrara el tablero1 siempre que se necesita
	Definir i,j Como Entero
	Para i=0 hasta 7 Hacer
		Para j=0 Hasta 7 Hacer
			Si t[i,j]<>"X1" y t[i,j]<>"X2" y t[i,j]<>"X3" y t[i,j]<>"X4" //condicion para que se tabule bien el tablero
				Escribir "   |   " t[i,j],"  " Sin Saltar
			SiNo
				Escribir "   |   " t[i,j]," " Sin Saltar
			FinSi
			
		FinPara
		Escribir "" 
	FinPara
FinSubProceso

SubProceso mover(tablero1 ,jugada Por Referencia,eleccionficha Por Referencia,fichaperro1,fichaperro2,fichaperro3,fichaperro4,nombreperro,nombrezorro)
	Definir posicioni,posicionj Como Entero
	Definir i,j,nuevaposicioni,nuevaposicionj Como Entero
	Para i=0 hasta 7 Hacer
		Para j=0 hasta 7 Hacer
			Si eleccionficha=1 //Buscara la posicion segun la respuesta del jugador de  que ficha mover
				Si tablero1[i,j]=fichaperro1	
					posicioni=i
					posicionj=j
				FinSi
			FinSi
			Si eleccionficha=2 //Dependiendo del numero elegira una de las fichas
				Si tablero1[i,j]=fichaperro2	
					posicioni=i
					posicionj=j
				FinSi
			FinSi
			Si eleccionficha=3
				Si tablero1[i,j]=fichaperro3	//Ademas dara la posicion para posteriormente calcular su movimiento en diagonal
					posicioni=i
					posicionj=j
				FinSi
			FinSi
			Si eleccionficha=4
				Si tablero1[i,j]=fichaperro4
					posicioni=i
					posicionj=j
				FinSi
			FinSi
		FinPara
		Escribir ""
	FinPara
	Si jugada="Derecha"
		nuevaposicioni=posicioni+1 // se le sumara uno a la i y a la j para que se mueva en diagnal hacia la derecha
		nuevaposicionj=posicionj+1
	finsi
	Si jugada="Izquierda"
		nuevaposicioni=posicioni+1 //se le sumara a la i pero a la j se le restara 1 por que asi ira en la direccion izquierda
		nuevaposicionj=posicionj-1
	FinSi
	Si nuevaposicioni=8 //Condicion en caso de desbordamiento a hacia abajo
		Limpiar Pantalla
		mostrartablero(tablero1) //mostrara el tablero1 para que se visualize
		Escribir "No puedes hacer eso"
		Escribir "Presiona una tecla para continuar"
		Esperar Tecla
		Eleccionperros(tablero1,posicioni,posicionj ,eleccionficha ,fichaperro2 ,jugada,fichaperro1 ,fichaperro3 ,fichaperro4,nombreperro,nombrezorro)
	Sino	
	Si nuevaposicionj=-1 //Condicion en caso de desbordamiento a la izquierda
		Limpiar Pantalla
		mostrartablero(tablero1) //mostrara el tablero1 para que se visualize
		Escribir "No puedes hacer eso"
		Escribir "Presiona una tecla para continuar"
		Esperar Tecla
		Eleccionperros(tablero1,posicioni,posicionj ,eleccionficha ,fichaperro2 ,jugada,fichaperro1 ,fichaperro3 ,fichaperro4,nombreperro,nombrezorro)
	SiNo
		
	Si nuevaposicionj=8 //Si el usuario va a hacer una jugada que lo lleve fuera del tablero  sobrepasando el limite a la derecha ya que j solo puede llegar hasta 7
		Limpiar Pantalla
		mostrartablero(tablero1) //mostrara el tablero1 para que se visualize
		Escribir "No puedes hacer eso" //Se le inidcara que no puede hacer eso
		Escribir "Presiona una tecla para continuar" //Se le dira que presione una tecla 
		Esperar Tecla
		Eleccionperros(tablero1,posicioni,posicionj ,eleccionficha ,fichaperro2 ,jugada,fichaperro1 ,fichaperro3 ,fichaperro4,nombreperro,nombrezorro ) //Se llamara nuevamente al subproceso para que cambie su jugada
	sino
	Para i=0 Hasta 0 Hacer
		Para j=0 hasta 0  Hacer
		Si tablero1[nuevaposicioni,nuevaposicionj]=" "   //Verificara Si la siguiente posicion esta vacia para poder mover la ficha
			Si eleccionficha=1
				tablero1[posicioni,posicionj]=" "     //dejara la posicion anterior vacia
				tablero1[nuevaposicioni,nuevaposicionj]=fichaperro1
			FinSi
		FinSi
		Si tablero1[nuevaposicioni,nuevaposicionj]=" "   //Verificara Si la siguiente posicion esta vacia para poder mover la ficha
			Si eleccionficha=2
				tablero1[posicioni,posicionj]=" "     //dejara la posicion anterior vacia
				tablero1[nuevaposicioni,nuevaposicionj]=fichaperro2  
			FinSi
		FinSi
		Si tablero1[nuevaposicioni,nuevaposicionj]=" "   //Verificara Si la siguiente posicion esta vacia para poder mover la ficha
			Si eleccionficha=3
				tablero1[posicioni,posicionj]=" "     //dejara la posicion anterior vacia
				tablero1[nuevaposicioni,nuevaposicionj]=fichaperro3 
			FinSi
		FinSi
		Si tablero1[nuevaposicioni,nuevaposicionj]=" "    //Verificara Si la siguiente posicion esta vacia para poder mover la ficha
			Si eleccionficha=4 y tablero1[nuevaposicioni,nuevaposicionj]=" "
				tablero1[posicioni,posicionj]=" "     //dejara la posicion anterior vacia
				tablero1[nuevaposicioni,nuevaposicionj]=fichaperro4 
			FinSi
		FinSi
		
		
		
//**********************************************Repetir jugada si hay otra ficha en la nueva posicion***********************************************************************************************************************************************************
		Si eleccionficha=1 y tablero1[nuevaposicioni,nuevaposicionj]<>" " y tablero1[nuevaposicioni,nuevaposicionj]<>fichaperro1
			Limpiar Pantalla
			mostrartablero(tablero1) //mostrara el tablero1 para que se visualize
			Escribir "No puedes hacer eso"
			Escribir "Presiona una tecla para continuar"
			Esperar Tecla
			Eleccionperros(tablero1,posicioni,posicionj ,eleccionficha ,fichaperro2 ,jugada,fichaperro1 ,fichaperro3 ,fichaperro4,nombreperro,nombrezorro)
		FinSi
		
		Si eleccionficha=2 y tablero1[nuevaposicioni,nuevaposicionj]<>" " y tablero1[nuevaposicioni,nuevaposicionj]<>fichaperro2
			Limpiar Pantalla
			mostrartablero(tablero1) //mostrara el tablero1 para que se visualize
			Escribir "No puedes hacer eso"
			Escribir "Presiona una tecla para continuar"
			Esperar Tecla
			Eleccionperros(tablero1,posicioni,posicionj ,eleccionficha ,fichaperro2 ,jugada,fichaperro1 ,fichaperro3 ,fichaperro4,nombreperro,nombrezorro)
		FinSi
		
		Si eleccionficha=3 y tablero1[nuevaposicioni,nuevaposicionj]<>" " y tablero1[nuevaposicioni,nuevaposicionj]<>fichaperro3
			Limpiar Pantalla
			mostrartablero(tablero1) //mostrara el tablero1 para que se visualize
			Escribir "No puedes hacer eso"
			Escribir "Presiona una tecla para continuar"
			Esperar Tecla
			Eleccionperros(tablero1,posicioni,posicionj ,eleccionficha ,fichaperro2 ,jugada,fichaperro1 ,fichaperro3 ,fichaperro4,nombreperro,nombrezorro)
		FinSi
		
		Si eleccionficha=4 y tablero1[nuevaposicioni,nuevaposicionj]<>" " y tablero1[nuevaposicioni,nuevaposicionj]<>fichaperro4
			Limpiar Pantalla
			mostrartablero(tablero1) //mostrara el tablero1 para que se visualize
			Escribir "No puedes hacer eso"
			Escribir "Presiona una tecla para continuar"
			Esperar Tecla
			Eleccionperros(tablero1,posicioni,posicionj ,eleccionficha ,fichaperro2 ,jugada,fichaperro1 ,fichaperro3 ,fichaperro4,nombreperro,nombrezorro)
		FinSi
		FinPara
	FinPara
	Limpiar Pantalla
		mostrartablero(tablero1)
		FinSi
	FinSi
	FinSi

FinSubProceso
//**********************************************************************************************************Vallidando zorro**********************************************************************
SubProceso zorro(tablero1,posicioniz Por Referencia , posicionjz Por Referencia,eleccionficha Por Referencia,fichazorro,ganoperros Por Referencia,ganozorro Por Referencia,fichaperro1,fichaperro2,fichaperro3,fichaperro4,nombrezorro Por Referencia,nombreperro Por Referencia)
		encuentraelemtentozorro(tablero1,posicioniz,posicionjz,fichazorro,ganoperros,ganozorro) //Llamar al subproceso para buscar la fichadelzorro en el tablero1
		moverzorro(tablero1,posicioniz,posicionjz,fichazorro,ganoperros,ganozorro,fichaperro1,fichaperro2,fichaperro3,fichaperro4,nombrezorro,nombreperro)//llamar al subproceso de mover al zorro
FinSubProceso
//***************************************************Encontrandoelzorro**********************************************************************************************************************************
SubProceso encuentraelemtentozorro(tablero1,posicioniz por referencia ,posicionjz Por Referencia,fichazorro,ganoperros Por Referencia,ganozorro Por Referencia)
	Definir i,j Como Entero
	Para i=0 hasta 7 Hacer
		Para j=0 hasta 7 Hacer
			Si tablero1[i,j]=fichazorro //Buscara en el tablero1 la posicion del zorro
				posicioniz=i //le asignara a la variable posicioniz que hace referencia a la posicion i del zorro
				posicionjz=j //le asignara a la variable poosicionjz que hace refericia a la posicion j del zorro
			FinSi
		FinPara
	FinPara
FinSubProceso
//******************************************Moviendozorro***********************************************************************************
SubProceso moverzorro(tablero1,posicioniz Por Referencia,posicionjz Por Referencia,fichazorro,ganoperros Por Referencia,ganozorro Por Referencia,fichaperro1,fichaperro2,fichaperro3,fichaperro4,nombrezorro Por Referencia,nombreperro Por Referencia)
	Definir i,j,nuevaposicioniz,nuevaposicionjz Como Entero
	Definir jugadazorro Como Caracter
	Limpiar Pantalla
	mostrartablero(tablero1)
	Escribir "Turno del jugador ",nombrezorro
	Escribir "Estas jugando con el zorro"
	Hacer
	Escribir "Escribe la jugada"
	Escribir "W Para ir hacia adelante a la Izquierda" 
	Escribir "E Para ir hacia adelante a la Derecha"
	Escribir "D Para ir hacia atras a la Derecha"
	Escribir "S Para ir hacia atras a la Izquierda"
	Escribir "Escriba jugada" //Se pedira la jugada del jugador del zorro
	Leer jugadazorro //Se leera la jugada
    Mientras Que jugadazorro<>"W"y jugadazorro<>"E" y jugadazorro<>"D" y jugadazorro<>"S" //Condicion por si el usuario se equivoca

	Si jugadazorro="W" //Si el usuario presiona la w se movera hacia adelante y a la izquierda
		nuevaposicioniz=posicioniz-1  //Se le restara 1 a la posicion de i para que suba en el tablero1
		nuevaposicionjz=posicionjz-1
		//Se le restara 1 a la j para que se mueva en direccion hacia la izquierda
	finsi
	Si jugadazorro="E" //Si el usuario presiona la E se la ficha se movera hacia adelante y a la derecha
		nuevaposicioniz=posicioniz-1 //Se le restara 1 a la posicion i para que suba en el tablero1
		nuevaposicionjz=posicionjz+1
								  //Se le sumara a la posicion j para que se mueva en direccion hacia la derecha
	
	FinSi
	Si jugadazorro="D"
		nuevaposicioniz=posicioniz+1 // se le sumara uno a la i y a la j para que se mueva en diagnal hacia la derecha
		nuevaposicionjz=posicionjz+1
	finsi
	Si jugadazorro="S"
		nuevaposicioniz=posicioniz+1 //se le sumara a la i pero a la j se le restara 1 por que asi ira en la direccion izquierda
		nuevaposicionjz=posicionjz-1
	FinSi
	Si nuevaposicioniz=8 //Condicion en caso de desbordamiento a hacia abajo
		Limpiar Pantalla
		mostrartablero(tablero1) //mostrara el tablero1 para que se visualize
		Escribir "No puedes hacer eso"
		Escribir "Presiona una tecla para continuar"
		Esperar Tecla
		moverzorro(tablero1 ,posicioniz,posicionjz,fichazorro,ganoperros,ganozorro,fichaperro1,fichaperro2,fichaperro3,fichaperro4,nombrezorro,nombreperro)
    sino	
	Si nuevaposicionjz=-1 //Condicion en caso de desbordamiento a la izquierda
		Limpiar Pantalla
		mostrartablero(tablero1) //mostrara el tablero1 para que se visualize
		Escribir "No puedes hacer eso"
		Escribir "Presiona una tecla para continuar"
		Esperar Tecla
		moverzorro(tablero1 ,posicioniz,posicionjz,fichazorro,ganoperros,ganozorro,fichaperro1,fichaperro2,fichaperro3,fichaperro4,nombrezorro,nombreperro)
	sino	
	Si nuevaposicionjz=8  
		Limpiar Pantalla
		mostrartablero(tablero1) //mostrara el tablero1 para que se visualize
		Escribir "No puedes hacer eso"
		Escribir "Presiona una tecla para continuar"
		Esperar Tecla
		moverzorro(tablero1 ,posicioniz,posicionjz,fichazorro,ganoperros,ganozorro,fichaperro1,fichaperro2,fichaperro3,fichaperro4,nombrezorro,nombreperro)
	SiNo
		Para i=0 Hasta 0 Hacer
			Para j=0 hasta 0 Hacer
//+++++++++++++++++++++++++++++++++++++++++++++++++++++Condiciondeganadorparalosperrros+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
		Si posicioniz=7 y  tablero1[posicioniz-1,posicionjz-1]<>" " y tablero1[posicioniz-1,posicionjz+1]<>" "
			ganoperros=Verdadero //Si el zorro esta en la fila limite   y Hay 2 perros en las unicas posiciones que se puede mover el zorro perdera
					
		SiNo		
			
		Si posicionjz=0 y tablero1[posicioniz-1,posicionjz+1]<>" " y tablero1[posicioniz+1,posicionjz+1]<>" "
			ganoperros=Verdadero //Si el zorro esta en la columna limite a la izquierda y Hay 2 perros en las unicas posiciones que se puede mover el zorro perdera
		SiNo
			
	//**********************************************************************limiteizquierdo**************************************************************************************************************************************************************	
			
		Si posicionjz=7 y  tablero1[posicioniz-1,posicionjz-1]<>" " y tablero1[posicioniz+1,posicionjz-1]<>" "
			ganoperros=Verdadero //Si el zorro esta en la columna limite  a la Derecha y Hay 2 perros en las unicas posiciones que se puede mover el zorro perdera
		SiNo
			
     //*********************************************************************************************************************************************************************************************
		Si  tablero1[nuevaposicioniz,nuevaposicionjz]=" " y nuevaposicioniz=0// CONDICION DE GANADOR SI EL ZORRO LLEGA A LA PRIMERA FILA
			ganozorro=Verdadero
		SiNo
			
	//*************************************************************************************************************************************************************************************************	
		Si tablero1[nuevaposicioniz,nuevaposicionjz]=" " //Verficara si la siguiente posicion esta vacia entonces movera la ficha de lo contrario no lo hara
						tablero1[posicioniz,posicionjz]=" "//dejara la posicion anterior vacia
						tablero1[nuevaposicioniz,nuevaposicionjz]=fichazorro //pondra en la nueva posicion la ficha del zorro
					FinSi
					//Esta condicion excluye a las columnas y fila limite ya que de lo contrario no activara la bandera para que se acabe el juego
					Si tablero1[nuevaposicioniz,nuevaposicionjz]<>" " y tablero1[nuevaposicioniz,nuevaposicionjz]<>fichazorro  //Esta condicion es para que se evite que se mueva a una posicion donde hay una ficha
						Limpiar Pantalla 
						mostrartablero(tablero1) //mostrara el tablero1 para que se visualize
						Escribir "No puedes hacer eso"
						Escribir "Presiona una tecla para continuar"
						Esperar Tecla
						moverzorro(tablero1 ,posicioniz,posicionjz,fichazorro,ganoperros,ganozorro,fichaperro1,fichaperro2,fichaperro3,fichaperro4,nombrezorro,nombreperro)
					FinSi
				FinSi
			FinSi
		FinSi
	FinSi


		FinPara
FinPara
		Si ganozorro=Verdadero 
			decirgano(nombrezorro)//llamara al subproceso para decir que gano el zorro
		FinSi
		Si ganoperros=Verdadero
			ganoperrosx(nombreperro)//llamara al subproceso para decir que ganaron los perros
		FinSi

	FinSi
FinSi
FinSi


	
FinSubProceso

SubProceso fichasyjugadores(nombreperro Por Referencia,nombrezorro Por Referencia)
	Definir fichaelegida Como Entero //Se define la variable fichaelegida para determinar que ficha jugara
	Definir nombre1,nombre2 Como Caracter //Se definen las variables para guardar 2 nombres
	Escribir "Escribe tu nombre primer jugador"//El usuario escribira su nombre
	Leer nombre1 //El programa leera el nombre
	Hacer
	Escribir "Elige la ficha con la quieres jugar" //Se le solicita con que ficha jugar
	Escribir "Digite 1 para jugar con los perros" //Se le indica que si digita el 1 se le dara las fichas de los perros
	Escribir "Digite 2 para jugar con el zorro"  //Se le indica que si digita el 2 se le dara la ficha de los perros
	Leer fichaelegida
	Mientras Que fichaelegida<>1 y fichaelegida<>2 //Por si el usuario se equivoca se le seguira solicitando hasta que de una respuesta valdia
	Escribir "Escribe tu nombre segundo jugador" //Se le solicita el nombre al segundo jugador
	leer nombre2 //Se lee el segundo nombre
	Si fichaelegida=1 //Si el digito 1 se le asiganara a la variable nombreperro su nombre y la variable nombrezorro el nombre del otro jugador
		nombreperro=nombre1
		nombrezorro=nombre2
	FinSi
	Si fichaelegida=2 //Si el digito 2 se le asiganara a la variable nombrezorro su nombre y la variable nombreperro el nombre del otro jugador
		nombrezorro=nombre1
		nombreperro=nombre2
	FinSi
	Escribir "El jugador que jugara con los perros ",nombreperro //Se indicara quien va a jugar con que ficha
	Escribir "El jugador que jugara con el zorro ",nombrezorro
	Escribir "Presione una tecla para continuar" //Se le solicita que presione una tecla para continuar
	Esperar Tecla 
FinSubProceso
	
SubProceso ganoperrosx(nombreperro Por Referencia)
	Escribir "Ganaron los perros" //se dice que ganaron los perros
	Escribir "El ganador es el jugador ",nombreperro //Se indica el nombre del ganador
FinSubProceso

SubProceso decirgano(nombrezorro Por Referencia)
	Escribir "Gano el zorro" //se dice que gano el zorro
	Escribir "El ganador es el jugador ",nombrezorro //Se indica el nombre del ganador
FinSubProceso
