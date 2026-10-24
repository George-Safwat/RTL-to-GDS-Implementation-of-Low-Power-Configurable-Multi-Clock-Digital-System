module sz(p_data,ser_data,ser_done,ser_en,clk,rst_n);
parameter WIDTH=8;
input [WIDTH-1:0] p_data;
input ser_en, clk, rst_n;
output reg ser_done;
output reg ser_data;
reg [2:0] counter;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        counter<=0;
        ser_done<=0;
        ser_data<=0;
    end
    
    else if(ser_en)begin
        ser_done<=0;
        ser_data<=p_data[counter];
        counter<=counter+1;

        if(counter==WIDTH-1)begin 
        //when counter becomes 8 it will not update in same cycle so we will check for 7 and set ser_done in next cycle
            ser_done<=1;
            counter<=0;
        end
    end
    end




endmodule