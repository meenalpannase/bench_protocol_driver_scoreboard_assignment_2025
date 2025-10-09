/************************************************************************
Author: Mirafra Technologies Pvt Limited
        By Meenal Pannase/Priya Ananthakrishnan
Filename:	Driver5.sv  
Date:   	15 oct 2025
Version:	1.0
Description: Concept of driver writing in UVM 
***************************************************************************/
//write a ahb driver code . follow the coding guidelines 

class ahb_driver extends uvm_driver#(ahb_tx);
	`uvm_component_utils(ahb_driver)
	virtual ahb_intf vif; //AHB Interface handle

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		end
	endfunction

	task run_phase(uvm_phase phase); 

		seq_item_port.get_next_item(req);
			drive_transfer(req);
		seq_item_port.item_done();
	end
	endtask

	task drive_transfer(ahb_tx req);
  endtask
endclass
