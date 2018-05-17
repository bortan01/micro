.model small
.data
.stack
.code
inicio:
mov ax,@data	; Cajon
mov ds,ax

;mov ax,0013h	; Función modo Grafico
int 10h
mov cx,00A0h	; Establecer coordenada X
mov dx,0064h	; Establecer coordenada Y
mov ah,0Ch	; Dibujar pixel
mov al,07h	; Color Blanco
int 10h


ciclo:
	mov ah,00h	; Función esperar la entrada desde el teclado forma extendida.
	int 16h

	cmp ah,1eh	; Si apreto la tecla A entonces saltar a izquierda.
		je izquierda	
	cmp ah,4bh	; Si apreto la tecla <- entonces saltar a izquierda.
		je izquierda
	cmp ah,1fh	; Si apreto la tecla S entonces saltar a abajo.
		je abajo
	cmp ah,50h	; Si apreto la tecla (abajo) entonces saltar a abajo.
		je abajo
	cmp ah,20h	; Si apreto la tecla D entonces saltar a derecha.
		je derecha
	cmp ah,4dh	; Si apreto la tecla -> entonces saltar a derecha.
		je derecha
	cmp ah,11h	; Si apreto la tecla W entonces saltar a arriba.
		je arriba
	cmp ah,48h	; Si apreto la tecla (arriba) entonces saltar a arriba.
		je arriba
	cmp ah,01h	; Si presiono la tecla Esc entonces saltar a salir.
		je salir	


	izquierda:
		cmp cx,0000h	; Si esta en el tope entonces saltar a ciclo
	
		sub cx,0001h
		mov ah,0Ch	; Dibujar pixel
		mov al,09h	; Color Azul
		int 10h
		jmp ciclo	; saltar a ciclo

	arriba:
		cmp dx,0000h	; Si esta en el tope entonces saltar a ciclo
	
		sub dx,0001h
		mov ah,0Ch	; Dibujar pixel
		mov al,04h	; Color Rojo
		int 10h
	jmp ciclo	; saltar a ciclo

	abajo:
		cmp dx,00c8h	; Si esta en el tope entonces saltar a ciclo
		
		add dx,0001h
		mov ah,0Ch	; Dibujar pixel
		mov al,0ah	; Color Verde
		int 10h
		jmp ciclo	; saltar a ciclo

	derecha:
		cmp cx,0140h	; Si esta en el tope entonces saltar a ciclo
			
		add cx,0001h
		mov ah,0Ch	; Dibujar pixel
		mov al,0eh	; Color Amarillo
		int 10h
		jmp ciclo	; saltar a ciclo
	
	salir:	
		mov ax,4c00h
		int 21h

end inicio     