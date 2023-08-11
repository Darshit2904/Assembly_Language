.model small
.stack 100
.data
x dw 1234h
y db 69h
quot db 0h
rem db 0h

.code
mov ax,@data
mov ds,ax

mov ax,x
mov bl,y
div bl
mov bh,ah
mov quot,al
mov rem,bh

mov ah,4ch
int 21h
end
