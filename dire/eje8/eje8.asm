.model small 
.STACK 
.DATA 
PATHNAM DB 64 DUP (' ')
.code

	
BEGIN : 




MAIN PROC NEAR
	
	CALL CIOPATH
	MOV AH, 10H
	INT 16H
	MOV AX,4C00H
	INT 21
MAIN ENDP



CIOPATH PROC NEAR
	MOV AH,47H
	MOV DL,00
	LEA SI,PATHNAM
	INT 21H

C20: 	
	CMP BYTE PTR (SI),00H
	JE C90
	MOV AL,[SI]
	MOV DL,AL
	CALL Q10DISP
	INC SI
	JMP C20
C90: RET
CIOPATH ENDP

Q10DISP PROC NEAR
	MOV AH,02H
	INT 21H
	RET
Q10DISP ENDP	


END BEGIN