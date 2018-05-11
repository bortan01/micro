CAPTURAR_TECLA macro
	mov ah,00h ;leer teclado extendido
	int 16h
ENDM

MOSTRAR_MENSAJE MACRO texto
	mov ah,09h
	mov dx, offset texto
	int 21h
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
		MOSTRAR_MENSAJE T1
		jmp pedir_tecla
	abajo:
		MOSTRAR_MENSAJE T2
		jmp pedir_tecla
	derecha:
		MOSTRAR_MENSAJE T3
		jmp pedir_tecla
	izquierda:
		MOSTRAR_MENSAJE T4
		jmp pedir_tecla
	salir:
		.exit
	
end inicio