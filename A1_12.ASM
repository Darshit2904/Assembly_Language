.model small
.stack 100
.data
m1 db 10,13, 'Enter the dividend: $'
m2 db 10,13, 'Enter the divisor: $'
n1 db 10,13, 'Quotient is: $'
n2 db 10,13, 'Remainder is: $'
x dw 0h
y db 0h

.code
mov ax,@data
mov ds,ax

mov cl,04h
mov ch,02h

mov ah,09h
lea dx,m1
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
lea dx,m2
int 21h

mov ch,02h
i7:mov ah,01h
   int 21h
   sub al,30h
   cmp al,09h
   jbe i8
   sub al,07h

i8:cmp ch,01h
   jz i9
   rol al,cl
   mov bl,al

i9:dec ch
   jnz i7
   add bl,al
   mov y,bl

mov ah,09h
lea dx,n1
int 21h

mov ax,x
mov bl,y
div bl

mov ch,02h
mov bx,ax
o1:rol bl,cl
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

mov ah,09h
lea dx,n2
int 21h

mov ch,02h
o3:rol bh,cl
   mov dl,bh
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
