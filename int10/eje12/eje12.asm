.model small
.stack 256h
.data
cadena db "Hola $"
.code
inicio:

mov ah, 0
mov al, 13h
int 10h

mov ah,0ch
mov al,71h
mov bh,00
mov cx,6
mov cx,9
int 10h

mov dx,offset cadena
mov ah,09h
int 21h

mov ah,01h
int 21h

end inicio

