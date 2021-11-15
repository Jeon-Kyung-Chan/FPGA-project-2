`timescale 1ns / 1ps

module prescalor_10Hz(
    input sysclk,
    output o_10Hz
    );

    reg [19:0] count=0;
    reg r_10Hz=0;

    always @(posedge sysclk)begin
        if(count >= 600000-1)begin
            count<=0;
            r_10Hz <= ~r_10Hz;
        end
        else begin
            count<= count+1;
        end
    end

    assign o_10Hz = r_10Hz;

endmodule
