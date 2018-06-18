CLS MACRO

MOV AH, 06H ; DESPLAZAR LINEAS DE TEXTO HACIA ARRIBA
MOV AL,00; NUMERO DE LINEAS A DESPLAZAR
MOV BH, 00 ; FONDO BLANCO CON PRIMER PLANO AZUL
MOv CX, 0000
MOV DX, 184FH
INT 10h
ENDM

BACKGRAUND MACRO fondo,inicioY,finY,inicioX,finX

MOV AH, 06H ; DESPLAZAR LINEAS DE TEXTO HACIA ARRIBA
MOV AL,0; NUMERO DE LINEAS A DESPLAZAR
MOV BH, fondo ; FONDO BLANCO CON PRIMER PLANO AZUL

MOv CH, inicioY;LINEA DONDE COMIENZA LA VENTANA DE TEXTO
MOV DH, finY ;LINEA DONDE ACABA VENTANADE TEXTO;

MOV CL, inicioX ; COLUMNA DONDE EMPIEZA VENTANA DE TEXTO
MOV DL, finX ;COLUMNA DONDE ACABA VENTANA DE TEXTO
INT 10h



ENDM


.model small
.stack
.data

CoordenadaX db 14h
CoordenadaY db 0ch

Fondo_Azul db 16
Universidad db 13,10, "Universidad Nacional de El Salvador",13,10, "$"
Facultad db "Facultad Multidisciplinaria Paracentral", 13,10, '$'
Nombre db "Boris Ricardo Miranda Ayala", 13,10, '$'
Carnet db "MA14049", 13,10, '$'

Negro db     0
Morado db   16
Acua db     48
Marron db   64
Violeta db  80
Cafe db     96
Plateado db 112
Gris db     128
Azul  db    144
Verde db    160
Celeste db  176
Rojo db     192
Rozado db   208
Amarillo db 224
Blanco db   240



L1_inicio db 3
L1_fin db 6

L2_inicio db 8
L2_fin db 11

L3_inicio db 13
L3_fin db 16

L4_inicio db 18
L4_fin db 21

L5_inicio db 23
L5_fin db 26

C1_inicio db 3
C1_fin db 15

C2_inicio db 18
C2_fin db 30

C3_inicio db 33
C3_fin db 45

C4_inicio db 48
C4_fin db 60

C5_inicio db 63
C5_fin db 75





.code
inicio:
mov ax,@data
mov ds,ax

push ax
push bx
push cx


CLS

BACKGRAUND Negro,0,24,00,79
BACKGRAUND Azul,L1_inicio,L1_fin,C1_inicio,C1_fin
BACKGRAUND Rojo,L1_inicio,L1_fin,C2_inicio,C2_fin
BACKGRAUND Verde,L1_inicio,L1_fin,C3_inicio,C3_fin
BACKGRAUND Celeste,L1_inicio,L1_fin,C4_inicio,C4_fin
BACKGRAUND Morado,L1_inicio,L1_fin,C5_inicio,C5_fin

BACKGRAUND Gris,L2_inicio,L2_fin,C1_inicio,C1_fin
BACKGRAUND 112,L2_inicio,L2_fin,C2_inicio,C2_fin
BACKGRAUND 128,L2_inicio,L2_fin,C3_inicio,C3_fin
BACKGRAUND 144,L2_inicio,L2_fin,C4_inicio,C4_fin
BACKGRAUND 160,L2_inicio,L2_fin,C5_inicio,C5_fin

BACKGRAUND 176,L3_inicio,L3_fin,C1_inicio,C1_fin
BACKGRAUND 192,L3_inicio,L3_fin,C2_inicio,C2_fin
BACKGRAUND 208,L3_inicio,L3_fin,C3_inicio,C3_fin
BACKGRAUND 224,L3_inicio,L3_fin,C4_inicio,C4_fin
BACKGRAUND 240,L3_inicio,L3_fin,C5_inicio,C5_fin

BACKGRAUND 255,L4_inicio,L4_fin,C1_inicio,C1_fin
BACKGRAUND Morado,L4_inicio,L4_fin,C2_inicio,C2_fin
BACKGRAUND Rojo,L4_inicio,L4_fin,C3_inicio,C3_fin
BACKGRAUND Amarillo,L4_inicio,L4_fin,C4_inicio,C4_fin
BACKGRAUND Celeste,L4_inicio,L4_fin,C5_inicio,C5_fin



Mov ax,0000h; Averigua si hay un ratón conectado
int 33h  

Mov ax,0001h; Mostrar el cursor del ratón en la pantalla
int 33h  

Mov ax,0007h;Determinar zona de movimiento horizontal para el cursor
Mov cx,30h;Posicion virtual minima del cursor del raton
Mov dx,100h;;Posicion virtual maxima del cursor del raton
int 33h   

Mov ax,0008h;Determinar zona de movimiento vertical para el cursor
Mov cx,40h;Posicion virtual minima del cursor del raton
Mov dx,125h;;Posicion virtual maxima del cursor del raton
int 33h   

mov ah,08h
int 21h 


escucha:
Mov ax,0003h
int 33h


cmp bx,1h  ;click izquierdo
je pintar
cmp bx,2h  ;click derecho
je salir
jmp escucha


salir:
pop cx
pop bx
pop ax
.exit

pintar:
cmp dx,30
jl fila1
jmp escucha

fila1:
 BACKGRAUND Verde,L1_inicio,L1_fin,C1_inicio,C1_fin
jmp escucha



end inicio



