`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2021 10:29:48
// Design Name: 
// Module Name: alu
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
module data_memory(rd,Adr,wrtData,mwr,moe,clk);
    parameter Mbit=32;
    parameter size=1024;
    output [Mbit-1:0] rd;
    input [Mbit-1:0] Adr,wrtData;//received address tell the byte address
    input mwr,moe,clk;//write enable , read enable , clock
    reg [7:0] mem[size-1:0];// each address is a byte 
    
    initial
    begin
        $readmemb("C:\\Users\\prana\\OneDrive\\Documents\\GitHub\\beta-risc\\beta_risc\\beta_risc.srcs\\sources_1\\new\\mem\\mem_data.txt",mem);
    end
    always@(posedge clk)
    begin
        //synchronous write
        if(mwr==1)
            {mem[Adr],mem[Adr+1],mem[Adr+2],mem[Adr+3]}<=wrtData;//return 32 bits or 4 bytes
    end
    //asynchronous read
    assign rd=moe?{mem[Adr],mem[Adr+1],mem[Adr+2],mem[Adr+3]}:32'bz;//return 32 bits or 4 bytes
endmodule
