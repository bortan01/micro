meterbuf macro c,var3
    mov bx,var3
    MOV SI,var3
    mov b.buf3[bx],c
    inc var3
	jmp conti3 
endm


.model small
.stack
.data
arch1 db 'mensaje1.txt',0    ;un archivo, debe estar en la misma carpeta del ejecutable
arch3 db 'desencrip.txt',0    ;se crea al ejecutar el programa
erm db 10,13,'error',10,13,'$'
exm db 10,13,'Palabra desencriptada',10,13,'$'  
buf1 dw 500 dup(?)    ;buffer de lectura del archivo 1
buf2 dw 500 dup(?)    ;buffer de lectura del archivo 2
buf3 dw 500 dup(?)    ;buffer de escritura del archivo 3
fiha1 dw ?
fiha2 dw ? 
VAR1 dw ?
VAR2 dw ?
VAR3 dw ?

.code

mensaje1:    mov ax,@data
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
    ;dec cx
    xor si,si        ;indice para desplazar buffer 3
	
	lazo:  
	;murcielago 0123456789   
	push bx
	push si
	
	mov al,b.buf1[bx]        ;lee ch de buffer 1 
	cmp al,'N'
	jne nex1
	    inc bx 
	    mov al,b.buf1[bx]        ;lee ch de buffer 1
    	cmp AL,'1'
    	je N1
    	cmp AL,'2'
	    je N2
	    cmp AL,'3'
	    je N3
	    cmp AL,'4'
	    je N4 
	    cmp AL,'5'
    	je N5
    	cmp AL,'6'
	    je N6
	    cmp AL,'7'
	    je N7

	
	nex1:

    cmp al,'E'
	jne nex2
	    inc bx 
	    mov al,b.buf1[bx]
    	cmp AL,'1'
    	je E1
    	cmp AL,'2'
	    je E2
	    cmp AL,'3'
	    je E3
	    cmp AL,'4'
	    je E4   
	    cmp AL,'5'
	    je E5
	    cmp AL,'6'
	    je E6 
	    cmp AL,'7'
	    je E7
	    
	
	nex2:
	cmp al,'S' 
	jne nex3
	    inc bx 
	    mov al,b.buf1[bx]
    	cmp AL,'1'
    	je S1
    	cmp AL,'2'
	    je S2
	    cmp AL,'3'
	    je S3
	    cmp AL,'4'
	    je S4
	    cmp AL,'5'
    	je S5
    	cmp AL,'6'
	    je S6
	    cmp AL,'7'
	    je S7 
	
	nex3: 
	cmp al,'O' 
	jne nex4
	    inc bx 
	    mov al,b.buf1[bx]
    	cmp AL,'1'
    	je O1
    	cmp AL,'2'
	    je O2
	    cmp AL,'3'
	    je O3
	    cmp AL,'4'
	    je O4 
	    cmp AL,'5'
	    je O5
	    cmp AL,'6'
	    je O6 
	
	nex4:
	
	jmp conti3
	
	
	N1:
	  meterbuf 'A',var3;fila0
	N2:
	  meterbuf 'E',var3
	N3:
	  meterbuf 'I',var3
	N4:
	  meterbuf 'M',var3
	N5:
	  meterbuf 'P',var3
	N6:
	  meterbuf 'T',var3
	N7:
	  meterbuf 'X',var3 
	E1:
	  meterbuf 'B',var3;fila1
	E2:
	  meterbuf 'F',var3
	E3:
	  meterbuf 'J',var3
	E4:
	  meterbuf 'N',var3
	E5:
	  meterbuf 'Q',var3
	E6:
	  meterbuf 'U',var3
	E7:
	  meterbuf 'Y',var3 
	S1:
	  meterbuf 'C',var3;fila2
	S2:
	  meterbuf 'G',var3
	S3:
	  meterbuf 'K',var3
	S4:
	  meterbuf 'Ñ',var3
	S5:
	  meterbuf 'R',var3
	S6:
	  meterbuf 'V',var3
	S7:
	  meterbuf 'Z',var3
	O1:
	  meterbuf 'D',var3;fila3
	O2:
	  meterbuf 'H',var3
	O3:
	  meterbuf 'L',var3
	O4:
	  meterbuf 'O',var3
	O5:
	  meterbuf 'S',var3
	O6:
	  meterbuf 'W',var3
	  

    conti3: 
	
	;inc var3
	pop si
	pop bx   
	
    inc si            ;desplaza indice

    inc bx            ;actualiza base 
    ciclo2:
    loop lazo        ;repite lazo hasta que cx sea 0 
    
    SALIR:

    mov bx,fiha2    ;   
    mov ah,40h
    lea dx,buf3
    ;dec var3
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

    end mensaje1