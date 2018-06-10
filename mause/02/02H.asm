.model small
.stack
.data
.code
inicio:

;00H verifica si hay un mouse conectado
Mov ax,0000h
int 33h      

;01H muestra el cursor del mouse en la pantalla
Mov ax,0001h
int 33h

;02H Eliminar de la pantalla el cursor del mouse
Mov ax,0002h
int 33h      

Mov ax, 004ch
Int 21h
end inicio