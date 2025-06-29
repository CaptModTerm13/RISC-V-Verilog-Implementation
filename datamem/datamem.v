module data_memory (
    input clk,
    input MemRead,
    input MemWrite,
    input [31:0] addr,
    input [31:0] write_data,
    output reg [31:0] read_data
);

    // Memory array - 1024 words (4KB)
    // Adjust size as needed for your implementation
    reg [31:0] memory [0:1023];
    
    // Word address (divide by 4 since we're word-aligned)
    wire [9:0] word_addr;
    assign word_addr = addr[11:2]; // Extract bits [11:2] for word addressing
    
    // Initialize memory to zero (optional)
    integer i;
    initial begin
        for (i = 0; i < 1024; i = i + 1) begin
            memory[i] = 32'h00000000;
        end
    end
    
    // Memory operations
    always @(posedge clk) begin
        if (MemWrite) begin
            memory[word_addr] <= write_data;
        end
    end
    
    // Combinational read
    always @(*) begin
        if (MemRead) begin
            read_data = memory[word_addr];
        end else begin
            read_data = 32'h00000000;
        end
    end

endmodule