.model small
.stack
.data
nombre db 'c:\ejemplo.txt',0
.code
inicio: 
mov ax,@data
mov ds,ax

crear:
mov ax,@data
mov ds,ax

;crear
mov ah,3ch
mov cx,0 ;establecemos el modo normal del fichero
mov dx,offset nombre
int 21h          

mov bx,ax ;handle 

mov ah,3eh ;cierra el archivo
int 21h 

.exit

end