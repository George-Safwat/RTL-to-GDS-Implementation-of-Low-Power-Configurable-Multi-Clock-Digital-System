module SYS_CTRL (
    input             CLK,
    input             RST,

    input      [15:0] ALU_OUT,
    input             ALU_OUT_VLD,

    output reg [3:0]  ALU_FUN,
    output reg        ALU_EN,
    output reg        CLKG_EN,

    output reg [3:0]  RF_Address,
    output reg        RF_WrEn,
    output reg        RF_RdEn,
    output reg [7:0]  RF_WrData,

    input      [7:0]  RF_RdData,
    input             RF_RdData_VLD,

    input      [7:0]  UART_RX_DATA,
    input             UART_RX_VLD,

    output reg [7:0]  UART_TX_DATA,
    output reg        UART_TX_VLD,

    output reg        CLKDIV_EN,

    input             FIFO_FULL
);

    //==========================================================
    // Commands
    //==========================================================

    localparam RF_WR_CMD          = 8'hAA;
    localparam RF_RD_CMD          = 8'hBB;
    localparam ALU_OPER_W_OP_CMD  = 8'hCC;
    localparam ALU_OPER_W_NOP_CMD = 8'hDD;


    //==========================================================
    // FSM States
    //==========================================================

    localparam IDLE        = 4'd0;
    localparam RF_WR_DATA  = 4'd1;
    localparam RF_WR_ADDR  = 4'd2;

    localparam RF_RD_ADDR  = 4'd3;
    localparam RF_RD_WAIT  = 4'd4;

    localparam ALU_OP_A    = 4'd5;
    localparam ALU_OP_B    = 4'd6;
    localparam ALU_OP_FUN  = 4'd7;

    localparam ALU_NOP_FUN = 4'd8;
    localparam ALU_WAIT    = 4'd9;


    reg [3:0] current_state;
    reg [3:0] next_state;


    //==========================================================
    // Internal Registers
    //==========================================================

    reg [3:0] alu_fun_reg;

    reg [7:0] rf_wr_data_reg;
    reg [3:0] rf_addr_reg;


    //==========================================================
    // State Register
    //==========================================================

    always @(posedge CLK or negedge RST) begin

        if (!RST)
            current_state <= IDLE;
        else
            current_state <= next_state;

    end


    //==========================================================
    // Next State Logic
    //==========================================================

    always @(*) begin

        next_state = current_state;

        case (current_state)

            IDLE: begin

                if (UART_RX_VLD) begin

                    case (UART_RX_DATA)

                        RF_WR_CMD:
                            next_state = RF_WR_DATA;

                        RF_RD_CMD:
                            next_state = RF_RD_ADDR;

                        ALU_OPER_W_OP_CMD:
                            next_state = ALU_OP_A;

                        ALU_OPER_W_NOP_CMD:
                            next_state = ALU_NOP_FUN;

                        default:
                            next_state = IDLE;

                    endcase

                end

            end


            //==================================================
            // Register File Write
            //==================================================

            RF_WR_DATA: begin

                if (UART_RX_VLD)
                    next_state = RF_WR_ADDR;

            end


            RF_WR_ADDR: begin

                if (UART_RX_VLD)
                    next_state = IDLE;

            end


            //==================================================
            // Register File Read
            //==================================================

            RF_RD_ADDR: begin

                if (UART_RX_VLD)
                    next_state = RF_RD_WAIT;

            end


            RF_RD_WAIT: begin

                if (RF_RdData_VLD)
                    next_state = IDLE;

            end


            //==================================================
            // ALU operation WITH operands
            //==================================================

            ALU_OP_A: begin

                if (UART_RX_VLD)
                    next_state = ALU_OP_B;

            end


            ALU_OP_B: begin

                if (UART_RX_VLD)
                    next_state = ALU_OP_FUN;

            end


            ALU_OP_FUN: begin

                if (UART_RX_VLD)
                    next_state = ALU_WAIT;

            end


            //==================================================
            // ALU operation WITHOUT operands
            //==================================================

            ALU_NOP_FUN: begin

                if (UART_RX_VLD)
                    next_state = ALU_WAIT;

            end


            //==================================================
            // Wait for ALU result
            //==================================================

            ALU_WAIT: begin

                if (ALU_OUT_VLD)
                    next_state = IDLE;

            end


            default:
                next_state = IDLE;

        endcase

    end


    //==========================================================
    // Output / Control Logic
    //==========================================================

    always @(posedge CLK or negedge RST) begin

        if (!RST) begin

            ALU_FUN      <= 4'b0;
            ALU_EN       <= 1'b0;
            CLKG_EN      <= 1'b0;

            RF_Address   <= 4'b0;
            RF_WrEn      <= 1'b0;
            RF_RdEn      <= 1'b0;
            RF_WrData    <= 8'b0;

            UART_TX_DATA <= 8'b0;
            UART_TX_VLD  <= 1'b0;

            CLKDIV_EN    <= 1'b1;

            alu_fun_reg  <= 4'b0;

            rf_wr_data_reg <= 8'b0;
            rf_addr_reg    <= 4'b0;

        end

        else begin

            //==================================================
            // Default values
            //==================================================

            RF_WrEn     <= 1'b0;
            RF_RdEn     <= 1'b0;

            ALU_EN      <= 1'b0;
            CLKG_EN     <= ALU_EN;   // one extra gated-clock edge with EN=0 clears OUT_VALID

            UART_TX_VLD <= 1'b0;

            CLKDIV_EN   <= 1'b1;         // clock divider always enabled after reset


            case (current_state)

                //================================================
                // Receive RF Write Data
                //================================================

                RF_WR_DATA: begin

                    if (UART_RX_VLD)
                        rf_wr_data_reg <= UART_RX_DATA;

                end


                //================================================
                // Receive RF Write Address
                //================================================

                RF_WR_ADDR: begin

                    if (UART_RX_VLD) begin

                        rf_addr_reg <= UART_RX_DATA[3:0];

                        RF_Address <= UART_RX_DATA[3:0];
                        RF_WrData  <= rf_wr_data_reg;

                        RF_WrEn <= 1'b1;

                    end

                end


                //================================================
                // Receive RF Read Address
                //================================================

                RF_RD_ADDR: begin

                    if (UART_RX_VLD) begin

                        rf_addr_reg <= UART_RX_DATA[3:0];

                        RF_Address <= UART_RX_DATA[3:0];
                        RF_RdEn    <= 1'b1;

                    end

                end


                //================================================
                // Send RF Read Result
                //================================================

                RF_RD_WAIT: begin

                    if (RF_RdData_VLD) begin

                        UART_TX_DATA <= RF_RdData;
                        UART_TX_VLD  <= 1'b1;

                    end

                end


                //================================================
                // ALU Operand A
                //================================================

                ALU_OP_A: begin

                    // Operand A is stored in REG0 of the register file
                    if (UART_RX_VLD) begin

                        RF_Address <= 4'd0;
                        RF_WrData  <= UART_RX_DATA;
                        RF_WrEn    <= 1'b1;

                    end

                end


                //================================================
                // ALU Operand B
                //================================================

                ALU_OP_B: begin

                    // Operand B is stored in REG1 of the register file
                    if (UART_RX_VLD) begin

                        RF_Address <= 4'd1;
                        RF_WrData  <= UART_RX_DATA;
                        RF_WrEn    <= 1'b1;

                    end

                end


                //================================================
                // ALU Function
                //================================================

                ALU_OP_FUN: begin

                    if (UART_RX_VLD)
                        alu_fun_reg <= UART_RX_DATA[3:0];

                end


                //================================================
                // ALU operation
                //================================================

                ALU_WAIT: begin

                    ALU_FUN <= alu_fun_reg;
                    ALU_EN  <= 1'b1;
                    CLKG_EN <= 1'b1;

                    if (ALU_OUT_VLD) begin

                        UART_TX_DATA <= ALU_OUT[7:0];
                        UART_TX_VLD  <= 1'b1;

                    end

                end


                //================================================
                // ALU operation without operands
                //================================================

                ALU_NOP_FUN: begin

                    if (UART_RX_VLD)
                        alu_fun_reg <= UART_RX_DATA[3:0];

                end

            endcase

        end

    end

endmodule