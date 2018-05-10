.model small 
.stack 
.data ; tiene el valor de 256
var1 db ? 
var2 db ? 
msg1 db 'El Primero Es Mayor $' 
msg2 db 'El Primero Es Menor $' 
msg3 db 'Son Iguales $' 
.code 
inicio: 
MOV AX,@DATA;linea de cajon
mov ds,ax ; linea de cajon 
mov ah,07h; funciona similar a la 01h pero sin eco(no se muestra en pantalla)  funcion 07 captura dato en secreto 
int 21h 
mov ah,02h; hasta aqui se muestra en pantalla 
mov dl,al
int 21h 
mov var1,al 
mov ah,07h 
int 21h 
mov ah,02h 
mov dl,al 
int 21h 
mov var2,al 
cmp var1,al ; esto es para comparar 
ja mayor 
jb menor 
je igual 
mayor: 
mov ah,09h  ;imprimr cadena 
lea dx,msg1 
int 21h  
jmp salir 
menor: 
mov ah,09h 
lea dx,msg2; funciona igual que mov dx, offset msg2 (omite la palabra offset) 
int 21h 
jmp salir 
igual: 
mov ah,09h 
lea dx,msg3 
int 21h 
jmp salir 
salir: 
mov ax,4c00h 
int 21h 
end inicio
