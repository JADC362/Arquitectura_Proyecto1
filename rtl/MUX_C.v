module MUX_C #(parameter DATAWIDTH_BUS=32)(
	//////////// OUTPUTS //////////
	CC_MUX_DataBUS_Out,
	//////////// INPUTS //////////
	CC_ALU_Data_Bus_In,
	CC_DataMemory_Data_Bus_In,
	CC_DataMemory_Selector_In
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
	output reg [DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_Out;
	input	[DATAWIDTH_BUS-1:0] CC_DataMemory_Data_Bus_In;
	input	[DATAWIDTH_BUS-1:0] CC_ALU_Data_Bus_In;
	input CC_DataMemory_Selector_In;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always@(*)
	begin
	case (CC_DataMemory_Selector_In)	
	// Example to more outputs: WaitStart: begin sResetCounter = 0; sCuenteUP = 0; end
		
		1'b0: CC_MUX_DataBUS_Out = CC_ALU_Data_Bus_In;
		1'b1: CC_MUX_DataBUS_Out = CC_DataMemory_Data_Bus_In;

		default : CC_MUX_DataBUS_Out = CC_DataMemory_Data_Bus_In; 
		endcase
	end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL

endmodule
