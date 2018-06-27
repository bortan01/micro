CLS MACRO

	MOV AH, 06H ; DESPLAZAR LINEAS DE TEXTO HACIA ARRIBA
	MOV AL,00; NUMERO DE LINEAS A DESPLAZAR
	MOV BH, 00 ; FONDO BLANCO CON PRIMER PLANO AZUL
	MOv CX, 0000
	MOV DX, 184FH
	INT 10h
ENDM


.model small
.stack
.data
	Aclaracion db 'SU RUTA ACTUAL ES:',13,10,'$'
	Ruta db 'OTRO',0; El Nombre est  fijo para el ejemplo
	Imp db 100 dup('$')
	Raiz db 'C:\',0
	Vec db 1000 dup('$') ; cantidad de espacio reservada 
	Longitud dw 5000 ; cantidad de letras a mostrar
	Buff dB 8 DUP (' ')
    cls_buffer DB '                            ',13,10, '$'
	Fin DB '',13,10, '$'

	

.code
inicio:
mov ax,@data
mov ds,ax

push ax
push bx
push cx
push dx


	CLS

	
	
	
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
	je regresar
	jmp escucha

regresar:

	pop dx
	pop cx
	pop bx
	pop ax
	jmp largo


pintar:

jmp escucha

largo:
	.exit

end inicio



