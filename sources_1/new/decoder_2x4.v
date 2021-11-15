`timescale 1ns / 1ps

module decoder_2x4(
    input [1:0] i_cnt4,
    output [3:0] o_fndselect
    );

    reg [3:0] r_fndselect=0;

    always @(i_cnt4)begin
        case(i_cnt4)
            0: r_fndselect <= 4'b0001;
            1: r_fndselect <= 4'b0010;
            2: r_fndselect <= 4'b0100;
            3: r_fndselect <= 4'b1000;
        endcase
    end
    
    assign o_fndselect = r_fndselect;

endmodule
