.model small
.stack
.data
.code
inicio:
Mov ax,0000h
int 33h
Mov ax,0001h
int 33h
Mov ax,0003h
int 33h

mov ah,08h
int 21h 

Mov ax,0004h;coloca el cursor del mouse en una posicion determinada
Mov cx,0050h;Posicion horizontal virtual del cursor del mouse
Mov dx,0050h;Posicion vertical virtual del cursor del mouse
int 33h   


Mov ax, 4C00h
Int 21h  

end inicio