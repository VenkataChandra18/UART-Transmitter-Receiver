// uart_tb.v
`timescale 1ns / 1ps

module uart_tb;

    reg clk = 0;
    reg rst = 0;
    reg tx_start = 0;
    reg [7:0] tx_data;
    wire tx;
    wire tx_done;

    wire [7:0] rx_data;
    wire rx_done;

    uart_tx tx_inst (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_done(tx_done)
    );

    uart_rx rx_inst (
        .clk(clk),
        .rst(rst),
        .rx(tx), // loopback
        .rx_data(rx_data),
        .rx_done(rx_done)
    );

    always #5 clk = ~clk; // 100MHz clock

    initial begin
        rst = 1;
        #20;
        rst = 0;
        tx_data = 8'hAB;
        tx_start = 1;
        #10;
        tx_start = 0;
        #200;
        $display("Received data: %h", rx_data);
        $finish;
    end
endmodule
