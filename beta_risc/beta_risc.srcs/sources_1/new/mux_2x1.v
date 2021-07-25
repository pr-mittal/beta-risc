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
module mux_2x1(out, in0 , in1 , sel);
    parameter Mbit=32;
    output reg [Mbit-1:0] out;
    input [Mbit-1:0] in0 , in1 ;
    input sel;
    always @(in0,in1,sel)
    begin
        if(sel)
            out<=in1;
        else
            out<=in0;
    end
endmodule
