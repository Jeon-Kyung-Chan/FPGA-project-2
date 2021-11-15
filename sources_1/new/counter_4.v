`timescale 1ns / 1ps

module counter_4(
    input i_1kHz,
    output [1:0]o_cnt4
    );

    reg [1:0] r_cnt4=0;

    always @(posedge i_1kHz)begin
        r_cnt4 <= (r_cnt4+1) %4;
    end

    assign o_cnt4 = r_cnt4;

endmodule
