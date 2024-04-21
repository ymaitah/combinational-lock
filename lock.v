module Lock(X, r, e, L, clk);

input [2:0] X;
input clk, e, r;
output reg L; 


parameter S0 = 0;
parameter S1 = 1;
parameter S2 = 2;
parameter S3 = 3;


reg[1:0] current_state, next_state;


always@(posedge clk) begin

	if(r) begin // system reset
			current_state <= S0;
			end
	else begin
			current_state <= next_state;
	end
end


always@* begin

case (current_state)
 
	S0:if(!r & e & (X == 3'b101)) 	// t1
			next_state = S1;
		else 
			next_state = S0; //t0
			
	
	S1:if(!r & e & (X == 3'b011)) 	// t2
			next_state = S2;
		else if (!r & !e)  				// t5
			next_state = S1; 
		else 
			next_state = S0; 			//t4
	
	S2:if(!r & e & (X == 3'b101)) 	// t3
			next_state = S3;
		else if (!r & !e)  				// t6
			next_state = S1; 
		else 
			next_state = S0; 			//t8
			
	S3:if(r) 	// t9
			next_state = S0; 
		else 
			next_state = S3; 			//t7
		

endcase
	
	end
	


always@* begin

case (current_state) 

//Locked 7'b0010000;	Unlocked 7'b0010000

S0:begin
L = 0;
end

S1:begin
L = 0;
end 

S2:begin
L = 0;
end

S3:begin
L = 1;
end

endcase

end




endmodule

