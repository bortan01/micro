.model small

.stack

.data
    file_spec db "*.asm*", 0
	youChoose db "exe", 0
    DTA db 128h dup(0)

.code
main proc
    mov ax, @Data
    mov ds, ax
	
	mov dx,OFFSET youChoose     ; DS:DX points to DTA 	
	mov ah,1AH               ; function 1Ah - set DTA
	int 21h                     ; call DOS service
	
    mov dx,offset DTA
    mov ah,1Ah
    int 21h

    mov dx,offset file_spec
    xor cx, cx
    mov ah,4Eh
    int 21h
    jc  quit

print_name:
    lea si, DTA + 1eh
next_char:
    lodsb
    int 29h
    test al, al
    jnz next_char

    mov al, 13
    int 29h
    mov al, 10
    int 29h

    mov dx, offset file_spec
    xor cx, cx
    mov ah, 4fh
    int 21h
    jnc print_name
quit:   
    mov ax, 4c00h
    int 21h
main endp
    end main