// uart_rx.v
module uart_rx (
    input wire clk,
    input wire rst,
    input wire rx,
    output reg [7:0] rx_data,
    output reg rx_done
);

    reg [3:0] bit_index = 0;
    reg [9:0] rx_shift = 0;
    reg sampling = 0;
    reg [3:0] sample_cnt = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            bit_index <= 0;
            rx_data <= 0;
            rx_done <= 0;
            sampling <= 0;
        end else begin
            if (!sampling && !rx) begin
                sampling <= 1;
                bit_index <= 0;
                sample_cnt <= 0;
            end else if (sampling) begin
                rx_shift[bit_index] <= rx;
                sample_cnt <= sample_cnt + 1;
                if (sample_cnt == 1) begin
                    bit_index <= bit_index + 1;
                    if (bit_index == 9) begin
                        rx_data <= rx_shift[8:1]; // exclude start/stop
                        rx_done <= 1;
                        sampling <= 0;
                    end
                end
            end else begin
                rx_done <= 0;
            end
        end
    end
endmodule
