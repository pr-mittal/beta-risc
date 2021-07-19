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
`define ADD 4'b0000
`define INC 4'b0001
`define SUB 4'b0010
`define DEC 4'b0011
`define MUL 4'b0100
`define DIV 4'b0101
`define SHL 4'b0110
`define SHR 4'b0111
`define INV 4'b1000
`define AND 4'b1001
`define OR 4'b1010
`define NAND 4'b1011
`define NOR 4'b1100
`define XOR 4'b1101
`define XNOR 4'b1110
`define BUF 4'b1111
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
        `ADD: tmp=operand_1+operand_2;
        `INC: tmp=operand_1+1;
        `SUB: tmp=operand_1-operand_2;
        `DEC: tmp=operand_1-1;
        `MUL: tmp=operand_1*operand_2;
        `DIV: tmp=operand_1/2;
        `SHL: tmp=operand_1<<1'b1;
        `SHR: tmp=operand_1>>1'b1;
        `INV: tmp=~operand_1;
        `AND: tmp=operand_1&operand_2;
        `OR: tmp=operand_1|operand_2;
        `NAND: tmp=~(operand_1&operand_2);
        `NOR: tmp=~(operand_1|operand_2);
        `XOR: tmp=operand_1^operand_2;
        `XNOR: tmp=~(operand_1^operand_2);
        `BUF: tmp=operand_1; 
    endcase
    end
    assign out=(enable)?tmp:32'bz ;
endmodule
