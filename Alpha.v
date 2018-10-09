`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2018 07:12:13 PM
// Design Name: 
// Module Name: Alpha
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Alpha(
input btnC, btnL, btnR, btnU, btnD,
input clk,
input [7:0] sw,

output LeftMotor,
output RightMotor,
output reg [3:0] Direction = 4'b0000
//output reg [7:0] led
    );

           
localparam N = 18; 
 
//reg [N-1:0]count;
wire [5:0] speed;
assign speed =  sw[5:0];

Bravo L(
 .PWMrate (speed),
 .clk(clk),
 .PWMoutput(LeftMotor)
 );
 
Bravo R(
 .PWMrate (speed),
 .clk(clk),
 .PWMoutput(RightMotor)
 );
 
 
always @ (posedge clk)
    begin
           
        case (sw[7:6])
            2'b00 : Direction = 4'b1001; // Reverse
            2'b01 : Direction = 4'b0110; // Right
            2'b10 : Direction = 4'b1010; // Left
            2'b11 : Direction = 4'b0101; // Forward
            
        endcase
            
 end
      

    
endmodule
