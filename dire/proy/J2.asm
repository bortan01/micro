TONO MACRO NUMERO ;Esta macro recibe el tono
	MOV BX,NUMERO ;y manda a llamar a los procedimientos
	CALL BOCINA
ENDM


CLS MACRO

	MOV AH, 06H ; DESPLAZAR LINEAS DE TEXTO HACIA ARRIBA
	MOV AL,00; NUMERO DE LINEAS A DESPLAZAR
	MOV BH, 00 ; FONDO BLANCO CON PRIMER PLANO AZUL
	MOv CX, 0000
	MOV DX, 184FH
	INT 10h
ENDM

BACKGRAUND MACRO fondo,inicioY,finY,inicioX,finX

	MOV AH, 06H ; DESPLAZAR LINEAS DE TEXTO HACIA ARRIBA
	MOV AL,0; NUMERO DE LINEAS A DESPLAZAR
	MOV BH, fondo ; FONDO BLANCO CON PRIMER PLANO AZUL

	MOv CH, inicioY;LINEA DONDE COMIENZA LA VENTANA DE TEXTO
	MOV DH, finY ;LINEA DONDE ACABA VENTANADE TEXTO;

	MOV CL, inicioX ; COLUMNA DONDE EMPIEZA VENTANA DE TEXTO
	MOV DL, finX ;COLUMNA DONDE ACABA VENTANA DE TEXTO
	INT 10h



ENDM


.model small
.stack
.data

	CoordenadaX db 14h
	CoordenadaY db 0ch

	Fondo_Azul db 16
	Universidad db 13,10, "Universidad Nacional de El Salvador",13,10, "$"
	Facultad db "Facultad Multidisciplinaria Paracentral", 13,10, '$'
	Nombre db "Boris Ricardo Miranda Ayala", 13,10, '$'
	Carnet db "MA14049", 13,10, '$'

	L1_inicio db 3
	L1_fin db 6

	L2_inicio db 8
	L2_fin db 11

	L3_inicio db 13
	L3_fin db 16

	L4_inicio db 18
	L4_fin db 21

	L5_inicio db 23
	L5_fin db 26

	C1_inicio db 3
	C1_fin db 15

	C2_inicio db 18
	C2_fin db 30

	C3_inicio db 33
	C3_fin db 45

	C4_inicio db 48
	C4_fin db 60

	C5_inicio db 63
	C5_fin db 75


	Negro db    16
	Blanco db   15
	Amarillo db 14
    Violeta	db  13
	Rozado db   12
	Celeste db  11
	Verde db    10
	Azul db     9
	Cafe  db    6
	Morado db   5
	Rojo db     4
	Acua db     3 
	otro db 2
	

.code
inicio:
mov ax,@data
mov ds,ax

push ax
push bx
push cx


	CLS

	mov ax,0010h	; Función modo Grafico
	MOV BH, 0
	int 10h         ;inicializacion de modo grafico  
	
	
	BACKGRAUND Negro,0,24,00,79
	BACKGRAUND Blanco,L1_inicio,L1_fin,C1_inicio,C1_fin
	BACKGRAUND Blanco ,L1_inicio,L1_fin,C2_inicio,C2_fin
	BACKGRAUND Blanco ,L1_inicio,L1_fin,C3_inicio,C3_fin
	BACKGRAUND Blanco ,L1_inicio,L1_fin,C4_inicio,C4_fin
	BACKGRAUND Blanco ,L1_inicio,L1_fin,C5_inicio,C5_fin

	BACKGRAUND Blanco ,L2_inicio,L2_fin,C1_inicio,C1_fin
	BACKGRAUND Blanco ,L2_inicio,L2_fin,C2_inicio,C2_fin
	BACKGRAUND Blanco,L2_inicio,L2_fin,C3_inicio,C3_fin
	BACKGRAUND Blanco,L2_inicio,L2_fin,C4_inicio,C4_fin
	BACKGRAUND Blanco,L2_inicio,L2_fin,C5_inicio,C5_fin

	BACKGRAUND Blanco,L3_inicio,L3_fin,C1_inicio,C1_fin
	BACKGRAUND Blanco,L3_inicio,L3_fin,C2_inicio,C2_fin
	BACKGRAUND Blanco,L3_inicio,L3_fin,C3_inicio,C3_fin
	BACKGRAUND Blanco,L3_inicio,L3_fin,C4_inicio,C4_fin
	BACKGRAUND Blanco ,L3_inicio,L3_fin,C5_inicio,C5_fin

	BACKGRAUND Blanco,L4_inicio,L4_fin,C1_inicio,C1_fin
	BACKGRAUND Blanco,L4_inicio,L4_fin,C2_inicio,C2_fin
	BACKGRAUND Blanco,L4_inicio,L4_fin,C3_inicio,C3_fin
	BACKGRAUND Blanco,L4_inicio,L4_fin,C4_inicio,C4_fin
	BACKGRAUND Blanco,L4_inicio,L4_fin,C5_inicio,C5_fin


	push ax
	push bx
	push cx
	push dx
	
	Mov ax,0000h; Averigua si hay un ratón conectado
	int 33h  

	Mov ax,0001h; Mostrar el cursor del ratón en la pantalla
	int 33h  

