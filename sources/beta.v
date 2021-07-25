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

module beta(irq,clk,e_ALU,reset,start_pc,xAdr,illOp,xp);
    parameter Mbit=32;
    input clk,irq,e_ALU,reset;//irq->interuppt request
    input [Mbit-1:0] start_pc,xAdr,illOp;//address for instruction by PC in case of exceptions 
    input [4:0] xp;//exception pointer address
    //control logic output
    wire [3:0] alufn;//function code in alu
    wire asel,bsel,moe,mwr,ra2sel,wasel,werf;//select a , select b ,memory output enable,memory write , read address select , write address select
    wire [2:0] pcsel;//program counter select
    wire [1:0] wdsel;//write data select
    
    //select PC
    reg [Mbit-1:0] cur_pc;//current program counter
    wire [Mbit-1:0] next_pc;//nect program counter
    reg [Mbit-1:0] pc_add_4,pc_add_c;
    wire [Mbit-1:0] pc_out,JT;//jump to
    
    
    //instruction memory- send pc get instruction
    wire [Mbit-1:0] inst;//instruction
    inst_memory IM(.out(inst),.Adr(cur_pc));
    
    //register file - send ra , rb, write address and get info accrdingly
    wire [4:0] ra2,wa;//read address 2 , write address
    wire [Mbit-1:0] rd1,rd2,wd;//read data 1 , read data 2 , write data
    mux_2x1 #(.Mbit(5)) M2x1_2(.out(ra2), .in0(inst[15:11]) , .in1(inst[25:21]) , .sel(ra2sel));
    mux_2x1 #(.Mbit(5)) M2x1_3(.out(wa), .in0(inst[25:21]) , .in1(xp) , .sel(wasel));
    register_file RF( .rd1(rd1),.rd2(rd2),.wrtAdr(wa),.wrtEnable(werf),.wrtData(wd),.rdAdr1(inst[20:16]), .rdAdr2(ra2),.clk(clk));
    
    //select PC
    assign JT=rd1;
    mux_5x1 M5x1_1(.out(pc_out), .in0(pc_add_4) , .in1(pc_add_c), .in2(JT) , .in3(illOp) , .in4(xAdr), .sel(pcsel));
    mux_2x1 M2x1_1(.out(next_pc),.in0(pc_out) , .in1(start_pc) , .sel(reset));
    
    
   
    //control logic 
    wire Z=~|rd1;//used in BEQ and BNE to decide if the input is 0
    control_logic CONTROL(.alufn(alufn),.asel(asel),.bsel(bsel),.moe(moe),
             .mwr(mwr),.pcsel(pcsel),.ra2sel(ra2sel),.wasel(wasel),.wdsel(wdsel),.werf(werf),.opcode(inst[Mbit-1:Mbit-6]),.Z(Z),.irq(irq));
   
   //arithmetic logic unit
   wire [Mbit-1:0] a,b,Adr;//a(ALU input) , b(ALU input) , adress(ALU output)
    mux_2x1 M2x1_4(.out(a), .in0(rd1) , .in1(pc_add_c) , .sel(asel));
    mux_2x1 M2x1_5(.out(b), .in0(rd2) , .in1({16*{inst[15]},inst[15:0]}) , .sel(bsel));
    alu arithmetic(.out(Adr),.operand_1(a),.operand_2(b),.enable(e_ALU),.command(alufn));
    
    //data memory
    wire [Mbit-1:0] rd;//read data
    data_memory DM(.rd(rd),.Adr(Adr),.wrtData(rd2),.mwr(mwr),.moe(moe),.clk(clk));
    
    
    
    mux_3x1 M3x1(.out(wd), .in0(pc_add_4) , .in1(Adr), .in2(rd) , .sel(wdsel));
    
    //program counter
    always@(posedge clk)
    begin
        cur_pc<=next_pc;
    end
    always@(cur_pc)
    begin
        pc_add_4=cur_pc+4;
        pc_add_c=pc_add_4+{{14{inst[15]}},inst[15:0],2'b00};//PC+4
    end
endmodule
