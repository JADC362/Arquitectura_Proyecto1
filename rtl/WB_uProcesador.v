//Módulo principal 


//=======================================================
//  MODULE Definition
//=======================================================
module WB_uProcesador #(
	parameter DATAWIDTH_BUS=32,
	parameter DATA_REGFIXED_INIT_0=32'b00000000000000000000000000000000,
	parameter DATAWIDTH_BUS_REG_IR=5,
	parameter DATAWIDTH_BUS_REG_IR_OP=8,
	parameter DATAWIDTH_DECODER_SELECTION=4, 
	parameter DATAWIDTH_DECODER_OUT=16,
	parameter DATAWIDTH_MUX_SELECTION=4,
	parameter DATAWIDTH_ALU_SELECTION=4,
	parameter DATAWIDTH_BUS_REG_MIR_FIELD=6,
	parameter DATAWIDTH_BUS_MUX_DATAPATH_OUT=6,
	parameter DATAWIDTH_COND_MIR =3, 
	parameter DATAWIDTH_BANDERAS=4, 
	parameter DATAWIDTH_BUS_OUT=2
)(
//////////// INPUTS //////////
	WB_uProcesador_CLOCK_50,
	WB_uProcesador_Reset_InHigh
);

//=======================================================
//  PORT declarations
//=======================================================
	input 	WB_uProcesador_CLOCK_50;
	input 	WB_uProcesador_Reset_InHigh;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
	
	wire  uDataPath_Overflow_InLow_Wire;
	wire  uDataPath_Carry_InLow_Wire;
	wire  uDataPath_Negative_InLow_Wire;
	wire  uDataPath_Zero_InLow_Wire;
	wire  uDataPath_ALU_Flags_Write_PCR_Wire;
	wire  uDataPath_Reg_IR_OP_Wire;
	wire  uDataPath_Reg_IR_IR13;
	
	wire [DATAWIDTH_ALU_SELECTION-1:0] uDataPath_ALU_Selection_In_Wire;
	wire [DATAWIDTH_BUS_REG_MIR_FIELD-1:0] uDataPath_MUX_A_MIR_Wire;
	wire [DATAWIDTH_BUS_REG_MIR_FIELD-1:0] uDataPath_MUX_B_MIR_Wire;
	wire [DATAWIDTH_BUS_REG_MIR_FIELD-1:0] uDataPath_MUX_C_MIR_Wire;
	wire uDataPath_MUX_A_MIR_Selector_Wire;
	wire uDataPath_MUX_B_MIR_Selector_Wire;
	wire uDataPath_MUX_C_MIR_Selector_Wire;
	wire [DATAWIDTH_BUS-1:0] uDataPath_DataMemory_Data_In_Wire;
	wire uDataPath_DataMemory_Selector_In_Wire;

