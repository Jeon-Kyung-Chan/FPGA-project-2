`timescale 1ns / 1ps

module TOP_FND_Display(
    input sysclk, i_reset, i_DIP,
    output [7:0] o_fndOut, [3:0] o_fndSelect
    );
    wire w_1kHz;
    prescalor_1kHz uprescalor_1kHz(
        .sysclk(sysclk),
        .o_1kHz(w_1kHz)
    );

    wire [1:0]w_cnt4;
    counter_4 ucounter_4(
        .i_1kHz(w_1kHz),
        .o_cnt_4(w_cnt4)
    );


    decoder_2x4 udecoder_2x4(
        .i_cnt_4(w_cnt4),
        .o_fnd_select(o_fndSelect)
    );
    wire w_10Hz;
    prescalor_10Hz uprescalor_10Hz(
        .sysclk(sysclk),
        .o_10Hz(w_10Hz)
    );
    
    wire [13:0]w_fndcnt;
    stopwatch_counter ustopwatch_counter(
        .i_10Hz(w_10Hz),
        .i_reset(i_reset),
        .i_run_stop(i_DIP),
        .o_fnd_cnt(w_fndcnt)
    );

    wire [3:0] w_BINcnt;
    corder_FND ucorder_FND(
        .i_fnd_cnt(w_fndcnt),
        .i_cnt_4(w_cnt4),
        .o_BIN_cnt(w_BINcnt)
    );


    BIN_to_FND uBIN_to_FND(
        .i_BIN_cnt(w_BINcnt),
        .o_fnd_out(o_fndOut)
    );
endmodule
