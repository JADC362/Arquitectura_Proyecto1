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
	parameter DATAWIDTH_BUS_MUX_DATAPATH_OUT=6)(
//////////// INPUTS //////////
	WB_uProcesador_CLOCK_50,
	WB_uProcesador_Reset_InHigh
);

//=======================================================
//  PORT declarations
//=======================================================
	input 	WB_uProcesador_CLOCK_50;
	input 	WB_uProcesador_Reset_InHigh;

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
	//////////// INPUTS //////////
	.uDataPath_CLOCK_50(WB_uProcesador_CLOCK_50),
	.uDATAPATH_RESET_InHigh(WB_uProcesador_Reset_InHigh),
);

SistemaControl control_u0(
	//////////// CLOCK //////////
	.CLOCK_50(WB_uProcesador_CLOCK_50),
	
);

endmodule
