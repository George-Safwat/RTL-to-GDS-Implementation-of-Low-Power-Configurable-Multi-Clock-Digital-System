module desz(clk, rst_n, deser_en, sampled_bit, p_data);


input clk, rst_n, deser_en, sampled_bit;

output reg [7:0] p_data;


always@(posedge clk or negedge rst_n) begin
if(!rst_n)
p_data<=0;

else begin
    if (deser_en)begin
    p_data<={sampled_bit,p_data[7:1]};
    end
end



end



endmodule