
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module proyecto1v1(

//////////// INPUTS //////////
	BB_SYSTEM_CLOCK_50,
	BB_SYSTEM_Reset_InHigh	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

	parameter DATAWIDTH_BUS=32;
	parameter DATA_REGFIXED_INIT_0=32'b00000000000000000000000000000000;
	parameter DATAWIDTH_BUS_REG_IR=5;
	parameter DATAWIDTH_BUS_REG_IR_OP=8;
	parameter DATAWIDTH_DECODER_SELECTION=4;
	parameter DATAWIDTH_DECODER_OUT=16;
	parameter DATAWIDTH_MUX_SELECTION=4;
	parameter DATAWIDTH_ALU_SELECTION=4;
	parameter DATAWIDTH_BUS_REG_MIR_FIELD=6;
	parameter DATAWIDTH_BUS_MUX_DATAPATH_OUT=6;

//=======================================================
//  PORT declarations
//=======================================================

	input 	BB_SYSTEM_CLOCK_50;
	input 	BB_SYSTEM_Reset_InHigh;

//=======================================================
//  Structural coding
//=======================================================
WB_uProcesador #(
	.DATAWIDTH_BUS(DATAWIDTH_BUS), 
	.DATAWIDTH_DECODER_SELECTION(DATAWIDTH_DECODER_SELECTION), 
	.DATAWIDTH_ALU_SELECTION(DATAWIDTH_ALU_SELECTION), 
	.DATAWIDTH_DECODER_OUT(DATAWIDTH_DECODER_OUT), 
	.DATAWIDTH_MUX_SELECTION(DATAWIDTH_MUX_SELECTION),
	.DATA_REGFIXED_INIT_0(DATA_REGFIXED_INIT_0)
) WB_uProcesador_u0 (
  
	.WB_uProcesador_CLOCK_50(BB_SYSTEM_CLOCK_50),	
	.WB_uProcesador_Reset_InHigh(BB_SYSTEM_Reset_InHigh)
);
endmodule
