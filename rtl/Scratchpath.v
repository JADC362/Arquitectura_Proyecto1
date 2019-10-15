//=======================================================
//  MODULE Definition
//=======================================================

module Scratchpath #(
	parameter DATAWIDTH_BUS=32,
	parameter DATA_REGFIXED_INIT_0=32'b00000000000000000000000000000000,
	parameter DATAWIDTH_BUS_REG_IR=5,
	parameter DATAWIDTH_BUS_REG_IR_OP=8,
	parameter DATAWIDTH_DECODER_SELECTION=4, 
	parameter DATAWIDTH_DECODER_OUT=16,
	parameter DATAWIDTH_MUX_SELECTION=4
)(
	//////////// OUTPUTS //////////
	Scratchpath_Reg_IR_IR13,
	Scratchpath_Reg_IR_RS1,
	Scratchpath_Reg_IR_RS2,
	Scratchpath_Reg_IR_RD,
	Scratchpath_Reg_IR_OP,
	Scratchpath_MUX_Out_A,
	Scratchpath_MUX_Out_B,
	
	
	//////////// INPUT //////////
	uDataPath_CLOCK_50,
	uDATAPATH_RESET_InHigh,
	MUXC_DataBUS_Write,
	Selector_Decoder_Wire,
	Selector_MUX_A_Wire,
	Selector_MUX_B_Wire
);

//=======================================================
//  PORT declarations
//=======================================================

	//////////// OUTPUTS //////////
	output  Scratchpath_Reg_IR_IR13;
	output  [DATAWIDTH_BUS_REG_IR-1:0] Scratchpath_Reg_IR_RS1;
	output  [DATAWIDTH_BUS_REG_IR-1:0] Scratchpath_Reg_IR_RS2;
	output  [DATAWIDTH_BUS_REG_IR-1:0] Scratchpath_Reg_IR_RD;
	output  [DATAWIDTH_BUS_REG_IR_OP-1:0] Scratchpath_Reg_IR_OP;
	output  [DATAWIDTH_BUS-1:0] Scratchpath_MUX_Out_A;
	output  [DATAWIDTH_BUS-1:0] Scratchpath_MUX_Out_B;

	//////////// INPUTS //////////
	input uDataPath_CLOCK_50;
	input uDATAPATH_RESET_InHigh;
	input [DATAWIDTH_BUS-1:0] MUXC_DataBUS_Write;
	input [DATAWIDTH_DECODER_SELECTION-1:0] Selector_Decoder_Wire;
	input [DATAWIDTH_MUX_SELECTION-1:0] Selector_MUX_A_Wire;
	input [DATAWIDTH_MUX_SELECTION-1:0] Selector_MUX_B_Wire;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================

// SPECIFIG_REGISTERS OUTPUTS BUSES TO MUX

	wire [DATAWIDTH_BUS-1:0] RegPC2MUX_DataBUS_Wire;
	wire [DATAWIDTH_BUS-1:0] Reg2MUX_DataBUS_Wire_temp0;
	wire [DATAWIDTH_BUS-1:0] Reg2MUX_DataBUS_Wire_temp1;
	wire [DATAWIDTH_BUS-1:0] Reg2MUX_DataBUS_Wire_temp2;
	wire [DATAWIDTH_BUS-1:0] Reg2MUX_DataBUS_Wire_temp3;
	wire [DATAWIDTH_BUS-1:0] RegIR2MUX_DataBUS_Wire;
	

// GENERAL_REGISTERS OUTPUTS BUSES TO MUX
	wire [DATAWIDTH_BUS-1:0] RegFIXED2MUX_DataBUS_Wire_0;
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_1;
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_2;
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_3;
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_4;
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_5;
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_6;
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_7;
	

// BUS WIRES MUXES

// BUS DECODER

	wire [DATAWIDTH_DECODER_OUT-1:0] Decoder2RegGeneral_WriteInLow_Wire;
	

//=======================================================
//  Structural coding
//=======================================================

//-------------------------------------------------------
//---------REGISTERS
//-------------------------------------------------------

// Fixed Registers
// Fixed register with value 0
SC_RegFIXED #(.DATAWIDTH_BUS(DATAWIDTH_BUS), .DATA_REGFIXED_INIT(DATA_REGFIXED_INIT_0)) SC_RegFIXED_g0(
// port map - connection between master ports and signals/registers  
	.SC_RegFIXED_DataBUS_Out(RegFIXED2MUX_DataBUS_Wire_0),
	.SC_RegFIXED_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh)
);

//-------------------------------------------------------
// General Registers
SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g1 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_1),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[1]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);
SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g2 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_2),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[2]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);
SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g3 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_3),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[3]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g4 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_4),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[4]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g5 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_5),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[5]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g6 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_6),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[6]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g7 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_7),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[7]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

//-------------------------------------------------------
//Specific registers
//Counter program register
SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGeneral_PC (
// port map - connection between master ports and signals/registers  
	.SC_RegGENERAL_DataBUS_Out(RegPC2MUX_DataBUS_Wire),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[8]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

//Temporal registers
SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_Temp0 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(Reg2MUX_DataBUS_Wire_temp0),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[9]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_Temp1 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(Reg2MUX_DataBUS_Wire_temp1),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[10]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_Temp2 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(Reg2MUX_DataBUS_Wire_temp2),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[11]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_Temp3 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(Reg2MUX_DataBUS_Wire_temp3),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[12]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);
//Instructions register
SC_RegGENERAL_IR #(.DATAWIDTH_BUS(DATAWIDTH_BUS),.DATAWIDTH_BUS_REG_IR(DATAWIDTH_BUS_REG_IR),.DATAWIDTH_BUS_REG_IR_OP(DATAWIDTH_BUS_REG_IR_OP)) SC_Reg_IR(
// port map - connection between master ports and signals/registers 
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(uDATAPATH_RESET_InHigh),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[13]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write),
	.SC_RegGENERAL_DataBUS_Out(RegIR2MUX_DataBUS_Wire),
	.SC_ReGENERAL_DataBUS_RS1(Scratchpath_Reg_IR_RS1),
	.SC_ReGENERAL_DataBUS_RS2(Scratchpath_Reg_IR_RS2),
	.SC_ReGENERAL_DataBUS_RD(Scratchpath_Reg_IR_RD),
	.SC_ReGENERAL_DataBUS_OP(Scratchpath_Reg_IR_OP), 
	.SC_ReGENERAL_DataBUS_IR13(Scratchpath_Reg_IR_IR13)
);


