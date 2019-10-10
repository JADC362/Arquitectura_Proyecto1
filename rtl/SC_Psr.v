
//=======================================================
//  MODULE Definition
//=======================================================
module SC_Psr (
	
	//////////// INPUTS //////////
	SC_Psr_CLOCK_50,
	//banderas
	SC_Psr_negativo,
	SC_Psr_cero,
	SC_Psr_overflow,
	SC_Psr_carry,
	//set condition codes
	SC_Psr_Write_InLow,
	
	//// OUTPUT ///
	SC_Psr_Out,
);

//=======================================================
//  PORT declarations
//=======================================================
	output reg	[3:0] SC_Psr_Out;
	input			SC_Psr_CLOCK_50;
	input			SC_Psr_Write_InLow;
	input       SC_Psr_negativo;
	input       SC_Psr_cero;
	input       SC_Psr_overflow;
	input       SC_Psr_carry;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg [3:0] RegGENERAL_Register;
	//inicializacion banderas en 1 
	initial RegGENERAL_Register = 4'b1111;
	reg [3:0] RegGENERAL_Signal;
	
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always @ (*)
	if (SC_Psr_Write_InLow == 0)	
		RegGENERAL_Signal = {SC_Psr_negativo,SC_Psr_cero,SC_Psr_overflow,SC_Psr_carry};
	else 	
		RegGENERAL_Signal = RegGENERAL_Register;

// REGISTER : SEQUENTIAL
	always @ ( posedge SC_Psr_CLOCK_50)
		RegGENERAL_Register <= RegGENERAL_Signal;
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
	always @ (*)
		SC_Psr_Out = RegGENERAL_Register;  

endmodule

