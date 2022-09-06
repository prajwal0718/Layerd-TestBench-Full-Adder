// "transaction.sv"
class transaction;   //packet class
  
  rand bit a;
  rand bit b;
  rand bit cin;  //inputs are declared as rand 
  
  bit s;
  bit cout;   //outputs are declared 
  
  function void display(string name);
    $display("----------------------");
    $display("%s",name);  //name of class gets printed here!!
    $display("----------------------");
    $display("a=%0d,b=%0d,cin=%0d",a,b,cin);
    $display("Sum=%0d,cout=%0d",s,cout);
    $display("----------------------");
  endfunction
endclass
