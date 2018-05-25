;BORIS RICARDO MIRANDA AYALA MA14049 TAREA 1

MOVER macro colo
	mov bh,0
	mov ah,02h;mover el cursor a una coordenada
	mov Dx,CoordenadaX
	mov Cx,CoordenadaY
	int 10h
	
	mov ah,0Ch	; Dibujar pixel
	mov al,colo	; Color Verde
	int 10h
	
	
endm

PRINTF MACRO texto
	mov ah,09h
	mov dx, offset texto
	int 21h
ENDM

.model small
.stack
.data
	CoordenadaX dw 25
	CoordenadaY dw 10
	pintado db 1h
	
	Rojo db 12 ;4   12   13
	Azul db 09
	Verde db 10
	Amarillo db 14
	
	mensaje1 db 13,10, "USE A,S,D,W O CURSORAS PARA DIBUJAR",13,10, "$"
	mensaje_salir db "PRECIONE ESC PARA SALIR ", 13,10, '$'
.code
	inicio:
	mov ax,@data
	mov ds,ax
	
	mov ax,0013h	; Función modo Grafico
	int 10h         ;inicializacion de modo grafico  
	
;	MOV AH, 00H          ;Modo video
;MOV AL, 12H 
	
	PRINTF mensaje1
	PRINTF mensaje_salir
	
	
	
	derecha:
		add CoordenadaY,01h
		MOVER Verde
		jmp imprimir
	arriba:
		sub CoordenadaX,01h
		MOVER Amarillo
		jmp imprimir		
	imprimir:
		mov ah,00h ;leer teclado extendido tambien con 10h
		int 16h
		;estas son para la comparacion de las cursoras
		cmp ah,48h
			je arriba
		cmp ah,50h
			je abajo
		cmp ah,4dh
			je derecha
		cmp ah,4bh
			je izquierda
		;estas son para la comparacion de letras	
		cmp ah,17
			je arriba
		cmp ah,31
			je abajo
		cmp ah,32
			je derecha
		cmp ah,30
			je izquierda	
		cmp ah,01h
			je salir
			jz imprimir
	salir:
		.exit
	abajo:
		add CoordenadaX,01h
		MOVER Azul
		jmp imprimir
	izquierda:
		sub CoordenadaY,01h
		MOVER Rojo
		jmp imprimir
	
	
	
	end inicio
	


	
;mov ah, 02h ; funcion para imprimir un caracter
;mov dx, '$' ; mover un 64 a Dx para imprimir en pantalla
;int 21h ; ejecuta la funcion