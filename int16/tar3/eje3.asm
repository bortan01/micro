mostrar MACRO texto
	mov ah,09h
	mov dx, offset texto
	int 21h
ENDM  
leer macro
	mov ah,00h ;leer teclado extendido
	int 16h
ENDM

GOTOXY MACRO caracter,colo
    
	PUSH CX
	mov bh,0
	mov ah,02h;
	mov dl,CoordenadaX
	mov dh,CoordenadaY
	int 10h                                                      	
	mov cx,1
	mov ah,9h 
	mov al,caracter
	mov bh,0h	
	mov bl,colo
	int 10h
	POP CX


ENDM

.model small
.stack
.data

	CoordenadaX db 14h
	CoordenadaY db 0ch
		

.code
inicio:
	mov ax,@data
	mov ds,ax
            
   

	pedir_tecla:
		leer  
		
       	cmp ah,59
			je cabeza
		cmp ah,60
			je cuerpo
		cmp ah,61
			je brazo
		cmp ah,62
			je pierna 
		cmp ah,01h
			je salir
			ja pedir_tecla
	
	salir:
		.exit
	cabeza:
		mov cx,3
		mov CoordenadaX,14h
		mov CoordenadaY,0ch
		jmp dibujar_cabeza
	cuerpo:
	    mov cx,5
		mov CoordenadaX,14h
		mov CoordenadaY,0Fh
		jmp dibujar_cuerpo
    pierna:
	    mov cx,4
		mov CoordenadaX,14h
		mov CoordenadaY,14h
		jmp dibujar_pierna      
	brazo:
		mov cx,3
		mov CoordenadaX,14h
		mov CoordenadaY,10h
		jmp dibujar_brazo
	
	dibujar_cabeza:
		GOTOXY '*',12
		add CoordenadaY,01
		loop dibujar_cabeza
		jmp pedir_tecla
	dibujar_cuerpo:
	    GOTOXY '*',14
		add CoordenadaY,01
		loop dibujar_cuerpo
		jmp pedir_tecla
	dibujar_brazo:
	    GOTOXY '*',10
		add CoordenadaX,02
		add CoordenadaY,01
		loop dibujar_brazo
		
		mov cx,3
		mov CoordenadaX,14h
		mov CoordenadaY,10h
		jmp dibujar_brazo2
	dibujar_pierna:
	    GOTOXY '*',09
		add CoordenadaX,01
		add CoordenadaY,01
		loop dibujar_pierna
		
		mov cx,4
		mov CoordenadaX,14h
		mov CoordenadaY,14h
		jmp dibujar_pierna2
	dibujar_pierna2:
		GOTOXY '*',09
		sub CoordenadaX,01
		add CoordenadaY,01
		loop dibujar_pierna2
		jmp pedir_tecla
	dibujar_brazo2:
		GOTOXY '*',10
		sub CoordenadaX,02
		add CoordenadaY,01
		loop dibujar_brazo2
		jmp pedir_tecla
		
	 	
end inicio

