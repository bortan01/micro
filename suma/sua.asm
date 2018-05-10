.model small
.stack 64
.data
.code
	inicio:
	;pedir primer número
	mov ah,01h
	int 21h
	sub al,30h
	mov bl,al
	
	;pedir segundo número
	mov ah,01h
	int 21h
	sub al,30h
	add al,bl
	;Ajuste ascii para la suma
	aaa 
	or  ax,3030h
	mov bx,ax
	sub bh,01h
	;impresion parte alta
	mov ah,02h
	mov dl,bh
	int 21h
	;impresion parte baja
	mov ah,02
	mov dl,bl
	int 21h
salir:
  mov ah,04ch
  int 21h
end inicio