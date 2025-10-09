/************************************************************************
Author: Mirafra Technologies Pvt Limited
        By Meenal Pannase/Priya Ananthakrishnan
Filename:	Driver1.sv  
Date:   	8th oct 2025
Version:	1.0
Description: Concept of driver writing in UVM 
***************************************************************************/
//write a apb driver code with wait cycles. follow the coding guidelines 

class apb_driver extends uvm_driver #(apb_trans);

//factory registeration
//constructor

//build phase		
//connect phase	
task run_phase(uvm_phase phase);

	forever begin
		//write driver logic here with wait cylces in apb
		end
endtask

endclass
