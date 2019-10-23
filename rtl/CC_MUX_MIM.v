module CC_MUX_MIM #(parameter DATAWIDTH_MUX_SELECTION=2, parameter DATAWIDTH_BUS=11)(
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
output reg	[DATAWIDTH_BUS-1:0] CC_MUX_data_OutBUS;
input			[DATAWIDTH_BUS-1:0] CC_MUX_Next_InBUS;
input			[DATAWIDTH_BUS-4:0] CC_MUX_Decode_InBUS;
input			[DATAWIDTH_BUS-1:0] CC_MUX_Jump_InBUS;
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
		2'b10: begin
			if(CC_MUX_Decode_InBUS[7:6]==2'b00)
				CC_MUX_data_OutBUS = {1'b1,CC_MUX_Decode_InBUS[7:3],5'b00000};
			else
				CC_MUX_data_OutBUS = {1'b1,CC_MUX_Decode_InBUS,2'b00};
			end
		default :   CC_MUX_data_OutBUS = CC_MUX_Next_InBUS; // channel 0 is selected 
	endcase
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL

endmodule
