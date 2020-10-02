`include "Base_class.sv"
`include "Transaction Definition.sv"
`include "generator.sv"
`include "driver.sv"
`include "environment.sv"

module my_test_bench();

//Initiate and Connect DUT
my_design my_design();
my_env env;
initial begin
env=new();
env.run();
end
endmodule 