
//=======================================================
//  MODULE Definition
//=======================================================
module SC_CSAI #(parameter DATAWIDTH_BUS_CSAI=11)(
	//OUTPUTS 
	CSAI_DATA_OUTPUT,
	//INPUTS
	SC_CSAI_CLOCK_50,
	CSAI_DATA_INPUT,
	SC_CSAI_RESET_InHigh,
);

//=======================================================
//  PORT declarations
//=======================================================
	output reg	[DATAWIDTH_BUS_CSAI-1:0] CSAI_DATA_OUTPUT;
	input			SC_CSAI_CLOCK_50;
	input 		[DATAWIDTH_BUS_CSAI-1:0] CSAI_DATA_INPUT;
	input 		SC_CSAI_RESET_InHigh;
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
	RegGENERAL_Signal = CSAI_DATA_INPUT + 1'b1;

// REGISTER : SEQUENTIAL
	always @ ( posedge SC_CSAI_CLOCK_50, posedge SC_CSAI_RESET_InHigh )
	begin
		if (SC_CSAI_RESET_InHigh == 1'b1)
			RegGENERAL_Register <= 0;
		else
			RegGENERAL_Register <= RegGENERAL_Signal;
	end
	
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
	always @ (*)
		CSAI_DATA_OUTPUT = RegGENERAL_Register;  

endmodule

