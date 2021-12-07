; program to sort numbers in ascending order  using bubble sort


.model small


.data
a db 34h,22h,12h,24h            ; array declaration
siz dw $-a                      ;  gives total no of elemnts in array
                                ; $-last add of array  a-first add of array
                                ; $-a==last add-first add==total elemnts
                                ; siz dw 04h

.code
start:          mov ax,@data       ; memory initialization
                mov ds,ax

                mov bx,siz         ; bx=04
                dec bx             ; bx=03

outloop:        mov cx,bx          ; cx=03
                mov si,0           ; si=frst elemt

inloop:         mov al, a[si]      ;  al=a[si]=a[0]===34    al=78  al=78
                inc si             ;  si=si+1=======78      si=12  si=34

                cmp al,a[si]       ; al vs a[si]=====34 vs 78      78 vs 12
                jb goon            ;  tx to goon if cf=1  jb/jc

                xchg al,a[si]      ;   78   78

                mov a[si-1],al     ;   12   78          pass 1

goon:           loop inloop        ; cx=cx-1  jnz  inloop

                dec bx             ;  pass 2
                jnz outloop

                mov ah,4ch
                int 21h
end start
