.model small
.stack 100
.data
m1 db 10,13, 'Enter a number: $'
n1 db 10,13, 'Sum is: $'
n2 db 10,13, 'Difference is: $'
n3 db 10,13, 'Multiplication is: $'
x db 0h
y db 0h


.code
main proc
   mov ax,@data
   mov ds,ax

   mov ah,09h
   lea dx,m1
   int 21h

   call input
   mov x,bl

   mov ah,09h
   lea dx,m1
   int 21h
                                                
   call input
   mov y,bl

   mov ah,09h
   lea dx,n1
   int 21h

   mov bl,x
   add bl,y
   
   mov bh,bl300
   mov ch,02h
   call output

   mov ah,09h
   lea dx,n2
   int 21h

   mov bl,x
   sub bl,y

   mov bh,bl
   mov ch,02h
   call output

   mov ah,09h
   lea dx,n3
   int 21h

   mov al,x
   mov bl,y
   mul bl

   mov ch,04h
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


