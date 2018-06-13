; para editar archivo
.model small
.stack 100h
.data
; El Nombre est  fijo para el ejemplo
direccion db 'C:\dire\eje4\prueba.txt',0
texto db 'hola','$'
imp db 50 dup('$')  
vec db 50 dup('$')
.code
inicio:
mov     AX, @data
mov     DS, AX
                       
pedir:                       
mov ah,01h
int 21h
mov vec[si],al
inc si
cmp al,0dh
ja pedir
jb pedir

editar:
    mov ah,3dh
    mov al,1h
    mov dx,offset direccion
    int 21h    
    
    mov bx,ax
    mov cx,si
    mov dx,offset vec
   
    mov ah,40h
    int 21h
               
    mov ah, 3eh
    int 21h           
	

mov ax,4c00h
int 21h      
END inicio 


