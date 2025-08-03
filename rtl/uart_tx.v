// uart_tx.v
module uart_tx (
    input wire clk,
    input wire rst,
    input wire tx_start,
    input wire [7:0] tx_data,
    output reg tx,
    output reg tx_done
);

    reg [3:0] bit_index = 0;
    reg [9:0] tx_shift = 10'b1111111111;
    reg busy = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx <= 1'b1;
            tx_done <= 0;
            busy <= 0;
            bit_index <= 0;
        end else begin
            if (tx_start && !busy) begin
                tx_shift <= {1'b1, tx_data, 1'b0}; // stop, data, start
                busy <= 1;
                tx_done <= 0;
                bit_index <= 0;
            end else if (busy) begin
                tx <= tx_shift[bit_index];
                bit_index <= bit_index + 1;
                if (bit_index == 9) begin
                    tx_done <= 1;
                    busy <= 0;
                end
            end
        end
    end
endmodule
