`timescale 1ns / 1ps

module seg_display #(
    parameter IDLE_DASH = 0
)(
    input  wire [3:0] winner,   
    output reg  [6:0] seg,      
    output wire       dp,       
    output wire [7:0] an        
);

    assign dp = 1'b1;
    assign an = 8'b1111_1110;  

    always @(*) begin
        case (winner)
            4'b0001: seg = 7'b1111001;  
            4'b0010: seg = 7'b0100100;  
            4'b0100: seg = 7'b0110000;  
            4'b1000: seg = 7'b0011001;  
            default: seg = IDLE_DASH ? 7'b0111111 : 7'b1111111;
        endcase
    end

endmodule
