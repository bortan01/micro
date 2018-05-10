.model small
.stack
.data
.code
inicio:
	mov ax,@data
	mov ds,ax
	
	call limpiar
	mov dx,0000
	call cursor
	mov al,"H"
	call escribe
	call cursor
	mov al,"O"
	call escribe
	call cursor
	mov al,"L"
	call escribe
	call cursor
	mov al,"A"
	call escribe
	.exit

	cursor proc near
     	mov ah,2 ;instruccion para imprimir caracter en posicion
		mov bh,0 ;numero de pagina 
		int 10h
		add dh,2; dh para la fila
		add dl,2; dl es para la columna
		ret
	endp

	limpiar proc near
       mov ah, 06h;funcion para desplazar lineas
	   mov al,09h ;lineas a desplazar 
       mov bh,7 ;              ; color (7 para b/n)
       mov cx, 0000h             ; desde 0,0
       mov dx, 2479            ; hasta 24,79
       int 10h
       ret
	limpiar endp

	escribe proc near
		mov ah,14 ;e en hexadecimal
		;mov bh,3 ; color  a usar
		int 10h
		ret
	escribe endp
end inicio
