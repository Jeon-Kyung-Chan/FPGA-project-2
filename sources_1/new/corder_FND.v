`timescale 1ns / 1ps

module corder_FND(
    input [13:0] i_fndcnt, [1:0] i_cnt4,
    output [3:0] o_BINcnt
    );

    reg [3:0] r_BINcnt;

    always @(i_cnt4)begin
        case(i_cnt4)
            0: r_BINcnt <= i_fndcnt %10; 
            1: r_BINcnt <= i_fndcnt/10 %10;
            2: r_BINcnt <= i_fndcnt/100 %10;
            3: r_BINcnt <= i_fndcnt/1000 %10;
        endcase
    end

    assign o_BINcnt = r_BINcnt;

endmodule