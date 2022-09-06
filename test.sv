//"test.sv"

`include "environment.sv"

program test(intf i_intf);
  environment env;  //inside test there is env class so take handle for that here
  
  initial
    begin
      env=new(i_intf);   //passing interface 
      env.run();
    end
endprogram
