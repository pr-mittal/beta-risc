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
    
    output [Mdata-1:0] rd1,rd2;
    input [MAdr-1:0] wrtAdr, rdAdr1, rdAdr2;
    input [Mdata-1:0] wrtData;
    input wrtEnable,clk;
    reg [Mdata-1:0] mem [Mreg-1:0];
    
    always@(posedge clk)
    begin
        //synchronous write
        if(wrtEnable)
            mem[wrtAdr]<=wrtData;
        mem[Mreg-1]<=32'd0;
    end
    initial mem[Mreg-1]=32'd0;
    
    
    //combinational read
    assign rd1=mem[rdAdr1];
    assign rd2=mem[rdAdr2];
    
endmodule
