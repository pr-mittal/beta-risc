`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2021 14:03:27
// Design Name: 
// Module Name: inst_memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module inst_memory(out,Adr);
    parameter Mbit=32;
    output [Mbit-1:0] out;
    input [Mbit-1:0] Adr;//received address tell the byte address
    reg [7:0] mem[2**Mbit-1:0]; //each address is a byte
    initial
    begin
        $readmemb("C:\\Users\\prana\\OneDrive\\Documents\\GitHub\\beta-risc\\beta_risc\\beta_risc.srcs\\sources_1\\new\\mem\\mem_inst.txt",mem);
    end
    assign out = {mem[Adr],mem[Adr+1],mem[Adr+2],mem[Adr+3]};//return 32 bits or 4 bytes
endmodule

