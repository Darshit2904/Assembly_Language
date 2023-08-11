.model small
.stack 100
.code
mov ah,01h
int 21h

mov bl,al

mov dl,0ah
mov ah,02h
int 21h

mov dl,0dh
mov ah,02h
int 21h

mov dl,bl
mov ah,02h
int 21h

mov ah,4ch
int 21h
end
