class my_env;
cmd_generator gen;
cmd_driver drv;
mailbox gen2drv;

function new();
gen2drv=new();
gen=new(gen2drv);
drv=new(gen2drv);
endfunction

task run();
fork
	gen.run();
	drv.run();
	join_none
	
	wait (gen.finished.triggered);
	$finish();
endtask : run
endclass

