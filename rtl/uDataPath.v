//=======================================================
//  MODULE Definition
//=======================================================
module uDATAPATH #(parameter DATAWIDTH_BUS=32)(
	//////////// OUTPUTS //////////
	uDataPath_Overflow_InLow,
	uDataPath_Carry_InLow,
	uDataPath_Negative_InLow,
	uDataPath_Zero_InLow,
	UU_uDataPath_Set_Codes_Out,
	//////////// INPUTS //////////
	uDataPath_CLOCK_50,
	uDATAPATH_RESET_InHigh,
	uDataPath_ALUSelection_IN,
	
	uDataPath_MirRegisterA,
	uDataPath_MirRegisterB,
	uDataPath_MirRegisterC,
	uDataPath_A_MUX_MIR,
	uDataPath_B_MUX_MIR,
	uDataPath_C_MUX_MIR,
	uDataPath_op,
	uDataPath_IR13,
	uDataPath_RD
);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

	//////////// OUTPUTS //////////

	output 	uDataPath_Overflow_InLow;
	output 	uDataPath_Carry_InLow;
	output 	uDataPath_Negative_InLow; 
	output 	uDataPath_Zero_InLow;
	output   [7:0] uDataPath_op;
	output   uDataPath_IR13;
	output   uDataPath_Flags_Write_PSR;
	
	//////////// INPUTS //////////
	
	input uDataPath_CLOCK_50;
	input [3:0] uDataPath_ALUSelection_In;
	
		//Active Mux A
	input uDataPath_A_Select_MUX_MIR;	
	input uDataPath_B_Select_MUX_MIR;	
	input uDataPath_C_Select_MUX_MIR;	
	
	input [5:0] uDataPath_A_MUX_MIR_Bus;
	input [5:0] uDataPath_B_MUX_MIR_Bus;
	input [5:0] uDataPath_C_MUX_MIR_Bus;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
// ARC_REGISTERS OUTPUTS WIRES (registros vitales)

	wire [DATAWIDTH_BUS-1:0] Reg2MUX_DataBUS_Wire_PC; 
	wire [DATAWIDTH_BUS-1:0] Reg2MUX_DataBUS_Wire_temp0;
	wire [DATAWIDTH_BUS-1:0] Reg2MUX_DataBUS_Wire_temp1;
	wire [DATAWIDTH_BUS-1:0] Reg2MUX_DataBUS_Wire_temp2;
	wire [DATAWIDTH_BUS-1:0] Reg2MUX_DataBUS_Wire_temp3;
	wire [DATAWIDTH_BUS-1:0] Reg2MUX_DataBUS_Wire_IR;
	
	wire [DATAWIDTH_BUS-1:0] RegGeneral_2MUX
	
	
	
	