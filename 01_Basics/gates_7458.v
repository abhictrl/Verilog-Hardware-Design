"""
The 7458 is a chip with four AND gates and two OR gates. This problem is slightly more complex than 7420.

Create a module with the same functionality as the 7458 chip. It has 10 inputs and 2 outputs. You may choose
to use an assign statement to drive each of the output wires, or you may choose to declare (four) wires for use as intermediate signals, 
where each internal wire is driven by the output of one of the AND gates. For extra practice, try it both ways.

"""

module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    input p2a, p2b, p2c, p2d,
    output p1y, p2y 
);

    // Intermediate wires for the AND gate outputs
    wire and1, and2, and3, and4;

    // Upper part of the chip: (p1a & p1b & p1c) OR (p1d & p1e & p1f)
    assign and1 = p1a & p1b & p1c;
    assign and2 = p1d & p1e & p1f;
    assign p1y  = and1 | and2;

    // Lower part of the chip: (p2a & p2b) OR (p2c & p2d)
    assign and3 = p2a & p2b;
    assign and4 = p2c & p2d;
    assign p2y  = and3 | and4;

endmodule