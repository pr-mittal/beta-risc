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


module mux_3x1(out, in0 , in1, in2 , sel);
    parameter Mbit=32;
    output reg [Mbit-1:0] out;
    input [Mbit-1:0] in0 , in1 ,in2;
    input [1:0]sel;
    
    always @(in0,in1,sel)
    begin
        case(sel)
        2'b00:out=in0;
        2'b01:out=in1;
        2'b10:out=in2;
        default:out=in0;
        endcase
    end
endmodule
