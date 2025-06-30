# ALU Module for Single-Cycle RISC-V Processor

This module implements the Arithmetic Logic Unit (ALU) for a single-cycle RISC-V processor, based on the standard instruction formats and control logic. It includes an internal mux to select between register data and an immediate value as the second operand.

---

## 🔧 Interface

### Inputs
| Signal       | Width | Description                                    |
|--------------|--------|------------------------------------------------|
| `SrcA`       | 32-bit | First operand (usually from register `rs1`)   |
| `RegData2`   | 32-bit | Second operand (register `rs2`)               |
| `ImmExt`     | 32-bit | Immediate value (sign-extended)               |
| `ALUSrc`     | 1-bit  | Select signal: 0 = use `RegData2`, 1 = use `ImmExt` |
| `ALUControl` | 3-bit  | Operation selector from ALU Decoder           |

### Outputs
| Signal       | Width | Description                                     |
|--------------|--------|-------------------------------------------------|
| `ALUResult`  | 32-bit | Result of the ALU operation                    |
| `Zero`       | 1-bit  | Flag: 1 if `ALUResult == 0`, used for branching |

---

## ⚙️ Operations Supported (from ALUControl)

| ALUControl | Operation      | Description                |
|------------|----------------|----------------------------|
| `000`      | ADD            | `SrcA + SrcB`              |
| `001`      | SUB            | `SrcA - SrcB`              |
| `010`      | AND            | `SrcA & SrcB`              |
| `011`      | OR             | `SrcA \| SrcB`             |
| `101`      | SLT            | `SrcA < SrcB ? 1 : 0`      |

> **Note**: `SrcB` is selected based on `ALUSrc`.  
> If `ALUSrc = 0`, then `SrcB = RegData2`;  
> If `ALUSrc = 1`, then `SrcB = ImmExt`.

---

## 🧪 Example Use Cases

- `add x1, x2, x3` → `ALUControl = 000`, `ALUSrc = 0`
- `addi x1, x2, 10` → `ALUControl = 000`, `ALUSrc = 1`
- `beq x1, x2, offset` → `ALUControl = 001`, `Zero` flag checked
- `and x1, x2, x3` → `ALUControl = 010`
- `or x1, x2, x3` → `ALUControl = 011`
- `slt x1, x2, x3` → `ALUControl = 101`

---

## 📦 File Structure

- `alu.v` — Verilog implementation of the ALU
- `README.md` — Documentation (this file)

---

## ✅ Status

✅ Fully compatible with:
- Single-cycle RISC-V datapath
- Table 7.3 ALU Control logic
- Inputs from Main Decoder & ALU Decoder

---
