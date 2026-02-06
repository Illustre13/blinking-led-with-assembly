; Minimal PIC16F877A blink example for XC8 pic-as
; Compatible with MPLAB X + pic-as (XC8 assembler)
; Author: Bertin
; Date: Feb 2026

; SYSTEM INCLUDE
; This replaces manual EQU definitions (e.g., PORTA equ 05h).
; MPLAB X knows the chip is 16F877A and pulls the right file.
#include <xc.inc>

; CONFIGURATION BITS
; (Crucial for real hardware. This sets the oscillator to HS, Watchdog OFF)
CONFIG FOSC = HS        ; Oscillator Selection bits (HS oscillator)
CONFIG WDTE = OFF       ; Watchdog Timer Enable bit (WDT disabled)
CONFIG PWRTE = OFF      ; Power-up Timer Enable bit (PWRT disabled)
CONFIG BOREN = ON       ; Brown-out Reset Enable bit (BOR enabled)
CONFIG LVP = OFF        ; Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit
CONFIG CPD = OFF        ; Data EEPROM Memory Code Protection bit
CONFIG WRT = OFF        ; Flash Program Memory Write Enable bits
CONFIG CP = OFF         ; Flash Program Memory Code Protection bit

; VARIABLE DECLARATION
; Instead of "COUNTER1 equ 20h", we ask the Linker to reserve bytes.
PSECT udata_bank0       ; Define a section in Bank 0 RAM
COUNTER1:   DS 1        ; Reserve 1 byte for COUNTER1
COUNTER2:   DS 1        ; Reserve 1 byte for COUNTER2
COUNTER3:   DS 1

; PROGRAM START
; "PSECT code" tells the linker this is executable machine code.
; "delta=2" is required for PIC16 instructions (2 bytes per word).
PSECT code, delta=2, abs
ORG 0x00                ; Reset Vector
    GOTO    START       ; Jump to main code

START:
    CLRW                

    ; Switch to Bank 1 to set pin directions
    BSF     STATUS, 5   ; RP0 = 1
    BCF     STATUS, 6   ; RP1 = 0

    ; Set TRISB (Port Direction) - 0x00 makes all PORTB pins Outputs
    MOVLW   0x00        
    MOVWF   TRISB

    ; Switch back to Bank 0 to operate the pins
    BCF     STATUS, 5   ; RP0 = 0
    BCF     STATUS, 6   ; RP1 = 0

    ; Initialize PORTB to completely OFF
    CLRF    PORTB

MAIN_LOOP:
    ; Turn ON all pins on PORTB (This will turn on both LEDs simultaneously)
    MOVLW   0xFF
    MOVWF   PORTB
    CALL    DELAY_ROUTINE

    ; Turn OFF all pins on PORTB
    MOVLW   0x00
    MOVWF   PORTB
    CALL    DELAY_ROUTINE

    GOTO    MAIN_LOOP
    
; --- Delay Subroutine ---
DELAY_ROUTINE:
    MOVLW   0x06        ; Adjust this value (0x01 to 0xFF) to change blink speed
    MOVWF   COUNTER3
DELAY3:
    MOVLW   0xFF
    MOVWF   COUNTER1
DELAY1:
    MOVLW   0xFF
    MOVWF   COUNTER2
DELAY2:
    DECFSZ  COUNTER2, 1
    GOTO    DELAY2
    DECFSZ  COUNTER1, 1
    GOTO    DELAY1
    DECFSZ  COUNTER3, 1
    GOTO    DELAY3
    RETURN

END