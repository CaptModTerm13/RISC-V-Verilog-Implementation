// Code your design here
module RegisterFile (
    input         clk,
    input         RegWrite,
    input  [4:0]  rs1,
    input  [4:0]  rs2,
    input  [4:0]  rd,
    input  [31:0] wd,
    output [31:0] rd1,
    output [31:0] rd2
);

    // Declare 32 registers of 32 bits
    reg [31:0] regs [31:0];

    // Read ports (asynchronous)
    assign rd1 = (rs1 == 5'd0) ? 32'd0 : regs[rs1];
    assign rd2 = (rs2 == 5'd0) ? 32'd0 : regs[rs2];

    // Write port (synchronous)
    always @(posedge clk) begin
        if (RegWrite && rd != 5'd0) begin
            regs[rd] <= wd;
        end
    end

endmodule