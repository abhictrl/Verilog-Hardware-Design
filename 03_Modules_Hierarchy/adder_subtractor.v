"""
An adder-subtractor can be built from an adder by optionally negating one of the inputs, which is equivalent to inverting the input then adding 1. 
The net result is a circuit that can do two operations: (a + b + 0) and (a + ~b + 1). See Wikipedia if you want a more detailed explanation of how 
this circuit works.

Build the adder-subtractor below.

You are provided with a 16-bit adder module, which you need to instantiate twice:

module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

Use a 32-bit wide XOR gate to invert the b input whenever sub is 1. (This can also be viewed as b[31:0] XORed with sub replicated 32 times. 
See replication operator.). Also connect the sub input to the carry-in of the adder.
"""

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] effb;
    wire [15:0] sum1, sum2;
    wire cout1, cout2;

    // Conditional Inverter: 
    // If sub=0, effb = b ^ 0 = b
    // If sub=1, effb = b ^ 1 = ~b
    assign effb = b ^ {32{sub}};

    // First 16-bit adder:
    // cin is connected to 'sub' to provide the "+1" for Two's Complement
    add16 instance1(
        .a(a[15:0]), 
        .b(effb[15:0]), 
        .cin(sub), 
        .sum(sum1), 
        .cout(cout1)
    );

    // Second 16-bit adder:
    add16 instance2(
        .a(a[31:16]), 
        .b(effb[31:16]), 
        .cin(cout1), 
        .sum(sum2), 
        .cout(cout2)
    );

    assign sum = {sum2, sum1};
    
endmodule