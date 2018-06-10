CLS MACRO

PUSH AX
PUSH BX
PUSH CX
PUSH DX

	MOV AH, 06H ; DESPLAZAR LINEAS DE TEXTO HACIA ARRIBA
	MOV AL,00; NUMERO DE LINEAS A DESPLAZAR
	MOV BH, 03 ; FONDO BLANCO CON PRIMER PLANO AZUL
	MOv CX, 0000
	MOV DX, 184FH 
	INT 10h
	
PUSH DX
PUSH CX
PUSH BX
PUSH AX	
	
ENDM
MOSTRAR_MOUSE MACRO 
    Mov ax,01
    int 33h 
ENDM

.model small
.stack
.data
.code
inicio:
    
CLS
MOSTRAR_MOUSE
  
; Obtener la posicion y el estado de los botones del mouse

escucha:
Mov ax,0003h
int 33h
cmp bx,2h  ;COMPARA
je salir      ;Salta si es igual o salta si es cero
jmp escucha
fin_repite:


salir:
    Mov ax, 4C00h
    Int 21h
end inicio