# Printed Circuit Boards (PCBs)
This repository houses circuits and PCB design for the Heron MK II cubesatellite project.

**Export all schematics and board layouts to PDF files so others can easily view them without using Altium.**

**Use the Issues tab in this repository to track any hardware/electrical issues, suggestions for PCBs, or other small items related to electronics.**


## Current PCBs in Lab

### PAY-SSM

[Manufacturing notes](https://github.com/HeronMkII/pcbs/issues/14)

- Payload subsystem main board
- Controls motors, heaters, thermistors
- Interfaces with EPS/OBC on the CAN bus
- 10-pin DF-14 connector to EPS


- **Programming headers - for both, the notch on the connector must face DOWN**
    - Board orientation is determined by the UTAT logo
- 2x2 header on right side between long debugging header and programming header - top 2 pins are MCU's TX (prints), bottom 2 pins are MCU's RX (laptop commands)
- Careful of different 5V and 3V3 headers!!


- Contains two microcontrollers:
    - pay (right side)
        - Controls SSM functions
        - Need to set switch to PROG when uploading programs, and RUN when executing programs
        - Switch must be in RUN mode for SSM_RST button and UART to work
        - Can leave microcontroller's RX pin connected when uploading a program (commands from a laptop)
    - pay-optical (left side)
        - Controls optical sensor setup
        - Should be on the PAY-Optical board, but is on the SSM board due to space constraints
        - UART headers (from MCU's perspective):
            - TX - DI
            - RX - CLK
        - Need to disconnect RX (CLK) pin when uploading a program
- The two microcontrollers are connected to each other over SPI, where pay functions as the master and pay-optical functions as the slave
- 5V supply required if using motors and heaters
- Disconnected (desoldered) CONFIG pin on both motor drivers so they use phase/enable mode


### PAY-Optical

[Manufacturing notes](https://github.com/HeronMkII/pcbs/issues/15)

- Payload optical board
- Physically stacked on top of PAY-SSM with a 20-pin header
    - Bought a 20-pin wire for testing without having to stack the boards
- 34 optical sensors and 2 SMA connectors to test input by simulating the input signal after the first amplification stage
- MCU for optical setup is on the PAY-SSM PCB


### PAY-LED

[Manufacturing notes](https://github.com/HeronMkII/pcbs/issues/20)

- Payload LED board
- Contains LEDs on opposite side from PAY-Optical board
- Second copy currently (on 2018-09-18) being soldered by Cindy
- Each LED board has a 10-pin DF14 connector to PAY-SSM


### BUS (OBC/EPS/COMM)

- Combined onboard computer, electrical power systems, and communications on the same board
- Next iteration will have OBC on its own board, EPS/COMM still together on the other board
- Decided to not finish soldering a complete board with all components, just a couple of partially finished boards
- Connects to systems PCB with DSUB-25 connector
- Two MCUs: EPS and OBC
- Must program MCUs through the systems debug PCB


### Systems Debug PCB

- Systems debugging board
- Connects to EPS board with DSUB-25 connector
- Will allow us to plug in the single DSUB-25 cable to the satellite, program and view UART from any board/MCU, and monitor high-level debugging signals
- Programming header layout is wrong on the current iteration, so the protoboard is attached to correct the header pin layout


## Old PCBs in Lab

### OBC-001

### OBC-002

### PAY-SSM
- Not all components soldered
- Previously used to test conformal coating
