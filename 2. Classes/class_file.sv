class cmd_base;
logic [7:0] header;
int length;
bit en_random_data;

function new(logic [7:0] header,int length,bit en_random_data);
this.header=header;
this.length=length;
this.en_random_data=en_random_data;
endfunction
endclass