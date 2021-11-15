`timescale 1ns / 1ps

module prescalor_1kHz(
    input sysclk,
    output o_1kHz
    );

    reg [12:0] count=0;
    reg r_1kHz=0;

    always @(posedge sysclk)begin
        if(count >= 6000-1)begin
            count <=0;
            r_1kHz <= ~r_1kHz;
        end
        else begin
            count <= count+1;
        end
    end
    
    assign o_1kHz = r_1kHz; 

endmodule
