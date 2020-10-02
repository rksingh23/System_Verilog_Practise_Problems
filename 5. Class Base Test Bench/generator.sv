class cmd_generator;
mailbox mbox;
event finished;

function new(mailbox mbox);
this.mbox=mbox;
endfunction

task run();
cpu_nop nop;
cpu_add add;
mem_store_reg store_reg;
mem_copy copy;

repeat (10) begin
nop=new();
nop.print("Generator Cmd: ");
mbox.put(nop);

add=new();
add.print("Generator Cmd: ");
mbox.put(add);

store_reg=new();
store_reg.print("Generator Cmd: ");
mbox.put(store_reg);

copy=new();
assert(copy.randomize());
copy.print("Generator Cmd: ");
mbox.put(copy);
end

store_reg=new();
store_reg.dst=16'hFFFF;
store_reg.rgr=8'h22;
store_reg.process_cmd(0);
store_reg.print("Non Random Store Reg Command - Generator Cmd : ");
mbox.put(store_reg);

->finished; //Triggering the event "Finished"
endtask:run


endclass
