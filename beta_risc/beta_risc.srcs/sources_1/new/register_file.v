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


module register_file( rd1, rd2, wrtAdr, wrtEnable, wrtData, rdAdr1, rdAdr2,clk);
    
    parameter MAdr=5,Mdata=32,Mreg=2**MAdr;
    
    output reg [MAdr-1:0] rd1,rd2;
    input [MAdr-1:0] wrtAdr, rdAdr1, rdAdr2;
    input [Mdata-1:0] wrtData;
    input wrtEnable,clk;
    reg [Mdata-1:0] mem [Mreg-1:0];
    initial begin mem[Mreg-1]<=32'b0; end
    always@(posedge clk)
    begin
        rd1<=mem[rdAdr1];
        rd2<=mem[rdAdr2];
        if(wrtEnable)
            mem[wrtAdr]<=wrtData;
        mem[Mreg-1]<=32'b0;
    end
endmodule
