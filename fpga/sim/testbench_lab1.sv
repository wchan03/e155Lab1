// Wava Chan
// wchan@g.hmc.edu
// Nov 2025
// Testbench for top level module of Lab 1

`timescale 1ns/1ns

module testbench_lab1();

    //set up logic 
    logic [3:0] s;
    logic [2:0] led, led_exp; 
    logic [6:0] seg, seg_exp;
    logic clk;
    
    //instantiate device under test
    lab1_wc dut(.s(s), .led(led), .seg(seg));

    //clock production 
    always
    begin
        clk = 1; #5;
        clk = 0; #5;
    end

    initial 
        begin

            #20
            s = 0001; 
            led = 

        end

        0000_1000000
0001_1111001
0010_0100100
0011_0110000
0100_0011001
0101_0010010
0110_0000010
0111_1111000
1000_0000000
1001_0010000
1010_0001000
1011_0000011
1100_0100111
1101_0100001
1110_0000110
1111_0001110

    

endmodule;