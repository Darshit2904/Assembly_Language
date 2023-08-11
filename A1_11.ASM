.model small
.stack 100
.data
m db 10,13, 'Enter a number: $'
n db 10,13, 'Multiplication is: $'
x db 0h
y db 0h

.code
mov ax,@data
mov ds,ax

mov cl,04h
mov ch,02h

mov ah,09h
lea dx,m
int 21h

i1:mov ah,01h
   int 21h
   sub al,30h
   cmp al,09h
   jbe i2
   sub al,07h

i2:cmp ch,01h
   jz i3
   rol al,cl
   mov bl,al

i3:dec ch
   jnz i1
   add bl,al
   mov x,bl

mov ah,09h
lea dx,m
int 21h

mov ch,02h
i4:mov ah,01h
   int 21h
   sub al,30h
   cmp al,09h
   jbe i5
   sub al,07h

i5:cmp ch,01h
   jz i6
   rol al,cl
   mov bl,al

i6:dec ch
   jnz i4
   add bl,al
   mov y,bl

mov ah,09h
lea dx,n
int 21h

mov al,x
mov bl,y
mul bl

mov ch,04h
mov bx,ax
o1:rol bx,cl
   mov dl,bl
   and dl,0Fh
   cmp dl,09h
   jbe o2
   add dl,07h

o2:add dl,30h
   mov ah,02h
   int 21h
   dec ch
   jnz o1

mov ah,4ch
int 21h
end
