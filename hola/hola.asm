pila segment para stack
db 256 dup(0)
pila ends
codigo segment para public
principal proc far
assume cs:codigo
push ds
xor ax,ax
push ax
 call limpiar
mov dl,10
 mov dh,10

 call cursor_hor
mov al,"H"
call escribe
call cursor_hor
mov al,"O"
call escribe
call cursor_hor
mov al,"L"
call escribe
call cursor_hor
mov al,"A"
call escribe
 add dh,2

 call cursor_ver
mov al,"O"
call escribe
call cursor_ver
mov al,"L"
call escribe
call cursor_ver
mov al,"A"
call escribe


mov dl,12
 mov dh,12
call cursor_diag
mov al,"O"
call escribe
call cursor_diag
mov al,"L"
call escribe
call cursor_diag
mov al,"A"
call escribe




 .exit
principal endp
;para imprimir horizontal
cursor_hor proc near
mov dh,10
mov ah,2
mov bh,0
int 10h
 add dl,2; dl es para la columna
ret
endp
cursor_ver proc near
 mov dl,10
mov ah,2
mov bh,0
int 10h
add dh,2; dh es para la fila
ret
endp
cursor_diag proc near
 mov dh,2
mov ah,0
mov bh,0
int 10h
 add dl,2; dl es para la columna
 add dh,2; dh es para la fila
ret
endp

limpiar proc near
 mov ax, 0600h ;
 mov bh,7 ; ; color (7 para b/n)
 mov cx, 0000 ; desde 0,0
 mov dx, 184fh ; hasta 24,79
 int 10h
 ret
limpiar endp
escribe proc near
mov ah,14
mov bh,0
int 10h
ret
escribe endp
codigo ends
end principal