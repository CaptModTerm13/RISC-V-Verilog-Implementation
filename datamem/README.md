# Data Memory Module (datamem.v)

A Verilog implementation of a 4KB data memory module for RISC-V single-cycle processor.

## Overview

The data memory module provides a 4KB (1024 words × 32 bits) memory space for data storage and retrieval in a RISC-V single-cycle processor implementation.

## Features

- **Memory Size**: 4KB (1024 words of 32 bits each)
- **Word-Aligned Access**: All memory accesses are word-aligned (4-byte boundaries)
- **Synchronous Write**: Memory writes occur on the positive clock edge
- **Combinational Read**: Memory reads are combinational for single-cycle operation
- **Initialization**: Memory is initialized to zero on startup

## Module Interface

```verilog
module data_memory (
    input clk,                    // Clock signal
    input MemRead,               // Memory read enable
    input MemWrite,              // Memory write enable
    input [31:0] addr,           // Memory address (byte address)
    input [31:0] write_data,     // Data to write
    output reg [31:0] read_data  // Data read from memory
);
```

## Design Details

### Memory Organization
- **Word-Aligned**: All memory accesses are 32-bit word-aligned
- **Little-Endian**: Follows RISC-V little-endian byte ordering
- **Address Translation**: Byte addresses are converted to word addresses internally

### Key Design Decisions
- **Word Addressing**: The module automatically converts byte addresses to word addresses by extracting bits [11:2]
- **Memory Safety**: Read operations return zero when MemRead is not asserted
- **Single-Cycle Compatible**: Designed for single-cycle processor timing requirements

### Timing
- **Single-Cycle**: Designed for single-cycle processor operation
- **Setup Time**: Memory reads complete within one clock cycle
- **Hold Time**: Memory writes occur on the positive clock edge

## Usage

### Simulation
To simulate the data memory module:

```bash
# Using ModelSim/QuestaSim
vlog datamem.v
vsim -c data_memory -do "run -all"

# Using Icarus Verilog
iverilog -o sim datamem.v datamem_tb.v
vvp sim
```

## Testing

### Test Bench Requirements
- Memory read/write operations
- Address boundary conditions
- Clock edge timing verification
- Memory initialization verification

---

**Note**: This module is part of a larger RISC-V single-cycle processor implementation. 