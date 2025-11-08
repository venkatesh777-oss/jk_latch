//behavioural modelling
module jk_latch1 (
    input j, k, en,
    output reg q
);
    always @ (j or k or en) begin
        if (en) begin
            if (j == 0 && k == 0)
                q = q;        // Hold state
            else if (j == 0 && k == 1)
                q = 1'b0;     // Reset
            else if (j == 1 && k == 0)
                q = 1'b1;     // Set
            else if (j == 1 && k == 1)
                q = ~q;       // Toggle
        end
        // else: when enable = 0, latch holds (no change)
    end
endmodule
