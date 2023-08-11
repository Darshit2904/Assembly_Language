.model small
.stack 100
.data
msg db '!!Hello World!!$'

.code
main proc
mov ax,@data
mov ds,ax

lea dx,msg
mov ah,09h
int 21h

mov ah,4ch
int 21h
main endp
end main
