module mux(mux_sel,start_bit,stop_bit,ser_data,parity_bit,tx_out,clk,rst_n);


input [1:0] mux_sel;
input ser_data,start_bit,stop_bit,parity_bit,clk,rst_n;
output reg tx_out;
reg tx_out_int;
//mux
always@(*)begin
case(mux_sel)
2'b00: tx_out_int=start_bit;
2'b01: tx_out_int=stop_bit;
2'b10: tx_out_int=ser_data;
2'b11: tx_out_int=parity_bit;
endcase
end

always@(posedge clk or negedge rst_n)begin
if(!rst_n)
    tx_out<=1'b1;
    else
    tx_out<=tx_out_int;
end
endmodule