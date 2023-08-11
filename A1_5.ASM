.model small
.stack 100
.data
x db 12h
y db 13h
sum db 0h
car db 0h

.code
mov ax,@data
mov ds,ax

mov al,x
mov bl,y
add al,bl

mov sum,al
adc ah,0h
mov car,ah

mov ah,4ch
int 21h
end
