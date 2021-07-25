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
`include "state_definition.v"
module alu(out,operand_1,operand_2,enable,command);
    parameter Mbit=32;
    output signed [Mbit-1:0] out;
    input signed [Mbit-1:0] operand_1,operand_2;
    input enable;
    input [3:0] command;
    
    reg [Mbit:0] tmp;
    always@(operand_1,operand_2,command)
    begin
    case(command)
        `ADDALU: tmp=operand_1+operand_2;
        `INCALU: tmp=operand_1+1;
        `SUBALU: tmp=operand_1-operand_2;
        `DECALU: tmp=operand_1-1;
        `MULALU: tmp=operand_1*operand_2;
        `DIVALU: tmp=operand_1/2;
        `SHLALU: tmp=operand_1<<operand_2;
        `SHRALU: tmp=operand_1>>operand_2;
        `INVALU: tmp=~operand_1;
        `ANDALU: tmp=operand_1&operand_2;
        `ORALU: tmp=operand_1|operand_2;
        `NANDALU: tmp=~(operand_1&operand_2);
        `NORALU: tmp=~(operand_1|operand_2);
        `XORALU: tmp=operand_1^operand_2;
        `XNORALU: tmp=~(operand_1^operand_2);
        `BUFALU: tmp=operand_1; 
    endcase
    end
    assign out=(enable)?tmp:32'bz ;
endmodule
