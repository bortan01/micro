.model small
.stack
.data
.code
inicio:
Mov ax,0000h; Averigua si hay un ratón conectado
int 33h 
	Mov ax,0001h; Mostrar el cursor del ratón en la pantalla
	int 33h  
Mov ax, 4C00h 
Int 21h
end inicio

