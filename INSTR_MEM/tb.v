
`timescale 1ns / 1ps
module tb_instr_mem;

    reg         clk;
    reg         rst;
    reg [31:0]  PC;
    wire [31:0] Instruction_Code;

    // Instantiate the DUT
    instr_mem uut (
        .clk(clk),
        .rst(rst),
        .PC(PC),
        .Instruction_Code(Instruction_Code)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin
        
        $dumpfile("instr_mem_tb.vcd");
        $dumpvars(0, tb_instr_mem);

        // Initial values
        clk = 0;
        rst = 0;
        PC  = 0;

        // Reset and initialize memory
        #7 rst = 1;
        #10 rst = 0;
        #10;

      
        // R-type Instructions 

        PC = 0;    #10;
        PC = 4;    #10;
        PC = 8;    #10;
        PC = 12;   #10;

        
        // I-type Instructions
       
        PC = 16;   #10;
        PC = 20;   #10;


        // S-type Instruction 
      
        PC = 24;   #10;

     
        // B-type Instruction 
        
        PC = 28;   #10;

     
        // U-type Instruction 
        
        PC = 32;   #10;

       
        // J-type Instruction 
      
        PC = 36;   #10;

        // NOP from end of memory 
      
        PC = 60;   #10;
        PC = 64;   #10;

        #20 $finish;
    end

    initial begin
        $monitor("Time: %0t | PC: %0d | Instruction: 0x%h", $time, PC, Instruction_Code);
    end

endmodule
