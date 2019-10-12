//=======================================================
//  MODULE Definition
//=======================================================
module uDATAPATH #(
	//=======================================================
	//  PARAMETER declarations
	//=======================================================
	parameter DATAWIDTH_BUS=32,
	parameter DATA_REGFIXED_INIT_0=32'b00000000000000000000000000000000,
	parameter DATAWIDTH_BUS_REG_IR=5,
	parameter DATAWIDTH_BUS_REG_IR_OP=8,
	parameter DATAWIDTH_DECODER_SELECTION=4, 
	parameter DATAWIDTH_DECODER_OUT=16,
	parameter DATAWIDTH_MUX_SELECTION=4,
	parameter DATAWIDTH_ALU_SELECTION=4,
	parameter DATAWIDTH_BUS_REG_MIR_FIELD=6,
	parameter DATAWIDTH_BUS_MUX_DATAPATH_OUT=6
)(
	//////////// OUTPUTS //////////
	uDataPath_Overflow_InLow,
	uDataPath_Carry_InLow,
	uDataPath_Negative_InLow,
	uDataPath_Zero_InLow,
	uDataPath_ALU_Flags_Write_PCR,
	uDataPath_Reg_IR_OP,
	uDataPath_Reg_IR_IR13,
	
	//////////// INPUTS //////////
	uDataPath_CLOCK_50,
	uDATAPATH_RESET_InHigh,
	uDataPath_ALU_Selection_In,
	uDataPath_MUX_A_MIR,
	uDataPath_MUX_B_MIR,
	uDataPath_MUX_C_MIR,
	uDataPath_MUX_A_MIR_Selector,
	uDataPath_MUX_B_MIR_Selector,
	uDataPath_MUX_C_MIR_Selector,
	uDataPath_DataMemory_Data_In,
	uDataPath_DataMemory_Selector_In,
	Scratchpath_MUX_Out_A,
	Scratchpath_MUX_Out_B
);

//=======================================================
//  PORT declarations
//=======================================================

	//////////// OUTPUTS //////////
	
	output uDataPath_Overflow_InLow;
	output uDataPath_Carry_InLow;
	output uDataPath_Negative_InLow;
	output uDataPath_Zero_InLow;
	output [DATAWIDTH_BUS_REG_IR_OP-1:0] uDataPath_Reg_IR_OP;
	output uDataPath_Reg_IR_IR13;
	output uDataPath_ALU_Flags_Write_PCR;
	output [DATAWIDTH_BUS-1:0] Scratchpath_MUX_Out_A;
	output [DATAWIDTH_BUS-1:0] Scratchpath_MUX_Out_B;
	
	//////////// INPUTS //////////
	
	input uDataPath_CLOCK_50;
	input uDATAPATH_RESET_InHigh;
	input [DATAWIDTH_ALU_SELECTION-1:0] uDataPath_ALU_Selection_In;
	input uDataPath_MUX_A_MIR_Selector;
	input uDataPath_MUX_B_MIR_Selector;
	input uDataPath_MUX_C_MIR_Selector;
	input [DATAWIDTH_BUS_REG_MIR_FIELD-1:0] uDataPath_MUX_A_MIR;
	input [DATAWIDTH_BUS_REG_MIR_FIELD-1:0] uDataPath_MUX_B_MIR;
	input [DATAWIDTH_BUS_REG_MIR_FIELD-1:0] uDataPath_MUX_C_MIR;
	input uDataPath_DataMemory_Selector_In;
	input [DATAWIDTH_BUS-1:0] uDataPath_DataMemory_Data_In;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
	
	wire [DATAWIDTH_BUS-1:0] uDataPath_MUXC_Memory_DataBUS_Write;
	wire [DATAWIDTH_BUS-1:0] uDataPath_ALU_DataBUS_Out_Wire;
	
	wire [DATAWIDTH_MUX_SELECTION-1:0] uDataPath_MUXA_BUS_Wire;
	wire [DATAWIDTH_MUX_SELECTION-1:0] uDataPath_MUXB_BUS_Wire;
	wire [DATAWIDTH_MUX_SELECTION-1:0] uDataPath_MUXC_BUS_Wire;

	wire [DATAWIDTH_BUS_REG_IR-1:0] uDataPath_Reg_IR_RS1_Wire;
	wire [DATAWIDTH_BUS_REG_IR-1:0] uDataPath_Reg_IR_RS2_Wire;
	wire [DATAWIDTH_BUS_REG_IR-1:0] uDataPath_Reg_IR_RD_Wire;
	

//=======================================================
//  Structural coding
//=======================================================

//-------------------------------------------------------
//---------SCRATCHPATH
//-------------------------------------------------------

Scratchpath #(
	.DATAWIDTH_BUS(DATAWIDTH_BUS),
	.DATA_REGFIXED_INIT_0(DATA_REGFIXED_INIT_0),
	.DATAWIDTH_BUS_REG_IR(DATAWIDTH_BUS_REG_IR),
	.DATAWIDTH_BUS_REG_IR_OP(DATAWIDTH_BUS_REG_IR_OP),
	.DATAWIDTH_DECODER_SELECTION(DATAWIDTH_DECODER_SELECTION),
	.DATAWIDTH_DECODER_OUT(DATAWIDTH_DECODER_OUT),
	.DATAWIDTH_MUX_SELECTION(DATAWIDTH_MUX_SELECTION)
) Scratchpath_DataPath (
	.Scratchpath_Reg_IR_IR13(uDataPath_Reg_IR_IR13),
	.Scratchpath_Reg_IR_RS1(uDataPath_Reg_IR_RS1_Wire),
	.Scratchpath_Reg_IR_RS2(uDataPath_Reg_IR_RS2_Wire),
	.Scratchpath_Reg_IR_RD(uDataPath_Reg_IR_RD_Wire),
	.Scratchpath_Reg_IR_OP(uDataPath_Reg_IR_OP),
	.Scratchpath_MUX_Out_A(Scratchpath_MUX_Out_A),
	.Scratchpath_MUX_Out_B(Scratchpath_MUX_Out_B),
	.uDataPath_CLOCK_50(uDataPath_CLOCK_50),
	.uDATAPATH_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.MUXC_DataBUS_Write(uDataPath_MUXC_Memory_DataBUS_Write),
	.Selector_Decoder_Wire(uDataPath_MUXC_BUS_Wire),
	.Selector_MUX_A_Wire(uDataPath_MUXA_BUS_Wire),
	.Selector_MUX_B_Wire(uDataPath_MUXB_BUS_Wire)
);

