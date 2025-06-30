// ALUControl.v
module ALUControl (
    input  [1:0] ALUOp,
    input  [2:0] funct3,
    input  [6:0] funct7,
    output reg [2:0] ALUControl
);

always @(*) begin
    case (ALUOp)
        2'b00: ALUControl = 3'b000; // lw/sw 
        2'b01: ALUControl = 3'b001; // beq 
        2'b10: begin                // R-type
            case (funct3)
                3'b000: begin
                    if (funct7 == 7'b0000000)
                        ALUControl = 3'b000; // ADD
                    else if (funct7 == 7'b0100000)
                        ALUControl = 3'b001; // SUB
                    else
                        ALUControl = 3'b111;
                end
                3'b111: ALUControl = 3'b010; // AND
                3'b110: ALUControl = 3'b011; // OR
                3'b010: ALUControl = 3'b101; // SLT
                default: ALUControl = 3'b111;
            endcase
        end
        default: ALUControl = 3'b111;
    endcase
end

endmodule
