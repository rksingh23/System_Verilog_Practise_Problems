class shallow_copy;
int d1;
endclass


class cmd_base;
logic [7:0] header;
int length;
bit en_random_data;

shallow_copy d_obj; //object of shallow copy

function new(logic [7:0] header,int length,bit en_random_data);
this.header=header;
this.length=length;
this.en_random_data=en_random_data;
d_obj =new;
endfunction

function void copy(cmd_base p1);
this.header=p1.header;
this.length=p1.length;
this.en_random_data=p1.en_random_data;
this.d_obj.d1=p1.d_obj.d1;
endfunction

function print();
$display("header is %h",this.header);
$display("length is %d",this.length);
$display("random bit is %b",this.en_random_data);
$display("shallow copy data memeber is %d",d_obj.d1);
endfunction

endclass



