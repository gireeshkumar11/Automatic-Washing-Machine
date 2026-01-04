module wm(
    input clk,
    input reset,
    input start,
    output reg wash,
    output reg rinse,
    output reg spin
);

    // State declaration
    reg [1:0] state;

    // State encoding
    parameter IDLE  = 2'b00,
              WASH  = 2'b01,
              RINSE = 2'b10,
              SPIN  = 2'b11;

    // State transition
    always @(posedge clk) begin
        if (reset)
            state <= IDLE;
        else begin
            case (state)
                IDLE  : state <= start ? WASH : IDLE;
                WASH  : state <= RINSE;
                RINSE : state <= SPIN;
                SPIN  : state <= IDLE;
            endcase
        end
    end

    // Output logic
    always @(*) begin
        wash  = 0;
        rinse = 0;
        spin  = 0;

        case (state)
            WASH  : wash  = 1;
            RINSE : rinse = 1;
            SPIN  : spin  = 1;
        endcase
    end
