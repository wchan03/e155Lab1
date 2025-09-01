// Wava Chan 
// wchan@g.hmc.edu
// Aug. 29, 2025
// Main module for testing operation of project board

module lab1_wc(
			input logic [3:0] s,
			output logic [2:0] led, 
			output logic [6:0] seg);
		
	logic int_osc; // Internal clock
	logic [32:0] counter;
	
	// Segment display module
	seg_disp sd(s, seg);
  
	// START CODE FROM TUTORIAL
	// Internal high-speed oscillator
	HSOSC #(.CLKHF_DIV(2'b01)) 
			hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
  
	// Counter
	always_ff @(posedge int_osc) begin	
		counter <= counter + 33'd859;
	end
	
	// Assign LED output
	assign led[0] = s[1] ^ s[0];
	assign led[1] = s[3] & s[2];
	assign led[2] = counter[32];
			
	// END CODE FROM TUTORIAL 
	
	
endmodule 