uDATAPATH #(
	.DATAWIDTH_BUS(DATAWIDTH_BUS),
	.DATA_REGFIXED_INIT_0(DATA_REGFIXED_INIT_0),
	.DATAWIDTH_BUS_REG_IR(DATAWIDTH_BUS_REG_IR),
	.DATAWIDTH_BUS_REG_IR_OP(DATAWIDTH_BUS_REG_IR_OP),
	.DATAWIDTH_DECODER_SELECTION(DATAWIDTH_DECODER_SELECTION),
	.DATAWIDTH_DECODER_OUT(DATAWIDTH_DECODER_OUT),
	.DATAWIDTH_MUX_SELECTION(DATAWIDTH_MUX_SELECTION),
	.DATAWIDTH_ALU_SELECTION(DATAWIDTH_ALU_SELECTION),
	.DATAWIDTH_BUS_REG_MIR_FIELD(DATAWIDTH_BUS_REG_MIR_FIELD),
	.DATAWIDTH_BUS_MUX_DATAPATH_OUT(DATAWIDTH_BUS_MUX_DATAPATH_OUT)
) uDataPath_u0(	

	.uDataPath_Overflow_InLow(uDataPath_Overflow_InLow_Wire),
	.uDataPath_Carry_InLow(uDataPath_Carry_InLow_Wire),
	.uDataPath_Negative_InLow(uDataPath_Negative_InLow_Wire),
	.uDataPath_Zero_InLow(uDataPath_Zero_InLow_Wire),
	.uDataPath_ALU_Flags_Write_PCR(uDataPath_ALU_Flags_Write_PCR_Wire),
	.uDataPath_Reg_IR_OP(uDataPath_Reg_IR_OP_Wire),
	.uDataPath_Reg_IR_IR13(uDataPath_Reg_IR_IR13),
	
	.uDataPath_CLOCK_50(WB_uProcesador_CLOCK_50),
	.uDATAPATH_RESET_InHigh(WB_uProcesador_Reset_InHigh),
	.uDataPath_ALU_Selection_In(uDataPath_ALU_Selection_In_Wire),
	.uDataPath_MUX_A_MIR(uDataPath_MUX_A_MIR_Wire),
	.uDataPath_MUX_B_MIR(uDataPath_MUX_B_MIR_Wire),
	.uDataPath_MUX_C_MIR(uDataPath_MUX_C_MIR_Wire),
	.uDataPath_MUX_A_MIR_Selector(uDataPath_MUX_A_MIR_Selector_Wire),
	.uDataPath_MUX_B_MIR_Selector(uDataPath_MUX_B_MIR_Selector_Wire),
	.uDataPath_MUX_C_MIR_Selector(uDataPath_MUX_C_MIR_Selector_Wire),
	.uDataPath_DataMemory_Data_In(uDataPath_DataMemory_Data_In_Wire),
	.uDataPath_DataMemory_Selector_In(uDataPath_DataMemory_Selector_In_Wire)
);

SistemaControl #(
	.DATAWIDTH_ALU_SELECTION(DATAWIDTH_ALU_SELECTION),
	.DATAWIDTH_COND_MIR(DATAWIDTH_COND_MIR),
	.DATAWIDTH_BANDERAS(DATAWIDTH_BANDERAS),
	.DATAWIDTH_BUS_OUT(DATAWIDTH_BUS_OUT),
	.DATAWIDTH_BUS_REG_MIR_FIELD(DATAWIDTH_BUS_REG_MIR_FIELD)
) SistemaControl_u0(
	.SistemaControl_CLOCK_50(WB_uProcesador_CLOCK_50),
	.SistemaControl_Overflow_InLow(uDataPath_Overflow_InLow_Wire),
	.SistemaControl_Carry_InLow(uDataPath_Carry_InLow_Wire),
	.SistemaControl_Negative_InLow(uDataPath_Negative_InLow_Wire),
	.SistemaControl_Zero_InLow(uDataPath_Zero_InLow_Wire),
	.SistemaControl_ALU_Flags_Write_PCR(uDataPath_ALU_Flags_Write_PCR_Wire),
	.SistemaControl_Reg_IR_IR13(uDataPath_Reg_IR_IR13),
	
	.SistemaControl_ALU_Selection_In(uDataPath_ALU_Selection_In_Wire),
	.SistemaControl_MUX_A_MIR(uDataPath_MUX_A_MIR_Wire),
	.SistemaControl_MUX_B_MIR(uDataPath_MUX_B_MIR_Wire),
	.SistemaControl_MUX_C_MIR(uDataPath_MUX_C_MIR_Wire),
	.SistemaControl_MUX_A_MIR_Selector(uDataPath_MUX_A_MIR_Selector_Wire),
	.SistemaControl_MUX_B_MIR_Selector(uDataPath_MUX_B_MIR_Selector_Wire),
	.SistemaControl_MUX_C_MIR_Selector(uDataPath_MUX_C_MIR_Selector_Wire),
	
);

endmodule
