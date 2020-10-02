
`include "adder.v"
`include "class_file_deep.sv"
`timescale 1ns/1ns

module classes_tb();
reg a,b,cin;
adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

initial begin
cmd_base p1,p2;
p1=new;
p1.print();
$display("\n");

p2=new;

p2.copy(p1); //Deep Copy
p2.print();
$display("\n");
$display("\n");

p1.header=8'h12;
p1.length=0;
p1.en_random_data=1;
p1.d_obj.d1=1;
$display("\n");
$display("After canges are made on the p1 object");
p1.print();
$display("\n");
$display("Before Deep Copy");
$display("\n");
p2.print();

$display("\n");
$display("After Deep Copy");
$display("\n");
p2.copy(p1);
p2.print();

end 

endmodule


// OUTPUT of simulating the test_bench_Shallow_Copy -
/*
# header is 2a
# length is           2
# random bit is 1
# shallow copy data memeber is           0
# 
# 
# header is 2a
# length is           2
# random bit is 1
# shallow copy data memeber is           0
# 
# 
# 
# 
# 
# 
# After canges are made on the p1 object
# header is 12
# length is           0
# random bit is 1
# shallow copy data memeber is           1

# Before Deep Copy
# 
# 
# header is 2a
# length is           2
# random bit is 1
# shallow copy data memeber is           0

# After Deep Copy
# 
NOTE - Previously only the handle was created so p2.d_obj.d1 was nothing but p1.d_obj.d1
This time we are not just passing the handle but the value --> hence p2.d_obj is p2.d_obj
# 
# header is 12
# length is           0
# random bit is 1
# shallow copy data memeber is           1

*/

/*
# header is a2
# length is           2
# random bit is 1
# shallow copy data memeber is           0
# 
# 
# header is a2
# length is           2
# random bit is 1
# shallow copy data memeber is           0
# 
# 
# 
# 
# 
# 
# After canges are made on the p1 object
# header is 12
# length is           0
# random bit is 1
# shallow copy data memeber is           1
# 
# 
# Before Deep Copy
# 
# 
# header is a2
# length is           2
# random bit is 1
# shallow copy data memeber is           0
# 
# 
# After Deep Copy
# 
# 
# header is 12
# length is           0
# random bit is 1
# shallow copy data memeber is           1
*/
