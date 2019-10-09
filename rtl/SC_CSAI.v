
//=======================================================
//  MODULE Definition
//=======================================================
module SC_CSAI #(parameter DATAWIDTH_BUS_CSAI=11)(
	//OUTPUTS 
	DATA_OUTPUT,
	//INPUTS
	SC_CSAI_CLOCK_50,
	DATA_INPUT
);

//=======================================================
//  PORT declarations
//=======================================================
	output reg	[DATAWIDTH_BUS_CSAI-1:0] DATA_OUTPUT;
	input			SC_CSAI_CLOCK_50;
	input 		[DATAWIDTH_BUS_CSAI-1:0] DATA_INPUT;
//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg [DATAWIDTH_BUS_CSAI-1:0] RegGENERAL_Register;
	initial RegGENERAL_Register = 11'b00000000000;
	reg [DATAWIDTH_BUS_CSAI-1:0] RegGENERAL_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always @ (*)
	RegGENERAL_Signal = DATA_INPUT + 1'b1;

// REGISTER : SEQUENTIAL
	always @ ( posedge SC_CSAI_CLOCK_50 )
	RegGENERAL_Register <= RegGENERAL_Signal;
	
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
	always @ (*)
		DATA_OUTPUT = RegGENERAL_Register;  

endmodule

