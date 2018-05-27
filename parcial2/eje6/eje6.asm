.model small
.stack
.data

msj1 db 13,10, "Digite el texto: ",13,10,"$"
f db 4
c db 4
cadena db 100 DUP (0)

.code

inicio:

.startup

call clrscrn
mov dx, offset msj1
mov ah,09h
int 21h

mov ah,0ah
mov dx, offset cadena
mov cadena[0],80 ; tamaño maximo de caracteres
int 21h

mov bx,0
lazo:
mov al,cadena[bx+2]
call diagonal
call impresion
call vertical
call impresion
call horizontal
call impresion
inc f
inc c
inc bx
cmp bl,cadena[1];comparamos bl con el tamaño usado de la lista
jne lazo

;posicionando el cursor al final para evitar sobre escritura en la cadena
mov ah,02
mov bh,0
mov dh,24
mov dl,0
int 10h

mov ah,07h  ;parecido al system("pause") de C++
int 21h
.exit

clrscrn proc near
mov ah,06
mov bh,09 ; color azul
mov cx,0000 ; (0,0)
mov dx,184fh ; (24,79)
int 10h
ret
endp

diagonal proc near
mov ah,02
mov bh,00
mov dh,f ; fila
mov dl,c ; columna
int 10h
ret
endp

vertical proc near
mov ah,02
mov bh,00
mov dh,f ; fila
mov dl,4 ; columna
int 10h
ret
endp

horizontal proc near
mov ah,02
mov bh,00
mov dh,4 ; fila
mov dl,c ; columna
int 10h
ret
endp

impresion proc near
mov ah,0eh
mov bh,00
int 10h
ret
endp

end inicio

