// Wava Chan 
// wchan@g.hmc.edu
// Aug. 29, 2025
// Main module for testing operation of project board

module lab1_wc( // input logic clk, //TODO: how are we having the clock work? INTERNAL LOGIC (per vikram)
			input logic [3:0] s,
			input logic reset,	//TODO: not allowed as an input/output		
			output logic [2:0] led, 
			output logic [6:0] seg);
		
	logic int_osc; // Internal clock
	logic [10:0] counter;
  
	// START CODE FROM TUTORIAL
	// Internal high-speed oscillator
	HSOSC #(.CLKHF_DIV(2'b01)) 
			hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
			//TODO: what does this oscillator output look like?
  
	// Counter
	always_ff @(posedge int_osc) begin
		if(reset == 0)  counter <= 0;
		else		counter <= counter + 1; //TODO: Warning here
	end
  
	// Assign LED output
	assign led[0] = s[1] ^ s[0];
	assign led[1] = s[3] & s[2]; //TODO: Does order matter?
	assign led[2] = counter[10]; //TODO: is blinking rate correct?
			
	// END CODE FROM TUTORIAL 
	
	seg_disp sd(s, seg);
	
endmodule 


// TODO: 
// turn on those segments by powering those pins 
// figure out how to wire the 7 segment display 
// you need to wire 7 pins and ground one 