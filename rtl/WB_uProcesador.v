//Módulo principal 


//=======================================================
//  MODULE Definition
//=======================================================
module WB_uProcesador #(parameter DATAWIDTH_BUS=8, parameter DATAWIDTH_REGSHIFTER_SELECTION=2, parameter DATAWIDTH_DECODER_SELECTION=3, parameter DATAWIDTH_ALU_SELECTION=4, parameter DATA_REGFIXED_INIT_0=8'b00001001, parameter DATA_REGFIXED_INIT_1=8'b00001111, parameter DATAWIDTH_DECODER_OUT=4, parameter DATAWIDTH_MUX_SELECTION=3) (
//////////// INPUTS //////////
	WB_uProcesador_CLOCK_50,
	WB_uProcesador_Reset_InHigh
);

//=======================================================
//  PORT declarations
//=======================================================
	input 	WB_uProcesador_CLOCK_50;
	input 	WB_uProcesador_Reset_InHigh;
	
SistemaControl control_u0(
	//////////// CLOCK //////////
	.CLOCK_50(WB_uProcesador_CLOCK_50),
	
);	
endmodule
