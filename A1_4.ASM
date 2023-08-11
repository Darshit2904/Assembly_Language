.model small
.stack 100
.data
x db 'Enter a string: $'
msg db 50 dup ('$')

.code
mov ax,@data
mov ds,ax

lea dx,x
mov ah,09h
int 21h

lea dx,msg
mov ah,0Ah
int 21h

mov dl,0Ah
mov ah,02h
int 21h

mov dl,0Dh
mov ah,02h
int 21h

lea dx,msg+2
mov ah,09h
int 21h

mov ah,4ch
int 21h
end
