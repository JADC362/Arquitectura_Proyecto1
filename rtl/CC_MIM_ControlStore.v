module CC_MIM_ControlStore #(parameter DATAWIDTH_MUX_SELECTION=3, parameter DATAWIDTH_BUS=8)(
	//////////// OUTPUTS //////////
	CC_MUX_data_OutBUS,
	//////////// INPUTS //////////
	CC_MUX_data0_InBUS,
	CC_MUX_data1_InBUS,
	CC_MUX_data2_InBUS,	
	CC_MUX_data3_InBUS,	
	CC_MUX_data4_InBUS,	
	CC_MUX_data5_InBUS,	
	CC_MUX_data6_InBUS,	
	CC_MUX_data7_InBUS,	
	CC_MUX_selection_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output reg	[DATAWIDTH_BUS-1:0] CC_MUX_data_OutBUS;
input			[DATAWIDTH_BUS-1:0] CC_MUX_data0_InBUS;
input			[DATAWIDTH_BUS-1:0] CC_MUX_data1_InBUS;
input			[DATAWIDTH_BUS-1:0] CC_MUX_data2_InBUS;
input			[DATAWIDTH_BUS-1:0] CC_MUX_data3_InBUS;	
input			[DATAWIDTH_BUS-1:0] CC_MUX_data4_InBUS;
input			[DATAWIDTH_BUS-1:0] CC_MUX_data5_InBUS;
input			[DATAWIDTH_BUS-1:0] CC_MUX_data6_InBUS;
input			[DATAWIDTH_BUS-1:0] CC_MUX_data7_InBUS;
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
	// Example to more outputs: WaitStart: begin sResetCounter = 0; sCuenteUP = 0; end
		3'b000: CC_MUX_data_OutBUS = CC_MUX_data0_InBUS;
		3'b001: CC_MUX_data_OutBUS = CC_MUX_data1_InBUS;
		3'b010: CC_MUX_data_OutBUS = CC_MUX_data2_InBUS;
		3'b011: CC_MUX_data_OutBUS = CC_MUX_data3_InBUS;
		3'b100: CC_MUX_data_OutBUS = CC_MUX_data4_InBUS;
		3'b101: CC_MUX_data_OutBUS = CC_MUX_data5_InBUS;
		3'b110: CC_MUX_data_OutBUS = CC_MUX_data6_InBUS;
		3'b111: CC_MUX_data_OutBUS = CC_MUX_data7_InBUS;
		default :   CC_MUX_data_OutBUS = CC_MUX_data0_InBUS; // channel 0 is selected 
	endcase
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL

endmodule
