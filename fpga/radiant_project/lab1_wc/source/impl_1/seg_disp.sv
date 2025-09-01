// Wava Chan 
// wchan@g.hmc.edu
// Aug. 29, 2025
// seg_disp determines which segments must be turned on for each hexidec digit

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
		// assign s = !s; // Flip all bits to pull segments DOWN to turn them on 
	end
endmodule 