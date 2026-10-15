`timescale 1ns / 1ps
module quiz_buzzer #(
    parameter CLK_HZ     = 100_000_000,
    parameter TONE_HZ    = 1000,
    parameter BEEP_MS    = 500,
    parameter DEBOUNCE_MS = 20,
    parameter IDLE_HIGH  = 1   
)(
    input  wire       clk,
    input  wire [3:0] btn_player,   
    input  wire       btn_reset,    
    output reg  [3:0] led,          
    output reg        buzzer        
);

    localparam TONE_HALF   = CLK_HZ / (2 * TONE_HZ);
    localparam BEEP_CYCLES = (CLK_HZ / 1000) * BEEP_MS;
    localparam DB_CYCLES   = (CLK_HZ / 1000) * DEBOUNCE_MS;


    reg [3:0] s1 = 0, s2 = 0, s3 = 0;
    always @(posedge clk) begin
        s1 <= btn_player;
        s2 <= s1;
        s3 <= s2;
    end
    wire [3:0] press = s2 & ~s3;

 
    reg r1 = 0, r2 = 0, r_stable = 0, r_prev = 0;
    reg [$clog2(DB_CYCLES+1)-1:0] db_cnt = 0;
    always @(posedge clk) begin
        r1 <= btn_reset;
        r2 <= r1;
        if (r2 == r_stable)
            db_cnt <= 0;
        else begin
            db_cnt <= db_cnt + 1;
            if (db_cnt == DB_CYCLES) begin
                r_stable <= r2;
                db_cnt   <= 0;
            end
        end
        r_prev <= r_stable;
    end
    wire reset_pulse = r_stable & ~r_prev;


    reg [$clog2(BEEP_CYCLES+1)-1:0] beep_cnt = 0;
    initial led = 4'b0000;

    always @(posedge clk) begin
        if (reset_pulse) begin
            led      <= 4'b0000;
            beep_cnt <= 0;
        end else begin
            if (led == 4'b0000 && (|press)) begin
                // Simultaneous presses in the same clock: lowest index wins
                casez (press)
                    4'b???1: led <= 4'b0001;
                    4'b??10: led <= 4'b0010;
                    4'b?100: led <= 4'b0100;
                    default: led <= 4'b1000;
                endcase
                beep_cnt <= BEEP_CYCLES;
            end else if (beep_cnt != 0) begin
                beep_cnt <= beep_cnt - 1;
            end
        end
    end


    reg [$clog2(TONE_HALF+1)-1:0] tone_cnt = 0;
    initial buzzer = IDLE_HIGH;
    always @(posedge clk) begin
        if (beep_cnt != 0) begin
            if (tone_cnt == TONE_HALF - 1) begin
                tone_cnt <= 0;
                buzzer   <= ~buzzer;
            end else
                tone_cnt <= tone_cnt + 1;
        end else begin
            tone_cnt <= 0;
            buzzer   <= IDLE_HIGH;
        end
    end

endmodule