escucha:
	Mov ax,0003h
	MOV BH,00
	MOV DX,00H
	int 33h


	cmp bx,1h  ;click izquierdo
	je pintar
	cmp bx,2h  ;click derecho
	je salir
	jmp escucha

salir:
pop dx
pop cx
pop bx
pop ax
.exit

pintar:
cmp dx,40
jg fila1
jmp escucha

fila1:
    cmp dx,110
    jg saltoA      
        cmp dx,30
        jg f1c1
        jmp escucha
        
        f1c1:
            cmp cx,125
            jg f1c2
            BACKGRAUND otro,L1_inicio,L1_fin,C1_inicio,C1_fin
			BACKGRAUND otro,L4_inicio,L4_fin,C2_inicio,C2_fin
			TONO 587
            jmp escucha
        saltoA: 
            jmp fila2
		
        f1c2:
            cmp cx,250
            jg f1c3
            BACKGRAUND Acua,L1_inicio,L1_fin,C2_inicio,C2_fin
			BACKGRAUND Acua,L3_inicio,L3_fin,C4_inicio,C4_fin 
			TONO 622
            jmp escucha   
        
        f1c3:
            cmp cx,370
            jg f1c4
            BACKGRAUND Rojo,L1_inicio,L1_fin,C3_inicio,C3_fin
			BACKGRAUND Rojo,L4_inicio,L4_fin,C1_inicio,C1_fin 
			TONO 659
            jmp escucha
        
        f1c4:
            cmp cx,490
            jg f1c5
            BACKGRAUND Morado,L1_inicio,L1_fin,C4_inicio,C4_fin
			BACKGRAUND Morado,L2_inicio,L2_fin,C5_inicio,C5_fin
			TONO 698
            jmp escucha  
        f1c5:
            cmp cx,610
            jg escucha1
            BACKGRAUND Cafe,L1_inicio,L1_fin,C5_inicio,C5_fin
			BACKGRAUND Cafe,L2_inicio,L2_fin,C1_inicio,C1_fin
			TONO 740
            jmp escucha
        escucha1:
            jmp escucha
   
   

fila2:
    cmp dx,180
    jg saltoB
        cmp dx,23
        jg f2c1
        jmp escucha
        
        f2c1:
            cmp cx,125
            jg f2c2
            BACKGRAUND Cafe,L1_inicio,L1_fin,C5_inicio,C5_fin
			BACKGRAUND Cafe,L2_inicio,L2_fin,C1_inicio,C1_fin
			TONO 784 
            jmp escucha
		saltoB: 
            jmp fila3
        
        f2c2:
            cmp cx,250
            jg f2c3
            BACKGRAUND Azul,L2_inicio,L2_fin,C2_inicio,C2_fin
			BACKGRAUND Azul,L4_inicio,L4_fin,C5_inicio,C5_fin
			TONO 830
            jmp escucha   
        
        
        f2c3:
            cmp cx,370
            jg f2c4
            BACKGRAUND Verde,L2_inicio,L2_fin,C3_inicio,C3_fin
			BACKGRAUND Verde,L4_inicio,L4_fin,C4_inicio,C4_fin
			TONO 880
            jmp escucha
        
        f2c4:
            cmp cx,490
            jg f2c5
            BACKGRAUND Celeste,L2_inicio,L2_fin,C4_inicio,C4_fin
			BACKGRAUND Celeste,L3_inicio,L3_fin,C3_inicio,C3_fin
			TONO 823
            jmp escucha  
        f2c5:
            cmp cx,610
            jg escha2
            BACKGRAUND Morado,L1_inicio,L1_fin,C4_inicio,C4_fin
			BACKGRAUND Morado,L2_inicio,L2_fin,C5_inicio,C5_fin
			TONO 988
            jmp escucha
        escha2:
            jmp escucha

