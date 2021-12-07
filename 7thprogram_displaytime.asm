; PROGRAM :: READ THE CURRENT TIME FROM THE SYSTEM AND DISPLAY IT IN THE
; STANDARD FORMAT ON THE SCREEN

.MODEL SMALL

DISPLAY MACRO MSG
        LEA DX, MSG
        MOV AH, 09H
        INT 21H
ENDM

.DATA
TIMESTR DB 020H DUP(?)
MSG1 DB "CURRENT TIME :: $"

.CODE
START : MOV AX, @DATA
        MOV DS, AX
; CLEAR THE SCREEN
        MOV AH, 00H
        MOV AL, 03H
        INT 10H
; SET A PARTICULAR LOCATION. FOR DYNAMIC CLOCK
AG:     MOV BH, 00H
        MOV DH, 01H
        MOV DL, 01H
        MOV AH, 02H
        INT 10H
        MOV SI, OFFSET TIMESTR
        MOV AH, 2CH             ; INTERRUPT FOR GETTING SYSTEM TIME
        INT 21H
        MOV AL, CH              ; CH=HOUR, CL=MINUTES, DH=SECOND
        AAM
        ADD AX, 3030H
        MOV [SI], AH
        INC SI
        MOV [SI], AL
        INC SI
        MOV [SI], BYTE PTR ':'
        INC SI
        MOV AL, CL
        AAM
        ADD AX, 3030H
        MOV [SI], AH
        INC SI
        MOV [SI], AL
        INC SI
        MOV [SI], BYTE PTR ':'
        INC SI
        MOV AL, DH
        AAM
        ADD AX, 3030H
        MOV [SI], AH
        INC SI
        MOV [SI], AL
        INC SI
        MOV [SI], BYTE PTR '$'
        DISPLAY MSG1
        DISPLAY TIMESTR                 ; DISPLAY THE TIME...
; CHECK FOR THE KEYBOARD STATUS....
; IF KEY IS PRESSED, TERMINATE THE PROGRAM..
        MOV AH, 0BH
        INT 21H
        CMP AL, 00H
        JE AG                         
FINAL : MOV AH, 4CH
        INT 21H
END START
