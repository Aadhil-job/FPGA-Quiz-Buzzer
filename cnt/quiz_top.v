`timescale 1ns / 1ps


module quiz_top (
    input  wire       clk,
    input  wire [3:0] btn_player,
    input  wire       btn_reset,
    output wire [3:0] led,        
    output wire [3:0] led_ext,    
    output wire       buzzer,
    output wire [6:0] seg,
    output wire       dp,
    output wire [7:0] an
);

    quiz_buzzer u_buzzer (
        .clk        (clk),
        .btn_player (btn_player),
        .btn_reset  (btn_reset),
        .led        (led),
        .buzzer     (buzzer)
    );

    assign led_ext = led;          

    seg_display u_display (
        .winner (led),
        .seg    (seg),
        .dp     (dp),
        .an     (an)
    );

endmodule
