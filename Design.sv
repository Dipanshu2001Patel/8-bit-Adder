module adder_8bit(sum, final_carry_out, carry_in, x, y);
  input [7:0] x, y;
  input carry_in;

  output wire [7:0] sum;
  output final_carry_out;
  
  wire [7:0] carry_out;
  
  add S0 (carry_out[0], sum[0], x[0], y[0], carry_in);
  add S1 (carry_out[1], sum[1], x[1], y[1], carry_out[0]);
  add S2 (carry_out[2], sum[2], x[2], y[2], carry_out[1]);
  add S3 (carry_out[3], sum[3], x[3], y[3], carry_out[2]);
  add S4 (carry_out[4], sum[4], x[4], y[4], carry_out[3]);
  add S5 (carry_out[5], sum[5], x[5], y[5], carry_out[4]);
  add S6 (carry_out[6], sum[6], x[6], y[6], carry_out[5]);
  add S7 (carry_out[7], sum[7], x[7], y[7], carry_out[6]);
  
  assign final_carry_out = carry_out[7];
  
endmodule

// Full adder Descripction
module add(carry_out, sum, a, b, carry_in);
  input a, b, carry_in;
  output carry_out, sum;
  
  carry C (carry_out, a, b, carry_in);
  sum S (sum, a, b, carry_in);
  
endmodule
	
// Carry Module Descripction
module carry(carry_out, a, b, carry_in);
  input a, b, carry_in;
  output carry_out;
  wire t1, t2, t3;
  
  and G1 (t1, a, b);
  and G2 (t2, b, carry_in);
  and G3 (t3, carry_in, a);
  or G4 (carry_out, t1, t2, t3);
  
endmodule


//Sum Module Description  
module sum(sum, a, b, carry_in);
  input a, b, carry_in;
  output sum;
  wire t;
  
  xor G1 (t, a, b);
  xor G2 (sum, t, carry_in);
  
endmodule
  
