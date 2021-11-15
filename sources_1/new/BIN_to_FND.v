`timescale 1ns / 1ps

module BINtoFND(
    input [3:0] i_BINcnt,
    output [7:0] o_fndout
    );

    reg [7:0] r_fndout;

    always @(i_BINcnt)begin
        case(i_BINcnt)
            0: r_fndout <= ~8'b11111100;
            1: r_fndout <= ~8'b01100000;
            2: r_fndout <= ~8'b11011010;
            3: r_fndout <= ~8'b11110010;
            4: r_fndout <= ~8'b01100110;
            5: r_fndout <= ~8'b10110110;
            6: r_fndout <= ~8'b10111110;
            7: r_fndout <= ~8'b11100100;
            8: r_fndout <= ~8'b11111110;
            9: r_fndout <= ~8'b11110110;
        endcase   
    end

    assign o_fndout = r_fndout;
    
endmodule