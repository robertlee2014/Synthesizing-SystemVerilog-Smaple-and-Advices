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

//SV version
module array_convert_packed(
    input  [15:0][8:0][31:0] i_bus_in,
    output [16*9*32-1:0]     o_bus_out
);
    assign o_bus_out = i_bus_in;
endmodule