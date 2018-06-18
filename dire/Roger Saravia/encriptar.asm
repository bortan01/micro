.model small
.stack
.data
arch1 db 'mensaje.txt',0    ;un archivo, debe estar en la misma carpeta del ejecutable
arch3 db 'encriptado.txt',0    ;se crea al ejecutar el programa
erm db 10,13,'error',10,13,'$'
exm db 10,13,'Palabra encriptada',10,13,'$'  
buf1 dw 500 dup(?)    ;buffer de lectura del archivo 1
buf2 dw 500 dup(?)    ;buffer de lectura del archivo 2
buf3 dw 500 dup(?)    ;buffer de escritura del archivo 3
fiha1 dw ?
fiha2 dw ? 
VAR1 dw ?
VAR2 dw ?
VAR3 dw ?

.code
mensaje:    mov ax,@data
    mov ds,ax    ; lo de siempre
    lea dx,arch1
    mov ax,3d02h
    int 21h        ;abre archivo 1
    jc error1
    jmp conti1
    error1: jmp error
    conti1:
    mov var1,0
    MOV var2,0 
    MOV var3,0
     mov fiha1,ax
    Ciclo:
        
        inc var1
		MOV AH,3Fh 
		LEA DX,buf1
		MOV BX,fiha1
		MOV CX,1
		INT 21h
		JC error
		CMP AX,0
		JE FinDeArchivo
		;MOV AH,2
		;MOV Dl,B.buf1
		;INT 21h
		JMP SHORT Ciclo
	FinDeArchivo:
    
    
    lea dx,arch1
    mov ax,3d02h
    int 21h
    mov fiha1,ax
    mov bx,fiha1
    mov ah,3fh
    mov cx,var1
    lea dx,buf1
    int 21h        ;lee archivo 1 en buf1
    jc error   
    mov ah,3eh
    int 21h        ;cierra arch1
    

    mov ah,3ch
    lea dx,arch3
    mov al,0
    mov cx,0
    int 21h        ;crea archivo 3
    jc error
    mov fiha2,ax

    xor bx,bx        ;base para apuntar los tres buffers
    mov cx,var1        ;caracteres a mover
    dec cx
    xor si,si        ;indice para desplazar buffer 3
	
	lazo:  
	;murcielago 0123456789   
	push bx
	push si
	;mov var2,si
	mov al,b.buf1[bx]        ;lee ch de buffer 1 
	cmp al,'A'
	je A
	cmp al,'B'
	je B
	cmp al,'C'
	je C
	cmp al,'D'
	je D
	;***FILA2
	cmp al,'E'
	je E
	cmp al,'F'
	je F
	cmp al,'G'
	je G
	cmp al,'H'
	je H
   ;;DESDE AQUI
    cmp al,'I'
	je I
	cmp al,'J'
	je J
	cmp al,'K'
	je K
	cmp al,'L'
	je L
	cmp al,'M'
	je M
	cmp al,'N'
	je N
	cmp al,'O'
	je O
	cmp al,'P'
	je P
	cmp al,'Q'
	je Q
	cmp al,'R'
	je R
	cmp al,'S'
	je S
	cmp al,'T'
	je T
	cmp al,'U'
	je U
	cmp al,'V'
	je V
	cmp al,'W'
	je W
	cmp al,'X'
	je X
	cmp al,'Y'
	je Y
	cmp al,'Z'
	je Z
	
	jmp conti2
	
	
	A:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],78
	  inc si
	  mov b.buf3[bx+si],49
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3
	  
	   
	B:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'E'
	  inc si
	  mov b.buf3[bx+si],'1'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3
	C:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'S'
	  inc si
	  mov b.buf3[bx+si],'1'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3
	D:
	  ;inc var2
	  mov bx,var3 
	  mov b.buf3[bx+si],'O'
	  inc si
	  mov b.buf3[bx+si],'1'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3
	E:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'N'
	  inc si
	  mov b.buf3[bx+si],'2'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3
	F:
	  ;inc var2
	  mov bx,var3 
	  mov b.buf3[bx+si],'E' 
	  inc si
	  mov b.buf3[bx+si],'2'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3
	G:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'S'
	  inc si
	  mov b.buf3[bx+si],'2'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3
	H:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'O'
	  inc si
	  mov b.buf3[bx+si],'2'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	 I:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'N'
	  inc si
	  mov b.buf3[bx+si],'3'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	 J:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'E'
	  inc si
	  mov b.buf3[bx+si],'3'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	 K:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'S'
	  inc si
	  mov b.buf3[bx+si],'3'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3  
	 L:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'O'
	  inc si
	  mov b.buf3[bx+si],'3'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	 M:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'N'
	  inc si
	  mov b.buf3[bx+si],'4'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	 N:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'E'
	  inc si
	  mov b.buf3[bx+si],'4'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	 O:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'O'
	  inc si
	  mov b.buf3[bx+si],'4'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	 P:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'N'
	  inc si
	  mov b.buf3[bx+si],'5'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3
	 Q:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'E'
	  inc si
	  mov b.buf3[bx+si],'5'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3  
	 R:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'S'
	  inc si
	  mov b.buf3[bx+si],'5'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	 S:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'O'
	  inc si
	  mov b.buf3[bx+si],'5'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	 T:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'N'
	  inc si
	  mov b.buf3[bx+si],'6'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	 U:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'E'
	  inc si
	  mov b.buf3[bx+si],'6'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3
	 V:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'S'
	  inc si
	  mov b.buf3[bx+si],'6'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3   
	 W:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'O'
	  inc si
	  mov b.buf3[bx+si],'6'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	  X:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'N'
	  inc si
	  mov b.buf3[bx+si],'7'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	  Y:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'E'
	  inc si
	  mov b.buf3[bx+si],'7'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3 
	  Z:
	  ;inc var2
	  mov bx,var3
	  mov b.buf3[bx+si],'S'
	  inc si
	  mov b.buf3[bx+si],'7'
	  inc bx
      add bx,bx
      mov var2,bx
	  jmp conti3
	  


	conti2:
	 ;mov var2
	 mov bx,var2
	 ;add bx,var2
	 ;dec bx 
	 mov b.buf3[bx],al
	 inc var2 
	 mov var3,bx
	 ;mov bx,var2  
	 ;mov si,bx
	 ;jmp ciclo2
	
    conti3: 
	
	inc var3
	pop si
	pop bx   
	
    ;mov buf3[bx+si],ax    ;mueve a buffer 3
    inc si            ;desplaza indice
    ;mov ax,buf2[bx]        ;lee ch de buffer 2
    ;mov buf3[bx+si],ax    ; mueve a buffer 3 
    ;mov var2,si

    inc bx            ;actualiza base 
    ciclo2:
    loop lazo        ;repite lazo hasta que cx sea 0 
    
    SALIR:

    mov bx,fiha2    ;   
    mov ah,40h
    lea dx,buf3
    dec var1
    mov cx,var3
    ;add cx,var1
    int 21h        ;escribe 40 ch de buffer 3 a archivo 3
    jc error
    mov ah,3eh
    int 21h        ;cierra archivo
    jc error
    lea dx,exm    ;
    mov ah,9
    int 21h        ;muestra mensaje de exito
    jmp fin
error:    lea dx,erm
    mov ah,9
    int 21h        ;muestra mensaje de error
fin:    mov ah,4ch
    int 21h        ;retorna al ss oo
    end mensaje