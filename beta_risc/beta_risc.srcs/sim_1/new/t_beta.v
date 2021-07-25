`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2021 16:23:35
// Design Name: 
// Module Name: t_beta
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


module t_beta(

    );
    parameter Mbit=32;
    parameter size=1024;
    integer i;
    //file I/O
    integer file_id_1,file_id_2;
    reg [7:0] key_1,key_2;
    
    //Beta-ALU
    reg clk,irq=1'b0,e_ALU=1'b1,reset;
    reg [Mbit-1:0] start_pc=32'b0,xAdr=32'd0,illOp=32'b0;//address for instruction by PC in case of exceptions 
    reg [4:0] xp=5'd30;
//    reg [31:0] inst=32'b01110111111111111111111111111100;
    beta B(irq,clk,e_ALU,reset,start_pc,xAdr,illOp,xp);
    initial
    begin
//        $display("%b",{{14{inst[15]}},inst[15:0],2'b00});
        clk=1'b0;
        #10 clk=1'b1;
        forever
            begin
                #10 clk=~clk;
                if(clk==0)
                begin
                    $display("Register File %d\n",B.RF.mem[0]);
                    $display("%d\n",B.RF.mem[1]);
                    $display("%d\n",B.RF.mem[2]);
                    
                end
            end
    end
    initial
    begin reset=1'b1;#20 reset=1'b0;
    #350
    $display("Data memory %d\n",{B.DM.mem[0],B.DM.mem[1],B.DM.mem[2],B.DM.mem[3]});
    $display("%d\n",{B.DM.mem[4],B.DM.mem[5],B.DM.mem[6],B.DM.mem[7]});
    $display("%d\n",{B.DM.mem[8],B.DM.mem[9],B.DM.mem[10],B.DM.mem[11]});
    write_to_txt();
    $finish; 
    end
    
    task write_to_txt();
    begin      
        file_id_1=$fopen("C:\\Users\\prana\\OneDrive\\Documents\\GitHub\\beta-risc\\beta_risc\\beta_risc.srcs\\sources_1\\new\\mem\\mem_inst.txt","w");
        file_id_2=$fopen("C:\\Users\\prana\\OneDrive\\Documents\\GitHub\\beta-risc\\beta_risc\\beta_risc.srcs\\sources_1\\new\\mem\\mem_data.txt","w");
        for(i=0;i<size;i=i+1)
        begin
            key_1=B.IM.mem[i];
            key_2=B.DM.mem[i];
            $fwrite(file_id_1,"%b\n",key_1);
            $fwrite(file_id_2,"%b\n",key_2);
        end
        $fclose(file_id_1);
        $fclose(file_id_2);
    end
    endtask
endmodule
