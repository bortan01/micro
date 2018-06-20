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
BACKGRAUND Acua,L1_inicio,L1_fin,C1_inicio,C1_fin
BACKGRAUND Rojo,L1_inicio,L1_fin,C2_inicio,C2_fin
BACKGRAUND Verde,L1_inicio,L1_fin,C3_inicio,C3_fin
BACKGRAUND Celeste,L1_inicio,L1_fin,C4_inicio,C4_fin
BACKGRAUND Morado,L1_inicio,L1_fin,C5_inicio,C5_fin

BACKGRAUND Celeste,L2_inicio,L2_fin,C1_inicio,C1_fin
BACKGRAUND Acua,L2_inicio,L2_fin,C2_inicio,C2_fin
BACKGRAUND Celeste,L2_inicio,L2_fin,C3_inicio,C3_fin
BACKGRAUND Morado,L2_inicio,L2_fin,C4_inicio,C4_fin
BACKGRAUND Rozado,L2_inicio,L2_fin,C5_inicio,C5_fin

BACKGRAUND Violeta,L3_inicio,L3_fin,C1_inicio,C1_fin
BACKGRAUND Blanco,L3_inicio,L3_fin,C2_inicio,C2_fin
BACKGRAUND Cafe,L3_inicio,L3_fin,C3_inicio,C3_fin
BACKGRAUND Marron,L3_inicio,L3_fin,C4_inicio,C4_fin
BACKGRAUND Violeta,L3_inicio,L3_fin,C5_inicio,C5_fin

BACKGRAUND Blanco,L4_inicio,L4_fin,C1_inicio,C1_fin
BACKGRAUND Morado,L4_inicio,L4_fin,C2_inicio,C2_fin
BACKGRAUND Rojo,L4_inicio,L4_fin,C3_inicio,C3_fin
BACKGRAUND Amarillo,L4_inicio,L4_fin,C4_inicio,C4_fin
BACKGRAUND Celeste,L4_inicio,L4_fin,C5_inicio,C5_fin


Mov ax,0000h; Averigua si hay un ratón conectado
int 33h  

Mov ax,0001h; Mostrar el cursor del ratón en la pantalla
int 33h  

escucha:
Mov ax,0003h
MOV BH,00
MOV DX,00H
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
cmp dx,24
jg fila1
jmp escucha

fila1:
    cmp dx,64
    jg saltoA      
        cmp dx,23
        jg f1c1
        jmp escucha
        
        f1c1:
            cmp cx,145
            jg f1c2
            BACKGRAUND 16,L1_inicio,L1_fin,C1_inicio,C1_fin
            jmp escucha
        
        f1c2:
            cmp cx,264
            jg f1c3
            BACKGRAUND 16,L1_inicio,L1_fin,C2_inicio,C2_fin
            jmp escucha   
        saltoA: 
            jmp fila2
        
        f1c3:
            cmp cx,348
            jg f1c4
            BACKGRAUND 16,L1_inicio,L1_fin,C3_inicio,C3_fin
            jmp escucha
        
        f1c4:
            cmp cx,504
            jg f1c5
            BACKGRAUND 16,L1_inicio,L1_fin,C4_inicio,C4_fin
            jmp escucha  
        f1c5:
            cmp cx,609
            jg escucha1
            BACKGRAUND 16,L1_inicio,L1_fin,C5_inicio,C5_fin
            jmp escucha
        escucha1:
            jmp escucha
   
   

fila2:
    cmp dx,104
    jg saltoB
        cmp dx,23
        jg f2c1
        jmp escucha
        
        f2c1:
            cmp cx,145
            jg f2c2
            BACKGRAUND 16,L2_inicio,L2_fin,C1_inicio,C1_fin
            jmp escucha
        
        f2c2:
            cmp cx,264
            jg f2c3
            BACKGRAUND 16,L2_inicio,L2_fin,C2_inicio,C2_fin
            jmp escucha   
        saltoB: 
            jmp fila3
        
        f2c3:
            cmp cx,348
            jg f2c4
            BACKGRAUND 16,L2_inicio,L2_fin,C3_inicio,C3_fin
            jmp escucha
        
        f2c4:
            cmp cx,504
            jg f2c5
            BACKGRAUND 16,L2_inicio,L2_fin,C4_inicio,C4_fin
            jmp escucha  
        f2c5:
            cmp cx,609
            jg escha2
            BACKGRAUND 16,L2_inicio,L2_fin,C5_inicio,C5_fin
            jmp escucha
        escha2:
            jmp escucha

fila3:
    cmp dx,144
    jg saltoC
        cmp dx,23
        jg f3c1
        jmp escucha
        
        f3c1:
            cmp cx,145
            jg f3c2
            BACKGRAUND 16,L3_inicio,L3_fin,C1_inicio,C1_fin
            jmp escucha
        
        f3c2:
            cmp cx,264
            jg f3c3
            BACKGRAUND 16,L3_inicio,L3_fin,C2_inicio,C2_fin
            jmp escucha    
        saltoC:
            jmp fila4
        
        f3c3:
            cmp cx,348
            jg f3c4
            BACKGRAUND 16,L3_inicio,L3_fin,C3_inicio,C3_fin
            jmp escucha
        
        f3c4:
            cmp cx,504
            jg f3c5
            BACKGRAUND 16,L3_inicio,L3_fin,C4_inicio,C4_fin
            jmp escucha  
        f3c5:
            cmp cx,609
            jg escucha3
            BACKGRAUND 16,L3_inicio,L3_fin,C5_inicio,C5_fin
            jmp escucha  
        escucha3:
            jmp escucha

fila4:
    cmp dx,176
    jg saltoD
        cmp dx,23
        jg f4c1
        jmp escucha
        
        f4c1:
            cmp cx,145
            jg f4c2
            BACKGRAUND 16,L4_inicio,L4_fin,C1_inicio,C1_fin
            jmp escucha
        
        f4c2:
            cmp cx,264
            jg f4c3
            BACKGRAUND 16,L4_inicio,L4_fin,C2_inicio,C2_fin
            jmp escucha
        saltoD:
            jmp escucha
        
        f4c3:
            cmp cx,348
            jg f4c4
            BACKGRAUND 16,L4_inicio,L4_fin,C3_inicio,C3_fin
            jmp escucha
        
        f4c4:
            cmp cx,504
            jg f4c5
            BACKGRAUND 16,L4_inicio,L4_fin,C4_inicio,C4_fin
            jmp escucha  
        f4c5:
            cmp cx,609
            jg escucha4
            BACKGRAUND 16,L4_inicio,L4_fin,C5_inicio,C5_fin
            jmp escucha
        escucha4:
            jmp escucha





end inicio



