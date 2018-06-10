.model small
.stack
.data
.code
inicio:
Mov ax,0000h
int 33h
Mov ax,0001h
int 33h  

Mov ax,0009h
Mov bx,500h;punto activo horizontal
Mov cx,50h;punto activo vertical
Mov es,dx;direccion del segmento donde se encuentra el buffer1
mov dx,100h ;desplazamiento dentro del segmento
int 33h

mov ah,08h
int 21h         

Mov ax, 4C00h
Int 21h
end inicio