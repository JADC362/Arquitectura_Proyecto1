module CC_MIM_ControlStore #(parameter DATAWIDTH_OUTPUT_BUS=41, parameter DATAWIDTH_INPUT_BUS=11)(
	//////////// OUTPUTS //////////
	CC_MIM_ControlStore_data_OutBUS,
	//////////// INPUTS //////////
	CC_MIM_ControlStore_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output reg	[DATAWIDTH_OUTPUT_BUS-1:0] CC_MIM_ControlStore_data_OutBUS;
input			[DATAWIDTH_INPUT_BUS-1:0] CC_MIM_ControlStore_data_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always@(*)
begin
	case (CC_MIM_ControlStore_data_InBUS)	
		11'b00000000000: CC_MIM_ControlStore_data_OutBUS = 41'b10000001000000001101010010100000000000000; //0
		11'b00000000001: CC_MIM_ControlStore_data_OutBUS = 41'b00000000000000000000000010111100000000000; //1
		11'b11001000000: CC_MIM_ControlStore_data_OutBUS = 41'b00000000000000000000000010110111001000010; //1600
		11'b11001000001: CC_MIM_ControlStore_data_OutBUS = 41'b00000010000001000000100001111011111111111; //1601
		11'b11001000010: CC_MIM_ControlStore_data_OutBUS = 41'b00110100000000100001000110000000000000000; //1602
		11'b11001000011: CC_MIM_ControlStore_data_OutBUS = 41'b00000011000010000000100001111011111111111; //1603
		11'b10001000000: CC_MIM_ControlStore_data_OutBUS = 41'b00000000000000000000000010111000000000010; //1088
		11'b00000000010: CC_MIM_ControlStore_data_OutBUS = 41'b00110100000000100001000101000000000000000; //2
		11'b00000000011: CC_MIM_ControlStore_data_OutBUS = 41'b10000100000000100001000111100000000000000; //3
		11'b00000000100: CC_MIM_ControlStore_data_OutBUS = 41'b10000100000000100001000111100000000000000; //4
		11'b00000000101: CC_MIM_ControlStore_data_OutBUS = 41'b00110100000000001101000111100000000000000; //5
		11'b00000000110: CC_MIM_ControlStore_data_OutBUS = 41'b00110100000000001101000111100000000000000; //6
		11'b00000000111: CC_MIM_ControlStore_data_OutBUS = 41'b00110100000000001101000111100000000000000; //7
		11'b00000001000: CC_MIM_ControlStore_data_OutBUS = 41'b00110101001000001101000100010100000001100; //8
		11'b00000001001: CC_MIM_ControlStore_data_OutBUS = 41'b00110101001000001101000100010100000001101; //9
		11'b00000001010: CC_MIM_ControlStore_data_OutBUS = 41'b00110101001000001101000100001000000001100; //10
		11'b00000001011: CC_MIM_ControlStore_data_OutBUS = 41'b00000000000000000000000010111011111111111; //11
		11'b00000001100: CC_MIM_ControlStore_data_OutBUS = 41'b10000001000010100000000100011000000000000; //12
		11'b11111111111: CC_MIM_ControlStore_data_OutBUS = 41'b10000000000000100000000111011000000000000; //2047
		default :   CC_MIM_ControlStore_data_OutBUS = 41'b00000000000000000000000000000000000000000;
	endcase
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL

endmodule
