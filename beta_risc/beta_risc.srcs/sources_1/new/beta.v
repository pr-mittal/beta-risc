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
parameter Mbit=31;
module beta(

    );
endmodule
module data_memory(rd,Adr,wrtData,mwr,moe,clk);
    parameter Mbit=32;
    output reg [Mbit-1:0] rd;
    input [Mbit-1:0] Adr,wrtData;
    input mwr,moe,clk;//write enable , read enable , clock
    reg [Mbit-1:0] mem[2**Mbit-1:0];
    always@(posedge clk)
    begin
        if(mwr==1)
            mem[Adr]<=wrtData;
        else
            if(moe==1)
                rd<=mem[Adr];
    end
endmodule
module inst_memory(out,Adr);
    parameter Mbit=32;
    output [Mbit-1:0] out;
    input [Mbit-1:0] Adr;
    reg [Mbit-1:0] mem[2**Mbit-1:0];
    initial
    begin
        
    end
    assign out = mem[Adr];
endmodule
