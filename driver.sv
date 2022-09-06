//"driver.sv"

class driver;
  virtual intf vif;  //create a virtual interface  (intf is actual interface name) 
 // (vif is handle of virtual interface)
  
  mailbox gen2driv;  //get randomized inputs from generator!
  //recieves from same mailbox
  
  //two arguments passed and wahatever is passed is generally assigned to vif declared in this class and to gen2drive declared in this class
  function new(virtual intf vif,mailbox gen2driv);
    this.vif=vif;
    this.gen2driv=gen2driv;
  endfunction
  
  task main;
    repeat(1)
      begin
        transaction trans;  //handle of transaction class to get mailbox data  
        gen2driv.get(trans);  //takes trans data from mailbox
       
        //data recieved from transaction class to driver has to be passed to interface   or DUT using a virtual interface
        
        vif.a <= trans.a;
        vif.b <= trans.b;
        vif.cin <= trans.cin;
  // we pass input signals to interface
  
        trans.s = vif.s;
        trans.cout = vif.cout;  //sampling is done this is optional we can also sample in monitor class if required
        trans.display("driver");
      end
  endtask
  
endclass
