//"environment.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

// all classes are included into env class!
class environment;
  generator gen;
  driver driv;
  monitor mon;
  scoreboard scb;  //take handle of all classes
  mailbox m1;
  mailbox m2;     //two mailbox are used so declare 2 mailbox and also one virtual interface
  
  virtual intf vif;
  function new(virtual intf vif);
    this.vif=vif;
    m1=new();     
    m2=new();
    gen=new(m1);   //In generator there was a parameter we pass m1 and assigned there!
    driv =new(vif,m1);  // two args are present virtual interface and mailbox
    mon =new(vif,m2);
    scb =new(m2);
  endfunction
  
  task test();   //env class encapsulated into top class!
    fork
      gen.main();
      driv.main();
      mon.main();
      scb.main();
    join
  endtask
  
  task run;
    test();   
    $finish;
  endtask
  
endclass
