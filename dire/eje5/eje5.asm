; para mostrar contenido de un archivo 
.model small
.stack 100h
.data
	; El Nombre est  fijo para el ejemplo
	nombre db 'C:\dire\eje5\prueba.txt',0
	imp db 100 dup('$')
	vec db 1000 dup('$') ; cantidad de espacio reservada 
	longitud dw 5000 ; cantidad de letras a mostrar
.code
inicio:
mov     AX, @data 
mov     DS, AX

abrir:
	mov ah,3dh
	mov al,00h
	mov dx, offset nombre
	int 21h

	mov bx,ax

	;leer archivo
	mov ah,3fh
	mov cx,longitud
	mov dx,offset vec
	int 21h
	mov ah,09h
	int 21h

	mov ah, 3eh
	int 21h


mov ax,4c00h
int 21h
END inicio





k 