//-------------------------------------------------------
//---------ALU
//-------------------------------------------------------

CC_ALU #(.DATAWIDTH_BUS(DATAWIDTH_BUS),.DATAWIDTH_ALU_SELECTION(DATAWIDTH_ALU_SELECTION)) CC_Datapath_ALU(
// port map - connection between master ports and signals/registers   
	.CC_ALU_overflow_OutLow(uDataPath_Overflow_InLow),
	.CC_ALU_carry_OutLow(uDataPath_Carry_InLow),
	.CC_ALU_negative_OutLow(uDataPath_Negative_InLow),
	.CC_ALU_zero_OutLow(uDataPath_Zero_InLow),
	.CC_ALU_data_OutBUS(uDataPath_ALU_DataBUS_Out_Wire),
	.CC_ALU_Set_Flags_Out(uDataPath_ALU_Flags_Write_PCR),
	.CC_ALU_dataA_InBUS(Scratchpath_MUX_Out_A),
	.CC_ALU_dataB_InBUS(Scratchpath_MUX_Out_B),
	.CC_ALU_selection_InBUS(uDataPath_ALU_Selection_In)
);

//-------------------------------------------------------
//---------MUX
//-------------------------------------------------------

//-------------------------------------------------------
//GENERAL MUXES A, B, C

MUX_Datapath #(
	.DATAWIDTH_MUX_SELECTION(DATAWIDTH_MUX_SELECTION), 
	.DATAWIDTH_BUS(DATAWIDTH_BUS),
	.DATAWIDTH_BUS_REG_IR(DATAWIDTH_BUS_REG_IR),
	.DATAWIDTH_BUS_REG_MIR_FIELD(DATAWIDTH_BUS_REG_MIR_FIELD),
	.DATAWIDTH_BUS_MUX_DATAPATH_OUT(DATAWIDTH_BUS_MUX_DATAPATH_OUT)
) MUX_Datapath_A (
	.CC_MUX_DataBUS_Out(uDataPath_MUXA_BUS_Wire),
	.CC_MUX_In_Register(uDataPath_Reg_IR_RS1_Wire),
	.CC_MUX_In_MIRField(uDataPath_MUX_A_MIR),
	.CC_MUX_In_Selector_Field_inLow(uDataPath_MUX_A_MIR_Selector)
);

MUX_Datapath #(
	.DATAWIDTH_MUX_SELECTION(DATAWIDTH_MUX_SELECTION), 
	.DATAWIDTH_BUS(DATAWIDTH_BUS),
	.DATAWIDTH_BUS_REG_IR(DATAWIDTH_BUS_REG_IR),
	.DATAWIDTH_BUS_REG_MIR_FIELD(DATAWIDTH_BUS_REG_MIR_FIELD),
	.DATAWIDTH_BUS_MUX_DATAPATH_OUT(DATAWIDTH_BUS_MUX_DATAPATH_OUT)
) MUX_Datapath_B (
	.CC_MUX_DataBUS_Out(uDataPath_MUXB_BUS_Wire),
	.CC_MUX_In_Register(uDataPath_Reg_IR_RS2_Wire),
	.CC_MUX_In_MIRField(uDataPath_MUX_B_MIR),
	.CC_MUX_In_Selector_Field_inLow(uDataPath_MUX_B_MIR_Selector)
);

MUX_Datapath #(
	.DATAWIDTH_MUX_SELECTION(DATAWIDTH_MUX_SELECTION), 
	.DATAWIDTH_BUS(DATAWIDTH_BUS),
	.DATAWIDTH_BUS_REG_IR(DATAWIDTH_BUS_REG_IR),
	.DATAWIDTH_BUS_REG_MIR_FIELD(DATAWIDTH_BUS_REG_MIR_FIELD),
	.DATAWIDTH_BUS_MUX_DATAPATH_OUT(DATAWIDTH_BUS_MUX_DATAPATH_OUT)
) MUX_Datapath_C (
	.CC_MUX_DataBUS_Out(uDataPath_MUXC_BUS_Wire),
	.CC_MUX_In_Register(uDataPath_Reg_IR_RD_Wire),
	.CC_MUX_In_MIRField(uDataPath_MUX_C_MIR),
	.CC_MUX_In_Selector_Field_inLow(uDataPath_MUX_C_MIR_Selector)
);

MUX_C #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) uDataPath_MUX_C(
	.CC_MUX_DataBUS_Out(uDataPath_MUXC_Memory_DataBUS_Write),
	.CC_ALU_Data_Bus_In(uDataPath_ALU_DataBUS_Out_Wire),
	.CC_DataMemory_Data_Bus_In(uDataPath_DataMemory_Data_In),
	.CC_DataMemory_Selector_In(uDataPath_DataMemory_Selector_In)
);

endmodule
	