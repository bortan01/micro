;title himno de la alegria
IDEAL
DOSSEG
MODEL small
STACK 512
DATASEG
ClaveFin DB 0

Himno 	DB 'T',35
DB 'N',59,64,192
DB 'N',60,32,192
DB 'N',62,32,192
DB 'N',62,32,192
DB 'N',60,32,192
DB 'N',59,32,192
DB 'N',57,32,192
DB 'N',55,32,192
DB 'N',55,32,192
DB 'N',57,32,192
DB 'N',59,32,192
DB 'N',59,48,192
DB 'N',57,16,228
DB 'N',57,64,192
DB 'D',24
DB 'N',59,64,192
DB 'N',60,32,192
DB 'N',62,32,192
DB 'N',62,32,192
DB 'N',60,32,192
DB 'N',59,32,192
DB 'N',57,32,192
DB 'N',55,32,192
DB 'N',55,32,192
DB 'N',57,32,192
DB 'N',59,32,192
DB 'N',57,48,192
DB 'N',55,16,228
DB 'N',55,64,192
DB 'D',16
DB 'N',57,64,192
DB 'N',59,32,192
DB 'N',55,32,192
DB 'N',57,32,192
DB 'N',59,16,228
DB 'N',60,16,228
DB 'N',59,32,192
DB 'N',55,32,192
DB 'N',57,32,192
DB 'N',59,16,228
DB 'N',60,16,228
DB 'N',59,32,192
DB 'N',57,32,192
DB 'N',55,32,192
DB 'N',57,32,192
DB 'N',50,64,192
DB 'D',16
DB 'N',59,64,192
DB 'N',60,32,192
DB 'N',62,32,192
DB 'N',62,32,192
DB 'N',60,32,192
DB 'N',59,32,192
DB 'N',57,32,192
DB 'N',55,32,192
DB 'N',55,32,192
DB 'N',57,32,192
DB 'N',59,32,192
DB 'N',57,48,192
DB 'N',55,16,228
DB 'N',55,64,192
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