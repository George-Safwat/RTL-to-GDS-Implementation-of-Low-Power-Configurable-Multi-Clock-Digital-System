module sample(clk,rst_n,dat_samp_en,prescale,edge_cnt,rx_in,sampled_bit);

input clk,rst_n,dat_samp_en,rx_in;
input [4:0] edge_cnt;
input [5:0] prescale;
output reg sampled_bit;

always@(posedge clk or negedge rst_n) begin
if(!rst_n)begin
sampled_bit<=1;
end
else begin
    if(dat_samp_en && (edge_cnt==(prescale/2) || edge_cnt==((prescale/2)-2) || edge_cnt==((prescale/2)-1)))//to synchronize with the edge counter(delay)
            sampled_bit<=rx_in;
end
end
endmodule