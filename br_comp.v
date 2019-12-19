//Date: 03/06/2019
//Author: TrongTran
//Design CPU 32 bit

module br_comp (br_in_1, br_in_2, BrUn, BrEq, BrLt);
   parameter DATA_WIDTH = 32;

   input [DATA_WIDTH-1:0] br_in_1;
   input [DATA_WIDTH-1:0] br_in_2;
   input                  BrUn;
   output                 BrEq;
   output                 BrLt;

   wire                   BrEq;
   reg                    BrLt;

   always @ (*) begin
      case (BrUn)
         1'b0: begin
            if (br_in_1 >= br_in_2) begin
                BrLt = 1'b0;
            end else begin
                BrLt = 1'b1;
            end
         end
         1'b1: begin
            if ($signed(br_in_1) >= $signed(br_in_2)) begin
               BrLt = 1'b0;
            end else begin
               BrLt = 1'b1;
            end
         end
      endcase
   end

   assign BrEq = (br_in_1==br_in_2)?1'b1:1'b0;

endmodule
