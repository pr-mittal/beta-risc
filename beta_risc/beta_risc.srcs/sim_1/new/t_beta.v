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
    integer i;
    integer file_id_1,file_id_2;
    reg [Mbit-1:0] key_1,key_2;
    initial 
    begin
        file_id_1=$fopen("C:\\Users\\prana\\OneDrive\\Documents\\GitHub\\beta-risc\\beta_risc\\beta_risc.srcs\\sources_1\\new\\mem\\mem_inst.txt","w");
        file_id_2=$fopen("C:\\Users\\prana\\OneDrive\\Documents\\GitHub\\beta-risc\\beta_risc\\beta_risc.srcs\\sources_1\\new\\mem\\mem_data.txt","w");
        for(i=0;i<2**Mbit;i=i+1)
        begin
            //key_1=mem[i];
            //key_2=mem[i];
            $fwrite(file_id_1,"%b\n",key_1);
            $fwrite(file_id_2,"%b\n",key_2);
        end
        $fclose(file_id_1);
        $fclose(file_id_2);
        #10 $finish;
    end
endmodule
