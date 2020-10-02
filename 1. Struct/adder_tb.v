`include "adder.v"
`timescale 1ns/1ns

module adder_tb();
reg a,b,cin;
adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

initial 
begin
	#5 a=1'b0;b=1'b0;cin=1'b0;
	#5 a=1'b0;b=1'b0;cin=1'b1;
	#5 a=1'b0;b=1'b1;cin=1'b0;
	#5 a=1'b0;b=1'b1;cin=1'b1;
	#5 a=1'b1;b=1'b0;cin=1'b0;
	#5 a=1'b1;b=1'b0;cin=1'b1;
	#5 a=1'b1;b=1'b1;cin=1'b0;
	#5 a=1'b1;b=1'b1;cin=1'b1;
end
endmodule
