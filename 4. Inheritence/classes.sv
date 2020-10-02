
`include "adder.v"
`include "class_file.sv"
`timescale 1ns/1ns

module classes_tb();
reg a,b,cin;
adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));


initial begin
cmd_base b1;
cpu_cmd_base c1;
mem_cmd_base m1;

c1=new(8'h2A,2,1'b0);
m1=new(8'h35,4,1'b1);
b1=c1;

c1.print();
m1.print();
b1.print();
end

endmodule
