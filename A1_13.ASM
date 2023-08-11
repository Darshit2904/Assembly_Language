.model small
.stack 100
.data
x dw 7354h
y dw 8A89h
sum_lsw dw 00h
sum_msw dw 00h

.code
mov ax,@data
mov ds,ax

mov ax,00h
mov cx,00h

mov ax,x
mov bx,y
add ax,bx

mov sum_lsw,ax
adc cx,0000h
mov sum_msw,cx

mov ah,4ch
int 21h
end
