# RISC-V Register File (32x32) – Verilog Implementation

## 🔧 Overview

This project implements a 32-register file in Verilog, compliant with the RISC-V architecture specification. It supports:
- Two asynchronous read ports
- One synchronous write port
- Enforces x0 (register 0) to always return 0 (read-only hardwired zero)

## 📘 RISC-V Compatibility

This register file follows the RISC-V ISA convention:
- 32 general-purpose registers: `x0` to `x31`, each 32 bits wide.
- Register `x0` is immutable and always reads as `0`, regardless of any attempted writes.

## 📁 Files

| File Name            | Description                                     |
|----------------------|-------------------------------------------------|
| `RegisterFile.sv`    | The main Register File module (32x32 design)    |
| `RegisterFile_tb.sv` | Testbench with clock, write/read tests, and VCD dump |
| `RegisterFile_tb.vcd`| Generated waveform file (after simulation)      |
| `README.md`          | This project documentation                      |

## 📜 Module Interface

### Module: `RegisterFile`

```verilog
module RegisterFile (
    input         clk,         // Clock signal
    input         RegWrite,    // Write enable
    input  [4:0]  rs1,         // Read register 1 index
    input  [4:0]  rs2,         // Read register 2 index
    input  [4:0]  rd,          // Write register index
    input  [31:0] wd,          // Write data
    output [31:0] rd1,         // Read data from rs1
    output [31:0] rd2          // Read data from rs2
);
