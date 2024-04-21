module Prac(SW, KEY, HEX0);
input[0:0] KEY;
input[17:0] SW;
output [6:0] HEX0;
wire L;
Lock inst1(SW[2:0], SW[17], SW[3], L, ~KEY[0]);
LookUp inst(L, HEX0);
endmodule












