
.model small
.stack
.data 

nombre db 'c:\ejemplo.txt',0 ;nombre de archivo debe terminar con 0
vec db 15 dup('$')
linea db 10,13,"$"  

.code  

inicio:
mov ax,@data
mov ds,ax

;capturamos la cadena de caracteres         
pedir:
mov ah,01h
int 21h
cmp al,0dh
je editar
jmp unir

unir: ;unimos la cadena de caracteres
mov vec[si],al
inc si
jmp pedir

editar: 
;abrir
mov ah,3dh
mov al,1h ;abrimos en modo escritura
mov dx,offset nombre
int 21h

;escribir
mov bx,ax
mov cx,si
mov dx,offset vec
mov ah,40h  ;es para imprimir un vector
int 21h            

;cerramos el archivo
mov ah,3eh
int 21h 

end       

