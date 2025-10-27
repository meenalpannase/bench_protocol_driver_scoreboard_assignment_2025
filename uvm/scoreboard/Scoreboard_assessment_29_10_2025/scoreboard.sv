/************************************************************************
Author: Mirafra Technologies Pvt Limited
        By Meenal Pannase/Priya Ananthakrishnan
Filename:	Scoreborad.sv  
Date:   	29th Oct 2025
Version:	1.0
Description: Concept of scoreboard writing in UVM 
***************************************************************************/
//write scoreboard check for given scinario.fro below temaplate can make modification as required this the genric scoreboard structure to follow .

class my_scoreboard extends uvm_scoreboard;

  // Factory registration
  `uvm_component_utils(my_scoreboard)

  // Analysis exports to receive transactions
  uvm_analysis_imp #(my_txn, my_scoreboard) monitor_aport; 

  // Internal queues to store expected and actual data
  my_txn exp_queue[$];
  my_txn act_queue[$];

  //==========================================================
  // Constructor
  //==========================================================
  function new(string name = "my_scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  //==========================================================
  // Build Phase
  //==========================================================
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    monitor_aport = new("monitor_aport", this);
  endfunction

  //==========================================================
  // Write Method
  //==========================================================
  // This method is triggered whenever monitor sends a transaction
  function void write(my_txn t);
    `uvm_info(get_type_name(), $sformatf("Received Transaction:\n%s", t.sprint()), UVM_LOW)

    // Example logic: categorize into expected or actual
    if (t.is_expected)
      exp_queue.push_back(t);
    else
      act_queue.push_back(t);

    compare_queues();
  endfunction

  //==========================================================
  // Compare Queues
  //==========================================================
  function void compare_queues();
    my_txn exp, act;

    if (exp_queue.size() > 0 && act_queue.size() > 0) begin
      exp = exp_queue.pop_front();
      act = act_queue.pop_front();

      if (!compare_txn(exp, act))
        `uvm_error(get_type_name(), $sformatf("Mismatch:\nExpected: %s\nActual: %s", exp.sprint(), act.sprint()))
      else
        `uvm_info(get_type_name(), "Transaction Matched!", UVM_LOW)
    end
  endfunction
  
endclass : my_scoreboard
