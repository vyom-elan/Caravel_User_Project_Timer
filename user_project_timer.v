`default_nettype none
module user_proj_timer (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,

    // IOs
    input  [10:0] io_in,
    output [10:0] io_out,
    output [10:0] io_oeb
);

    wire [6:0] seven_seg;
    wire [3:0] digit_en;

    timer timer(
        .clk(wb_clk_i),
        .rst(wb_rst_i),
        .seven_seg(seven_seg),
        .digit_en(digit_en)
    );

    assign io_out = {seven_seg, digit_en};
    assign io_oeb = 11'd0;
    
endmodule

`default_nettype wire
