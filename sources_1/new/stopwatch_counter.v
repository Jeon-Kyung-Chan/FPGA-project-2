`timescale 1ns / 1ps

module stopwatch_counter(
    input i_10Hz, i_reset, i_runstop,
    output [13:0] o_fndcnt
    );

    reg [3:0] r_hms=0;
    reg [5:0] r_sec=0;
    reg [3:0] r_min=0;  

    always @(posedge i_10Hz or negedge i_reset)begin
        if(!i_reset)begin
            r_hms<=0;
            r_min<=0;
            r_sec<=0;
        end
        else begin
            if(i_runstop)begin
                if(r_hms>=9)begin
                    r_hms<=0;
                    r_sec <= r_sec+1;
                    if(r_sec >= 60) begin
                        r_sec <=0;
                        r_min <= r_min +1;
                        if(r_min >= 9)begin
                            r_min<=0;
                        end
                    end
                end
                else begin
                    r_hms<= r_hms+1;
                end
            end
        end
    end

    assign  o_fndselect = r_min*1000+r_sec*10+r_hms;

endmodule
