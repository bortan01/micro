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
	;add CoordenadaY,01h
	int 10h
     ;KITE ESTO
	;imprimiendo caracter
	;mov ah,02h
	;mov dl,caracter
	;int 21h
     ;FIN DE LOQ KITE
     ;LO KITE PARA QUE SOLO LO POSICIONE EL CARACTER
     ;Y CON LOQ AGREGUE LO IMPRIMA Y LE DE COLOR
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
		sub CoordenadaY,01h
		GOTOXY vtext[si-1] 
		;ESTO AGREGUE
mov al,vtext[si-1];MUEVO EL CARACTER A IMPRIMIR
mov ah,14
mov bh,0
mov ah,09h
mov al,al
mov bh,0
mov bl,2h;COLOR
mov aux,cl;guardo lo de cl en aux para mantener la cantidad de letras que son
;mov dh,cl
mov cx,1; cx en 1 para imprimir con color el primer caracter
mov cx,cx
int 10h
mov cl,aux;reestablezco el contador para seguir ejecutando
;mov dh,aux 
 ;FIN DE LOQ AGREGUE
		dec si
		loop arriba
		
		jmp pedir_tecla
	abajo:
		add CoordenadaY,01h
		GOTOXY vtext[si-1]
		;ESTO LE AGREGUE 
mov al,vtext[si-1]
mov ah,14
mov bh,0
mov ah,09h
mov al,al
mov bh,0
mov bl,1h
mov aux,cl;guardo lo de cl en aux para mantener la cantidad de letras que son
;mov dh,cl
mov cx,1; cx en 1 para imprimir con color el primer caracter
mov cx,cx
int 10h
mov cl,aux;reestablezco el contador para seguir ejecutando
;mov dh,aux 
;--FIN DE LOQ AGREGUE
		dec si
		loop abajo
		
		jmp pedir_tecla
		
	derecha:
		sub CoordenadaX,01h
		GOTOXY vtext[si-1]
          ;ESTO AGREGUE
mov al,vtext[si-1];MUEVO EL CARACTER A IMPRIMIR
mov ah,14
mov bh,0
mov ah,09h
mov al,al
mov bh,0
mov bl,5h;COLOR
mov aux,cl;guardo lo de cl en aux para mantener la cantidad de letras que son
;mov dh,cl
mov cx,1; cx en 1 para imprimir con color el primer caracter
mov cx,cx
int 10h
mov cl,aux;reestablezco el contador para seguir ejecutando
;mov dh,aux 
 ;FIN DE LOQ AGREGUE
		dec si
		loop derecha
	
		jmp pedir_tecla
	izquierda:
		add CoordenadaX,01h
		GOTOXY vtext[si-1]
		 ;ESTO AGREGUE
mov al,vtext[si-1];MUEVO EL CARACTER A IMPRIMIR
mov ah,14
mov bh,0
mov ah,09h
mov al,al
mov bh,0
mov bl,4h;COLOR
mov aux,cl;guardo lo de cl en aux para mantener la cantidad de letras que son
;mov dh,cl
mov cx,1; cx en 1 para imprimir con color el primer caracter
mov cx,cx
int 10h
mov cl,aux;reestablezco el contador para seguir ejecutando
;mov dh,aux 
 ;FIN DE LOQ AGREGUE

		dec si
		loop izquierda
		
		jmp pedir_tecla
end inicio

