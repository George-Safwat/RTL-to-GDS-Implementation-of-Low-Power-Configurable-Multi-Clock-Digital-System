module parity(p_data,parity_type,data_valid,parity_bit);
parameter WIDTH=8;

input [WIDTH-1:0] p_data;
input parity_type,data_valid;
output reg parity_bit;

always@(*) begin
    if (parity_type == 0)
        parity_bit = ^p_data;      // Even parity
    else
        parity_bit = ~(^p_data);   // Odd parity
end
endmodule