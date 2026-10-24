module CLK_GATE (
  input  CLK_EN,
  input  CLK,
  input  test_mode,
  output GATED_CLK
);

`ifdef SIMULATION
  reg Latch_Out;
  always @* if (!CLK) Latch_Out = CLK_EN | test_mode;
  assign GATED_CLK = CLK & Latch_Out;
`else
  TLATNCAX12M U0_TLATNCAX12M (
    .E   (CLK_EN),
    .CK  (CLK),
    .ECK (GATED_CLK)
  );
`endif

endmodule
