module edge_counter (clk,rst_n,edge_cnt,bit_cnt,enable,par_en,prescale);

input clk,rst_n,enable,par_en;
input [5:0] prescale;
output reg [4:0] edge_cnt;
output reg [3:0] bit_cnt;


always@(posedge clk or negedge rst_n) begin
if(!rst_n) begin
edge_cnt<=0;
bit_cnt<=0;
end

else begin
    if(enable && ((bit_cnt!=10 && !par_en) || (bit_cnt!=11 && par_en))) begin
        if(edge_cnt==(prescale-1)) begin
        edge_cnt<=0;
        bit_cnt<=bit_cnt+1;
        end
        else edge_cnt<=edge_cnt+1;
    end
    else begin 
    edge_cnt<=0;
    bit_cnt<=0;
    end
end

end



endmodule