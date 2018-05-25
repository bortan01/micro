;BORIS RICARDO MIRANDA AYALA MA14049 TAREA 3

CLS macro;limpiar pantlla
	mov ax,0013h	; Función modo Grafico
	int 10h  
endm

CAPTURAR_TECLA macro
	mov ah,00h ;leer teclado extendido
	int 16h
ENDM

PRINTF MACRO texto
	mov ah,09h
	mov dx, offset texto
	int 21h
ENDM  


GOTOXY MACRO caracter,colo
    
	PUSH CX
	
	
	mov bh,0
	mov ah,02h;mover el cursor a una coordenada
	mov dl,CoordenadaX
	mov dh,CoordenadaY
	int 10h
                                                      	
	mov cx,1
	mov ah,9h ;escribir atributo o cuaracter en el cursor
	mov al,caracter;codigo assci de la arroba
	mov bh,0h;pagina de video		
	mov bl,colo; color
	int 10h;llamar a la vios
	


	POP CX


ENDM

.model small
.stack
.data
	mensaje1 db 13,10, "Use F1,F2,F3,F4 PARA DIBUJAR",13,10, "$"
	mensaje_salir db "PRECIONE ESC PARA SALIR ", 13,10, '$'

	CoordenadaX db 14h
	CoordenadaY db 0ch
		
	Rojo db 12 ;4   12   13
	Azul db 09
	Verde db 10
	Amarillo db 14
	Blanco db 15
	
	
.code
inicio:
	mov ax,@data
	mov ds,ax
            
    CLS 
         
	PRINTF mensaje1
	PRINTF mensaje_salir

	pedir_tecla:
		CAPTURAR_TECLA  ; HACEMOS LA PETICION DE LA TECLA
		
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
		GOTOXY '*',Rojo
		add CoordenadaY,01
		loop dibujar_cabeza
		jmp pedir_tecla
	dibujar_cuerpo:
	    GOTOXY '*',Amarillo
		add CoordenadaY,01
		loop dibujar_cuerpo
		jmp pedir_tecla
	dibujar_brazo:
	    GOTOXY '*',Verde
		add CoordenadaX,02
		add CoordenadaY,01
		loop dibujar_brazo
		
		mov cx,3
		mov CoordenadaX,14h
		mov CoordenadaY,10h
		jmp dibujar_brazo2
	dibujar_pierna:
	    GOTOXY '*',Azul
		add CoordenadaX,01
		add CoordenadaY,01
		loop dibujar_pierna
		
		mov cx,4
		mov CoordenadaX,14h
		mov CoordenadaY,14h
		jmp dibujar_pierna2
	dibujar_pierna2:
		GOTOXY '*',Azul
		sub CoordenadaX,01
		add CoordenadaY,01
		loop dibujar_pierna2
		jmp pedir_tecla
	dibujar_brazo2:
		GOTOXY '*',Verde
		sub CoordenadaX,02
		add CoordenadaY,01
		loop dibujar_brazo2
		jmp pedir_tecla
		
	 	
end inicio

