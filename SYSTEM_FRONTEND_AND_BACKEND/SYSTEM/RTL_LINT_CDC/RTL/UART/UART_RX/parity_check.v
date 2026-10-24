module parity_check(clk,rst_n,par_chk_en,par_err,sampled_bit,par_type,edge_cnt,prescale,bit_cnt);

input clk, rst_n, par_chk_en,sampled_bit,par_type;
input [3:0] bit_cnt;
input [5:0] prescale;
input [4:0] edge_cnt;
output reg par_err;
reg [7:0] data;
reg [1:0] correct_counter;
reg [1:0] error_counter;

always@(posedge clk or negedge rst_n) begin
if(!rst_n )begin
par_err<=0;
error_counter<=0;
    correct_counter<=0;
    data<=0;
    end

else if (!par_chk_en && (edge_cnt==(prescale/2) && (bit_cnt!=0 && bit_cnt!=9 && bit_cnt!=10)))begin
    data<= {sampled_bit,data[7:1]};
    par_err<=0;
end
else begin
    if(par_chk_en && correct_counter==2)//ODD_OR_EVEN_CORRECT
    begin
    par_err<=0;
    correct_counter<=0;
    error_counter<=0;
    end
    else if(par_chk_en  && error_counter==2)//EVEN_ERROR
    begin
    par_err<=1;
     correct_counter<=0;
    error_counter<=0;
    end
    else if(par_chk_en && ( (!par_type && sampled_bit!=^data) || (par_type && sampled_bit!=~(^data))) && (edge_cnt==(prescale/2) || edge_cnt==(prescale/2)-1 || edge_cnt==(prescale/2)+1) ) //EVEN_ODD_ERROR_COUNTER
    error_counter<=error_counter+1;
    else if(par_chk_en && ( (!par_type && sampled_bit==^data) || (par_type && sampled_bit==~(^data))) && (edge_cnt==(prescale/2) || edge_cnt==(prescale/2)-1 || edge_cnt==(prescale/2)+1)) //EVEN_ODD_ERROR_COUNTER
    correct_counter<=correct_counter+1;


end
end

endmodule