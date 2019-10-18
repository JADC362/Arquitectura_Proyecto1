//Módulo principal 

//=======================================================
//  MODULE Definition
//=======================================================

module Data_Memory #(parameter DATAWIDTH_BUS=32)(

	//////////// OUTPUTS //////////
	DataMemory_Data_Out,
	
	//////////// INPUTS //////////
	DataMemory_Address_In,
	DataMemory_Data_In,
	DataMemory_Cont,
	DataMemory_Selector_RD,
	DataMemory_Selector_WR
);

//=======================================================
//  PORT declarations
//=======================================================

	//////////// OUTPUTS //////////
	output reg [DATAWIDTH_BUS-1:0] DataMemory_Data_Out;
	
	//////////// INPUTS //////////
	input [DATAWIDTH_BUS-1:0] DataMemory_Address_In;
	input [DATAWIDTH_BUS-1:0] DataMemory_Data_In;
	input DataMemory_Selector_RD;
	input DataMemory_Selector_WR;
	input [DATAWIDTH_BUS-1:0] DataMemory_Cont;
	
//=======================================================
//  Structural coding
//=======================================================

always @(*)
begin
	case(DataMemory_Address_In)
		32'h00000000:DataMemory_Data_Out=32'h00000000;
		32'h00000004:DataMemory_Data_Out=32'h00000001;
		32'h00000008:DataMemory_Data_Out=DataMemory_Cont;
		32'h00000800:DataMemory_Data_Out=32'hc2002004;
		32'h00000804:DataMemory_Data_Out=32'hc8002008;
		32'h00000808:DataMemory_Data_Out=32'h88810000;
		32'h0000080c:DataMemory_Data_Out=32'h02800007;
		32'h00000810:DataMemory_Data_Out=32'h86804002;
		32'h00000814:DataMemory_Data_Out=32'h8280a000;
		32'h00000818:DataMemory_Data_Out=32'h8480e000;
		32'h0000081c:DataMemory_Data_Out=32'h88813fff;
		32'h00000820:DataMemory_Data_Out=32'h02800002;
		32'h00000824:DataMemory_Data_Out=32'h10bffffb;
	
		default: DataMemory_Data_Out=32'h00000000; 
	endcase
end

endmodule
