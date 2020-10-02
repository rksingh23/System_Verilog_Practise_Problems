`include "adder.v"
`timescale 1ns/1ns

module adder_tb();
reg a,b,cin;
adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
typedef struct
{
  logic [7:0] addr;
  logic [7:0] data[15:0];
  logic [3:0] cntrl;
}struct_tb;
struct_tb s1;

initial 
begin
  s1.addr=8'h2A;
  foreach(s1.data[i]) s1.data[i] = i;
  s1.cntrl=3'b001;
	#5 a=1'b0;b=1'b0;cin=1'b0;
	#5 a=1'b0;b=1'b0;cin=1'b1;
	#5 a=1'b0;b=1'b1;cin=1'b0;
	#5 a=1'b0;b=1'b1;cin=1'b1;
	#5 a=1'b1;b=1'b0;cin=1'b0;
	#5 a=1'b1;b=1'b0;cin=1'b1;
	#5 a=1'b1;b=1'b1;cin=1'b0;
	#5 a=1'b1;b=1'b1;cin=1'b1;
	
	
$display("%p",s1);
//$display("%b",s1.cntrl);
//$display("%3b",s1.addr)
//foreach(s1.data[i]) $display("\tValue of data[%0d]=%0d",i,s1.data[i]);

end

endmodule
