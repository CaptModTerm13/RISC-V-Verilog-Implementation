`timescale 1ns/1ps

module pc_tb;

  reg clk;
  reg reset;
  reg PCsrc;
  reg [31:0] ImmExt;

  wire [31:0] PC, PCplus4, PCtarget, PCNext;

  wire [31:0] PCreg;

  // Instantiate modules
  pc pc_instance (.clk(clk), .reset(reset), .PCNext(PCNext), .PCreg(PCreg), .PC(PC));

  PCPlus4 plus4_instance (.PC(PC), .PCplus4(PCplus4));

  PCTarget target_instance (.PC(PC), .ImmExt(ImmExt), .PCtarget(PCtarget));

  PCmux mux_instance (.PCplus4(PCplus4), .PCtarget(PCtarget), .PCsrc(PCsrc), .PCNext(PCNext));

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns clock period
  end

  initial begin
    reset = 1; PCsrc = 0; ImmExt = 32'd16;
    #10;

    reset = 0;
    #10;

    PCsrc = 1; ImmExt = 32'd8;
    #10;

    PCsrc = 0;
    #10;

    PCsrc = 1; ImmExt = 32'd20;
    #10;

    $finish;
  end

  initial begin
    $monitor("Time=%0t | Reset=%b | PC=%h | PCplus4=%h | PCtarget=%h | PCNext=%h | PCsrc=%b",
              $time, reset, PC, PCplus4, PCtarget, PCNext, PCsrc);
  end
  
  initial begin
    $dumpvars();
    $dumpfile("dump.vcd");
    #1500
    $finish;
  end

endmodule
