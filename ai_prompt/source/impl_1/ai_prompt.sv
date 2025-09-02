module led_blink_2hz (
    output logic led
);

    // Internal oscillator signal
    logic clk_int;

    // Instantiate internal oscillator (OSCH: ~2.08 MHz)
    OSCH #(
        .NOM_FREQ("2.08")  // Nominal frequency in MHz
    ) osc_inst (
        .STDBY(1'b0),       // 0 = oscillator enabled
        .OSC(clk_int),      // Output clock
        .SEDSTDBY()         // Unused standby status output
    );

    // Calculate toggle rate for 2 Hz blink using 2.08 MHz clock
    // 2.08 MHz / 4,160,000 = 0.5s toggle rate (i.e., 2 Hz)
    localparam int TOGGLE_COUNT = 1_040_000;  // Toggle every 0.5s

    logic [20:0] counter = 0;
    logic led_state = 0;

    always_ff @(posedge clk_int) begin
        if (counter == TOGGLE_COUNT - 1) begin
            counter <= 0;
            led_state <= ~led_state;
        end else begin
            counter <= counter + 1;
        end
    end

    assign led = led_state;

endmodule

