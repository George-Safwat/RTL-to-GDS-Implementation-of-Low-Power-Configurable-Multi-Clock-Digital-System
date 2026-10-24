module uart_top(p_data,data_valid,parity_type,parity_en,clk,rst_n,tx_out,busy);
parameter DATA_WIDTH = 8;
input [DATA_WIDTH-1:0] p_data;
input data_valid,parity_type,parity_en,clk,rst_n;
output tx_out,busy;

wire ser_data,ser_done,parity_bit,ser_en;

// Latch the FIFO word when a frame starts: the FIFO read pointer advances
// while the frame is still being shifted out, so p_data must not be used live.
reg [DATA_WIDTH-1:0] data_reg;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        data_reg <= {DATA_WIDTH{1'b0}};
    else if(data_valid && !busy)
        data_reg <= p_data;
end
wire [1:0] mux_sel;


sz m1(.p_data(data_reg),.ser_data(ser_data),.ser_done(ser_done),.ser_en(ser_en),.clk(clk),.rst_n(rst_n));
FSM m2(.mux_sel(mux_sel),.data_valid(data_valid),.parity_en(parity_en),.ser_en(ser_en),.ser_done(ser_done),.clk(clk),.rst_n(rst_n),.busy(busy));
parity m3(.p_data(data_reg),.parity_type(parity_type),.data_valid(data_valid),.parity_bit(parity_bit));
mux m4(.mux_sel(mux_sel), .start_bit(1'b0),.stop_bit(1'b1),.ser_data(ser_data),.parity_bit(parity_bit),.tx_out(tx_out),.clk(clk),.rst_n(rst_n));


endmodule