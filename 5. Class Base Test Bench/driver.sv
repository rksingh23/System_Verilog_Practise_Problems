class cmd_driver;
mailbox mbox;

function new(mailbox mbox);
this.mbox.mbox;
endfunction

task run();
cmd_base txn;

forever begin

mbox.get(txn); //Wait for command
txn.print("Command received in Driver: "); //Drive the transaction into DUT

end
endtask: run
endclass
