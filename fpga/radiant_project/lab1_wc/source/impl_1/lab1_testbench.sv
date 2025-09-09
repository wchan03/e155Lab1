// Wava Chan
// wchan@g.hmc.edu
// Sept. 2, 2025
// Testbench module to confirm code

`timescale 1us/1ns

module lab1_testbench();
	logic clk, reset;
	logic [3:0] s;
	logic [2:0] led; 
	logic [6:0] seg;
	logic [8:0] expected;
	logic [31:0] vectornum, errors;
	logic [13:0] testvectors[10000:0];
	
	//instatiate device under test 
	lab1_wc dut(s, led, seg);
	
	// generate clock
	always 
		begin 
			clk=1; #5; clk=0; #5;
		end
		
	// at the start of a test, load vectors + pulse reset
	initial 
		begin 
			$readmemb("lab1_testvectors.tv", testvectors);
			vectornum = 0; errors=0; reset=1; #22; reset=0;
		end 
	
	//apply testvectors on rsng edge of clock
	always @(posedge clk)
		begin 
			#1; {s, expected} = testvectors[vectornum];
		end
	// check results on falling edge of clk
	always @(negedge clk) 
		if (~reset) begin // skip during reset
			if ({led, seg} !== expected) begin // check result; 
				errors = errors + 1; 
			end
			vectornum = vectornum + 1;
			if (testvectors[vectornum] === 8'bx) begin 
				$display("%d tests completed with %d errors", vectornum, errors); 
				$stop; 
			end 
		end 
endmodule 
	
	

	