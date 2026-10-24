module tb_SYS_TOP;

    //==========================================================
    // Parameters
    //==========================================================

    parameter DATA_WIDTH = 8;
    parameter RF_ADDR    = 4;

    // REF_CLK  = 50 MHz  -> 20 ns period
    // UART_CLK = 3.6864 MHz -> ~271.267 ns period
    //
    // Prescale = 32
    // Baud rate = 3.6864 MHz / 32 = 115.2 kHz
    //
    // UART bit time = 1 / 115200 = 8.680555 us
    //==========================================================

    localparam realtime REF_CLK_PERIOD  = 20.0;
    localparam realtime UART_CLK_PERIOD = 271.267361;
    localparam realtime UART_BIT_TIME   = 8680.555556;


    //==========================================================
    // DUT signals
    //==========================================================

    reg  RST_N;
    reg  UART_CLK;
    reg  REF_CLK;
    reg  UART_RX_IN;

    wire UART_TX_O;
    wire parity_error;
    wire framing_error;


    //==========================================================
    // Scoreboard + sticky error flags
    //==========================================================

    integer pass_count;
    integer fail_count;

    reg par_err_seen;
    reg frm_err_seen;

    initial begin
        pass_count   = 0;
        fail_count   = 0;
        par_err_seen = 1'b0;
        frm_err_seen = 1'b0;
    end

    always @(posedge parity_error)  par_err_seen = 1'b1;
    always @(posedge framing_error) frm_err_seen = 1'b1;


    //==========================================================
    // DUT
    //==========================================================

    SYS_TOP #(
        .DATA_WIDTH(DATA_WIDTH),
        .RF_ADDR(RF_ADDR)
    )
    DUT (
        .RST_N(RST_N),
        .UART_CLK(UART_CLK),
        .REF_CLK(REF_CLK),
        .UART_RX_IN(UART_RX_IN),
        .UART_TX_O(UART_TX_O),
        .parity_error(parity_error),
        .framing_error(framing_error)
    );


    //==========================================================
    // Clock Generation
    //==========================================================

    initial begin
        REF_CLK = 1'b0;

        forever #(REF_CLK_PERIOD/2)
            REF_CLK = ~REF_CLK;
    end


    initial begin
        UART_CLK = 1'b0;

        forever #(UART_CLK_PERIOD/2)
            UART_CLK = ~UART_CLK;
    end


    //==========================================================
    // Reset
    //==========================================================

    task reset_system;
        begin

            $display("=================================================");
            $display("                 RESET SYSTEM");
            $display("=================================================");

            RST_N      = 1'b0;
            UART_RX_IN = 1'b1;

            #1000;

            RST_N = 1'b1;

            // Wait for reset synchronizers
            repeat(20)
                @(posedge REF_CLK);

            $display("[%0t] RESET RELEASED", $time);

        end
    endtask


    //==========================================================
    // UART SEND BYTE
    //
    // Frame:
    //
    // START
    // DATA[0] ... DATA[7]
    // PARITY
    // STOP
    //
    // Current configuration:
    // parity enabled
    // even parity
    // prescale = 32
    //==========================================================

    task uart_send_byte;

        input [7:0] data;

        integer i;
        reg parity_bit;

        begin

            // Even parity
            parity_bit = ^data;

            $display("[%0t] UART TX -> %02h", $time, data);

            // IDLE
            UART_RX_IN = 1'b1;
            #(UART_BIT_TIME);

            // START BIT
            UART_RX_IN = 1'b0;
            #(UART_BIT_TIME);

            // DATA BITS - LSB first
            for (i = 0; i < 8; i = i + 1) begin

                UART_RX_IN = data[i];

                #(UART_BIT_TIME);

            end

            // PARITY BIT
            UART_RX_IN = parity_bit;

            #(UART_BIT_TIME);

            // STOP BIT
            UART_RX_IN = 1'b1;

            #(UART_BIT_TIME);

            // Keep line idle
            UART_RX_IN = 1'b1;

            // Small gap between bytes
            #(UART_BIT_TIME);

        end

    endtask


    //==========================================================
    // UART SEND BYTE WITH ERROR INJECTION
    //
    // bad_parity = 1 -> parity bit is inverted
    // bad_stop   = 1 -> stop bit is driven low (framing error)
    //==========================================================

    task uart_send_byte_err;

        input [7:0] data;
        input       bad_parity;
        input       bad_stop;

        integer i;

        begin

            $display("[%0t] UART TX (ERROR INJECT) -> %02h  bad_parity=%b bad_stop=%b",
                     $time, data, bad_parity, bad_stop);

            // IDLE
            UART_RX_IN = 1'b1;
            #(UART_BIT_TIME);

            // START BIT
            UART_RX_IN = 1'b0;
            #(UART_BIT_TIME);

            // DATA BITS - LSB first
            for (i = 0; i < 8; i = i + 1) begin
                UART_RX_IN = data[i];
                #(UART_BIT_TIME);
            end

            // PARITY BIT (even parity, optionally corrupted)
            UART_RX_IN = (^data) ^ bad_parity;
            #(UART_BIT_TIME);

            // STOP BIT (optionally corrupted)
            UART_RX_IN = ~bad_stop;
            #(UART_BIT_TIME);

            // Return to idle and give the receiver time to resynchronize
            UART_RX_IN = 1'b1;
            #(UART_BIT_TIME * 3);

        end

    endtask


    //==========================================================
    // UART RECEIVE BYTE
    //
    // Receives serial data from UART_TX_O
    //==========================================================

    task uart_receive_byte;

        output [7:0] data;

        integer i;
        reg parity_bit;
        reg expected_parity;

        begin

            data = 8'b0;

            // Wait for START BIT
            @(negedge UART_TX_O);

            // Move to middle of START bit
            #(UART_BIT_TIME/2);

            if (UART_TX_O !== 1'b0) begin

                $display("[%0t] ERROR: Invalid UART START bit",
                         $time);

            end

            // Move to DATA[0]
            #(UART_BIT_TIME);

            // Receive 8 data bits
            for (i = 0; i < 8; i = i + 1) begin

                data[i] = UART_TX_O;

                #(UART_BIT_TIME);

            end

            // Receive parity
            parity_bit = UART_TX_O;

            expected_parity = ^data;

            if (parity_bit !== expected_parity) begin

                $display("[%0t] ERROR: UART parity mismatch",
                         $time);

                $display("           DATA = %02h", data);
                $display("           Expected parity = %b",
                         expected_parity);
                $display("           Received parity = %b",
                         parity_bit);

            end

            #(UART_BIT_TIME);

            // STOP BIT
            if (UART_TX_O !== 1'b1) begin

                $display("[%0t] ERROR: Invalid UART STOP bit",
                         $time);

            end

            #(UART_BIT_TIME);

            $display("[%0t] UART RX <- %02h",
                     $time,
                     data);

        end

    endtask


    //==========================================================
    // UART RECEIVE AND CHECK
    //==========================================================

    task uart_receive_check;

        input [7:0] expected_data;

        reg [7:0] received_data;

        begin

            uart_receive_byte(received_data);

            if (received_data === expected_data) begin

                $display("-------------------------------------------------");
                pass_count = pass_count + 1;
                $display("PASS");
                $display("Expected : %02h", expected_data);
                $display("Received : %02h", received_data);
                $display("-------------------------------------------------");

            end
            else begin

                $display("-------------------------------------------------");
                fail_count = fail_count + 1;
                $display("FAIL");
                $display("Expected : %02h", expected_data);
                $display("Received : %02h", received_data);
                $display("-------------------------------------------------");

            end

        end

    endtask


    //==========================================================
    // Register File Write
    //
    // Command:
    //
    // AA | DATA | ADDRESS
    //
    // According to the project specification.
    //==========================================================

    task RF_WRITE;

        input [7:0] data;
        input [7:0] address;

        begin

            $display("");
            $display("===============================================");
            $display("REGISTER FILE WRITE");
            $display("DATA    = %02h", data);
            $display("ADDRESS = %02h", address);
            $display("===============================================");

            uart_send_byte(8'hAA);
            uart_send_byte(data);
            uart_send_byte(address);

            // Allow SYS_CTRL to process command
            repeat(10)
                @(posedge REF_CLK);

        end

    endtask


    //==========================================================
    // Register File Read
    //
    // Command:
    //
    // BB | ADDRESS
    //==========================================================

    task RF_READ;

        input [7:0] address;
        input [7:0] expected_data;

        begin

            $display("");
            $display("===============================================");
            $display("REGISTER FILE READ");
            $display("ADDRESS = %02h", address);
            $display("EXPECTED = %02h", expected_data);
            $display("===============================================");

            uart_send_byte(8'hBB);
            uart_send_byte(address);

            uart_receive_check(expected_data);

        end

    endtask


    //==========================================================
    // ALU operation WITH operands
    //
    // CC | Operand A | Operand B | ALU FUN
    //==========================================================

    task ALU_OPERATION;

        input [7:0] operand_a;
        input [7:0] operand_b;
        input [3:0] alu_fun;
        input [7:0] expected_result;

        begin

            $display("");
            $display("===============================================");
            $display("ALU OPERATION");
            $display("A        = %02h", operand_a);
            $display("B        = %02h", operand_b);
            $display("ALU_FUN  = %01h", alu_fun);
            $display("EXPECTED = %02h", expected_result);
            $display("===============================================");

            uart_send_byte(8'hCC);

            uart_send_byte(operand_a);

            uart_send_byte(operand_b);

            uart_send_byte({4'b0000, alu_fun});

            uart_receive_check(expected_result);

        end

    endtask


    //==========================================================
    // ALU operation WITHOUT operands
    //
    // DD | ALU FUN
    //
    // This uses the values already stored in REG0 / REG1.
    //==========================================================

    task ALU_OPERATION_NO_OPERANDS;

        input [3:0] alu_fun;
        input [7:0] expected_result;

        begin

            $display("");
            $display("===============================================");
            $display("ALU OPERATION - NO OPERANDS");
            $display("ALU_FUN  = %01h", alu_fun);
            $display("EXPECTED = %02h", expected_result);
            $display("===============================================");

            uart_send_byte(8'hDD);

            uart_send_byte({4'b0000, alu_fun});

            uart_receive_check(expected_result);

        end

    endtask


    //==========================================================
    // PARITY ERROR TEST
    //
    // Sends a frame with a wrong parity bit. Expects:
    //  - parity_error asserts
    //  - frame is dropped (no command is executed)
    //==========================================================

    task TEST_PARITY_ERROR;

        input [7:0] data;

        begin

            $display("");
            $display("===============================================");
            $display("ERROR TEST: BAD PARITY  (frame = %02h)", data);
            $display("===============================================");

            par_err_seen = 1'b0;
            frm_err_seen = 1'b0;

            uart_send_byte_err(data, 1'b1, 1'b0);

            if (par_err_seen === 1'b1) begin
                pass_count = pass_count + 1;
                $display("PASS: parity_error asserted");
            end
            else begin
                fail_count = fail_count + 1;
                $display("FAIL: parity_error was NOT asserted");
            end

        end

    endtask


    //==========================================================
    // FRAMING ERROR TEST
    //
    // Sends a frame with stop bit = 0. Expects:
    //  - framing_error asserts
    //  - frame is dropped (no command is executed)
    //==========================================================

    task TEST_FRAMING_ERROR;

        input [7:0] data;

        begin

            $display("");
            $display("===============================================");
            $display("ERROR TEST: BAD STOP BIT  (frame = %02h)", data);
            $display("===============================================");

            par_err_seen = 1'b0;
            frm_err_seen = 1'b0;

            uart_send_byte_err(data, 1'b0, 1'b1);

            if (frm_err_seen === 1'b1) begin
                pass_count = pass_count + 1;
                $display("PASS: framing_error asserted");
            end
            else begin
                fail_count = fail_count + 1;
                $display("FAIL: framing_error was NOT asserted");
            end

        end

    endtask


    //==========================================================
    // MAIN TEST
    //==========================================================

    reg [7:0] dummy;

    initial begin

        // Initial values
        RST_N      = 1'b0;
        UART_RX_IN = 1'b1;

        //======================================================
        // Reset
        //======================================================

        reset_system;


        //======================================================
        // CONFIGURATION
        //
        // REG2:
        //
        // [0] = Parity Enable = 1
        // [1] = Parity Type   = 0
        // [7:2] = Prescale    = 32
        //
        // REG2 = 1000_0001 = 81h
        //
        // REG3:
        //
        // Division ratio = 32
        //======================================================

        $display("");
        $display("=================================================");
        $display("        SYSTEM CONFIGURATION");
        $display("=================================================");

        RF_WRITE(8'h81, 8'h02);

        RF_WRITE(8'h20, 8'h03);


        //======================================================
        // REGISTER FILE TEST
        //
        // Write 55h to address 04h
        // Then read it back
        //======================================================

        RF_WRITE(8'h55, 8'h04);

        RF_READ(8'h04, 8'h55);


        //======================================================
        // REGISTER FILE TEST 2
        //======================================================

        RF_WRITE(8'hA5, 8'h05);

        RF_READ(8'h05, 8'hA5);


        //======================================================
        // ALU TESTS
        //
        // ALU function encoding assumed:
        //
        // 0000 ADD
        // 0001 SUB
        // 0010 MUL
        // 0011 DIV
        // 0100 AND
        // 0101 OR
        // 0110 NAND
        // 0111 NOR
        // 1000 XOR
        // 1001 XNOR
        // 1010 CMP A=B
        // 1011 CMP A>B
        // 1100 SHIFT RIGHT
        // 1101 SHIFT LEFT
        //======================================================


        // ADD
        ALU_OPERATION(
            8'h0A,
            8'h05,
            4'b0000,
            8'h0F
        );


        // SUB
        ALU_OPERATION(
            8'h0A,
            8'h05,
            4'b0001,
            8'h05
        );


        // MUL
        ALU_OPERATION(
            8'h05,
            8'h04,
            4'b0010,
            8'h14
        );


        // DIV
        ALU_OPERATION(
            8'h14,
            8'h04,
            4'b0011,
            8'h05
        );


        // AND
        ALU_OPERATION(
            8'hF0,
            8'h0F,
            4'b0100,
            8'h00
        );


        // OR
        ALU_OPERATION(
            8'hF0,
            8'h0F,
            4'b0101,
            8'hFF
        );


        // NAND
        ALU_OPERATION(
            8'hF0,
            8'h0F,
            4'b0110,
            8'hFF
        );


        // NOR
        ALU_OPERATION(
            8'hF0,
            8'h0F,
            4'b0111,
            8'h00
        );


        // XOR
        ALU_OPERATION(
            8'hF0,
            8'h0F,
            4'b1000,
            8'hFF
        );


        // XNOR
        ALU_OPERATION(
            8'hF0,
            8'h0F,
            4'b1001,
            8'h00
        );


        // CMP A = B
        ALU_OPERATION(
            8'h55,
            8'h55,
            4'b1010,
            8'h01
        );


        // CMP A > B
        ALU_OPERATION(
            8'h55,
            8'h20,
            4'b1011,
            8'h01
        );


        // SHIFT RIGHT
        ALU_OPERATION(
            8'h80,
            8'h00,
            4'b1100,
            8'h40
        );


        // SHIFT LEFT
        ALU_OPERATION(
            8'h04,
            8'h00,
            4'b1101,
            8'h08
        );


        //======================================================
        // ALU WITHOUT OPERANDS
        //
        // First put operands in REG0 and REG1.
        //======================================================

        RF_WRITE(8'h0C, 8'h00);
        RF_WRITE(8'h03, 8'h01);

        // 0Ch + 03h = 0Fh
        ALU_OPERATION_NO_OPERANDS(
            4'b0000,
            8'h0F
        );


        //======================================================
        // ERROR CHECK
        //======================================================

        if (parity_error !== 1'b0)
            $display("WARNING: parity_error is HIGH");

        if (framing_error !== 1'b0)
            $display("WARNING: framing_error is HIGH");


        //======================================================
        // NEGATIVE TESTS: PARITY / FRAMING ERRORS
        //
        // A corrupted frame carrying a valid command byte (BBh =
        // register read) must be dropped. If it were accepted, the
        // SYS_CTRL FSM would wait for an address byte and the
        // recovery read below would fail.
        //======================================================

        TEST_PARITY_ERROR(8'hBB);

        // Recovery: the system must still work after a parity error
        RF_READ(8'h04, 8'h55);

        TEST_FRAMING_ERROR(8'hBB);

        // Recovery: the system must still work after a framing error
        RF_READ(8'h05, 8'hA5);

        // Error on a data byte in the middle of a multi-frame command
        // is not tested here: the spec defines no recovery behaviour.


        //======================================================
        // END
        //======================================================

        $display("");
        $display("=================================================");
        $display("             TESTBENCH FINISHED");
        $display("=================================================");
        $display("   PASSED : %0d", pass_count);
        $display("   FAILED : %0d", fail_count);
        if (fail_count == 0)
            $display("   RESULT : ALL TESTS PASSED");
        else
            $display("   RESULT : SOME TESTS FAILED");
        $display("=================================================");

        #1000;

        $finish;

    end


    //==========================================================
    // Monitor UART errors
    //==========================================================

    always @(posedge parity_error) begin

        $display("[%0t] WARNING: parity_error asserted",
                 $time);

    end


    always @(posedge framing_error) begin

        $display("[%0t] WARNING: framing_error asserted",
                 $time);

    end


    //==========================================================
    // Optional waveform monitor
    //==========================================================

    initial begin

        $monitor(
            "[%0t] RST_N=%b RX_IN=%b TX_OUT=%b PAR_ERR=%b FRAME_ERR=%b",
            $time,
            RST_N,
            UART_RX_IN,
            UART_TX_O,
            parity_error,
            framing_error
        );

    end


endmodule