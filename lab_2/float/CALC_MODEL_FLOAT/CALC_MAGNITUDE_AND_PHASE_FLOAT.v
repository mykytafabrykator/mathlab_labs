// -------------------------------------------------------------
// 
// File Name: C:\Users\Mykyta\Documents\MATLAB\lab_2\float\CALC_MODEL_FLOAT\CALC_MAGNITUDE_AND_PHASE_FLOAT.v
// Created: 2022-11-30 19:05:33
// 
// Generated by MATLAB 9.12 and HDL Coder 3.20
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 1
// Target subsystem base rate: 1
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// o_PHASE                       ce_out        1
// o_MAGNITUDE                   ce_out        1
// o_VALID                       ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: CALC_MAGNITUDE_AND_PHASE_FLOAT
// Source Path: CALC_MODEL_FLOAT/CALC_MAGNITUDE_AND_PHASE_FLOAT
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module CALC_MAGNITUDE_AND_PHASE_FLOAT
          (clk,
           reset,
           clk_enable,
           i_COMPLEX_VALUE_re,
           i_COMPLEX_VALUE_im,
           i_VALID,
           ce_out,
           o_PHASE,
           o_MAGNITUDE,
           o_VALID);


  input   clk;
  input   reset;
  input   clk_enable;
  input   [31:0] i_COMPLEX_VALUE_re;  // single
  input   [31:0] i_COMPLEX_VALUE_im;  // single
  input   i_VALID;
  output  ce_out;
  output  [31:0] o_PHASE;  // single
  output  [31:0] o_MAGNITUDE;  // single
  output  o_VALID;


  wire enb;
  wire [31:0] Atan2_out1;  // ufix32
  reg [31:0] delayMatch_reg [0:4];  // ufix32 [5]
  wire [31:0] delayMatch_reg_next [0:4];  // ufix32 [5]
  wire [31:0] Atan2_out1_1;  // ufix32
  wire [31:0] Product_out1;  // ufix32
  wire [31:0] Product1_out1;  // ufix32
  wire [31:0] Add_out1;  // ufix32
  wire [31:0] Sqrt_out1;  // ufix32
  reg  [0:46] delayMatch1_reg;  // ufix1 [47]
  wire [0:46] delayMatch1_reg_next;  // ufix1 [47]
  wire i_VALID_1;


  nfp_atan2_single u_nfp_atan2_comp (.clk(clk),
                                     .reset(reset),
                                     .enb(clk_enable),
                                     .nfp_in1(i_COMPLEX_VALUE_im),  // single
                                     .nfp_in2(i_COMPLEX_VALUE_re),  // single
                                     .nfp_out(Atan2_out1)  // single
                                     );

  assign enb = clk_enable;

  always @(posedge clk or posedge reset)
    begin : delayMatch_process
      if (reset == 1'b1) begin
        delayMatch_reg[0] <= 32'h00000000;
        delayMatch_reg[1] <= 32'h00000000;
        delayMatch_reg[2] <= 32'h00000000;
        delayMatch_reg[3] <= 32'h00000000;
        delayMatch_reg[4] <= 32'h00000000;
      end
      else begin
        if (enb) begin
          delayMatch_reg[0] <= delayMatch_reg_next[0];
          delayMatch_reg[1] <= delayMatch_reg_next[1];
          delayMatch_reg[2] <= delayMatch_reg_next[2];
          delayMatch_reg[3] <= delayMatch_reg_next[3];
          delayMatch_reg[4] <= delayMatch_reg_next[4];
        end
      end
    end

  assign Atan2_out1_1 = delayMatch_reg[4];
  assign delayMatch_reg_next[0] = Atan2_out1;
  assign delayMatch_reg_next[1] = delayMatch_reg[0];
  assign delayMatch_reg_next[2] = delayMatch_reg[1];
  assign delayMatch_reg_next[3] = delayMatch_reg[2];
  assign delayMatch_reg_next[4] = delayMatch_reg[3];



  nfp_mul_single u_nfp_mul_comp (.clk(clk),
                                 .reset(reset),
                                 .enb(clk_enable),
                                 .nfp_in1(i_COMPLEX_VALUE_re),  // single
                                 .nfp_in2(i_COMPLEX_VALUE_re),  // single
                                 .nfp_out(Product_out1)  // single
                                 );

  nfp_mul_single u_nfp_mul_comp_1 (.clk(clk),
                                   .reset(reset),
                                   .enb(clk_enable),
                                   .nfp_in1(i_COMPLEX_VALUE_im),  // single
                                   .nfp_in2(i_COMPLEX_VALUE_im),  // single
                                   .nfp_out(Product1_out1)  // single
                                   );

  nfp_add_single u_nfp_add_comp (.clk(clk),
                                 .reset(reset),
                                 .enb(clk_enable),
                                 .nfp_in1(Product_out1),  // single
                                 .nfp_in2(Product1_out1),  // single
                                 .nfp_out(Add_out1)  // single
                                 );

  nfp_sqrt_single u_nfp_sqrt_comp (.clk(clk),
                                   .reset(reset),
                                   .enb(clk_enable),
                                   .nfp_in(Add_out1),  // single
                                   .nfp_out(Sqrt_out1)  // single
                                   );

  always @(posedge clk or posedge reset)
    begin : delayMatch1_process
      if (reset == 1'b1) begin
        delayMatch1_reg[0] <= 1'b0;
        delayMatch1_reg[1] <= 1'b0;
        delayMatch1_reg[2] <= 1'b0;
        delayMatch1_reg[3] <= 1'b0;
        delayMatch1_reg[4] <= 1'b0;
        delayMatch1_reg[5] <= 1'b0;
        delayMatch1_reg[6] <= 1'b0;
        delayMatch1_reg[7] <= 1'b0;
        delayMatch1_reg[8] <= 1'b0;
        delayMatch1_reg[9] <= 1'b0;
        delayMatch1_reg[10] <= 1'b0;
        delayMatch1_reg[11] <= 1'b0;
        delayMatch1_reg[12] <= 1'b0;
        delayMatch1_reg[13] <= 1'b0;
        delayMatch1_reg[14] <= 1'b0;
        delayMatch1_reg[15] <= 1'b0;
        delayMatch1_reg[16] <= 1'b0;
        delayMatch1_reg[17] <= 1'b0;
        delayMatch1_reg[18] <= 1'b0;
        delayMatch1_reg[19] <= 1'b0;
        delayMatch1_reg[20] <= 1'b0;
        delayMatch1_reg[21] <= 1'b0;
        delayMatch1_reg[22] <= 1'b0;
        delayMatch1_reg[23] <= 1'b0;
        delayMatch1_reg[24] <= 1'b0;
        delayMatch1_reg[25] <= 1'b0;
        delayMatch1_reg[26] <= 1'b0;
        delayMatch1_reg[27] <= 1'b0;
        delayMatch1_reg[28] <= 1'b0;
        delayMatch1_reg[29] <= 1'b0;
        delayMatch1_reg[30] <= 1'b0;
        delayMatch1_reg[31] <= 1'b0;
        delayMatch1_reg[32] <= 1'b0;
        delayMatch1_reg[33] <= 1'b0;
        delayMatch1_reg[34] <= 1'b0;
        delayMatch1_reg[35] <= 1'b0;
        delayMatch1_reg[36] <= 1'b0;
        delayMatch1_reg[37] <= 1'b0;
        delayMatch1_reg[38] <= 1'b0;
        delayMatch1_reg[39] <= 1'b0;
        delayMatch1_reg[40] <= 1'b0;
        delayMatch1_reg[41] <= 1'b0;
        delayMatch1_reg[42] <= 1'b0;
        delayMatch1_reg[43] <= 1'b0;
        delayMatch1_reg[44] <= 1'b0;
        delayMatch1_reg[45] <= 1'b0;
        delayMatch1_reg[46] <= 1'b0;
      end
      else begin
        if (enb) begin
          delayMatch1_reg[0] <= delayMatch1_reg_next[0];
          delayMatch1_reg[1] <= delayMatch1_reg_next[1];
          delayMatch1_reg[2] <= delayMatch1_reg_next[2];
          delayMatch1_reg[3] <= delayMatch1_reg_next[3];
          delayMatch1_reg[4] <= delayMatch1_reg_next[4];
          delayMatch1_reg[5] <= delayMatch1_reg_next[5];
          delayMatch1_reg[6] <= delayMatch1_reg_next[6];
          delayMatch1_reg[7] <= delayMatch1_reg_next[7];
          delayMatch1_reg[8] <= delayMatch1_reg_next[8];
          delayMatch1_reg[9] <= delayMatch1_reg_next[9];
          delayMatch1_reg[10] <= delayMatch1_reg_next[10];
          delayMatch1_reg[11] <= delayMatch1_reg_next[11];
          delayMatch1_reg[12] <= delayMatch1_reg_next[12];
          delayMatch1_reg[13] <= delayMatch1_reg_next[13];
          delayMatch1_reg[14] <= delayMatch1_reg_next[14];
          delayMatch1_reg[15] <= delayMatch1_reg_next[15];
          delayMatch1_reg[16] <= delayMatch1_reg_next[16];
          delayMatch1_reg[17] <= delayMatch1_reg_next[17];
          delayMatch1_reg[18] <= delayMatch1_reg_next[18];
          delayMatch1_reg[19] <= delayMatch1_reg_next[19];
          delayMatch1_reg[20] <= delayMatch1_reg_next[20];
          delayMatch1_reg[21] <= delayMatch1_reg_next[21];
          delayMatch1_reg[22] <= delayMatch1_reg_next[22];
          delayMatch1_reg[23] <= delayMatch1_reg_next[23];
          delayMatch1_reg[24] <= delayMatch1_reg_next[24];
          delayMatch1_reg[25] <= delayMatch1_reg_next[25];
          delayMatch1_reg[26] <= delayMatch1_reg_next[26];
          delayMatch1_reg[27] <= delayMatch1_reg_next[27];
          delayMatch1_reg[28] <= delayMatch1_reg_next[28];
          delayMatch1_reg[29] <= delayMatch1_reg_next[29];
          delayMatch1_reg[30] <= delayMatch1_reg_next[30];
          delayMatch1_reg[31] <= delayMatch1_reg_next[31];
          delayMatch1_reg[32] <= delayMatch1_reg_next[32];
          delayMatch1_reg[33] <= delayMatch1_reg_next[33];
          delayMatch1_reg[34] <= delayMatch1_reg_next[34];
          delayMatch1_reg[35] <= delayMatch1_reg_next[35];
          delayMatch1_reg[36] <= delayMatch1_reg_next[36];
          delayMatch1_reg[37] <= delayMatch1_reg_next[37];
          delayMatch1_reg[38] <= delayMatch1_reg_next[38];
          delayMatch1_reg[39] <= delayMatch1_reg_next[39];
          delayMatch1_reg[40] <= delayMatch1_reg_next[40];
          delayMatch1_reg[41] <= delayMatch1_reg_next[41];
          delayMatch1_reg[42] <= delayMatch1_reg_next[42];
          delayMatch1_reg[43] <= delayMatch1_reg_next[43];
          delayMatch1_reg[44] <= delayMatch1_reg_next[44];
          delayMatch1_reg[45] <= delayMatch1_reg_next[45];
          delayMatch1_reg[46] <= delayMatch1_reg_next[46];
        end
      end
    end

  assign i_VALID_1 = delayMatch1_reg[46];
  assign delayMatch1_reg_next[0] = i_VALID;
  assign delayMatch1_reg_next[1] = delayMatch1_reg[0];
  assign delayMatch1_reg_next[2] = delayMatch1_reg[1];
  assign delayMatch1_reg_next[3] = delayMatch1_reg[2];
  assign delayMatch1_reg_next[4] = delayMatch1_reg[3];
  assign delayMatch1_reg_next[5] = delayMatch1_reg[4];
  assign delayMatch1_reg_next[6] = delayMatch1_reg[5];
  assign delayMatch1_reg_next[7] = delayMatch1_reg[6];
  assign delayMatch1_reg_next[8] = delayMatch1_reg[7];
  assign delayMatch1_reg_next[9] = delayMatch1_reg[8];
  assign delayMatch1_reg_next[10] = delayMatch1_reg[9];
  assign delayMatch1_reg_next[11] = delayMatch1_reg[10];
  assign delayMatch1_reg_next[12] = delayMatch1_reg[11];
  assign delayMatch1_reg_next[13] = delayMatch1_reg[12];
  assign delayMatch1_reg_next[14] = delayMatch1_reg[13];
  assign delayMatch1_reg_next[15] = delayMatch1_reg[14];
  assign delayMatch1_reg_next[16] = delayMatch1_reg[15];
  assign delayMatch1_reg_next[17] = delayMatch1_reg[16];
  assign delayMatch1_reg_next[18] = delayMatch1_reg[17];
  assign delayMatch1_reg_next[19] = delayMatch1_reg[18];
  assign delayMatch1_reg_next[20] = delayMatch1_reg[19];
  assign delayMatch1_reg_next[21] = delayMatch1_reg[20];
  assign delayMatch1_reg_next[22] = delayMatch1_reg[21];
  assign delayMatch1_reg_next[23] = delayMatch1_reg[22];
  assign delayMatch1_reg_next[24] = delayMatch1_reg[23];
  assign delayMatch1_reg_next[25] = delayMatch1_reg[24];
  assign delayMatch1_reg_next[26] = delayMatch1_reg[25];
  assign delayMatch1_reg_next[27] = delayMatch1_reg[26];
  assign delayMatch1_reg_next[28] = delayMatch1_reg[27];
  assign delayMatch1_reg_next[29] = delayMatch1_reg[28];
  assign delayMatch1_reg_next[30] = delayMatch1_reg[29];
  assign delayMatch1_reg_next[31] = delayMatch1_reg[30];
  assign delayMatch1_reg_next[32] = delayMatch1_reg[31];
  assign delayMatch1_reg_next[33] = delayMatch1_reg[32];
  assign delayMatch1_reg_next[34] = delayMatch1_reg[33];
  assign delayMatch1_reg_next[35] = delayMatch1_reg[34];
  assign delayMatch1_reg_next[36] = delayMatch1_reg[35];
  assign delayMatch1_reg_next[37] = delayMatch1_reg[36];
  assign delayMatch1_reg_next[38] = delayMatch1_reg[37];
  assign delayMatch1_reg_next[39] = delayMatch1_reg[38];
  assign delayMatch1_reg_next[40] = delayMatch1_reg[39];
  assign delayMatch1_reg_next[41] = delayMatch1_reg[40];
  assign delayMatch1_reg_next[42] = delayMatch1_reg[41];
  assign delayMatch1_reg_next[43] = delayMatch1_reg[42];
  assign delayMatch1_reg_next[44] = delayMatch1_reg[43];
  assign delayMatch1_reg_next[45] = delayMatch1_reg[44];
  assign delayMatch1_reg_next[46] = delayMatch1_reg[45];



  assign o_VALID = i_VALID_1;

  assign ce_out = clk_enable;

  assign o_PHASE = Atan2_out1_1;

  assign o_MAGNITUDE = Sqrt_out1;

endmodule  // CALC_MAGNITUDE_AND_PHASE_FLOAT
