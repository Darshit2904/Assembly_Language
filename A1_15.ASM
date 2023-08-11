.model small
.stack 100
.data
m db 10,13, 'Enter a number: $'
n db 10,13, 'Multplication is: $'
x dw 0h
y dw 0h
a dw 0h
b dw 0h

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
   mov bh,bl

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
   mov x,bx

mov ah,09h
lea dx,m
int 21h

mov ch,02h
j1:mov ah,01h
   int 21h
   sub al,30h
   cmp al,09h
   jbe j2
   sub al,07h

j2:cmp ch,01h
   jz j3
   rol al,cl
   mov bl,al

j3:dec ch
   jnz j1
   add bl,al
   mov bh,bl

mov ch,02h
j4:mov ah,01h
   int 21h
   sub al,30h
   cmp al,09h
   jbe j5
   sub al,07h

j5:cmp ch,01h
   jz j6
   rol al,cl
   mov bl,al

j6:dec ch
   jnz j4
   add bl,al
   mov y,bx

mov ah,09h
lea dx,n
int 21h

mov ax,x
mov bx,y
mul bx

mov a,dx
mov b,ax

mov ch,04h
mov bx,a
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

mov ch,04h
mov bx,b
o3:rol bx,cl
   mov dl,bl
   and dl,0Fh
   cmp dl,09h
   jbe o4
   add dl,07h

o4:add dl,30h
   mov ah,02h
   int 21h
   dec ch
   jnz o3

mov ah,4ch
int 21h
end
