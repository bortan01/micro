.model small
.stack
.data
    n db ?
    x db ?
    y db ?
    xmi db ?
    ymi db ?
    xmd db ?
    ymd db ?
    xpi db ?
    ypi db ?
    xpd db ?
    ypd db ?
    cont db ?
    cont1 db ?
    cont2 db ?
    cont3 db ?
    msg DB 13,10,"JAVIER ARMANDO OCHOA CERON","$"
    msg1 DB 13,10,"SAUL ANTONIO HERNANDEZ CUELLAR","$"
.code
.startup
mov x,5
mov y,15
mov xmi,9
mov ymi,14
mov xmd,9
mov ymd,16 
mov xpi,15
mov ypi,12
mov xpd,13
mov ypd,16

       
mov cont,1
mov cont1,1
mov cont2,1
mov cont3,1
  
mov ah,00h
mov al,03h
int 10h

mov ah,01h
int 21h

mov n,al

cabeza:
mov ah,02h
mov dh,x
mov dl,y
int 10h
cmp cont,5
ja manoizq
call imprimir

imprimir:
mov ah,02h
mov bh,00
mov dl,n
int 21h
call salto
ret

salto:
add x,02h
add cont,1
call cabeza

manoizq:
mov ah,02h
mov dh,xmi
mov dl,ymi
int 10h
cmp cont1,3
ja pieizq
call imprimirizq

imprimirizq:
mov ah,02h
mov bh,00
mov dl,n
int 21h 
sub ymi,1
add cont1,1
cmp cont1,3
je  saltoizq
call manoizq


saltoizq:
add xmi,2
call manoizq

pieizq: 
mov ah,02h
mov dh,xpi
mov dl,ypi
int 10h

mov ah,09
mov al,n
mov bh,00
mov bl,05
mov cx,0003h
int 10h
call manoder


manoder:
mov ah,02h
mov dh,xmd
mov dl,ymd
int 10h
cmp cont2,3
ja pieder
call imprimirder

imprimirder:
mov ah,02h
mov bh,00
mov dl,n
int 21h 
sub xmd,2
add ymd,1
add cont2,1
call manoder
                
pieder:
mov ah,02h
mov dh,xpd
mov dl,ypd
int 10h
cmp cont3,4
ja info 
call imprimirpder

imprimirpder:
mov ah,02h
mov bh,00
mov dl,n
int 21h
add ypd,1
add cont3,1
cmp cont3,2
ja saltopder
call pieder

saltopder: 
cmp cont3,3
je sum
call pieder

sum:
add xpd,2h
call pieder

info:
mov ah,02h
mov dh,18
mov dl,15
int 10h
MOV AH,09
MOV DX,offset MSG
INT 21H
MOV AH,09
MOV DX,offset MSG1
INT 21H
call exit

exit:
.exit
end
