`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:33 11/29/2020 
// Design Name: 
// Module Name:    EXtoMEMreg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module EXtoMEMreg(
    input wire clk,
    input wire reset,

    input wire [31:0] InstrIn,
    output wire [31:0] InstrOut,
    // input wire [4:0] WriteAddrIn,
    // output wire [4:0] WriteAddrOut,
    input wire [31:0] ALUResultIn,
    output wire [31:0] ALUResultOut,
    input wire [31:0] RData2In,
    output wire [31:0] RData2Out,

    input wire [31:0] curPCIn,
    output wire [31:0] curPCOut,
    input wire [1:0] TnewIn,
    output wire [1:0] TnewOut
    );

    reg [31:0] Instr=0;
    // reg [4:0] WriteAddr=0;
    reg [31:0] ALUResult=0;
    reg [31:0] RData2=0;
    reg [31:0] curPC=0;
    reg [1:0] Tnew = 0;

    always @(posedge clk) 
    begin
        if(reset) begin
            Instr <= 0;
            // WriteAddr <= 0;
            ALUResult <= 0;
            RData2 <= 0;
            curPC <= 0;
            Tnew <= 0;
        end
        else begin
            Instr <= InstrIn;
            // WriteAddr <= WriteAddrIn;
            ALUResult <= ALUResultIn;
            RData2 <= RData2In;
            curPC <= curPCIn;
            Tnew <= (TnewIn==0) ? 0 : TnewIn-1;
        end
    end

    assign InstrOut = Instr;
    // assign WriteAddrOut = WriteAddr;
    assign ALUResultOut = ALUResult;
    assign RData2Out = RData2;
    assign curPCOut = curPC;
    assign TnewOut = Tnew;

endmodule
