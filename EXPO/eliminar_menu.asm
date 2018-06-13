.model small
.stack
.data 
nombre db 'c:\ejemplo.txt',0
.code
inicio:
 
mov ax,@data
mov ds,ax

eliminar:
mov ah,41h
mov dx, offset nombre
int 21h

end