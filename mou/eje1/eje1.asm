macro gotoXY fila,col
 mov ah,02h
 mov bh,0
 mov dh,fila
 mov dl,col
 int 10h 
endm
         

; car: elijo el caracter a imprimir
;color, seleccion el color de la letra
macro imprime car,color
   mov al,car 
   mov ah,09h
   mov bh,0
   mov bl,color
   mov cx,1
   int 10h
endm          

.model small
.stack
.data 

.code 

inicio:
.startup   

gotoxy 5,5


call horizontal           
call horizontal
call horizontal
call horizontal 


call vertical
call vertical
call vertical
call vertical
 
push dx  ;guardo en una pila los valores de dh y dl (13,13)
 
call izquierdo
call izquierdo
call izquierdo
call izquierdo 


pop dx  ; recupero los valores de dx(13,13)

call derecho
call derecho
call derecho
call derecho
               
gotoxy 5,15 

call horizontal2
call horizontal2
call horizontal2
call horizontal2

gotoxy 1,13
call vertical2
call vertical2



.exit 

proc horizontal
  gotoxy dh,dl
  imprime 42,4
  add dl,2 
  ret
endp

proc horizontal2
  gotoxy dh,dl
  imprime 42,7
  add dl,2 
  ret
endp
        
proc vertical
   gotoxy dh,dl
  imprime 42,5 
  add dh,2
  ret
endp 
proc vertical2
   gotoxy dh,dl
  imprime 42,6 
  add dh,2
  ret
endp

proc izquierdo
   gotoxy dh,dl
  imprime 42,3
  sub dl,2 
  add dh,2
  ret
endp   

proc derecho
  gotoxy dh,dl
  imprime 42,2
  add dl,2 
  add dh,2
  ret
endp 

end inicio