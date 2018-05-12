CAPTURAR_TECLA macro
	mov ah,00h ;leer teclado extendido
	int 16h
ENDM

MOSTRAR_MENSAJE MACRO texto
	mov ah,09h
	mov dx, offset texto
	int 21h
ENDM  

ASIGNAR_COLOR MACRO pintura
   
   push ax
   push bx
   push cx
   push dx
   
    mov ah,06h
	mov al,00h
	mov bh,pintura
	mov cx,0000h
	mov dx,184fh
	int 10h  
	
	pop dx
	pop cx
	pop bx
	pop ax
	
ENDM

GOTOXY MACRO caracter
PUSH AX
PUSH BX
PUSH CX
PUSH DX
    PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX   
	
	mov bh,0
	mov ah,02h;mover el cursor a una coordenada
	mov dl,CoordenadaX
	mov dh,CoordenadaY
	;add CoordenadaY,01h
	int 10h

	
	
	;imprimiendo caracter
	mov ah,02h
	mov dl,caracter
	int 21h

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
	contador db  ?
.code
inicio:
	mov ax,@data
	mov ds,ax
            
    ASIGNAR_COLOR 02h      
            
         
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

		mov cx,si
		mov contador,cl

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
	    ASIGNAR_COLOR 03h
		sub CoordenadaY,01h
		GOTOXY vtext[si-1]
		dec si
		loop arriba
		
		jmp pedir_tecla
	abajo:
	    ASIGNAR_COLOR 04h
		add CoordenadaY,01h
		GOTOXY vtext[si-1]
		dec si
		loop abajo
		
		jmp pedir_tecla
	derecha:
	    ASIGNAR_COLOR 05h
		sub CoordenadaX,01h
		GOTOXY vtext[si-1]
		dec si
		loop derecha
	
		jmp pedir_tecla
	izquierda:          
	    ASIGNAR_COLOR 06h
		add CoordenadaX,01h
		GOTOXY vtext[si-1]
		dec si
		loop izquierda
		
		jmp pedir_tecla
end inicio

