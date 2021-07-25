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
    
    output [Mdata-1:0] rd1,rd2;//read data 1 , read data 2
    input [MAdr-1:0] wrtAdr, rdAdr1, rdAdr2;//write address , read address 1, read address 2
    input [Mdata-1:0] wrtData;//write data
    input wrtEnable,clk;//write enable , clock
    reg [Mdata-1:0] mem [Mreg-1:0];//memory
    
    always@(posedge clk)
    begin
        //synchronous write
        if(wrtEnable)
            mem[wrtAdr]<=wrtData;
        mem[Mreg-1]<=32'd0;//mem 31 has always to be 0
    end
    initial mem[Mreg-1]=32'd0;
    
    
    //combinational read
    assign rd1=mem[rdAdr1];
    assign rd2=mem[rdAdr2];
    
endmodule
