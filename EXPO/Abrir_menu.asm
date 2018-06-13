.model small
.stack
.data
    nombre db 'C:\dire\eje5\prueba.txt',0
    cadena db '            ',"$"
    
.code
.startup
mov ax,@data
mov ds,ax

;abrimos el fichero
mov ah,3dh
mov al,00h ; establecemos el modo lectura 
mov dx,offset nombre
int 21h

mov bx,ax  ;handle

;leemos el fichero
mov ah,3fh
mov cx,12 ;tamaño de la cadena
mov dx,offset cadena
int 21h 

;mostramos la cadena
mov ah,09h
int 21h

;cerramos el fichero
mov ah,3eh
int 21h

end