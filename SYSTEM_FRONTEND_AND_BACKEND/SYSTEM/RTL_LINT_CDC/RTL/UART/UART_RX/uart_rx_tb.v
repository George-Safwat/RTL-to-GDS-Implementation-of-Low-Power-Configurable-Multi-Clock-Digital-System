module uart_rx_tb;

    // =========================================================
    // DUT Signals
    // =========================================================

    reg         clk_tb;
    reg         rst_n_tb;
    reg         par_en_tb;
    reg         rx_in_tb;
    reg [5:0]   prescale_tb;
    reg         par_type_tb;

    wire        data_valid_tb;
    wire [7:0]  p_data_tb;
    reg [0:10] frame_parity;
    reg [0:9] frame;
    integer i,j;
real clk_period;
    parameter FREQ1=115.2 *(10**3)*8 ;
    parameter FREQ2=115.2 *(10**3)*16;
    parameter FREQ3=115.2 *(10**3)*32;
    parameter CLK_NS1=(1/(FREQ1))*(10**9);
    parameter CLK_NS2=(1/(FREQ2))*(10**9);
    parameter CLK_NS3=(1/(FREQ3))*(10**9);
    


    // =========================================================
    // DUT
    // =========================================================

    uart_rx_top DUT (
        .clk        (clk_tb),
        .rst_n      (rst_n_tb),
        .par_en     (par_en_tb),
        .rx_in      (rx_in_tb),
        .prescale   (prescale_tb),
        .par_type   (par_type_tb),
        .data_valid (data_valid_tb),
        .p_data     (p_data_tb)
    );


    // =========================================================
    // Clock Generation
    // =========================================================

    initial begin
        clk_period=CLK_NS1;
        clk_tb =0;
        forever #(clk_period/2) clk_tb = ~clk_tb;
        end
       


    // =========================================================
    // Reset Task
    // =========================================================

    task reset_dut;
        begin
            rst_n_tb = 1'b0;
            rx_in_tb = 1'b1;

            @(negedge clk_tb);
    
            if(data_valid_tb==0 && p_data_tb==0)
                $display("RESET PASSED: rst_n = %b, data_valid = %b, p_data = %b", rst_n_tb, data_valid_tb, p_data_tb);
            else  $display("RESET FAILED: rst_n = %b, data_valid = %b, p_data = %b", rst_n_tb, data_valid_tb, p_data_tb);

            rst_n_tb = 1'b1;       
        
        end
    endtask

    task frame_no_parity;
        begin
        frame=10'b0110011011;//data=8'b11001101
            for(i=0;i<10; i=i+1)begin
                rx_in_tb=frame[i];
                repeat (prescale_tb) @(negedge clk_tb);
            end
            
            if(p_data_tb!={frame[8], frame[7], frame[6], frame[5],frame[4], frame[3], frame[2], frame[1]})begin
                $display("Frame Test failed frame=%b P_data=%b",frame,p_data_tb);
                $stop;    
            end
            else $display("Frame Test Passed frame=%b P_data=%b",frame,p_data_tb);
        end
    endtask

    task frame_with_parity_odd;
    begin
                frame_parity=11'b01100110101;//data=8'b11001101 odd parity bit=0
            for(i=0;i<11; i=i+1)begin
                rx_in_tb=frame_parity[i];
                repeat (prescale_tb) @(negedge clk_tb);
            end
             @(negedge clk_tb);
            
            if(p_data_tb!={frame_parity[8], frame_parity[7], frame_parity[6], frame_parity[5],frame_parity[4], frame_parity[3],frame_parity[2] ,frame_parity[1]})begin
                $display("Frame with odd parity Test failed frame_parity=%b P_data=%b",frame_parity,p_data_tb);
                $stop;    
            end
            else $display("Frame with odd parity Test Passed frame_parity=%b P_data=%b",frame_parity,p_data_tb);
    end
    endtask

    task random_correct_frame;
    begin
        frame[0]=0;
        frame[9]=1;
        frame[1:8]=$random;
         for(i=0;i<10; i=i+1)begin
                rx_in_tb=frame[i];
                repeat (prescale_tb) @(negedge clk_tb);
            end
            
            if(p_data_tb!={frame[8], frame[7], frame[6], frame[5],frame[4], frame[3], frame[2], frame[1]})begin
                $display("Random Frame Test failed frame=%b P_data=%b",frame,p_data_tb);
                $stop;    
            end
            else $display("Random Frame Test Passed frame=%b P_data=%b",frame,p_data_tb);


    end
    endtask

    task frame_error_start_no_parity;
    begin
        frame[0]=0;
        frame[9]=1;
        frame[1:8]=$random;
                rx_in_tb=frame[0];
                
                for(j=0; j<prescale_tb; j=j+1)begin //prescale clock cycles
                if(j==1) begin 
                frame[0]=1;
                rx_in_tb=frame[0];
                end
                 @(negedge clk_tb);
                end
        frame[0]=0;
        frame[9]=1;
        frame[1:8]=$random;
            for(i=0;i<10; i=i+1)begin
                rx_in_tb=frame[i];
                repeat (prescale_tb) @(negedge clk_tb);
            end        
            
            
            if(p_data_tb!={frame[8], frame[7], frame[6], frame[5],frame[4], frame[3], frame[2], frame[1]})begin
                $display("Random Frame ERROR start no parity Test failed frame=%b P_data=%b",frame,p_data_tb);
                $stop;    
            end
            else $display("Random Frame ERROR start no parity Test Passed frame=%b P_data=%b",frame,p_data_tb);
    end
    endtask

    task frame_error_start_with_parity;
    begin
        //odd parity with 0 parity bit
        frame_parity[0]=0;
        frame_parity[9]=0;
        frame_parity[10]=1;
        frame_parity[1:8]=8'b11001101;
                rx_in_tb=frame_parity[0];
                
                for(j=0; j<p_data_tb; j=j+1)begin
                if(j==1) begin 
                frame_parity[0]=1;
                rx_in_tb=frame_parity[0];
                end
                 @(negedge clk_tb);
                end
        frame_parity[0]=0;
        frame_parity[9]=1;
        frame_parity[1:8]=$random;
            for(i=0;i<11; i=i+1)begin
                rx_in_tb=frame_parity[i];
                repeat (prescale_tb) @(negedge clk_tb);
            end        
            
            
            if(p_data_tb!={frame_parity[8], frame_parity[7], frame_parity[6], frame_parity[5],frame_parity[4], frame_parity[3],frame_parity[2] ,frame_parity[1]})begin
                $display("frame_error_start_with_parity Test failed frame_parity=%b P_data=%b",frame_parity,p_data_tb);
                $stop;    
            end
            else $display("frame_error_start_with_parity Test Passed frame_parity=%b P_data=%b",frame_parity,p_data_tb);
    end
    endtask

    task frame_error_stop;
    begin

        frame[0]=0;
        frame[9]=1;
        frame[1:8]=$random;
            for(i=0;i<10; i=i+1)begin
                rx_in_tb=frame[i];
               for(j=0; j<prescale_tb; j=j+1)begin
                if(j==1 && i==9) begin 
                frame[9]=0;
                rx_in_tb=frame[9];
                end
                 @(negedge clk_tb);
                end
            end 
           
        frame[0]=0;
        frame[9]=1;
        frame[1:8]=$random;
            for(i=0;i<10; i=i+1)begin
                rx_in_tb=frame[i];
                repeat (prescale_tb) @(negedge clk_tb);
            end            
            
            
            if(p_data_tb!={frame[8], frame[7], frame[6], frame[5],frame[4], frame[3], frame[2], frame[1]})begin
                $display("Random frame_error_stop Test failed frame=%b P_data=%b",frame,p_data_tb);
                $stop;    
            end
            else $display("Random frame_error_stop Test Passed frame=%b P_data=%b",frame,p_data_tb);
    end
    endtask

    task frame_parity_error;
    begin
       frame_parity=11'b01100110101;//data=8'b11001101 odd parity bit=0
            for(i=0;i<11; i=i+1)begin
                rx_in_tb=frame_parity[i];
                for(j=0; j<prescale_tb; j=j+1)begin
                if(j==1 && i==9) begin 
                frame_parity[9]=1;
                rx_in_tb=frame_parity[9];
                end
                 @(negedge clk_tb);
                end
            end
            frame_parity=11'b01100110101;//data=8'b11001101 odd parity bit=0
            for(i=0;i<11; i=i+1)begin
                rx_in_tb=frame_parity[i];
                repeat (prescale_tb) @(negedge clk_tb);
            end
             @(negedge clk_tb);

            if(p_data_tb!={frame_parity[8], frame_parity[7], frame_parity[6], frame_parity[5],frame_parity[4], frame_parity[3],frame_parity[2] ,frame_parity[1]})begin
                $display("Frame with odd parity ERROR Test failed frame_parity=%b P_data=%b",frame_parity,p_data_tb);
                $stop;    
            end
            else $display("Frame with odd parity ERROR Test Passed frame_parity=%b P_data=%b",frame_parity,p_data_tb); 
    end
    endtask

