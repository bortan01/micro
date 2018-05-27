;BORIS RICARDO MIRANDA AYALA MA14049 TAREA 1
PUTPIXEL macro colo
    
	push cx
    
	mov bh,0
	mov ah,0Ch	; Dibujar pixel
	mov al,colo	; Poner Color
	mov Cx,CoordenadaX
	mov Dx,CoordenadaY
	int 10h
	
	pop cx
endm

PRINTF MACRO texto
	mov ah,09h
	mov dx, offset texto
	int 21h
ENDM

ESTABLECER_GRAFICO MACRO
	mov ax,0013h	; Función modo Grafico 0E
	int 10h         ;inicializacion de modo grafico  
ENDM

LEER_EXTENDIDO MACRO
	mov ah,00h ;leer teclado extendido tambien con 10h
	int 16h
ENDM

FONDO MACRO  ;Define la paleta de colores
MOV AH,0BH ;Set colro palette (Func 0B/Int 10h)
MOV BH,0H ;
MOV BL,3;color 0-15
INT 10H ;Interrupt 10h Video functions
ENDM

.model small
.stack
.data
	CoordenadaX dw ?
	CoordenadaY dw ?
	pintado db 1h
	
	Rojo db 12 ;4   12   13
	Azul db 09
	Verde db 10
	Amarillo db 14
	
	mensaje1 db 13,10, "  USE A,S,D,W O CURSORAS PARA DIBUJAR",13,10, "$"
	mensaje_salir db "  PRECIONE ESC PARA SALIR ", 13,10, '$'
	
	longitudX dw  ?
	longitudY dw  ?
	
.code
inicio:
	mov ax,@data
	mov ds,ax
	
	ESTABLECER_GRAFICO
	PRINTF mensaje1
	PRINTF mensaje_salir
	
	
	rectangulo1:
		mov CoordenadaX , 10
		mov CoordenadaY ,5
		mov longitudX ,  300
		mov longitudY ,  180
		mov cx,longitudX 
		derecha:
			add CoordenadaX,01h
			PUTPIXEL Verde 
			loop derecha
			mov cx,longitudY 
		abajo:
			add CoordenadaY,01h
			PUTPIXEL Verde 
			loop abajo 
			mov cx,longitudX
		izquierda:
			sub CoordenadaX,01h
			PUTPIXEL Verde  
			loop izquierda
			mov cx,longitudY
		arriba:
			sub CoordenadaY,01h
			PUTPIXEL Verde
			loop arriba
			
	rectangulo2:
	
		mov longitudX,225
		mov longitudY,75
		mov CoordenadaX,50
		mov CoordenadaY,80
		mov cx,longitudX 
		
		derecha2:
			add CoordenadaX,01h
			PUTPIXEL Amarillo
			loop derecha2
			mov cx,longitudY 
		abajo2:
			add CoordenadaY,01h
			PUTPIXEL Amarillo
			loop abajo2 
			mov cx,longitudX
		izquierda2:
			sub CoordenadaX,01h
			PUTPIXEL Amarillo   
			loop izquierda2
			mov cx,longitudY
		arriba2:
			sub CoordenadaY,01h
			PUTPIXEL Amarillo
			loop arriba2

;////////uso  del mause 
		mov ax,0000h ;mostradndo mause 
		int 33h
		mov bx,0000h  
		mov ax,0001h
		int 33h

		mov ax,0007h ; para los limites de coordenada en x
		mov cx,550
		mov dx,100
		int 33h

		mov ax,0008h ; para los limites de coordenada en y
		mov cx,80
		mov dx,155
		int 33h

;//////uso del teclado
	mov CoordenadaX,55
	mov CoordenadaY,84
	
	pintar:
		LEER_EXTENDIDO ;LEEMOS LA TECLA
		;estas son para la comparacion de las cursoras
		cmp ah,48h
			je dibujar_arriba
		cmp ah,50h
			je dibujar_abajo
		cmp ah,4dh
			je dibujar_derecha
		cmp ah,4bh
			je dibujar_izquierda
		cmp ah,01h
			je salir
			ja pintar
	salir:
		.exit 
	dibujar_arriba:
		cmp CoordenadaY,81
			je pintar
		sub CoordenadaY,01h
		PUTPIXEL Amarillo
		jmp pintar	
	dibujar_abajo:
		cmp CoordenadaY,154
			je pintar
		add CoordenadaY,01h
		PUTPIXEL Azul
		jmp pintar
	dibujar_derecha:
		cmp CoordenadaX,274
			je pintar
		add CoordenadaX,01h
		PUTPIXEL Verde
		jmp pintar
	dibujar_izquierda:
		cmp CoordenadaX,51
		;	je pintar
		sub CoordenadaX,01h
		PUTPIXEL Rojo
		jmp pintar

	       
end inicio
	
