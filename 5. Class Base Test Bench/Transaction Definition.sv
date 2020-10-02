//CPU Command NOP
class cpu_nop extends cpu_cmd_base;
virtual function void set_header();
	length=1;
	super.set_header();
	header[5:0]='h00;
endfunction: set_header

virtual function void fill_random_val();
endfunction: fill_random_val

virtual function void finalize_cmd();
super.finalize_cmd();
cmd[0]=header;
endfunction: finalize_cmd
endclass


//CPU Command ADD
class cpu_add extends cpu_cmd_base;
logic [7:0] op1,op2;

virtual function void set_header();
	length=3;
	super.set_header(); //sets the header[7:6]='h00
	header[5:0]='h01;   //set the command property
endfunction: set_header

virtual function void fill_random_val();
op1=$urandom_range(0,255);
op2=$urandom_range(0,255);
endfunction: fill_random_val

virtual function void finalize_cmd();
super.finalize_cmd();
cmd[0]=header;
cmd[1]=op1;
cmd[2]=op2;
endfunction: finalize_cmd
endclass: cpu_add

//CPU Command SUB
class cpu_sub extends cpu_cmd_base;
logic [7:0] op1,op2;

virtual function void set_header();
	length=3;
	super.set_header(); //sets the header[7:6]='h00
	header[5:0]='h02;   //set the command property
endfunction: set_header

virtual function void fill_random_val();
op1=$urandom_range(0,255);
op2=$urandom_range(0,255);
endfunction: fill_random_val

virtual function void finalize_cmd();
super.finalize_cmd();
cmd[0]=header;
//COndition 1st byte > 2nd byte
if(op1>=op2)
begin
cmd[1]=op1;
cmd[2]=op2;
end
else
begin
cmd[1]=op2;
cmd[2]=op1;
end
endfunction: finalize_cmd
endclass: cpu_sub

class mem_wait extends mem_cmd_base;

virtual function void set header(); 
length=1;
super.set_header(); //Sets the header [7:6] as 01
header[5:0]='h00;
endfunction: set_header

virtual function void fill_random_val();
endfunction: fill_random_val

virtual function void finalize_cmd();
super.finalize_cmd();
cmd[0]=header;
endfunction: finalize_cmd

endclass: mem_wait

class mem_load_reg extends mem_cmd_base;
logic [7:0] rgr;
logic[15:0] src;

virtual function void set header(); 
length=1;
super.set_header(); //Sets the header [7:6] as 01
header[5:0]='h01;
endfunction: set_header

virtual function void fill_random_val();
rgr=$urandom_range(0,255);
src=$urandom_range(0,'hffff);
endfunction: fill_random_val

virtual function void finalize_cmd();
super.finalize_cmd();
cmd[0]=header;
cmd[1]=rgr
cmd[2]=src[15:8];
cmd[3]=src[7:0];
endfunction: finalize_cmd

endclass

class mem_store_reg extends mem_cmd_base;
logic [7:0] rgr;
logic[15:0] dst;

virtual function void set header(); 
length=1;
super.set_header(); //Sets the header [7:6] as 01
header[5:0]='h02;
endfunction: set_header

virtual function void fill_random_val();
rgr=$urandom_range(0,255);
dst=$urandom_range(0,'hffff);
endfunction: fill_random_val

virtual function void finalize_cmd();
super.finalize_cmd();
cmd[0]=header;
cmd[1]=rgr
cmd[2]=dst[15:8];
cmd[3]=dst[7:0];
endfunction: finalize_cmd

endclass: mem_store_reg


class mem_copy extends mem_cmd_base;

logic[15:0] dst,src;

virtual function void set header(); 
length=1;
super.set_header(); //Sets the header [7:6] as 01
header[5:0]='h03;
endfunction: set_header

virtual function void fill_random_val();
src=$urandom_range(0,'hffff);
dst=$urandom_range(0,'hffff);
endfunction: fill_random_val

virtual function void finalize_cmd();
super.finalize_cmd(); //Sets the finalize command
cmd[0]=header;
cmd[1]=src[15:8];
cmd[2]=src[7:0];
cmd[3]=dst[15:8];
cmd[4]=dst[7:0];
endfunction: finalize_cmd

endclass: mem_copy
















