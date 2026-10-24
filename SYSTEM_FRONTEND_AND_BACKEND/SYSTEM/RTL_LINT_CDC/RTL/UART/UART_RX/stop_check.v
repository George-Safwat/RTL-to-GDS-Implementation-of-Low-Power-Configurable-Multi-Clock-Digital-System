module stop_check (clk,rst_n,stp_chk_en,stp_error,sampled_bit,prescale,edge_cnt);

input clk,rst_n,sampled_bit,stp_chk_en;
input [5:0] prescale;
input [4:0] edge_cnt;
output reg stp_error; 

reg [1:0] correct_counter;
reg [1:0] error_counter;

always@(posedge clk or negedge rst_n) begin
if(!rst_n) begin
stp_error<=0;
error_counter<=0;
correct_counter<=0;
    end
else if (!stp_chk_en)
stp_error<=0;

else begin
    if (stp_chk_en && correct_counter==2)begin
    stp_error<=0;
    error_counter<=0;
    correct_counter<=0;
    end
    else if (stp_chk_en && error_counter==2) begin
    stp_error<=1;
    error_counter<=0;
    correct_counter<=0;
    end
    else if (stp_chk_en && sampled_bit && (edge_cnt==(prescale/2) || edge_cnt==(prescale/2)-1 || edge_cnt==(prescale/2)+1))
    correct_counter<=correct_counter+1;
    else if (stp_chk_en && !sampled_bit && (edge_cnt==(prescale/2) || edge_cnt==(prescale/2)-1 || edge_cnt==(prescale/2)+1))
    error_counter<=error_counter+1;
end
end




endmodule