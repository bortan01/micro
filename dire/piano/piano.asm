TONO MACRO NUMERO ;Esta macro recibe el tono
	MOV BX,NUMERO ;y manda a llamar a los procedimientos
	CALL BOCINA
ENDM

.model small
.stack 100h
.data
.code


MOV AX, @data ;se mandan llamar todos los
MOV DS, AX ;procedimientos

EMPIEZA:

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

pintar:

	TONO 587
	TONO 622
	TONO 659
	TONO 698
	TONO 740
	TONO 784
	TONO 830
	TONO 880
	TONO 923
	TONO 988
	
	jmp escucha
	
salir:
	pop dx
	pop cx
	pop bx
	pop ax
	.exit







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







END EMPIEZA