MOVER macro
	mov bh,0
	mov ah,02h;mover el cursor a una coordenada
	mov dh,CoordenadaX
	mov dl,CoordenadaY
	int 10h
	
	;imprimiedo en caracter
	mov ah,02h
    mov dl, '#'
	int 21h
endm



.model small
.stack
.data
	CoordenadaX  db 0ch
	CoordenadaY  db 28h
	
	
.code
	inicio:
	mov ax,@data
	mov ds,ax
	
	imprimir:
		mov ah,10h ;leer teclado extendido
		int 16h
		
		cmp ah,48
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
		MOVER
		jmp imprimir
	abajo:
		add CoordenadaX,01h
		MOVER
		jmp imprimir	
	derecha:
		add CoordenadaY,01h
		MOVER
		jmp imprimir	
	izquierda:
		sub CoordenadaY,01h
		MOVER
		jmp imprimir
	
	
	
		
	salir:
		.exit                        

	
	end inicio
	
	
;mov ah, 02h ; funcion para imprimir un caracter
;mov dx, '$' ; mover un 64 a Dx para imprimir en pantalla
;int 21h ; ejecuta la funcion