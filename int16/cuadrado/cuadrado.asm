;BORIS RICARDO MIRANDA AYALA MA14049 TAREA 1

MOVER macro colo
    
    push cx
    
	mov bh,0
	mov ah,02h;mover el cursor a una coordenada
	mov Dx,CoordenadaX
	mov Cx,CoordenadaY
	int 10h
	
	mov ah,0Ch	; Dibujar pixel
	mov al,colo	; Color Verde
	int 10h
	
	pop cx
	
	
endm

PRINTF MACRO texto
	mov ah,09h
	mov dx, offset texto
	int 21h
ENDM

.model small
.stack
.data
	CoordenadaX dw 25
	CoordenadaY dw 10
	pintado db 1h
	
	Rojo db 12 ;4   12   13
	Azul db 09
	Verde db 10
	Amarillo db 14
	
	mensaje1 db 13,10, "USE A,S,D,W O CURSORAS PARA DIBUJAR",13,10, "$"
	mensaje_salir db "PRECIONE ESC PARA SALIR ", 13,10, '$'
.code
	inicio:
	mov ax,@data
	mov ds,ax
	
	mov ax,0013h	; Función modo Grafico
	int 10h         ;inicializacion de modo grafico  
	
	PRINTF mensaje1
	PRINTF mensaje_salir
	mov cx,300 
	
	derecha:
	  
		add CoordenadaY,01h
		MOVER Verde 
		loop derecha
		mov cx,150 
	abajo:
		add CoordenadaX,01h
		MOVER Azul 
		loop abajo 
		mov cx,300
	izquierda:
		sub CoordenadaY,01h
		MOVER Rojo   
		loop izquierda
		mov cx,150
	
	arriba:
		sub CoordenadaX,01h
		MOVER Amarillo
		loop arriba
		mov cx,150		
	
	
	
	salir:
		.exit        
		
		
	dimensionX:
     mov cx,150   
     ret
    END
	
	
	
	end inicio
	
