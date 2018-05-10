MOVER macro simbolo,colo
	mov bh,0h
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
	CoordenadaX db 0ch
	CoordenadaY db 28h
.code
	inicio:
	mov ax,@data
	mov ds,ax

	der:
		add CoordenadaY,01h
		MOVER '#',4h
		jmp imprimir
		
	imprimir:
		mov ah,10h
		int 16h

		cmp ah,48h
			je arriva
		cmp ah,4dh
			je der
		cmp ah,50h
			je aba
		cmp ah,4bh
			je izq
		cmp ah,01h
			je salir
		
		
	arriva:
		sub CoordenadaX,01h
		MOVER '@',2h
		jmp imprimir	
	aba:
		add CoordenadaX,01h
		MOVER '$',3h
		jmp imprimir	
	izq:
		mov ah, 02h ; funcion para imprimir un caracter
		sub CoordenadaY,01h
		MOVER '%',5h
		jmp imprimir
    salir:
		mov ax,4c00h
		int 21h                    

end inicio
