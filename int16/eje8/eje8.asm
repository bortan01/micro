MOVER macro simbolo,colo
	mov bh,0
	mov ah,02h;mover el cursor a una coordenada
	mov DL,CoordenadaX
	mov CL,CoordenadaY
	int 10h
	
	mov ah,0Ch	; Dibujar pixel
	mov al,colo	; Color Verde
	int 10h
	add pintado,01h
	
	
	
endm

.model small
.stack
.data
	CoordenadaX db 0ch
	CoordenadaY db 28h
	pintado db 1h
	
	Rojo db 12
	Azul db 09
	Verde db 10
	Amarillo db 14
.code
	inicio:
	mov ax,@data
	mov ds,ax
	
	mov ax,0013h	; Función modo Grafico
	int 10h         ;inicializacion de modo grafico  
	
	MOVER '$',Rojo
	
		
	abajo:
		add CoordenadaX,01h
		MOVER '$',Azul
		jmp imprimir	
	
	zero:
		mov pintado,1h
		jmp imprimir
	
	derecha:
		add CoordenadaY,01h
		MOVER '#',Verde
		jmp imprimir
	imprimir:
		mov ah,00h ;leer teclado extendido tambien con 10h
		int 16h
		
		cmp pintado,15
			je zero
		
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
	arriba:
		sub CoordenadaX,01h
		MOVER '@',Amarillo
		jmp imprimir	
	izquierda:
		sub CoordenadaY,01h
		MOVER '%',Rojo
		jmp imprimir
	salir:
		.exit
		
			
	end inicio
	


	
;mov ah, 02h ; funcion para imprimir un caracter
;mov dx, '$' ; mover un 64 a Dx para imprimir en pantalla
;int 21h ; ejecuta la funcion