module uart_rx_top(clk, rst_n,par_en,rx_in,prescale,par_type,data_valid,p_data,parity_error,framing_error);
input par_en,rx_in,par_type, clk, rst_n;
input [5:0] prescale;
output data_valid;
output [7:0] p_data;
output parity_error;
output framing_error;
    wire [4:0] edge_cnt;
    wire [3:0] bit_cnt;

    wire sampled_bit;

    wire par_err;
    wire strt_glitch;
    wire stp_error;

    wire enable;
    wire data_valid_int;   // combinational output of the FSM
    reg  data_valid_r;     // registered copy -> glitch-free CDC source

    wire deser_en;
    wire stp_chk_en;
    wire strt_chk_en;
    wire par_chk_en;
    wire dat_samp_en;
// FIX (Ac_glitch03): data_valid is decoded combinationally from cs/edge_cnt/bit_cnt/rx_in
// and feeds the DATA_SYNC bus_enable synchronizer (via UART -> RX_OUT_V). Register it so the
// CDC source is a flop. p_data is stable for many clocks after data_valid.
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) data_valid_r <= 1'b0;
    else       data_valid_r <= data_valid_int;
end
assign data_valid = data_valid_r;
assign parity_error = par_err;
assign framing_error = stp_error || strt_glitch;
fsm u_fsm (
        .clk          (clk),
        .rst_n        (rst_n),
        .rx_in        (rx_in),
        .edge_cnt     (edge_cnt),
        .bit_cnt      (bit_cnt),
        .par_en       (par_en),
        .par_err       (par_err),
        .strt_glitch  (strt_glitch),
        .stp_error    (stp_error),

        .enable       (enable),
        .data_valid   (data_valid_int),
        .deser_en     (deser_en),
        .stp_chk_en   (stp_chk_en),
        .strt_chk_en  (strt_chk_en),
        .par_chk_en   (par_chk_en),
        .dat_samp_en  (dat_samp_en),
        .prescale (prescale)
    );


    // =========================================================
    // 2. Edge Counter
    // =========================================================

    edge_counter u_edge_counter (
        .clk       (clk),
        .rst_n     (rst_n),
        .edge_cnt  (edge_cnt),
        .bit_cnt   (bit_cnt),
        .enable    (enable),
        .par_en     (par_en),
        .prescale (prescale)
    );


    // =========================================================
    // 3. Data Sampler
    // =========================================================

    sample u_sample (
        .clk          (clk),
        .rst_n        (rst_n),
        .dat_samp_en  (dat_samp_en),
        .prescale     (prescale),
        .edge_cnt     (edge_cnt),
        .rx_in        (rx_in),
        .sampled_bit  (sampled_bit)
    );


    // =========================================================
    // 4. Start Check
    // =========================================================

    start_check u_start_check (
        .clk          (clk),
        .rst_n        (rst_n),
        .strt_chk_en  (strt_chk_en),
        .strt_glitch  (strt_glitch),
        .sampled_bit  (sampled_bit),
        .edge_cnt     (edge_cnt),
        .prescale       (prescale)
    );


    // =========================================================
    // 5. Parity Check
    // =========================================================

    parity_check u_parity_check (
        .clk          (clk),
        .rst_n        (rst_n),
        .par_chk_en   (par_chk_en),
        .par_err      (par_err),
        .sampled_bit  (sampled_bit),
        .par_type     (par_type),
        .bit_cnt        (bit_cnt),
        .prescale       (prescale),
        .edge_cnt       (edge_cnt)
    );


    // =========================================================
    // 6. Stop Check
    // =========================================================

    stop_check u_stop_check (
        .clk          (clk),
        .rst_n        (rst_n),
        .stp_chk_en   (stp_chk_en),
        .stp_error    (stp_error),
        .sampled_bit  (sampled_bit),
        .edge_cnt     (edge_cnt),
        .prescale       (prescale)
    );


    // =========================================================
    // 7. Deserializer
    // =========================================================

    desz u_deserializer (
        .clk          (clk),
        .rst_n        (rst_n),
        .deser_en     (deser_en),
        .sampled_bit  (sampled_bit),
        .p_data       (p_data)
    );





endmodule
