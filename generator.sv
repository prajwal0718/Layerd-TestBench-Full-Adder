//"generator.sv"

class generator;
  transaction trans;  //take handle of transaction class
  
  mailbox gen2driv;  //MailBox declaration
  //generator to driver 
  
  
  //new creates memory for gen class.
  function new(mailbox gen2driv);
    this.gen2driv=gen2driv;
  endfunction
  
  task main();
    repeat(1)
      begin
        trans=new();    //object for transaction class is created
        trans.randomize();  //randomization of inputs 
        trans.display("Generator");
//trans is handle of transaction class so it goes to transaction class and calls display method.
        
        gen2driv.put(trans);  //put randomized data  into mailbox
      end
  endtask
endclass
