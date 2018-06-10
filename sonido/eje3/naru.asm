;title himno de la alegria
IDEAL
DOSSEG
MODEL small
STACK 512
DATASEG
ClaveFin DB 0

DO EQU 64 
DO_S EQU 65
RE EQU 66
RE_S EQU 67
MI EQU 68
FA EQU 69
FA_S EQU 70
SOL EQU 71
SOL_S  EQU 72
LA  EQU 73
LA_S EQU 74
SII EQU 75

Himno 	DB 'T',35

DB "N",MI,35,220
DB 'D',56
DB "N",MI,35,220
DB 'D',56
DB "N",MI,35,220
DB 'D',56
DB "N",FA_S,35,220
DB 'D',56
DB "N",MI,35,220
DB 'D',56
DB "N",MI,35,220
DB 'D',56
DB "N",SII,35,220
DB 'D',56
DB "N",LA,35,220
DB 'D',56
DB "N",SOL,35,220
DB 'D',56
DB "N",LA,35,220
DB 'D',56

DB "N",SOL,35,220
DB 'D',56
DB "N",FA_S,35,220
DB 'D',56
DB "N",MI,35,220
DB 'D',56
DB "N",MI,35,220
DB 'D',56
DB "N",FA_S,35,220
DB 'D',56
DB "N",MI,35,220
DB 'D',56
DB "N",MI,35,220
DB 'D',56
DB "N",RE_S,150,220
DB 'D',56
DB "N",LA,35,220
DB 'D',56

DB "N",MI,35,220
DB 'D',56
DB "N",MI,35,220
DB 'D',56
DB "N",MI,35,220
DB 'D',56
DB "N",FA,35,220
DB 'D',56
DB "N",MI,35,220
DB 'D',56
DB "N",MI,35,220
DB 'D',56
DB "N",SII,35,220
DB 'D',56
DB "N",LA,35,220
DB 'D',56
DB "N",SOL,35,220
DB 'D',56
DB "N",LA,35,220
DB 'D',56

DB "N",SOL,35,220
DB 'D',56
DB "N",FA_S,35,220
DB 'D',56
DB "N",DO,35,220
DB 'D',56
DB "N",DO,35,220
DB 'D',56
DB "N",SII,35,220
DB 'D',56
DB "N",SII,35,220
DB 'D',56
DB 'X' 

CODESEG
; De SONIDO.OBJ
EXTRN Toca:proc
Inicia:
	mov ax,@data ;Inicia segmento de datos
	mov ds,ax
	mov es,ax
	mov si,offset Himno ;Apunta a tabla
	call Toca ;Ejecuta melodía
	mov ah,4ch ;Regresa a DOS
	mov al,[ClaveFin]
	int 21h
END Inicia