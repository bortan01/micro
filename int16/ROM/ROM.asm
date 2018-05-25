limpiar macro;limpiar pantlla
mov bh,17h
mov ah,06h
mov al,00h
mov cx,0000h
mov dx,184fh
int 10h
endm   

marriva macro ;para subir
mov cx,auxCX
mov dx,auxDX

sub dx,1 


mov dh,00  
mov al,05h 
mov ah,0ch
mov bh,0
 

int 10h 
mov auxCX, cx
mov auxDX, dx 
endm

mabajo macro ;para bajar
mov cx,auxCX
mov dx,auxDX

add dx,1 


mov dh,00  
mov al,02h 
mov ah,0ch
mov bh,0
 

int 10h 
mov auxCX, cx
mov auxDX, dx
endm

mder macro ;para derecha 
mov cx,auxCX
mov dx,auxDX

add cx,1 


mov dh,00  
mov al,03h 
mov ah,0ch
mov bh,0
 

int 10h 
mov auxCX, cx
mov auxDX, dx
endm

mizq macro ;para izquierda
mov cx,auxCX
mov dx,auxDX

sub cx,1 


mov dh,00  
mov al,04h 
mov ah,0ch
mov bh,0
 

int 10h 
mov auxCX, cx
mov auxDX, dx
endm

colores macro 

;xcambia el color de ijmprecion

mov ax,0012h
mov bh,04
mov cx,0000h
mov dx,184fh
int 10h 

endm

.model small
.stack
.data
d1 db 9
d2 db 20 
var1 db ? 
auxCX dw ?
auxDX dw ?
.code
inicio:
mov ax,@data
mov ds,ax

limpiar

colores 
;mostrar
mov auxCX,0050
mov auxDX,0050
mov var1, 4dh

imprimir:
 mov ah,1 
int 16h
 jz imprimir2
 
mov ah, 00h
int 16h

jmp cambio
;mov var1,ah 


imprimir2:
cmp var1,48h
je arriva
cmp var1,4dh
je der
cmp var1,50h
je aba
cmp var1,4bh
je izq
cmp var1,01h
je salir

loop imprimir 

cambio:
cmp al,77h
je arriva
cmp al,64h
je der
cmp al,73h
je aba
cmp al,61h
je izq
 
cmp ah,48h
je arriva
cmp ah,4dh
je der
cmp ah,50h
je aba
cmp ah,4bh
je izq

cmp ah,01h
je salir

jmp imprimir2

arriva: 
mov var1,48h
marriva
jmp imprimir

der:
mov var1,4dh
mder
jmp imprimir

aba:
mov var1,50h
mabajo
jmp imprimir

izq:
mov var1,4bh
mizq
jmp imprimir

salir:
mov ax,4c00h
int 21h                        


end inicio
