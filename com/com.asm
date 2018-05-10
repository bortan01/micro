;programa mayus.asm
PROG SEGMENT PARA PUBLIC 'CODE'
 ASSUME cs:PROG,ss:PROG,ds:PROG
 ORG 0100h
programa:
imprime proc near
 mov dl,"A"
 mov cx,25
lazo:
 call escribe_char
 inc dl
 loop lazo
 mov ah,0ach
 int 21h
imprime endp
escribe_char proc near
 mov ah,02;
 int 21h
 ret
escribe_char endp
PROG ENDS
end programa