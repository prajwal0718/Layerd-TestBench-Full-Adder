//monitor.sv

class monitor;
  virtual intf vif;  //monitor also requires virtual interface as it recieves from interface
  mailbox mon2scb;  //monitor to scoreboard as RM is done in Sb only 
  
  //We can sample all input and output signals in one sample class
  
  function new(virtual intf vif, mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  
  task main;
    repeat(1)
      #3;  //just for sampling after 3ns
    begin
    transaction trans;   // handle of transaction class!!
      trans=new();    //object for transaction
      
    trans.a = vif.a;   //now io signals are present ininterface
    trans.b = vif.b;
    trans.cin = vif.cin;  //sampling input 
    
    trans.s = vif.s;
    trans.cout=vif.cout;  //sampling output
     
    mon2scb.put(trans);  
    trans.display("monitor");
    end
  endtask
endclass
