.model small
.code
 inicio:
 mov ax,@data
 mov ds,ax
;CICLO
 ciclo: ;al hacer la comparacion y x no llegue a 10 regresa aqui
 add y,1 ;salta renglones de 2 en 2
 add x,1 ;variable x que se incrementa en 1
;LIMPIAR PANTALLA
 mov ah,06h
 mov al,0
 mov ch,0
 mov cl,0
 mov bh,0
 mov dh,24
 mov dl,80
 mov bx,0203h ;color de letras
 int 10h
;COORDENADAS PARA LETRERO
 mov ah,02h
 mov bh,0 ;inicia en pag. cero
 mov dh,y ;aparece letrero en hilera del valor de y:5
 mov dl,30 ;columna
 int 10h
;CADENA
 mov ah,09h
 mov dx,offset letrero
 int 21h
;CARACTER
 mov ah,01h
 int 21h
;COMPARACION DE VARIABLES
 cmp x,11 ;compara el valor de la variable x que inicia en cero
 ;y se incrementa hasta legar 11
 jne ciclo ;mientras no llegue a 11 retorna a ejecutar desde

 mov ax,4c00h
 int 21h
 .data
 letrero db 'DESPLAZAMIENTO VERTICAL$'
 x db 0 ;declaracion de la variable para que inicie en cero
 y db 5 ;variable y inicia en posicion 5
 .stack
end inicio
end inicio