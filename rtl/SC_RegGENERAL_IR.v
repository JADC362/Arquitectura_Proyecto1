//=======================================================
//  MODULE Definition
//=======================================================
module SC_RegGENERAL_IR #(
	parameter DATAWIDTH_BUS=32,
	parameter DATAWIDTH_BUS_REG_IR=5,
	parameter DATAWIDTH_BUS_REG_IR_OP=8
)(
	//////////// OUTPUTS //////////
	SC_RegGENERAL_DataBUS_Out,
	SC_ReGENERAL_DataBUS_RS1,
	SC_ReGENERAL_DataBUS_RS2,
	SC_ReGENERAL_DataBUS_RD,
	SC_ReGENERAL_DataBUS_OP, 
	SC_ReGENERAL_DataBUS_IR13,
	//////////// INPUTS //////////
	SC_RegGENERAL_CLOCK_50,
	SC_RegGENERAL_RESET_InHigh,
	SC_RegGENERAL_Write_InLow,
	SC_RegGENERAL_DataBUS_In
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
	output reg	[DATAWIDTH_BUS-1:0] SC_RegGENERAL_DataBUS_Out;
	
	output reg  [DATAWIDTH_BUS_REG_IR-1:0] SC_ReGENERAL_DataBUS_RS1;
	output reg  [DATAWIDTH_BUS_REG_IR-1:0] SC_ReGENERAL_DataBUS_RS2;
	output reg  [DATAWIDTH_BUS_REG_IR-1:0] SC_ReGENERAL_DataBUS_RD;
	output reg 	[DATAWIDTH_BUS_REG_IR_OP-1:0] SC_ReGENERAL_DataBUS_OP;
	output reg SC_ReGENERAL_DataBUS_IR13;
	
	input			SC_RegGENERAL_CLOCK_50;
	input			SC_RegGENERAL_Write_InLow;
	input 		SC_RegGENERAL_RESET_InHigh;
	input 		[DATAWIDTH_BUS-1:0] SC_RegGENERAL_DataBUS_In;
//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg [DATAWIDTH_BUS-1:0] RegGENERAL_Register;
	reg [DATAWIDTH_BUS-1:0] RegGENERAL_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always @ (*)
	if (SC_RegGENERAL_Write_InLow == 1'b0)	
		RegGENERAL_Signal = SC_RegGENERAL_DataBUS_In;
	else 	
		RegGENERAL_Signal = RegGENERAL_Register;

// REGISTER : SEQUENTIAL
	//STATE REGISTER: SEQUENTIAL
	always @(posedge SC_RegGENERAL_CLOCK_50, posedge SC_RegGENERAL_RESET_InHigh)
	begin
		if (SC_RegGENERAL_RESET_InHigh == 1'b1)
			RegGENERAL_Register <= 0;
		else
			RegGENERAL_Register <= RegGENERAL_Signal;
	end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
	always @ (*)
	begin
		SC_RegGENERAL_DataBUS_Out = RegGENERAL_Register;  
		SC_ReGENERAL_DataBUS_RS2= RegGENERAL_Register[4:0];
		SC_ReGENERAL_DataBUS_IR13= RegGENERAL_Register[13];
		SC_ReGENERAL_DataBUS_RS1= RegGENERAL_Register[18:14];
		SC_ReGENERAL_DataBUS_RD= RegGENERAL_Register[29:25];
		SC_ReGENERAL_DataBUS_OP= {RegGENERAL_Register[31:30],RegGENERAL_Register[24:19]};
	end

endmodule

