module fsm (clk,rst_n,rx_in,edge_cnt,bit_cnt,par_en,par_err,strt_glitch,
stp_error,enable,data_valid,deser_en,stp_chk_en,
strt_chk_en,par_chk_en,dat_samp_en,prescale);

parameter IDLE = 3'b000;
parameter START_CHECK = 3'b001;
parameter DATA_CHECK = 3'b010;
parameter PAR_CHECK = 3'b011;
parameter STOP_CHECK = 3'b100;




input clk, rst_n, rx_in, par_en,par_err, strt_glitch,stp_error;
input [5:0] prescale;
input [3:0] bit_cnt;
input [4:0] edge_cnt;
output reg enable, data_valid, deser_en,
stp_chk_en, strt_chk_en, par_chk_en, dat_samp_en;

reg [2:0] cs,ns;

//NEXT state 
always@(posedge clk or negedge rst_n) begin
if(!rst_n)
cs <= IDLE;
else
cs<=ns;
end


always@(*) begin

//Default values
ns=IDLE;
enable=0;
data_valid=0;
par_chk_en=0;
stp_chk_en=0;
strt_chk_en=0;
deser_en=0;
dat_samp_en=0;

//STATES
case(cs)

IDLE: begin

enable=0;
data_valid=0;

strt_chk_en=0;
par_chk_en=0;
stp_chk_en=0;

deser_en=0;
dat_samp_en=0;


if(rx_in==0 && stp_error==0) begin
    ns=START_CHECK;
    enable=1;
    deser_en=0;
    dat_samp_en=1;
    strt_chk_en=1;
    end
    else begin 
    ns=IDLE;
    enable=0;
    end

end

START_CHECK: begin
    enable=1;
    data_valid=0;
    dat_samp_en=1;
    strt_chk_en=1;
    par_chk_en=0;
    if(strt_glitch || bit_cnt!=0)begin //if par_en=0 and frame has parity
            ns=IDLE;
            enable=0;
    end
    else begin
            if(edge_cnt==(prescale-1)) begin
                ns=DATA_CHECK;
                stp_chk_en=0;
                strt_chk_en=0;
                deser_en=0;
            end
            else ns=START_CHECK;
            end
    end




DATA_CHECK: begin
enable=1;
dat_samp_en=1;
par_chk_en=0;
stp_chk_en=0;

    if(bit_cnt==9) begin
        if(par_en==1) begin
            ns=PAR_CHECK;
            par_chk_en=1;
            deser_en=0;
        end
        else begin
            ns=STOP_CHECK;
            deser_en=0;
            stp_chk_en=1;
            par_chk_en=0;
            end
    end

    else begin
        if(edge_cnt==(prescale/2)) begin
        ns=DATA_CHECK;
        deser_en=1;
        end
        else begin 
        deser_en=0;
        ns=DATA_CHECK;
        end
    end
end

PAR_CHECK: begin

    enable=1;
    dat_samp_en=1;
    deser_en=0;
    par_chk_en=1;
if(par_err) begin
    ns=IDLE;
    enable=0;

end
else begin    
    if(bit_cnt==10) begin
        ns=STOP_CHECK;
        stp_chk_en=1;
        deser_en=0;
        par_chk_en=0;
    end
    else begin 
    ns=PAR_CHECK;//waits until 8 edges come
    par_chk_en=1;
    end
end
end

STOP_CHECK: begin

enable=1;
dat_samp_en=1;
stp_chk_en=1;
strt_chk_en=0;
par_chk_en=0;
if(stp_error )begin
    ns=IDLE;
    enable=0;
end
else begin
    
    if(par_en==1) begin
        if(edge_cnt==0 && bit_cnt==11) begin
            // frame done: only chain into a new start check if the line is already low
            data_valid=1;
            stp_chk_en=0;
            if(rx_in==0) begin
                ns=START_CHECK;
                strt_chk_en=1;
                enable=1;
                dat_samp_en=1;
            end
            else begin
                ns=IDLE;
                enable=0;
            end
            end
        else ns=STOP_CHECK;
        end
    else begin
        if(edge_cnt==0 && bit_cnt==10 ) begin
            data_valid=1;
            stp_chk_en=0;
            if(rx_in==0) begin
                ns=START_CHECK;
                strt_chk_en=1;
                enable=1;
                dat_samp_en=1;
            end
            else begin
                ns=IDLE;
                enable=0;
            end
        end
        else begin
        ns=STOP_CHECK;
        stp_chk_en=1;
        end
        end
end


end

endcase
end

endmodule