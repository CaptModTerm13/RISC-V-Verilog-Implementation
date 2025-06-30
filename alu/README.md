# ALU Module for Single-Cycle RISC-V Processor

This module implements a 32-bit Arithmetic Logic Unit (ALU) for a single-cycle RISC-V processor. It supports basic arithmetic and logic operations and includes an internal multiplexer to select between a register operand or an immediate value.

## 📦 Inputs

| Signal       | Width   | Description                                             |
| ------------ | ------- | ------------------------------------------------------- |
| `SrcA`       | 32 bits | First operand (typically `rs1` from Register File)      |
| `RegData2`   | 32 bits | Second operand (from Register File, `rs2`)              |
| `ImmExt`     | 32 bits | Immediate value (sign-extended)                         |
| `ALUSrc`     | 1 bit   | Select signal: `0` = use `RegData2`, `1` = use `ImmExt` |
| `ALUControl` | 3 bits  | Operation selector from ALU Decoder                     |

## 📤 Outputs

| Signal      | Width   | Description                       |
| ----------- | ------- | --------------------------------- |
| `ALUResult` | 32 bits | Output of ALU operation           |
| `Zero`      | 1 bit   | `1` if `ALUResult == 0`, else `0` |

## 🔁 Supported Operations

| ALUControl | Operation | Description   |        |
| ---------- | --------- | ------------- | ------ |
| `000`      | ADD       | `SrcA + SrcB` |        |
| `001`      | SUB       | `SrcA - SrcB` |        |
| `010`      | AND       | `SrcA & SrcB` |        |
| `011`      | OR        | \`SrcA        | SrcB\` |
| `100`      | XOR       | `SrcA ^ SrcB` |        |

## 🧠 Notes

* The `SrcB` is computed internally using a mux: `SrcB = ALUSrc ? ImmExt : RegData2`
* The `Zero` flag is useful for branch decisions like `beq`
* This module is meant to be used in conjunction with an ALU Decoder and Control Unit in a full processor datapath.

## 📷 Diagram

<>
