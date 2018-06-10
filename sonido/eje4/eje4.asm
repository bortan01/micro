%TITLE 'EMITE POR EL ALTAVOZ UN FRAGMENTO DE CONCIERTO'
IDEAL
DOSSEG
MODEL small
STACK 512
DATASEG
ClaveFin DB 0
Himno DB 'T',10

DB 'N',64,8,192 ;do  C
DB 'N',80,8,192 ;mi 
DB 'N',80,8,192 ;mi 
DB 'N',80,8,192 ;mi 
DB 'N',80,8,192 ;mi 
DB 'N',80,8,192 ;mi 
DB 'N',80,8,192 ;mi 
DB 'N',66,8,192 ;re; D
DB 'N',64,8,192 ;do  C
;-------------------------------DB 'D',50

DB 'N',64,8,192 ;do  C
DB 'N',80,8,192 ;mi 
DB 'N',66,8,192 ;re; D
DB 'N',64,8,192 ;do  C
DB 'N',66,8,192 ;re; D
DB 'N',64,8,192 ;do  C
DB 'N',64,8,192 ;do  C
DB 'D',50

DB 'N',64,8,192 ;do  C
DB 'N',80,8,192 ;mi 
DB 'N',80,8,192 ;mi 
DB 'N',80,8,192 ;mi 
DB 'N',80,8,192 ;mi 
DB 'N',71,8,192 ;sol G
DB 'N',71,8,192 ;sol G
DB 'N',80,8,192 ;mi
;--------------------------------DB 'D',50

DB 'N',64,8,192 ;do  C
DB 'N',80,8,192 ;mi
DB 'N',66,8,192 ;re; D
DB 'N',80,8,192 ;mi
DB 'N',80,8,192 ;mi
DB 'N',66,8,192 ;re; D
DB 'N',80,8,192 ;mi
DB 'N',80,8,192 ;mi
DB 'D',50
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