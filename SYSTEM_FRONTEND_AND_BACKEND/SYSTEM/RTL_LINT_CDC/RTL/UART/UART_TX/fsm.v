module FSM(mux_sel,data_valid, parity_en, ser_en,ser_done,clk,rst_n, busy);

parameter IDLE=3'b000;
parameter SER_START=3'b001;
parameter SERIAL_DATA=3'b010;
parameter PARITY=3'b011;
parameter SER_STOP=3'b100;



input data_valid,ser_done,parity_en,clk,rst_n;
output reg ser_en,busy;
output reg [1:0] mux_sel;

reg [2:0] cs,ns;
//next state logic(sequential)
always@(posedge clk or negedge rst_n) begin
if(!rst_n)
    cs<=IDLE;
    else
    cs<=ns;
end

//output logic(combinational)
always@(*)begin
    // DEFAULT VALUES
    ns      = IDLE;
    ser_en  = 1'b0;
case (cs)
IDLE: begin
    mux_sel=2'b01; //tx_out=reset=1
    busy=0;
    ser_en=0;
    if(data_valid)begin
        ns=SER_START;
    end
        else begin  
        ns=IDLE;
        end
end

SER_START: begin 
    mux_sel=2'b00; //tx_out=start_bit=0
    ser_en=1;
    busy=1;
    ns=SERIAL_DATA;
end

SERIAL_DATA:begin
    mux_sel=2'b10; //tx_out=ser_data= first bit of p_data
    busy=1;
    ser_en=1;
    if(ser_done && !parity_en)begin
    ns=SER_STOP;
    ser_en=0;
    end
    else if(ser_done && parity_en) begin
    ns=PARITY;
    ser_en=0;
    end
    else begin 
    ns=SERIAL_DATA;
    ser_en=1;
    end
end

PARITY:begin
    mux_sel=2'b11;
    busy=1;  
    ser_en=0;
    ns=SER_STOP;
end

SER_STOP:begin
    ns=IDLE;
    mux_sel=2'b01;
    busy=1;
    ser_en=0;
end
default:begin 
    ns = IDLE;
    ser_en=0;
    busy=0;
    mux_sel=2'b01;
end
endcase

end





endmodule