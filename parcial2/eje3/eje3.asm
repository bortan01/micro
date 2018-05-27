color macro x1
mov ax,0600h
mov bh,x1
mov cx,0000h
mov dx,184fh
int 10h
endm

gotoxy macro x,y
xor bh,bh
Mov dl,x
mov dh,y
mov ah,02h
int 10h
endm

limpiar macro
mov bh,17h
mov ah,06h
mov al,00h
mov cx,0000
mov dx,184fh
int 10h
endm



.MODEL SMALL
.STACK 256
.DATA
cad0 db 32,32,32,32,32,32,32,32,32,32,32,32,"Alumno:                                    Carnet: ",13,10,'$'
cad1 db 32,32,32,32,32,32,32,32,32,32,32,32,"        Carlos Eduardo Alvarado Calderon   Carnet: AC06041",13,10,'$'
cad2 db 32,32,32,32,32,32,32,32,32,32,32,32,"        Jorge Antonio Osorio Medina   Carnet: OM04016",13,10,'$'

texto DB 13,10,'1. Informacion ',13,10,'2. Dibujo',13,10,'3. Salir',13,10,'Digite la opcion:','$'
final db 13,10,'Presione una tecla para salir....$'
regresar db 13,10,'Presione una tecla para regresar al menu....$'
opc db ?
	TIP db 'ESTE ES EL TIPO   ',10,13,'$'
	car db 1
	col db 1
	fil db 1
	;variabes del marco
	X1      DB      ?
    Y1      DB      ?
    X2      DB      ?
    Y2      DB      ? 

.code 
principal:
;para limpiar la pantalla
    mov ah,00h
	mov al,0
	int 10h	  
;
            
            
MOV AX,@DATA
MOV DS,AX
MOV CX,10
MOV AH,09H
MOV DX,offset texto
MOV AH,09H
INT 21H  

 
 
cmp opc,31h
je  informacion

cmp opc,32h
readkey:
mov ah,00
int 16h ;espera que presione una tecla
je  dibujatipo

mov opc,al
cmp opc,33h
je salir     


;*********************************nombres

MOV     AX, @data 
         
        MOV     DS, AX
        
        MOV     CL, 1  ;coordenada x1 inicio         
        MOV     CH, 1  ;coordenada y1 inicio
        MOV     DL, 76 ;coordenada x2 final
        MOV     DH, 20 ;coordenada y2 final
        MOV     BH, 0  ;si le pongo un uno me cambia de pagina          
        MOV    BL, 2Fh  ;con esto se puede cambiar el color del fondo y la linea  
        
        CALL    Marco
        
         mov al,02
     	 mov bh,0;es la pagina
     	 mov dx,08; desde el comienzo
     	 int 10h 	 

mov di,2
mov ah,09h
mov dx,offset cad0
int 21h

mov di,2
mov ah,09h
mov dx,offset cad1
int 21h

mov ah,09h
mov dx,offset cad2
int 21h 
                
        MOV     AH, 4Ch
        INT     21h

        
informacion:

Marco   PROC
        MOV     AH, 5   
        MOV     AL, BH  
        INT     10h     
        
        
        MOV     AX, 0600h       
        
        XCHG    BH, BL  
        INT     10h     
        
        MOV     X1, CL
        MOV     X2, DL
        MOV     Y1, CH
        MOV     Y2, DH
        
        MOV     AH, 2   
        
        XCHG    BH, BL  
        INT     10h     
        MOV     AH, 9   
        
        MOV     AL, 217  
        MOV     CX, 1   
        INT     10h
        
        
CicloDerecha:
        MOV     AH, 2   
        DEC     DH      
        CMP     DH, Y1  
        JE      EsqSupDer       
        INT     10h     
        MOV     AH, 9   
        MOV     AL, 179 
        
        INT     10h
        JMP     CicloDerecha
EsqSupDer:      
        INT     10h     
        MOV     AH, 9   
        MOV     AL, 191 
        
        INT     10h
        
        
CicloSuperior:
        MOV     AH, 2   
        DEC     DL      
        CMP     DL, X1  
        JE      EsqSupIzq
        INT     10h     
        MOV     AH, 9   
        MOV     AL, 196 
         
        INT     10h
        JMP SHORT CicloSuperior
        
