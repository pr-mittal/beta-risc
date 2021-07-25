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
module control_logic(alufn,asel,bsel,moe,mwr,pcsel,ra2sel,wasel,wdsel,werf,opcode,Z,irq);
    output reg [3:0] alufn;
    output reg asel,bsel,moe,mwr,ra2sel,wasel,werf;
    output reg [1:0] wdsel;
    output reg [2:0] pcsel;
    input [5:0] opcode;
    input Z;
    input irq;
    always@(opcode,Z,irq)
    begin
        if(irq==1'b1)
        begin
            mwr=1'b0;pcsel=3'd4;ra2sel=1'b0;wasel=1'b0;wdsel=2'd1;werf=1'b1;
        end
        else
        begin
            case(opcode)
              `ADDOP   :begin alufn=`ADDALU;asel=1'b0;bsel=1'b0;mwr=1'b0;pcsel=3'd0;ra2sel=1'b0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `ADDCOP  :begin alufn=`ADDALU;asel=1'b0;bsel=1'b1;mwr=1'b0;pcsel=3'd0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `ANDOP   :begin alufn=`ANDALU;asel=1'b0;bsel=1'b0;mwr=1'b0;pcsel=3'd0;ra2sel=1'b0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `ANDCOP  :begin alufn=`ANDALU;asel=1'b0;bsel=1'b1;mwr=1'b0;pcsel=3'd0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `BEQOP   :begin mwr=1'b0;pcsel=Z;wasel=1'b0;wdsel=2'd0;werf=1'b1; end
              `BNEOP   :begin mwr=1'b0;pcsel=~Z;wasel=1'b0;wdsel=2'd0;werf=1'b1; end
              `JMPOP   :begin mwr=1'b0;pcsel=3'd2;wasel=1'b0;wdsel=2'd0;werf=1'b1; end
              `LDOP    :begin alufn=`ADDALU;asel=1'b0;bsel=1'b1;moe=1'b1;mwr=1'b0;pcsel=3'd0;wasel=1'b0;wdsel=2'd2;werf=1'b1; end
              `LDROP   :begin alufn=`BUFALU;asel=1'b1;moe=1'b1;mwr=1'b0;pcsel=3'd0;wasel=1'b0;wdsel=2'd2;werf=1'b1; end
              `MULOP   :begin alufn=`MULALU;asel=1'b0;bsel=1'b0;mwr=1'b0;pcsel=3'd0;ra2sel=1'b0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `MULCOP  :begin alufn=`MULALU;asel=1'b0;bsel=1'b1;mwr=1'b0;pcsel=3'd0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `OROP    :begin alufn=`ORALU;asel=1'b0;bsel=1'b0;mwr=1'b0;pcsel=3'd0;ra2sel=1'b0;wasel=1'd0;wdsel=2'b1;werf=1'b1; end
              `ORCOP   :begin alufn=`ORALU;asel=1'b0;bsel=1'b1;mwr=1'b0;pcsel=3'd0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `SHLOP   :begin alufn=`SHLALU;asel=1'b0;bsel=1'b0;mwr=1'b0;pcsel=3'd0;ra2sel=1'b0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `SHLCOP  :begin alufn=`SHLALU;asel=1'b0;bsel=1'b1;mwr=1'b0;pcsel=3'd0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `SHROP   :begin alufn=`SHRALU;asel=1'b0;bsel=1'b0;mwr=1'b0;pcsel=3'd0;ra2sel=1'b0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `SHRCOP  :begin alufn=`SHRALU;asel=1'b0;bsel=1'b1;mwr=1'b0;pcsel=3'd0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `SUBOP   :begin alufn=`SUBALU;asel=1'b0;bsel=1'b0;mwr=1'b0;pcsel=3'd0;ra2sel=1'b0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `SUBCOP  :begin alufn=`SUBALU;asel=1'b0;bsel=1'b1;mwr=1'b0;pcsel=3'd0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `STOP    :begin alufn=`ADDALU;asel=1'b0;bsel=1'b1;moe=1'b0;mwr=1'b1;pcsel=1'b0;ra2sel=1'b1;werf=1'b0; end
              `XOROP   :begin alufn=`XORALU;asel=1'b0;bsel=1'b0;mwr=1'b0;pcsel=3'd0;ra2sel=1'b0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
              `XORCOP  :begin alufn=`XORALU;asel=1'b0;bsel=1'b1;mwr=1'b0;pcsel=3'd0;wasel=1'b0;wdsel=2'd1;werf=1'b1; end
           endcase
        end
    end
endmodule
