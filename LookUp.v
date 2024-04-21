module LookUp(L, hex);

	input L;
	output [6:0] hex;
	reg [6:0] LUT [4:0];
	

  
  
  assign hex = (L) ? 7'b1000001: 7'b1000111; 

endmodule

