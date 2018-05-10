.MODEL SMALL

.DATA
 CADENA DB 20 DUP() 
 CADENA2 DB 'ESCRIBRE LA CADENA','$'
.STACK
.CODE
.STARTUP

mov ax,@data
mov ds,ax

mov dx,OFFSET CADENA2
MOV AH,9H
INT 21H

mov ah,02h
    mov dl,10
    int 21h
    
    mov ah,02h
    mov dl,13
    int 21h

MOV AH,0AH
MOV DX,OFFSET CADENA
INT 21H

mov ah,10h
int 16h

.EXIT
END