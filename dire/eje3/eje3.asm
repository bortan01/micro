;para crear archivos

.model small
.stack 100h
.data
; El Nombre est  fijo para el ejemplo
nombre db 'C:\dire\eje3\prueba.txt',0
.code
inicio:
mov     AX, @data
mov     DS, AX
mov ah, 3ch
mov al,00
mov cx,00
mov dx,offset nombre
int 21h
mov bx,ax

mov ah,3eh
int 21h

mov ax,4c00h
int 21h      
END inicio 

