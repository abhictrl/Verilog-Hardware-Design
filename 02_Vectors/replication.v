"""
Given five 1-bit signals (a, b, c, d, and e), compute all 25 pairwise one-bit comparisons in the 25-bit output vector. The output should be 1 if the two bits being compared are equal.

out[24] = ~a ^ a;   // a == a, so out[24] is always 1.
out[23] = ~a ^ b;
out[22] = ~a ^ c;
...
out[ 1] = ~e ^ d;
out[ 0] = ~e ^ e;


As the diagram shows, this can be done more easily using the replication and concatenation operators.

The top vector is a concatenation of 5 repeats of each input
The bottom vector is 5 repeats of a concatenation of the 5 inputs
"""

module top_module (
    input a, b, c, d, e,
    output [24:0] out 
);

    // We create two 25-bit vectors to compare against each other:
    // Vector 1: {aaaaa, bbbbb, ccccc, ddddd, eeeee}
    // Vector 2: {abcde, abcde, abcde, abcde, abcde}
    
    // Using XNOR (~^) gives a '1' if the bits are equal.
    assign out = ~({ {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} } ^ { 5{a,b,c,d,e} });

endmodule