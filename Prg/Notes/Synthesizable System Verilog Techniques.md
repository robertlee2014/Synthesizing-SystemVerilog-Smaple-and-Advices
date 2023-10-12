# Useful Skill about Packed and Unpacked Array in Design

Basically, in verilog designes, it is supposed to use vectors in 1-D and array in 2-D. And with EDA tool updates. the 3-D and more dimensions array is also employeed in design activities with verilog. The verilog vector and array is easy to understand and use. But the shortcomings are not flexiable and redundant especially in complicated datapath designs. Here is one simple smaple abouth the redundency:

Supposed that we need convert a 3-D array with $9 channels \times 16 lines \times 32 bits$ into 1-D vector with $9 \times 16 \times 32 bits$. In verilog style, it needs 2 for loops to complete the convert process.

```verilog
module array_convert(
    input  [31:0]        i_bus_in [0:15] [0:8],
    output [16*9*32-1:0] o_bus_out
);

generate
    for(genvar l1 = 0; l1 < 16; l1=l1+1) begin:LEVEL_1
        for(genvar l2 = 0; l2 < 9; l2=l2+1) begin:LEVEL_2
            assign o_bus_out[l1*(32*16)+l2*32+:32] = i_bus_in[l1][l2];
        end
    end
endgenerate

endmodule
```

With verilog codes, it is difficult to understand even by experienced engineers considering the succession of design. 

And back to the question itself, the purpose is to cluster the seperate signals into one for usage in PR sides. Thanks to the array extension in SV, this question can be coded by simplified methods.

```verilog
module array_convert_packed(
    input  [15:0][8:0][31:0] i_bus_in,
    output [16*9*32-1:0]     o_bus_out
);
    assign o_bus_out = i_bus_in;
endmodule
```
