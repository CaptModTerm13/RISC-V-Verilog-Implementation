// Code your design here
module pc (clk, reset, PCNext, PCreg, PC);
  input wire clk, reset; 
  input wire [31:0] PCNext;
  output wire [31:0] PC;
  output reg [31:0] PCreg;
  
  always @ (posedge clk or posedge reset)
    begin
      if (reset == 1)
        PCreg <= 32'h00001000;
      else 
        PCreg <= PCNext;
    end
  assign PC = PCreg;
endmodule
      
module PCmux (PCplus4, PCtarget, PCsrc, PCNext);
  input wire [31:0] PCplus4;
  input wire [31:0] PCtarget; 
  input wire PCsrc;
  output wire [31:0] PCNext;
  
  assign PCNext = PCsrc?PCtarget:PCplus4;
  
endmodule
     
module PCTarget(PC, ImmExt, PCtarget);
  input wire [31:0] PC;
  input wire [31:0] ImmExt;
  output wire [31:0] PCtarget;
  
  assign PCtarget = PC + ImmExt;
  
endmodule
      
module PCPlus4 (PC, PCplus4);
  input wire [31:0] PC;
  output wire [31:0] PCplus4;
  
  assign PCplus4 = PC + 32'd4;
  
endmodule
  
  
        
  
    
        
  
  
        
        
        
