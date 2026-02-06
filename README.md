# Lab 1 Part Two - PIC16F877A Blinking LED – Assembly (pic-as)

This repository contains an Assembly language project developed for the **PIC16F877A** using Microchip’s **pic-as assembler** (XC8 toolchain) in **MPLAB X**. 

The project was created as part of a microcontroller laboratory exercise to build a strong understanding of low-level hardware operations, specifically focusing on **I/O ports, registers, bank switching, and software timing delays**.

---

## Purpose of the Project

The main goal of this lab was to:
* Understand the basic architecture of the PIC16F877A.
* Learn how **PORTB and TRISB** registers control I/O behavior.
* Practice **bank switching** using the STATUS register.
* Implement **software delays** using nested counters tailored for a 20MHz clock.
* Control multiple LEDs simultaneously using assembly instructions.

---

## What the Program Does

* Configures **PORTB** (specifically RB0 and RB1) as digital outputs.
* Turns the connected LEDs **ON** simultaneously.
* Executes a 3-variable nested loop delay to ensure the blink is visible to the human eye at 20MHz.
* Turns the LEDs **OFF**.
* Executes the delay again.
* Repeats the process indefinitely in a continuous loop.

---

## Simulated Hardware Components (Proteus)

* **Microcontroller:** PIC16F877A 
* **Indicators:** 2× LEDs (Green and Yellow)
* **Resistors:** 2× 330Ω current-limiting resistors, 1× 10kΩ pull-up resistor for MCLR
* **Oscillator:** 20 MHz Crystal
* **Capacitors:** 2× 22pF

---

## Basic Hardware Connections

### Power & Reset
* **MCLR (Pin 1)** → 10kΩ resistor → +5V (VDD)

### Oscillator
* 20 MHz crystal connected between **OSC1 (Pin 13)** and **OSC2 (Pin 14)**.
* 22pF capacitors from each crystal pin to **GND**.

### LEDs
* **RB0 (Pin 33)** → 330Ω resistor → Green LED → GND
* **RB1 (Pin 34)** → 330Ω resistor → Yellow LED → GND

---

## Development & Simulation Tools

* **MPLAB X IDE** (Code development)
* **XC8 Compiler / pic-as** (Assembler)
* **Proteus Design Suite** (Circuit simulation)

---

## Project Structure

```text
/
├── blink_assembler.X                          # Main assembly source code
├── bndahayo_lab1_part2.pdsprj      # Proteus circuit simulation file
├── dist/                           # Compiled .hex files for simulation
└── README.md                       # Project documentation