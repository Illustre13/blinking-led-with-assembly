;************************************************
; Example 2
; Description: Blinking LED using PIC Assembly (PIC-AS)
; Author: Emmy (rewritten & cleaned)
;************************************************

        PROCESSOR 16F877A
        #include <xc.inc>

;------------------------------------------------
; Variable definitions (Bank 0 RAM)
;------------------------------------------------
COUNTER1    equ     0x20
COUNTER2    equ     0x21

;------------------------------------------------
; Reset Vector
;------------------------------------------------
        ORG     0x0000
        GOTO    MAIN

;------------------------------------------------
; Main Program
;------------------------------------------------
MAIN:
        ; Clear W and PORTA
        CLRW
        CLRF    PORTA

        ;----------------------------------------
        ; Configure PORTA as digital outputs
        ;----------------------------------------
        BSF     STATUS, RP0        ; Bank 1
        MOVLW   0x06               ; All PORTA pins digital
        MOVWF   ADCON1
        CLRF    TRISA              ; PORTA as output
        BCF     STATUS, RP0        ; Back to Bank 0

;------------------------------------------------
; Main Loop
;------------------------------------------------
START:
        ; Turn ON LEDs (PORTA)
        MOVLW   0xFF
        MOVWF   PORTA

        CALL    DELAY

        ; Turn OFF LEDs (PORTA)
        CLRF    PORTA

        CALL    DELAY

        GOTO    START

;------------------------------------------------
; Delay Subroutine
;------------------------------------------------
DELAY:
        MOVLW   0xFF
        MOVWF   COUNTER1
        MOVWF   COUNTER2

DELAY_LOOP:
        DECFSZ  COUNTER1, F
        GOTO    DELAY_LOOP
        DECFSZ  COUNTER2, F
        GOTO    DELAY_LOOP
        RETURN

        END