//-------------------------------------------------------
//---------DECODER
//-------------------------------------------------------
// DECODER TO GENERATE WRITE SIGNAL TO GENERAL_REGISTERS TO WRITE DATA TO DATA_BUS_C. ¡ONE BY ONE, NOT AT SAME TIME!
CC_DECODER #(.DATAWIDTH_DECODER_SELECTION(DATAWIDTH_DECODER_SELECTION),.DATAWIDTH_DECODER_OUT(DATAWIDTH_DECODER_OUT)) Scratchpath_DECODER(
	.CC_DECODER_Selection_OutBUS(Decoder2RegGeneral_WriteInLow_Wire),
	.CC_DECODER_Selection_InBUS(Selector_Decoder_Wire)
);

//-------------------------------------------------------
//---------MUX
//-------------------------------------------------------

// MUX CONTROL: TO SELECT OUTPUT REGISTER TO BUS_A, BUS_B OR BOTH OF THEM
CC_MUXX #(.DATAWIDTH_MUX_SELECTION(DATAWIDTH_MUX_SELECTION),.DATAWIDTH_BUS(DATAWIDTH_BUS)) CC_MUXX_A(
	//////////// OUTPUTS //////////
	.CC_MUX_data_OutBUS(Scratchpath_MUX_Out_A),
	//////////// INPUTS //////////
	.CC_MUX_DataBUS_In_g0(RegFIXED2MUX_DataBUS_Wire_0),
	.CC_MUX_DataBUS_In_g1(RegGENERAL2MUX_DataBUS_Wire_1),
	.CC_MUX_DataBUS_In_g2(RegGENERAL2MUX_DataBUS_Wire_2),
	.CC_MUX_DataBUS_In_g3(RegGENERAL2MUX_DataBUS_Wire_3),	
	.CC_MUX_DataBUS_In_g4(RegGENERAL2MUX_DataBUS_Wire_4),	
	.CC_MUX_DataBUS_In_g5(RegGENERAL2MUX_DataBUS_Wire_5),	
	.CC_MUX_DataBUS_In_g6(RegGENERAL2MUX_DataBUS_Wire_6),	
	.CC_MUX_DataBUS_In_g7(RegGENERAL2MUX_DataBUS_Wire_7),	
	.CC_MUX_DataBUS_PC(RegPC2MUX_DataBUS_Wire),
	.CC_MUX_DataBUS_Temp0(Reg2MUX_DataBUS_Wire_temp0),
	.CC_MUX_DataBUS_Temp1(Reg2MUX_DataBUS_Wire_temp1),
	.CC_MUX_DataBUS_Temp2(Reg2MUX_DataBUS_Wire_temp2),
	.CC_MUX_DataBUS_Temp3(Reg2MUX_DataBUS_Wire_temp3),
	.CC_MUX_DataBUS_IR(RegIR2MUX_DataBUS_Wire),
	.CC_MUX_Selection_In(Selector_MUX_A_Wire)
);

CC_MUXX #(.DATAWIDTH_MUX_SELECTION(DATAWIDTH_MUX_SELECTION),.DATAWIDTH_BUS(DATAWIDTH_BUS)) CC_MUXX_B(
	//////////// OUTPUTS //////////
	.CC_MUX_data_OutBUS(Scratchpath_MUX_Out_B),
	//////////// INPUTS //////////
	.CC_MUX_DataBUS_In_g0(RegFIXED2MUX_DataBUS_Wire_0),
	.CC_MUX_DataBUS_In_g1(RegGENERAL2MUX_DataBUS_Wire_1),
	.CC_MUX_DataBUS_In_g2(RegGENERAL2MUX_DataBUS_Wire_2),	
	.CC_MUX_DataBUS_In_g3(RegGENERAL2MUX_DataBUS_Wire_3),	
	.CC_MUX_DataBUS_In_g4(RegGENERAL2MUX_DataBUS_Wire_4),	
	.CC_MUX_DataBUS_In_g5(RegGENERAL2MUX_DataBUS_Wire_5),	
	.CC_MUX_DataBUS_In_g6(RegGENERAL2MUX_DataBUS_Wire_6),	
	.CC_MUX_DataBUS_In_g7(RegGENERAL2MUX_DataBUS_Wire_7),	
	.CC_MUX_DataBUS_PC(RegPC2MUX_DataBUS_Wire),
	.CC_MUX_DataBUS_Temp0(Reg2MUX_DataBUS_Wire_temp0),
	.CC_MUX_DataBUS_Temp1(Reg2MUX_DataBUS_Wire_temp1),
	.CC_MUX_DataBUS_Temp2(Reg2MUX_DataBUS_Wire_temp2),
	.CC_MUX_DataBUS_Temp3(Reg2MUX_DataBUS_Wire_temp3),
	.CC_MUX_DataBUS_IR(RegIR2MUX_DataBUS_Wire),
	.CC_MUX_Selection_In(Selector_MUX_B_Wire)
);

endmodule
