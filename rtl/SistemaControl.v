
module SistemaControl(

	//////////// CLOCK //////////
	CLOCK_50,
	

);


//=======================================================
//  PORT declarations
//=======================================================

input CLOCK_50;


// WIRES PSR
wire [3:0] Psr_Out ;

//WIRES CSAI

//WIRES BRANCH CONTROL


//=======================================================
//  Structural coding
//=======================================================

SC_CSAI CSAI(

	//entradas
	.SC_CSAI_CLOCK_50(CLOCK_50),
//	.CSAI_DATA_INPUT()
	//Salidas
// .CSAI_DATA_OUTPUT()
	
);


SC_Psr Psr(

	//salida
	.SC_Psr_Out(Psr_Out),
	//entradas
	.SC_Psr_CLOCK_50(CLOCK_50),
//	.SC_Psr_Write_InLow(),
//	.SC_Psr_negativo(),
//	.SC_Psr_cero(),
//	.SC_Psr_overflow(),
//	.SC_Psr_carry()
	
);

CC_branchControl branchControl(
	// salida
//	.Brach_output(),
	//entradas
	.Branch_Flags(Psr_Out),
//	.Branch_Ir13(),
//	.Branch_Condition()
);



endmodule
