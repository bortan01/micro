CAPTURAR_TECLA macro
	mov ah,00h ;leer teclado extendido
	int 16h
ENDM

MOSTRAR_MENSAJE MACRO texto
	mov ah,09h
	mov dx, offset texto
	int 21h
ENDM
GOTOXY MACRO caracter 
	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX
	
	mov bh,0
	mov ah,02h;mover el cursor a una coordenada
	mov dl,CoordenadaX
	mov dh,CoordenadaY
	add CoordenadaY,01h
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
	T1 db 13,10, "MENSAJE 1 ", 13,10, '$'
	T2 db 13,10, "MENSAJE 2 ", 13,10, '$'
	T3 db 13,10, "MENSAJE 3 ", 13,10, '$'
	T4 db 13,10, "MENSAJE 4 ", 13,10, '$'
	
	CoordenadaX db 14h
	CoordenadaY db 0ch
	
	vtext db 10 dup('$')
	aux db ?
	contador db  ?
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
			
		mov cx,si
		mov contador,cl
	
	pedir_tecla:
		CAPTURAR_TECLA  ; HACEMOS LA PETICION DE LA TECLA
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
		add CoordenadaY,01h
		GOTOXY vtext[si-1]
		dec si 
		loop arriba
		
		jmp pedir_tecla
	abajo:
		GOTOXY '2'
		jmp pedir_tecla
	derecha:
		GOTOXY '3'
		jmp pedir_tecla
	izquierda:
		GOTOXY '4'
		jmp pedir_tecla
	
	for_1 proc near
		mov cl,contador
        mov si,cx;  
		add CoordenadaY,01h
		GOTOXY vtext[1]    
		ret
	for_1 endp
		
	
end inicio