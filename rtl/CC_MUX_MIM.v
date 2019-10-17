module CC_MUX_MIM #(parameter DATAWIDTH_MUX_SELECTION=2, parameter DATAWIDTH_OUTPUT_BUS=41, parameter DATAWIDTH_INPUT_BUS=11)(
	//////////// OUTPUTS //////////
	CC_MUX_data_OutBUS,
	//////////// INPUTS //////////
	CC_MUX_Next_InBUS,
	CC_MUX_Decode_InBUS,
	CC_MUX_Jump_InBUS,	
	CC_MUX_selection_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output reg	[DATAWIDTH_OUTPUT_BUS-1:0] CC_MUX_data_OutBUS;
input			[DATAWIDTH_INPUT_BUS-1:0] CC_MUX_Next_InBUS;
input			[DATAWIDTH_INPUT_BUS-4:0] CC_MUX_Decode_InBUS;
input			[DATAWIDTH_INPUT_BUS-1:0] CC_MUX_Jump_InBUS;
input			[DATAWIDTH_MUX_SELECTION-1:0] CC_MUX_selection_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always@(*)
begin
	case (CC_MUX_selection_InBUS)	
		2'b00: CC_MUX_data_OutBUS = CC_MUX_Next_InBUS;
		2'b01: CC_MUX_data_OutBUS = CC_MUX_Jump_InBUS;
		2'b10: CC_MUX_data_OutBUS = {1'b1,CC_MUX_Decode_InBUS,2'b00};
		default :   CC_MUX_data_OutBUS = CC_MUX_Next_InBUS; // channel 0 is selected 
	endcase
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL

endmodule
