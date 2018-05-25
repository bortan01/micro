pixel macro x, y, co
mov ah,0ch
mov al,co
mov bh,00
mov cx,x
mov dx,y
int 10h
endm
.model small
.stack
.data
x1 dw 100
y1 dw 100
x2 dw 05
y2 dw 05
titulo db 10,"                PARCIAL 2 - PRACTICO $",13,10
n1     db 10,10,"      Nombres: Kelvin Adonay Flores Mejia$",13,10
n2     db 10,10,"               Alejandro Antonio Henriquez Merino$",13,10
.code
inicio:
.startup

mov ah,00h
mov al,0eh
int 10h
margen:

mov ah,09
mov dx,offset titulo
int 21h
mov ah,09
mov dx,offset n1
int 21h
mov ah,09
mov dx,offset n2
int 21h

mlinea1:
pixel x2,y2,12
inc x2
cmp x2,637
jne mlinea1

mlinea2:
pixel x2,y2,12
inc y2
cmp y2,195
jne mlinea2

mlinea3:
pixel x2,y2,12
dec x2
cmp x2,5
jne mlinea3

mlinea4:
pixel x2,y2,12
dec y2
cmp y2,5
jne mlinea4



culebrita:
linea1:
pixel x1,y1,10
inc x1
cmp x1,500
jne linea1

linea2:
pixel x1,y1,10
inc y1
cmp y1,180
jne linea2

linea3:
pixel x1,y1,10
dec x1
cmp x1,100
jne linea3

linea4:
pixel x1,y1,10
dec y1
cmp y1,100
jne linea4

mov ax,0000h
int 33h
mov bx,0000h
mov ax,0001h
int 33h

mov ax,0007h
mov cx,100
mov dx,500
int 33h

mov ax,0008h
mov cx,100
mov dx,180
int 33h

mov cx,300
mov dx,140


proc leer near

mov ah,00h
int 16h

cmp ax,4d00h
je derecha

cmp ax,5000h
je abajo

cmp ax,4B00h
je izquierda

cmp ax,4800h
je arriba

cmp ax,13h
.exit
endp

proc arriba near
cmp dx,101
je leer
mov ah,0ch
mov al,09
mov bh,00
dec dx
int 10h
mov ah,00h
int 16h
cmp ax,4800h
je arriba
call leer
endp

proc derecha near
cmp cx,499
je leer
mov ah,0ch
mov al,04
mov bh,00
inc cx
int 10h
mov ah,00h
int 16h
cmp ax,4d00h
je derecha
call leer
endp

proc izquierda near
cmp cx,101
je leer
mov ah,0ch
mov al,14
mov bh,00
dec cx
int 10h
mov ah,00h
int 16h
cmp ax,4B00h
je izquierda
call leer
endp

proc abajo near
cmp dx,179
je leer
mov ah,0ch
mov al,05
mov bh,00
inc dx
int 10h
mov ah,00h
int 16h
cmp ax,5000h
je abajo
call leer
endp
salir:
.exit



end inicio
.exit

