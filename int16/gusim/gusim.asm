CLS macro
	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX
	MOV AX, 0605
	MOV BH, 61 ; FONDO BLANCO CON PRIMER PLANO AZUL
	MOV CX, 10H
	MOV DX, 49H
	INT 10
	POP DX
	POP CX 
	POP BX
	POP AX
endm


MOVER macro simbolo,colo
	mov bh,0
	mov ah,02h;mover el cursor a una coordenada
	mov dh,CoordenadaX
	mov dl,CoordenadaY
	int 10h
	
	add colo,01h
	
	mov ah,06h
	mov al,00h
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
	pintado db 0h
.code

	inicio:
	mov ax,@data
	mov ds,ax
	
	CLS	
	abajo:
		add CoordenadaX,01h
		MOVER '$',pintado
		jmp imprimir	
	
	zero:
		mov pintado,0h
		jmp imprimir
	
	derecha:
		add CoordenadaY,01h
		MOVER '#',pintado
		jmp imprimir
	imprimir:
		mov ah,10h ;leer teclado extendido
		int 16h
		
		cmp pintado,09h
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
		MOVER '@',pintado
		jmp imprimir	
	izquierda:
		sub CoordenadaY,01h
		MOVER '%',pintado
		jmp imprimir
	salir:
		.exit
		
			
	end inicio
	
	
;mov ah, 02h ; funcion para imprimir un caracter
;mov dx, '$' ; mover un 64 a Dx para imprimir en pantalla
;int 21h ; ejecuta la funcion