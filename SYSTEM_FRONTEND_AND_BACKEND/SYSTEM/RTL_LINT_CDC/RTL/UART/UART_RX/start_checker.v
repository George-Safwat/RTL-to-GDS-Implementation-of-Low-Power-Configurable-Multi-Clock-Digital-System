module start_check (clk,rst_n,strt_chk_en,strt_glitch,sampled_bit,edge_cnt,prescale);

input clk,rst_n,sampled_bit,strt_chk_en;
input [5:0] prescale;
input [4:0] edge_cnt;
output reg strt_glitch;

reg [1:0] correct_counter;
reg [1:0] error_counter; 


always@(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
    strt_glitch<=0;
    error_counter<=0;
    correct_counter<=0;
    end
    else if(!strt_chk_en)
    strt_glitch<=0;
    else begin
    
    if(strt_chk_en && correct_counter==2) begin
        strt_glitch<=0;
        error_counter<=0;
        correct_counter<=0;
    end
    else if(strt_chk_en && error_counter==2) begin
        strt_glitch<=1;
        error_counter<=0;
        correct_counter<=0;
    end
    else if (strt_chk_en && sampled_bit==0 && (edge_cnt==(prescale/2) || edge_cnt==(prescale/2)-1 || edge_cnt==(prescale/2)+1))
    correct_counter<=correct_counter+1;
    else if (strt_chk_en && sampled_bit==1  && (edge_cnt==(prescale/2) || edge_cnt==(prescale/2)-1 || edge_cnt==(prescale/2)+1) )
    error_counter<=error_counter+1;
    end

end
endmodule