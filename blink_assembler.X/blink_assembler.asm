;************************************************
; Ex 2 Modified
; Description: Blinking two LEDs alternately in Assembly language
; Author: STUDENT
;************************************************

; Declaring constants
ADCON1 equ 9fh ; BANK1 - analog-to-digital converter register
STATUS equ 03h ; for selecting BANK
RP0 equ 05h
RP1 equ 06h
PORTA equ 05h ; BANK0
TRISA equ 85h ; BANK1

COUNTER1 equ 20h ; first counter for delay loop
COUNTER2 equ 21h ; second counter for delaying counter 1

; Use directive to force the program to start at reset vector : 00h
org 00h
; Program starts here
clrw ; clear W register

; Initialize PORTA
BCF STATUS, RP0 ; RP0 =0
BCF STATUS, RP1 ; RP1=0
CLRF PORTA ; clear PORTA

; Switch to Bank1 to configure ADCON1
BSF STATUS, RP0 ; RP0 =1
MOVLW 0x06 ; Configure all pins of PORTA as digital
MOVWF ADCON1

; Set PORTA as output
MOVLW 0x00 ; clear W register
MOVWF TRISA ; set PORTA pins as output

; Back to Bank0 for working with PORTA
BCF STATUS, RP0 ; RP0 =0
BCF STATUS, RP1 ; RP1=0

; Main loop
START:
    ; Turn ON RA0, turn OFF RA1
    MOVLW 0x01 ; 0000 0001
    MOVWF PORTA
    ; Delay
    MOVLW 0xFF
    MOVWF COUNTER1
    MOVWF COUNTER2
DELAY1:
    DECFSZ COUNTER1, 1
    GOTO DELAY1
    DECFSZ COUNTER2, 1
    GOTO DELAY1

    ; Turn ON RA1, turn OFF RA0
    MOVLW 0x02 ; 0000 0010
    MOVWF PORTA
    ; Delay
    MOVLW 0xFF
    MOVWF COUNTER1
    MOVWF COUNTER2
DELAY2:
    DECFSZ COUNTER1, 1
    GOTO DELAY2
    DECFSZ COUNTER2, 1
    GOTO DELAY2

GOTO START
END
