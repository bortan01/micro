.model small
.stack
.data
.code
inicio:                      

;Verifica si hay un Mouse conectado
  
;AX = FFFFh - Hay un Mouse instalado

;AX= 0000h - No hay un Mouse instalado    

;===================== 
Mov ax,0000h 
int 33h
Mov ax, 4C00h;int 20
Int 21h    
;=====================
end inicio