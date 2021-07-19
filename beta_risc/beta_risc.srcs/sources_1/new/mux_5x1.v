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


module mux_5x1(out, in0 , in1, in2 , in3 , in4, sel);
    parameter Mbit=32;
    output reg [Mbit-1:0] out;
    input [Mbit-1:0] in0 , in1 ,in2 , in3 , in4;
    input [2:0]sel;
    
    always @(in0,in1,sel)
    begin
        case(sel)
        3'b000:out=in0;
        3'b001:out=in1;
        3'b010:out=in2;
        3'b011:out=in3;
        3'b100:out=in4;
        default:out=in0;
        endcase
    end
endmodule
