
//=======================================================
//  MODULE Definition
//=======================================================
module SC_Psr #(
	parameter DATAWIDTH_ALU_SELECTION=4
)(
	//////////// INPUTS //////////
	SC_Psr_CLOCK_50,
	SC_Psr_RESET_InHigh,
	//banderas
	SC_Psr_negativo,
	SC_Psr_cero,
	SC_Psr_overflow,
	SC_Psr_carry,
	SC_Psr_Write_InLow,
	//// OUTPUT ///
	SC_Psr_Out
);

//=======================================================
//  PORT declarations
//=======================================================
	output reg	[DATAWIDTH_ALU_SELECTION-1:0] SC_Psr_Out;
	input			SC_Psr_CLOCK_50;
	input			SC_Psr_Write_InLow;
	input       SC_Psr_negativo;
	input       SC_Psr_cero;
	input       SC_Psr_overflow;
	input       SC_Psr_carry;
	input			SC_Psr_RESET_InHigh;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg [DATAWIDTH_ALU_SELECTION-1:0] RegGENERAL_Register;
	//inicializacion banderas en 1 
	initial RegGENERAL_Register = 4'b1111;
	reg [DATAWIDTH_ALU_SELECTION-1:0] RegGENERAL_Signal;
	
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
	always @ ( negedge SC_Psr_CLOCK_50, posedge SC_Psr_RESET_InHigh)
	begin
		if (SC_Psr_RESET_InHigh == 1'b1)
			RegGENERAL_Register <= 0;
		else
			RegGENERAL_Register <= RegGENERAL_Signal;
	end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
	always @ (*)
		SC_Psr_Out = RegGENERAL_Register;  

endmodule