EsqSupIzq:      
        INT     10h     
        
        MOV     AH, 9   
        MOV     AL, 218 
        
        INT     10h
        
CicloIzquierda:
        MOV     AH, 2   
        INC     DH      
        CMP     DH, Y2  
        JE      EsqInfIzq
        INT     10h     
        
        MOV     AH, 9   
        MOV     AL, 179 
        
        INT     10h
        JMP SHORT CicloIzquierda
        
        
EsqInfIzq:
        INT     10h     
        
        MOV     AH, 9   
        MOV     AL, 192 
        
        INT     10h
        
CicloInferior:
        MOV     AH, 2   
        INC     DL      
        CMP     DL, X2  
        JE      FinMarco
        INT     10h     
        
        MOV     AH, 9   
        MOV     AL, 196 
         
        INT     10h
        JMP SHORT CicloInferior  
        
       
FinMarco:

call principal

;*********************************dibuja al tipo
dibujatipo: 
	mov ax,@data ; Inicializa el segmento de
	mov ds,ax  
		
	mov fil,0

	mov ah,00h
	mov al,0
	int 10h	

	mov ah,07h
	int 21h
	
	mov car,al
	mov si,0
	call cuerpo	
    sigue:
	mov si,0
	mov fil,4 ;
	call brasoder
    sigue1:
	mov si,0
	call brasoizq
    sigue2:
	mov si,0
	call piernader	
    sigue3:
	mov si,0
	call piernaizq	
cuerpo:
	mov ah,02h
	mov bh,00h
	mov dh,fil
	mov dl,4
	int 10h

	mov ah,09h
	mov al,car
	mov bh,00h
	mov bl,1; es para el color
	mov cx,1
	int 10h

	inc si
	add fil,1
	cmp si,05
	jl cuerpo

	mov fil,0
	mov col,7

	jmp sigue

brasoder:
	mov ah,02h
	mov bh,00h
	mov dh,fil
	mov dl,col
	int 10h

	mov ah,09h
	mov al,car
	mov bh,00h
	mov bl,2
	mov cx,1
	int 10h

	inc si

	sub fil,1  ;cambie add por sub
	sub col,1
	cmp si,03
	jl brasoder
	mov col,3
	mov fil,2
	jmp sigue1

brasoizq:
	mov ah,02h
	mov bh,00h
	mov dh,fil
	mov dl,col
	int 10h

	mov ah,09h
	mov al,car
	mov bh,00h
	mov bl,2;es para el color
	mov cx,1
	int 10h

	inc si

	add fil,1
	sub col,1
	cmp si,03
	jl brasoizq
	mov col,3
	jmp sigue2
	
piernader:
	mov ah,02h
	mov bh,00h
	mov dh,fil
	mov dl,col
	int 10h

	mov ah,09h
	mov al,car
	mov bh,00h
	mov bl,3 ;es para el color
	mov cx,1
	int 10h

	inc si
	sub col,1
	
	cmp si,03
	je piernader

	add fil,1
	
	cmp si,03
	jl piernader
	
	mov fil,5
	mov col,5
	jmp sigue3
	
piernaizq:
	mov ah,02h
	mov bh,00h
	mov dh,fil
	mov dl,col
	int 10h

	mov ah,09h
	mov al,car
	mov bh,00h
	mov bl,3 
	mov cx,1
	int 10h

	inc si
	add col,1
	
	cmp si,03
	je piernaizq

	add fil,1
	
	cmp si,03
	jl piernaizq

mov si,0
dossalto:
	mov ah,02h
	mov dl,10
	int 21h
	mov ah,02h
	mov dl,13
	int 21h
	inc si
	cmp si,2
	jl dossalto

mov dx,offset TIP
mov ah,09h
int 21h 

mov dx,offset regresar
mov ah,09h
int 21h

mov ah,07h
int 21h
call principal
;********************************* 


;********************************* 

salir:
MOV AH,09H
MOV DX,OFFSET final
INT 21H
MOV AH,07H
INT 21H
mov ax,4c00h
int 21h 


 
end principal