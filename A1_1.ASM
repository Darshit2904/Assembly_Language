.model small
.stack 100
.data
    msg db 'D'

.code
main proc
    mov ax,@data
    mov ds,ax

    mov dl,msg 
    mov ah,02h
    int 21h

    mov ah,4ch
    int 21h
main endp
end main