fila3:
    cmp dx,250
    jg saltoC
        cmp dx,23
        jg f3c1
        jmp escucha
        
        f3c1:
            cmp cx,125
            jg f3c2
            BACKGRAUND Rozado,L3_inicio,L3_fin,C1_inicio,C1_fin
			BACKGRAUND Rozado,L3_inicio,L3_fin,C5_inicio,C5_fin
			TONO 587
            jmp escucha
		saltoC:
            jmp fila4
        f3c2:
            cmp cx,250
            jg f3c3
            BACKGRAUND Amarillo,L3_inicio,L3_fin,C2_inicio,C2_fin
			BACKGRAUND Amarillo,L4_inicio,L4_fin,C3_inicio,C3_fin
			TONO 622
            jmp escucha    
        f3c3:
            cmp cx,370
            jg f3c4
            BACKGRAUND Celeste,L2_inicio,L2_fin,C4_inicio,C4_fin
			BACKGRAUND Celeste,L3_inicio,L3_fin,C3_inicio,C3_fin
			TONO 659
            jmp escucha
        
        f3c4:
            cmp cx,490
            jg f3c5
            BACKGRAUND Acua,L1_inicio,L1_fin,C2_inicio,C2_fin
			BACKGRAUND Acua,L3_inicio,L3_fin,C4_inicio,C4_fin 
			TONO 698
            jmp escucha  
        f3c5:
            cmp cx,610
            jg escucha3
            BACKGRAUND Rozado,L3_inicio,L3_fin,C1_inicio,C1_fin
			BACKGRAUND Rozado,L3_inicio,L3_fin,C5_inicio,C5_fin
			TONO 740
			jmp escucha  
        escucha3:
            jmp escucha

fila4:
    cmp dx,320
    jg saltoD
        cmp dx,23
        jg f4c1
        jmp escucha
        
        f4c1:
            cmp cx,125
            jg f4c2
            BACKGRAUND Rojo,L1_inicio,L1_fin,C3_inicio,C3_fin
			BACKGRAUND Rojo,L4_inicio,L4_fin,C1_inicio,C1_fin
			TONO 784
            jmp escucha
		saltoD:
            jmp escucha
        
        f4c2:
            cmp cx,250
            jg f4c3
            BACKGRAUND otro,L1_inicio,L1_fin,C1_inicio,C1_fin
			BACKGRAUND otro,L4_inicio,L4_fin,C2_inicio,C2_fin
			TONO 830
            jmp escucha
        
        
        f4c3:
            cmp cx,370
            jg f4c4
            BACKGRAUND Amarillo,L3_inicio,L3_fin,C2_inicio,C2_fin
			BACKGRAUND Amarillo,L4_inicio,L4_fin,C3_inicio,C3_fin
			TONO 880
            jmp escucha
        
        f4c4:
            cmp cx,490
            jg f4c5
            BACKGRAUND Verde,L2_inicio,L2_fin,C3_inicio,C3_fin
			BACKGRAUND Verde,L4_inicio,L4_fin,C4_inicio,C4_fin
			TONO 923
            jmp escucha  
        f4c5:
            cmp cx,610
            jg escucha4
            BACKGRAUND Azul,L2_inicio,L2_fin,C2_inicio,C2_fin
			BACKGRAUND Azul,L4_inicio,L4_fin,C5_inicio,C5_fin 
			TONO 988
            jmp escucha
        escucha4:
            jmp escucha

BocinaOn PROC ;Activa la bocina
	IN AL, 61h
	OR AL, 11B
	OUT 61h, AL
	RET
BocinaOn ENDP


BocinaOff PROC ;Desactiva la bocina
	IN AL, 61h
	AND AL, 11111100b
	OUT 61h, AL
	RET
BocinaOff ENDP

Ajustar PROC ;Ajusta la bocina con la frecuencia dada
	PUSH BP
	MOV BP, SP
	MOV DX, 18
	MOV AX, 13353
	MOV BX, [BP + 4]
	DIV BX
	MOV BX, AX
	MOV AL, 0B6h
	OUT 43h, AL
	MOV AX, BX
	OUT 42h, AL
	MOV AL, AH
	OUT 42h, AL
	POP BP
	RET
Ajustar ENDP


Suena proc ;Activa la bocina y coloca el nombre de
	CALL bocinaON ;la tecla.
	
	MOV AX,40H
	MOV ES,AX
	MOV DX,[ES:006EH] ;Graba el valor del contador del BIOS
	MOV AX,[ES:006CH]
	ADD AX,7
	ADC DX,0 ;Se le suma 7 unidades a ese valor
	CLIC:
		CMP DX,[ES:006EH] ;Y se compara hasta que sean iguales
		JB FINI ;Pasando por un ciclo, cuando llegen
		JA CLIC ;a ser iguales se sale del ciclo y
		CMP AX,[ES:006CH]
		JA CLIC
	FINI:
		CALL BocinaOff ;Se desconecta la bocina y vuelve

	RET ;Su nombre
Suena endp

Bocina proc ;Este procedimiento guarda AX y BX en
	PUSH BX ;la pila para no perder su valor, con
	MOV AX, BX ;esto llama a ajusta y a suena
	PUSH AX
	CALL Ajustar
	POP AX
	POP BX
	CALL SUENA
	ret
Bocina endp




end inicio



