module alutest;
  reg [7:0]X,Y;
  reg carry_in;
  reg [7:0]sum;
  wire cout;
	
  adder_8bit dut (.sum(sum), .final_carry_out(cout), .carry_in(carry_in), .x(X), .y(Y));
  
 initial
    begin
      $dumpfile ("alu.vcd");
      $dumpvars (0,alutest);
      $monitor ($time," X=%d,Y=%d,carry_in=%b,sum=%d, cout=%b",X,Y,carry_in,sum,cout);
      
      #5 X=8'd10;  Y=8'd2;   carry_in=1'b0;
      #5 X=8'd125; Y=8'd124; carry_in=1'b0;
      #5 X=8'd108; Y=8'd32;  carry_in=1'b0;
      #5 X=8'd10;  Y=8'd200; carry_in=1'b0; 
      #5 X=8'd1;   Y=8'd29;  carry_in=1'b0;
      #5 X=8'd1;   Y=8'd29;  carry_in=1'b1;
      #5 X=8'd128; Y=8'd129;  carry_in=1'b0;
      #5 $finish;
      
    end
endmodule
