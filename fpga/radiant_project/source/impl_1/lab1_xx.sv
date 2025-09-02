// Wava Chan 
// wchan@g.hmc.edu
// Aug. 29, 2025
// TODO: insert brief summary here 

module lab1_xx( input logic clk //TODO: how are we having the clock work? 
			input logic [3:0] s, 
			output logic [2:0] led, 
			output logic [6:0] seg);
		logic led_1, led_2;
			
	seg_display sd(clk, s, seg);
			
endmodule 

// Wava Chan 
// wchan@g.hmc.edu
// Aug. 29, 2025
// seg_display determines which segments must be turned on for each hexidec digit

module seg_disp( input logic clk,
				input logic [3:0] s,
				output logic [6:0] seg
	)
	
	always_comb begin
		// seg[0] is A
		// seg[6] is G
		//TODO: is the way im assigning things right?
		case(s):
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

//assigns led1 (led[0]) based on s
//TODO: intermediate variable for led[2:0]
module led1_2(input logic clk,
	input logic [3:0],
	output logic led_1, led_2
	)
	
	always_comb begin
		case(s):
			4'b00xx: led_1 <= 0; //assign LOW/OFF to led
			4'b10xx: led_1 <= 1; //assign ON
			4'b10xx: led_1 <= 1; //On
			4'b11xx: led_1 <= 0; //OFF
			4'bxx00: led_2 <= 0; //OFF
			4'bxx01: led_2 <= 0; //OFF
			4'bxx10: led_2 <= 0; //OFF
			4'bxx11: led_2 <= 1; //on
		endcase 
	end
		
endmodule 

module led3(
	)
	//TODO: figure out how to blink at 2.4Hz
endmodule



// TODO: 
// turn on those segments by powering those pins 
// figure out how to wire the 7 segment display 
// you need to wire 7 pins and ground one 