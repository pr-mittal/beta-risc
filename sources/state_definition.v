`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2021 18:25:34
// Design Name: 
// Module Name: state_definition
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

`define ADDOP 6'h20
`define ADDCOP 6'h30
`define ANDOP 6'h28
`define ANDCOP 6'h38
`define BEQOP 6'h1D
`define BNEOP 6'h1E
`define CMPEQOP 6'h24
`define CMPEQCOP 6'h34
`define CMPLEOP 6'h26
`define CMPLECOP 6'h36
`define CMPLTOP 6'h25
`define CMPLTCOP 6'h35
`define DIVOP 6'h23
`define DIVCOP 6'h33
`define JMPOP 6'h1B
`define LDOP 6'h18
`define LDROP 6'h1F
`define MULOP 6'h22
`define MULCOP 6'h32
`define OROP 6'h29
`define ORCOP 6'h39
`define SHLOP 6'h2C
`define SHLCOP 6'h3C
`define SHROP 6'h2D
`define SHRCOP 6'h3D
`define SRAOP 6'h2E
`define SRACOP 6'h3E
`define SUBOP 6'h21
`define SUBCOP 6'h31
`define STOP 6'h19
`define XOROP 6'h2A
`define XORCOP 6'h3A


`define ADDALU 4'b0000
`define INCALU 4'b0001
`define SUBALU 4'b0010
`define DECALU 4'b0011
`define MULALU 4'b0100
`define DIVALU 4'b0101
`define SHLALU 4'b0110
`define SHRALU 4'b0111
`define INVALU 4'b1000
`define ANDALU 4'b1001
`define ORALU 4'b1010
`define NANDALU 4'b1011
`define NORALU 4'b1100
`define XORALU 4'b1101
`define XNORALU 4'b1110
`define BUFALU 4'b1111