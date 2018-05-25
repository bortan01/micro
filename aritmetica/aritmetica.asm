.model small
.stack
.data
Var1 db 39h
Var2 db 34h

.code  

	mov ax,@data
	mov ds,ax

Mov al,Var1
Mov bl,Var2
Add al,bl  
mov Var1,al
daa


mov Var1,al
nop
 .exit 