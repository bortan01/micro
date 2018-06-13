imprime macro cadena
    mov ax,@data
    mov ds,ax
    mov ah,09h
    mov dx,offset cadena
    int 21h
endm

.model small
.stack
.data 

msj1 db 0ah,0dh, '******** Menu ********','$'
msj2 db 0ah,0dh, ' 1.- Crear Archivo','$'
msj3 db 0ah,0dh, ' 2.- Abrir Archivo','$'
msj4 db 0ah,0dh, ' 3.- Modificar Archivo','$'
msj5 db 0ah,0dh, ' 4.- Eliminar Archivo','$'
msj6 db 0ah,0dh, ' 5.- Salir','$' 
opc db "Opcion: ","$"
cadena db 'Cadena a escribir ','$'
nombre db 'c:\expo\ejemplo.txt',0 ;nombre de archivo debe terminar con 0
vec db 50 dup('$')
mole db 50 dup('$')
handle db 0
linea db 10,13,'$'  

.code  

inicio:
menu:
imprime msj1
imprime msj2
imprime msj3
imprime msj4
imprime msj5
imprime msj6
imprime linea
imprime opc 

mov ah,0dh
int 21h
;se compara la opcion que elijio
mov ah,01h
int 21h
cmp al,31h
je crear
cmp al,32h
je abrir
cmp al,33h
je pedir
cmp al,34h
je eliminar
cmp al,35h
je salir
         
crear:
mov     AX, @data
mov     DS, AX
;crear
mov ah,3ch
mov cx,0
mov dx,offset nombre
int 21h
jc salir ;sino se pudo crear 

mov bx,ax
mov ah,3eh; se cierra el archivo
int 21h
jmp menu

abrir:
mov ah,3dh
mov al,0h; 0h es solo lectura, 1h solo escritura y 2h ambas
mov dx,offset nombre
int 21h
mov ah,42h
mov al,00h
mov bx,ax
mov cx,50
int 21h
;leer el archivo
mov ah,3fh
mov bx,ax 
mov cx,10
mov dx,offset vec
int 21h
mov ah,09h
int 21h

;cerrar archivo
mov ah,3eh
int 21h
jmp menu

pedir:
mov ah,01h
int 21h
mov vec[si],al
inc si
cmp al,0dh
ja pedir
jb pedir

editar: 
;abrir
mov ah,3dh
mov al,1h
mov dx,offset nombre
int 21h; si hubo error
;escribir
mov bx,ax
mov cx,si
mov dx,offset vec
mov ah,40h  ;es para imprimir un vector
int 21h           

mov ah,3eh
int 21h
jmp menu

eliminar: 
mov ah,41h
mov dx,offset nombre
int 21h 
jmp salir

salir:
mov ah,04ch 
int 21h
end       

