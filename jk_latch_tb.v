//testbench for jk latch
module jk_latch1_tb();

    reg j, k, en;
    wire q;

    // Instantiate the DUT
    jk_latch1 uut (
        .j(j),
        .k(k),
        .en(en),
        .q(q)
    );

    initial begin
        $monitor("Time=%0t | en=%b j=%b k=%b | q=%b ", $time, en, j, k, q);
        
        // Initial conditions
        en = 0; j = 0; k = 0; #10;

        // Enable latch and set/reset combinations
        en = 1;

        j = 0; k = 0; #10;  // No change
        j = 0; k = 1; #10;  // Reset
        j = 1; k = 0; #10;  // Set
        j = 1; k = 1; #10;  // Toggle
        j = 1; k = 1; #10;  // Toggle again
        j=0;k=1;#10;
        j=1;k=1;#10;

        // Disable latch - should hold value
        en = 0; j = 1; k = 0; #10;

        $finish;
    end
