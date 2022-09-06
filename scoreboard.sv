//scoreboard.sv

class scoreboard;
  mailbox mon2scb;  
  //take data from mailbox
  
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task main;
    transaction trans;  //handle of transaction class
    repeat(1)
    begin
      mon2scb.get(trans);  
   
      //just a comparator as here we wont include any reference model 
      
      if(((trans.a ^ trans.b ^ trans.cin == trans.s) && (((trans.a & trans.b)|((trans.a ^ trans.b) & trans.cin)) == trans.cout)))
        $display("Result is as expected");
      else
        $error("Wrong Result");
      
      trans.display("Scoreboard");
    end
  endtask
endclass
