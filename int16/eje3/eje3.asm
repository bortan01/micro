MOVER macro simbolo,colo
	mov bh,0
	mov ah,02h;mover el cursor a una coordenada
	mov dh,CoordenadaX
	mov dl,CoordenadaY
	int 10h
	
	mov ah,06h
	add bh,colo
	mov cx,0000h
	mov dx,184fh
	int 10h
	
	;imprimiedo en caracter
	mov ah,02h
    mov dl, simbolo
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
	
	
	abajo:
		add CoordenadaX,01h
		MOVER '$',3h
		jmp imprimir	
	
	imprimir:
		mov ah,10h ;leer teclado extendido
		int 16h
		
		cmp ah,48h
			je arriba
		cmp ah,50h
			je abajo
		cmp ah,4dh
			je derecha
		cmp ah,4bh
			je izquierda
		cmp ah,1BH 
			je salir
	arriba:
		sub CoordenadaX,01h
		MOVER '@',2h
		jmp imprimir	
	
	derecha:
		add CoordenadaY,01h
		MOVER '#',4h
		jmp imprimir	
	izquierda:
		sub CoordenadaY,01h
		MOVER '%',5h
		jmp imprimir
	salir:
		;mov ah, 1BH 
		;int 21h
		
		mov ah, 02h ; funcion para imprimir un caracter
       mov dx, 'A' ; mover un 64 a Dx para imprimir en pantalla
      int 21h ; ejecuta la funcion
		
	end inicio
	
	
;mov ah, 02h ; funcion para imprimir un caracter
;mov dx, '$' ; mover un 64 a Dx para imprimir en pantalla
;int 21h ; ejecuta la funcion