`timescale 1ns / 1ps
module instr_mem (
    input  wire        clk,
    input  wire        rst,
    input  wire [31:0] PC,
    output reg  [31:0] Instruction_Code
);

    reg [7:0] Memory [0:63];
    integer i;

    always @(posedge clk) begin
        if (rst) begin
            // R-type Instructions 
            // add t1, s0, s1 => 0x00940333
            Memory[0]  = 8'h33; Memory[1]  = 8'h03; Memory[2]  = 8'h94; Memory[3]  = 8'h00;
            // sub t2, s2, s3 => 0x413903b3
            Memory[4]  = 8'hb3; Memory[5]  = 8'h03; Memory[6]  = 8'h39; Memory[7]  = 8'h41;
            // mul t0, s4, s5 => 0x035a02b3
            Memory[8]  = 8'hb3; Memory[9]  = 8'h02; Memory[10] = 8'h5a; Memory[11] = 8'h03;
            // xor t3, s6, s7 => 0x017b4e33
            Memory[12] = 8'h33; Memory[13] = 8'h4e; Memory[14] = 8'h7b; Memory[15] = 8'h01;
            // I-type Instructions
            
            // addi a0, a0, 5 => 0x00550513
            Memory[16] = 8'h13; Memory[17] = 8'h05; Memory[18] = 8'h55; Memory[19] = 8'h00;
            // lw x6, -4(x9) => 0xFFC4A303
            Memory[20] = 8'h03; Memory[21] = 8'hA3; Memory[22] = 8'hC4; Memory[23] = 8'hFF;

            // S-type Instruction 
            // sw x6, -8(x9) => 0xFE642023
            Memory[24] = 8'h23; Memory[25] = 8'h20; Memory[26] = 8'h64; Memory[27] = 8'hFE;

           
            // B-type Instruction 
            // beq x1, x2, 8 => 0x00208663
            Memory[28] = 8'h63; Memory[29] = 8'h86; Memory[30] = 8'h20; Memory[31] = 8'h00;

          
            // U-type Instruction 
            // lui x5, 0x12345 => 0x12345037
            Memory[32] = 8'h37; Memory[33] = 8'h50; Memory[34] = 8'h34; Memory[35] = 8'h12;

            
            // J-type Instruction 
            
            // jal x1, 16 => 0x010000EF
            Memory[36] = 8'hEF; Memory[37] = 8'h00; Memory[38] = 8'h00; Memory[39] = 8'h01;

           
            // Fill Remaining with NOP (addi x0, x0, 0 => 0x00000013)
           
            for (i = 40; i < 64; i = i + 1)
                Memory[i] = 8'h13;

            Instruction_Code <= 32'h00000013; // Output NOP during reset
        end else begin
            if (PC <= 60)
                Instruction_Code <= {Memory[PC+3], Memory[PC+2], Memory[PC+1], Memory[PC]};
            else
                Instruction_Code <= 32'h00000013; // Out-of-bounds: return NOP
        end
    end

endmodule
