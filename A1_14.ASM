.model small
.stack 100
.data
m db 10,13, 'Enter a number: $'
n db 10,13, 'Sum is: $'
x dw 0h
y dw 0h

.code
main proc
   mov ax,@data
   mov ds,ax

   mov ah,09h
   lea dx,m
   int 21h

   call input
   mov bh,bl

   call input
   mov x,bx

   mov ah,09h
   lea dx,m
   int 21h

   call input
   mov bh,bl

   call input
   mov y,bx

   mov ah,09h
   lea dx,n
   int 21h

   mov ax,x
   add ax,y

   mov bx,ax
   call output

   mov ah,4ch
   int 21h
main endp

input proc
   mov cl,04h
   mov ch,02h

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
ret
input endp

output proc
   mov ch,04h
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
ret
output endp

end main