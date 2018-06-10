.model small
.stack
.data
.code
inicio:
Mov ax,0000h; Averigua si hay un ratón conectado
int 33h  

Mov ax,0001h; Mostrar el cursor del ratón en la pantalla
int 33h  

Mov ax,0007h;Determinar zona de movimiento horizontal para el cursor
Mov cx,30h;Posicion virtual minima del cursor del raton
Mov dx,100h;;Posicion virtual maxima del cursor del raton
int 33h   

Mov ax,0008h;Determinar zona de movimiento vertical para el cursor
Mov cx,40h;Posicion virtual minima del cursor del raton
Mov dx,125h;;Posicion virtual maxima del cursor del raton
int 33h   

mov ah,08h
int 21h  

Mov ax, 4C00h
Int 21h
end inicio

