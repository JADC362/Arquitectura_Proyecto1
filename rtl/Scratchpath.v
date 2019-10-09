//=======================================================
//  MODULE Definition
//=======================================================

module Scratchpath #(
	parameter DATAWIDTH_BUS=32
	parameter DATAWIDTH_DECODER_BUS=38,
	parameter DATA_REGFIXED_INIT_0=8'b00001001,
	parameter DATAWIDTH_BUS_REG_IR=5,
	parameter DATAWIDTH_BUS_REG_IR_OP=8,
)(
	//////////// OUTPUTS //////////
	
	
	
	//////////// INPUT //////////
	uDataPath_CLOCK_50
	input 	[DATAWIDTH_BUS-1:0] MUXC_DataBUS_Write;
)

//=======================================================
//  PORT declarations
//=======================================================

	//////////// INPUTS //////////
	input 	uDataPath_CLOCK_50;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================

// SPECIFIG_REGISTERS OUTPUTS BUSES TO MUX

	wire [DATAWIDTH_BUS-1:0] RegPC2MUX_DataBUS_Wire

// GENERAL_REGISTERS OUTPUTS BUSES TO MUX
	wire [DATAWIDTH_BUS-1:0] RegFIXED2MUX_DataBUS_Wire_0
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_1
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_2
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_3
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_4
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_5
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_6
	wire [DATAWIDTH_BUS-1:0] RegGENERAL2MUX_DataBUS_Wire_7
	

// BUS WIRES MUXES

// BUS OUT DECODER

	wire [DATAWIDTH_DECODER_BUS-1:0] Decoder2RegGeneral_WriteInLow_Wire;
	

//=======================================================
//  Structural coding
//=======================================================

//-------------------------------------------------------

// Fixed Registers
// Fixed register with value 0
SC_RegFIXED #(.DATAWIDTH_BUS(DATAWIDTH_BUS), .DATA_REGFIXED_INIT(DATA_REGFIXED_INIT_0)) SC_RegFIXED_g0(
// port map - connection between master ports and signals/registers  
	.SC_RegFIXED_DataBUS_Out(RegFIXED2MUX_DataBUS_Wire_0),
	.SC_RegFIXED_CLOCK_50(uDataPath_CLOCK_50)
);
//-------------------------------------------------------
// General Registers
SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g1 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_1),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[1]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);
SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g2 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_2),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[2]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);
SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g3 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_3a),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[3]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g4 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_4),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[4]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g5 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_5),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[5]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g6 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_6),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[6]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_g7 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(RegGENERAL2MUX_DataBUS_Wire_7),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
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
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[8]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
)


SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_Temp0 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(Reg2MUX_DataBUS_Wire_temp0),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[9]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_Temp1 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(Reg2MUX_DataBUS_Wire_temp1),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[10]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_Temp2 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(Reg2MUX_DataBUS_Wire_temp2),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[11]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) SC_RegGENERAL_Temp3 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_DataBUS_Out(Reg2MUX_DataBUS_Wire_temp3),
	.SC_RegGENERAL_CLOCK_50(uDataPath_CLOCK_50),
	.SC_RegGENERAL_Write_InLow(Decoder2RegGeneral_WriteInLow_Wire[12]),
	.SC_RegGENERAL_DataBUS_In(MUXC_DataBUS_Write)
);

SC_RegGENERAL_IR #(.DATAWIDTH_BUS(DATAWIDTH_BUS),.DATAWIDTH_BUS_REG_IR(DATAWIDTH_BUS_REG_IR),.DATAWIDTH_BUS_REG_IR_OP(DATAWIDTH_BUS_REG_IR_OP))
