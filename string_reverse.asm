.model small
.stack 100h

print macro M
    mov ah,09H
    lea dx,M
    int 21H
endm

.data
    str1 db 30,?,28 dup('$')
    str2 db 30 dup('$')
    m1 db 'Enter a string: $'
    m2 db 10,13, 'String in reverse: $'
    m3 db 10,13, 'String is palindrome$'
    m4 db 10,13, 'String is not palindrome$'
    len dw 00h

.code
    main proc
        mov ax,@data
        mov ds,ax

        print m1

        mov ah,0ah
        lea dx,str1
        int 21h

        mov bx,0000h
        mov bl,str1+1
        mov len,bx

        lea si,str1+1
        lea di,str2
        
        mov cx,len
        add si,cx
        
        l1: mov al,[si]
            mov [di],al
            dec si
            inc di
            loop l1

        print m2

        mov ah,09h
        lea dx,str2
        int 21h

        lea si,str1+2
        lea di,str2
        mov cx,len

        cld
        repe cmpsb
        jnz found

        print m3
        jmp exit

        found: print m4
               
        exit: mov ah,4ch
              int 21h
    main endp
end main