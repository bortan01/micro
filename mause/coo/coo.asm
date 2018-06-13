.MODEL SMALL
.STACK 100H
.DATA
XB DW 00
YB DW 00
VALASC DW 00
MEN1 DB 'Mouse no disponible...$'
DESPDATO LABEL BYTE
XMEN DB 'x= '
XASCII DW ?
YMEN DB ' y= '
YASCII DW ?
YXI DW 00
YXF DW 00
FPP DB 00
.CODE     

MAIN PROC FAR
;PROTOCOLO
PUSH DS
SUB AX,AX
PUSH AX
MOV AX,@DATA
MOV DS,AX
MOV ES,AX
;FIN PROTOCOLO 

MOV FPP,3EH
MOV YXI,00H
MOV YXF,184FH
CALL TEXTBACKGROUND
CALL I_MOUSE
CMP AX,00

CALL M_MOUSE
MOV YXI,1843H 
;======================================todoesto se repitecada ves
OTRO: CALL P_MOUSE ; SERVICIO 03
CMP BX,01

CALL GOTOXY
MOV AX,XB
CALL CONV
MOV AX,VALASC
MOV XASCII,AX
MOV AX,YB
CALL CONV
MOV AX,VALASC
MOV YASCII,AX
CALL DESPLIEGA ;SERVICIO 40 DE LA INT 21
JMP OTRO  
;==========================================


MOV FPP,07H
MOV YXI,00H
MOV YXF,184FH
CALL TEXTBACKGROUND
MOV AX,4C00H
INT 21H
RET
MAIN ENDP


I_MOUSE PROC NEAR
MOV AX,00
INT 33H
RET
I_MOUSE ENDP


M_MOUSE PROC NEAR
PUSH AX
MOV AX,01H; si le ponemos 02h se esconde el cursor pero no deja de marcar las posiciones del mouse
INT 33H
POP AX
RET
M_MOUSE ENDP
    
    
C_MOUSE PROC NEAR
PUSH AX
MOV AX,04H
INT 33H
POP AX
RET
C_MOUSE ENDP  




C_CURSOR PROC NEAR
MOV AH,02
MOV BH,00
MOV DH,00
MOV DL,25
INT 10H
RET
C_CURSOR ENDP


P_MOUSE PROC NEAR
;La subrutina devuelve XB,YB
SAL3: MOV AX,03 ;RETORNA BX = Edo DE LOS BOTONES Y
INT 33H ;RETORNA CX= COORD X, DX= COORD Y
CMP BX,01 ; SI SE PULSO BOTON IZQ.
JE SAL1
MOV AX,CX ; AUXILIAR DE LA COORDENADA HOR
MOV CL,3
SHR AX,CL ;DIVIDE COORDENDA X / 8
SHR DX,CL ;DIVIDE COORDENDA Y / 8
MOV CX,AX ;RECUPERANDO LA COORDENADA PARA MODO TEXTO
CMP CX,XB ; sI EXISTE MOVIMIEMTO ?
JNE SAL2 ; SI
CMP DX,YB
JE SAL3 ;NO
SAL2: MOV XB,CX ;REFRESCO DE COORDENADAS
MOV YB,DX
SAL1: RET
P_MOUSE ENDP 


CONV PROC NEAR
MOV VALASC,2020H ;LIMPIANDO VALASC
MOV CX,10 ; FACTOR DE DIVISI�N
LEA SI,VALASC+1
CMP AX,CX ;AX CONTIENE LA COORDENADA
JB C1 ; SI ES MENOR
DIV CL ; SI MAYOR DIVIDE
OR AH,30H ;RESIDUO
MOV [SI],AH
DEC SI
C1: OR AL,30H ;COCIIENTE
MOV [SI],AL
RET
CONV ENDP  
           
           
DESPLIEGA PROC NEAR
; Servicio 40h :manejador de archivo para despliegue en pantalla
MOV AH,40H
MOV BX,01 ;N�mero de dispositivo: 1 = pantalla
MOV CX,11 ;Total de caracteres a desplegar
LEA DX,DESPDATO ; Area a desplegar
INT 21H
RET
DESPLIEGA ENDP 





TEXTBACKGROUND PROC NEAR
PUSH AX
PUSH BX
PUSH CX
PUSH DX
MOV AX,0600H
MOV BH,4
MOV CX,YXI
MOV DX,YXF
INT 10H
POP DX
POP CX
POP BX
POP AX
RET
TEXTBACKGROUND ENDP


GOTOXY PROC NEAR
PUSH AX
PUSH BX
PUSH DX
MOV AH,02H
MOV BH,00H
MOV DX,YXI
INT 10H
POP DX
POP BX
POP AX
RET
GOTOXY ENDP
END MAIN