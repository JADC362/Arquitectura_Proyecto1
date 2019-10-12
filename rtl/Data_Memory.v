//Módulo principal 

//=======================================================
//  MODULE Definition
//=======================================================

module Data_Memory #(DATAWIDTH_BUS=32)(

	//////////// OUTPUTS //////////
	DataMemory_Data_Out,
	
	//////////// INPUTS //////////
	DataMemory_Address_In,
	DataMemory_Data_In,
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
	
//=======================================================
//  Structural coding
//=======================================================

always @(*)
begin
	case(DataMemory_Address_In)
		32'b00000000000000000000000000000000:DataMemory_Data_Out=32'b00000000000000000000000000000000;
	
		default: DataMemory_Data_Out=32'b00000000000000000000000000000000; 
	endcase
end

endmodule
