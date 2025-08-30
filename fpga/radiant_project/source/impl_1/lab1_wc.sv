// Wava Chan 
// wchan@g.hmc.edu
// Aug. 29, 2025
// Main module for testing operation of project board

module lab1_wc( input logic clk, //TODO: how are we having the clock work? 
			input logic [3:0] s,
			input logic reset,			
			output logic [2:0] led, 
			output logic [6:0] seg);
	logic led_0, led_1;
		
	logic int_osc;
	logic [24:0] counter;
  
	// START CODE FROM TUTORIAL
	// Internal high-speed oscillator
	HSOSC #(.CLKHF_DIV(2'b01)) 
			hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
  
	// Counter
	always_ff @(posedge int_osc) begin
		if(reset == 0)  counter <= 0;
		else            counter <= counter + 1;
	end
  
	// Assign LED output
	assign led[2] = counter[24]; //TODO: this is blinking at ~1Hz. NOT 2.4
			
	// END CODE FROM TUTORIAL 
	
	seg_disp sd(clk, s, seg);
	led0_1 leds(clk, s, led_0, led_1);
	
	assign led[0] = led_0;
	assign led[1] = led_1; //TODO: this is shaky
	
	
	
			
endmodule 

// Wava Chan 
// wchan@g.hmc.edu
// Aug. 29, 2025
// seg_display determines which segments must be turned on for each hexidec digit

module seg_disp( input logic clk,
				input logic [3:0] s,
				output logic [6:0] seg
	);
	
	always_comb begin
		// seg[0] is A
		// seg[6] is G
		//TODO: is the way im assigning things right?
		case(s)
			4'b0000: seg <= 7'b1111110; //0
			4'b0001: seg <= 7'b0110000; //1
			4'b0010: seg <= 7'b1101101; //2
			4'b0011: seg <= 7'b1111001; //3
			4'b0100: seg <= 7'b0110011; //4
			4'b0101: seg <= 7'b1011011; //5
			4'b0110: seg <= 7'b1011111; //6
			4'b0111: seg <= 7'b1110000; //7
			4'b1000: seg <= 7'b1111111; //8
			4'b1001: seg <= 7'b1111011; //9
			4'b1010: seg <= 7'b1110111; //A
			4'b1011: seg <= 7'b0011111; //B
			4'b1100: seg <= 7'b0001101; //C
			4'b1101: seg <= 7'b0111101; //D
			4'b1110: seg <= 7'b1001111; //E
			4'b1110: seg <= 7'b1001111; //E
			4'b1111: seg <= 7'b1000111; //F
		endcase
	end
endmodule 

//TODO: intermediate variable for led[2:0]?
//TODO: does this need to be a module?

// Wava Chan 
// wchan@g.hmc.edu
// Aug. 29, 2025
// Assigns led output based on input value from s
module led0_1(input logic clk,
	input logic [3:0] s,
	output logic led_0, led_1 
	);

	assign led_0 = s[1] ^ s[0];
	assign led_1 =  s[3] & s[2];
		
endmodule 


// TODO: 
// turn on those segments by powering those pins 
// figure out how to wire the 7 segment display 
// you need to wire 7 pins and ground one 