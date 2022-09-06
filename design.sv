//design.sv
module full_adder(a,b,cin,s,cout);
  input a,b,cin;
  output s,cout;
  
  assign s = (a^b^cin);
  assign cout = ((a&b) | (a^b) & cin);
 
  /*
  
  logic a1,a2,a3;
  
  xor u1(a1,a,b);
  and u2(a2,a,b);
  and u3(a3,a1,cin);
  or u4(cout,a2,a3);
  xor u5(s,a1,cin);  
  
  */
  
endmodule
