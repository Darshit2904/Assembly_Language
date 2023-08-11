.model small
.stack 100
.data
x db 20h
y db 13h
diff db 0h
borr db 0h

.code
mov ax,@data
mov ds,ax

mov al,x
mov bl,y
sub al,bl

mov diff,al
adc ah,0h
mov borr,ah

mov ah,4ch
int 21h
end
