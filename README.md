# Lap 1 Part 2 - PIC16F877A Blinking LED – Assembly (pic-as)

This repository contains a simple blinking LED project developed using **PIC16F877A** and written in **Assembly language** with Microchip’s **pic-as assembler** in **MPLAB X**.

The project was created as part of a **microcontroller laboratory exercise** to help build a strong understanding of how PIC microcontrollers work at a low level, especially how **I/O ports, registers, and timing delays** are handled directly in assembly.

---

## Purpose of the Project

The main goal of this lab was to:

* Understand the **basic architecture of the PIC16F877A**
* Learn how **PORT and TRIS registers** control I/O behavior
* Practice **bank switching** using the STATUS register
* Implement **software delays** using counters
* Control LEDs directly using **PORTA**

This project focuses on **learning**, not optimization or advanced features.

---

## What the Program Does

* Configures **PORTA** as a digital output
* Turns **all LEDs ON**
* Waits for a short delay
* Turns **all LEDs OFF**
* Waits again
* Repeats the process indefinitely

The blinking effect is created entirely using **nested delay loops** in assembly.

---

## Hardware Components Used

* PIC16F877A microcontroller
* PICkit 3 programmer
* LEDs
* 330Ω current-limiting resistors
* 20 MHz crystal oscillator
* 2 × 22pF capacitors
* 5V power supply

---

## Basic Hardware Connections

### Power

* **VDD (Pins 11 & 32)** → +5V
* **VSS (Pins 12 & 31)** → GND

### Oscillator

* 20 MHz crystal connected between **OSC1 (Pin 13)** and **OSC2 (Pin 14)**
* 22pF capacitors from each crystal pin to **GND**

### LEDs

* LEDs connected to **PORTA pins (RA0–RA7)**
* Each LED in series with a **330Ω resistor**
* Other side of LED connected to **GND**

---

## Development Tools

* **MPLAB X IDE**
* **XC8 Compiler (pic-as assembler)**
* **PICkit 3** for programming
* Optional: **Proteus** for simulation

---

## Project Structure

```
blink_assembler.X/
│
├── blink_assembler.asm   # Main assembly source code
├── nbproject/            # MPLAB X project files
├── .gitignore            # Ignores build and temporary files
└── README.md             # Project documentation
```

---

## How to Build and Program

1. Open **MPLAB X**
2. Open the project folder
3. Select **pic-as assembler** as the toolchain
4. Select **PIC16F877A** as the target device
5. Connect **PICkit 3**
6. Build the project
7. Program the microcontroller

---

## Learning Notes

This project helped reinforce key concepts such as:

* Why **TRISA must be set before using PORTA**
* How **bank switching** affects register access
* How delays work without timers
* How the microcontroller executes instructions step-by-step

It is intentionally kept simple to make the logic easy to follow.


