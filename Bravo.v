`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2018 07:13:04 PM
// Design Name: 
// Module Name: Foxtrot
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

// PWM module for controlling the motors on the rover

module Bravo(
input [5:0] PWMrate,
input clk,
output reg PWMoutput = 0
    );
    
reg [5:0] count = 0;

always @ (posedge clk)
    begin
        PWMoutput <= (count < PWMrate);
        count = count + 1;
    end
endmodule
