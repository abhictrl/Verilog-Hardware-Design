// Build an XOR gate three ways, using an assign statement, a combinational always block, and a clocked always block. Note that the 
// clocked always block produces a different circuit from the other two: There is a flip-flop so the output is delayed.

// synthesis verilog_input_version verilog_2001
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );

    // 1. Continuous assignment
    assign out_assign = a ^ b;

    // 2. Combinational always block: Use BLOCKING (=)
    always @(*) out_always_comb = a ^ b;

    // 3. Clocked always block: Use NON-BLOCKING (<=)
    // This creates a D-Flip-Flop at the output
    always @(posedge clk) out_always_ff <= a ^ b;

endmodule