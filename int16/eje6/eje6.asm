CAPTURAR_TECLA macro
	mov ah,00h ;leer teclado extendido
	int 16h
ENDM

MOSTRAR_MENSAJE MACRO texto
	mov ah,09h
	mov dx, offset texto
	int 21h
ENDM  



GOTOXY MACRO caracter,colo
    PUSH AX
	pUSH BX
	PUSH CX
	PUSH DX   
	
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
	

	POP DX
	POP CX
	POP BX	
	POP AX

ENDM

.model small
.stack
.data
	mensaje1 db 13,10, "Escriba la cadena ",13,10, "$"
	mensaje_salir db 13,10, "Precione esc para salir ", 13,10, '$'

	CoordenadaX db 14h
	CoordenadaY db 0ch
	vtext db 10 dup('$')
	aux db ?
	contador dw  ?
	
	Rojo db 12 ;4   12   13
	Azul db 09
	Verde db 10
	Amarillo db 14

.code
inicio:
	mov ax,@data
	mov ds,ax
            
     
         
	MOSTRAR_MENSAJE mensaje1

	capturar_cadena: ;aca comienzo a pedir letra x letra de la cadena
		mov ax,0000
		mov ah,01h
		int 21h
		;Guardamos el valor tecleado por el usuario en la posicion si del vector.
		mov vtext[si],al
		inc si   ;Incrementamos nuestro contador
		cmp al,0dh  ;Se repite el ingreso de datos hasta que se teclee un Enter.
		ja capturar_cadena
        
        DEC SI; papra borrar el caracter del enter
        
	
		mov contador,si

	pedir_tecla:
		CAPTURAR_TECLA  ; HACEMOS LA PETICION DE LA TECLA

		mov CoordenadaX,14h
		mov CoordenadaY,0ch


		mov cl,contador
		mov si,cx;

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
	arriba:
	  GOTOXY vtext[si-1],Azul
		dec si        
		sub CoordenadaY,01h
		loop arriba
		jmp pedir_tecla
	abajo:
	 	GOTOXY vtext[si-1],Amarillo
		dec si   
		add CoordenadaY,01h
		loop abajo
		jmp pedir_tecla
		
	izquierda:          
	   	GOTOXY vtext[si-1],Rojo
		dec si 
		sub CoordenadaX,01h
		loop izquierda
		jmp pedir_tecla  	
	derecha:
	   	GOTOXY vtext[si-1],Verde
		dec si      
		add CoordenadaX,01h
		;MOV CoordenadaY, 13
		loop derecha
	 	jmp pedir_tecla	
	
	
end inicio

