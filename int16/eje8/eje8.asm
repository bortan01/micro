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

.model small
.stack
.data
	CoordenadaX dw 10
	CoordenadaY dw 10
	pintado db 1h
	
	Rojo db 12 ;4   12   13
	Azul db 09
	Verde db 10
	Amarillo db 14
.code
	inicio:
	mov ax,@data
	mov ds,ax
	
	mov ax,0013h	; Función modo Grafico
	int 10h         ;inicializacion de modo grafico  
	
	MOVER Rojo
	
	
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
		
		cmp ah,48h
			je arriba
		cmp ah,50h
			je abajo
		cmp ah,4dh
			je derecha
		cmp ah,4bh
			je izquierda
		cmp ah,01h
			je salir
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