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
	//factory registeration
//constructor

//build phase		
//connect phase	
	task run_phase(uvm_phase phase); 

		seq_item_port.get_next_item(req);
		drive_transfer(req);//write ahb drive rlogic here
		seq_item_port.item_done();
	end
	endtask

	task drive_transfer(ahb_tx req);
  endtask
endclass
