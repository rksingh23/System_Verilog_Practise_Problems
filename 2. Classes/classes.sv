
`include "adder.v"
`include "class_file.sv"
`timescale 1ns/1ns

module classes_tb();
reg a,b,cin;
adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

cmd_base b1;


initial begin
b1=new(8'h2A,2,1'b0);
$display("%p",b1);
$display("header is %h",b1.header);
$display("length is %d",b1.length);
$display("random bit is %b",b1.en_random_data);
end

endmodule