initial begin
prescale_tb=8;
par_en_tb=1;
par_type_tb=1;
reset_dut;
frame_no_parity;
reset_dut;
par_en_tb=1;
par_type_tb=1;//ODD
frame_with_parity_odd;
par_en_tb=0;
par_type_tb=0;
//CONSECUTIVE frames test
frame_no_parity;
reset_dut;
repeat(10) begin 
random_correct_frame;
@(negedge clk_tb); 
end
//start checker test
frame_error_start_no_parity;
par_en_tb=1;
par_type_tb=1;
frame_error_start_with_parity;
reset_dut;
//stop checker test
par_en_tb=0;
par_type_tb=0;
frame_error_stop;
@(negedge clk_tb);
//parity checker 
par_en_tb=1;
par_type_tb=1;
frame_parity_error;
reset_dut;

$display("--------------------------PRESCALE 16--------------------");
//PRESCALE 16
clk_period=CLK_NS2;
prescale_tb=16;
par_en_tb=1;
par_type_tb=1;
reset_dut;
frame_no_parity;
reset_dut;
par_en_tb=1;
par_type_tb=1;//ODD
frame_with_parity_odd;
par_en_tb=0;
par_type_tb=0;
//CONSECUTIVE frames test
frame_no_parity;
reset_dut;
repeat(10) begin 
random_correct_frame;
@(negedge clk_tb); 
end
//start checker test
frame_error_start_no_parity;
par_en_tb=1;
par_type_tb=1;
frame_error_start_with_parity;
reset_dut;
//stop checker test
par_en_tb=0;
par_type_tb=0;
frame_error_stop;
@(negedge clk_tb);
//parity checker 
par_en_tb=1;
par_type_tb=1;
frame_parity_error;
reset_dut;

