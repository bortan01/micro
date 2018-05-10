.MODEL SMALL ; Define el modelo de memoria 
.stack
.DATA  
.CODE ;Define el area de codigo 
inicio: 
Mov AX, @Data ;Obtiene la direccion del segmento de datos 
Mov Ds, Ax ;Inicializa a DS con esa direccion 

;pedimos el numero
mov ah,01h
int 21h

;guardamos el numero en bl
sub al,30h
mov bl,al

;pedimos el segundo numero
mov ah,01h
int 21h

;guardamos el numero en bh
sub al,30h
mov bh,al

;empezamos operacion de suma y la guardamos en al
mov al,bl
add al,bh
mov bh,al

AAM

mov bx,ax

mov ah,02h
mov dl,bh
add dl,30h
int 21h

mov ah,02h
mov dl,bl
add dl,30h
int 21h

Mov ax,4c00h 
int 21h

Mov ax,4c00h 
int 21h
End inicio