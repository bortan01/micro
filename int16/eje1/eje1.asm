LEER_LETRA MACRO ;Equivalente de ReadKey en Inicios lenguajes
	MOV AH,10h ;CAPTURA DESDE TECLADO 01
	INT 16h ;INTERRUPCION DE 16H ENTRADA/SALIDA DE TECLADO INT 21
ENDM

IMPRIMIR MACRO titulo ;Macro con parametro (titulo)
	MOV DX,OFFSET titulo
	MOV AH,09h
	INT 21h
ENDM

SALTO MACRO  ;Macro con parametro (titulo)
	MOV AH,02h
		MOV DL,10; para nueva linea
		INT 21h

		MOV AH,02h
		MOV DL,15 ;13 con 01 imprime una carita
		INT 21h
		RET
ENDM

.MODEL SMALL
.STACK
.DATA
	aviso DB 'Presione una tecla de extendida: ','$'
	letra DB 'Presionada esc para Salir','$'
	letra2 DB 'Tecla presionada F1','$'
	letra3 DB 'Tecla presionada F2','$'
	letra4 DB 'Tecla presionada F3','$'
	letra5 DB 'Tecla presionada F4','$'
	letra6 DB 'Tecla presionada Insert','$' 
.CODE
.STARTUP
	IMPRIMIR letra
	SALTO
	Inicio:LEER_LETRA ; esperar por tecla

	CMP AH,52h
		JE Insert;Si es igual a 52

	CMP AH,59
		JE F1 ; si es igual a 59

	CMP AH,60 ;
		JE F2 ;si es igual a 60

	CMP AH,61 ;Tecla 
		JE F3 ;si es igual a 61

	CMP AH,62 ;
		JE F4 ;si es igual a 62

	CMP AL,1BH ;
	JE SALIR ;Etiqueta que va a donde se regresa a modo MSDOS, y termina el

	JNE Inicio ;Otra iteración o ciclo (Leemos otra tecla para mover punto) si es que no preciono ninguna tecla definida si no es igual 
	
	
	F1:	IMPRIMIR letra2
		SALTO
		JMP Inicio
	F2:	IMPRIMIR letra3
		SALTO
		JMP Inicio
	F3:	
		IMPRIMIR letra4
		SALTO
		JMP Inicio
	F4:
		IMPRIMIR letra5
		SALTO 
		JMP Inicio
	
	Insert:
		imprimir letra6
		SALTO
		JMP Inicio
	SALIR: ;Etiqueta que representa el final de la aplicación.
	.EXIT
		
END
