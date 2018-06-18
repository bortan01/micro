.model small
.stack 100h
.data
	Raiz equ 'C:'
	;Ruta db 'C:\dire\eje6\prueba',0; El Nombre est  fijo para el ejemplo
	Nombre db 'C:\dire\eje7\prueba.txt',0
	Imp db 100 dup('$')
	Vec db 1000 dup('$') ; cantidad de espacio reservada 
	Longitud dw 5000 ; cantidad de letras a mostrar

.code
inicio:
	mov     AX, @data
	mov     DS, AX

   
    
	mov AH , 43H
    mov AL , 01h
    mov CX , 02h   
    mov dx, offset Nombre
    int 21h
	
	
	Mov ax,4c00h
	int 21h      
END inicio 


