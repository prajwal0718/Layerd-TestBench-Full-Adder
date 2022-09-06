//"testbench.sv"

//Top msot level 

`include "interface.sv"
`include "test.sv"

module tbench_top;
  intf i_intf();
  test t1(i_intf);
  
  // instantiation is done here
  full_adder f1 (
    .a(i_intf.a),
    .b(i_intf.b),
    .cin(i_intf.cin),
    .s(i_intf.s),
    .cout(i_intf.cout)
  );
  
  initial begin
    $display("Name: Prajwal D Nayak, SRN: PES1UG19EC200");
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