$display("--------------------------PRESCALE 32--------------------");
clk_period=CLK_NS3;
//PRESCALE 32
prescale_tb=32;
par_en_tb=1;
par_type_tb=1;
reset_dut;
frame_no_parity;
reset_dut;
par_en_tb=1;
par_type_tb=1;//ODD
frame_with_parity_odd;
par_en_tb=0;
par_type_tb=0;
//CONSECUTIVE frames test
frame_no_parity;
reset_dut;
repeat(10) begin 
random_correct_frame;
@(negedge clk_tb); 
end
//start checker test
frame_error_start_no_parity;
par_en_tb=1;
par_type_tb=1;
frame_error_start_with_parity;
reset_dut;
//stop checker test
par_en_tb=0;
par_type_tb=0;
frame_error_stop;
@(negedge clk_tb);
//parity checker 
par_en_tb=1;
par_type_tb=1;
frame_parity_error;
$stop;
end

initial begin

    $display("==================================================================================================================================================================");
    $display("|  TIME  | RST | RX | CS | NS | PAR_EN | PAR_TYPE | STRT_EN | STRT_GL | PAR_CHK_EN | PAR_ERR | STP_CHK_EN | STP_ERR | DATA_VALID   |    FRAME    | FRAME_PARITY |  P_DATA  |");
    $display("==================================================================================================================================================================");

    $monitor("| %6t |  %b  | %b  | %2d | %2d |    %b    |     %b     |    %b    |    %b    |      %b      |    %b    |      %b      |    %b    |     %b      | %b | %b | %b |",
             $time,
             rst_n_tb,
             rx_in_tb,
             DUT.u_fsm.cs,
             DUT.u_fsm.ns,
             par_en_tb,
             par_type_tb,

             // Start Check
             DUT.u_start_check.strt_chk_en,
             DUT.u_start_check.strt_glitch,

             // Parity Check
             DUT.u_parity_check.par_chk_en,
             DUT.u_parity_check.par_err,

             // Stop Check
             DUT.u_stop_check.stp_chk_en,
             DUT.u_stop_check.stp_error,

             data_valid_tb,
             frame,
             frame_parity,
             p_data_tb
            );

end

endmodule