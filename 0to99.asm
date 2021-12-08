; PROGRAM :: PROGRAM TO SIMULATE A DECIMAL UP COUNTER TO DISPLAY 00-99

.MODEL SMALL

.CODE
START : MOV CL, 00H
; CLEAR THE SCREEN FIRST
        MOV AH, 00H
        MOV AL, 03H
        INT 10H

BACK:   MOV BH, 00H
        MOV DH, 00H             ; SET ROW
        MOV DL, 00H             ; SET COLUMN
        MOV AH, 02H
        INT 10H
        MOV AL, CL
        ADD AL,00H
        AAM
        ADD AX, 3030H
        MOV CH, AL
        MOV AL, AH
        MOV DL, AL
        MOV AH, 02H
        INT 21H
        MOV AL, CH
        MOV DL, AL
        MOV AH, 02H
        INT 21H
        CALL DELAY
        INC CL
        XOR AX, AX
        CMP CL, 100D
        JNE BACK
        JE FINAL

DELAY PROC NEAR
        PUSH CX
        PUSH AX
        PUSH BX
        MOV CX, 0FFFH
AG:     MOV BX, 0FFFFH
AG1:    NOP
        XOR AX, AX
        DEC BX
        JNZ AG1
        DEC CX
        JNZ AG
        POP BX
        POP AX
        POP CX
RET
DELAY ENDP
FINAL:  MOV AH, 4CH
        INT 21H
END START
        
