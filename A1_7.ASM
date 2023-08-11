.model small
.stack 100
.data
x db 12h
y db 13h
pro dw 00h

.code
mov ax,@data
mov ds,ax

mov al,x
mov bl,y
mul bl
mov cx,ax
mov pro,cx

mov ah,4ch
int 21h
end
