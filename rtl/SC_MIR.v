module SC_MIR #(parameter MIR_DATAWIDTH=41)(
	//////////// OUTPUTS //////////
	SC_MIR_A_OutBUS,
	SC_MIR_AMUX_Out,
	SC_MIR_B_OutBUS,
	SC_MIR_BMUX_Out,
	SC_MIR_C_OutBUS,
	SC_MIR_CMUX_Out,
	SC_MIR_Read_Out,
	SC_MIR_Write_Out,
	SC_MIR_ALU_OutBUS,
	SC_MIR_Cond_OutBUS,
	SC_MIR_JumpAddr_OutBUS,
	//////////// INPUTS //////////
	SC_MIR_CLOCK_50,
	SC_MIR_RESET_InHigh,
	SC_MIR_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[5:0]	SC_MIR_A_OutBUS;
output		SC_MIR_AMUX_Out;
output		[5:0]	SC_MIR_B_OutBUS;
output		SC_MIR_BMUX_Out;
output		[5:0]	SC_MIR_C_OutBUS;
output		SC_MIR_CMUX_Out;
output		SC_MIR_Read_Out;
output		SC_MIR_Write_Out;
output		[3:0]	SC_MIR_ALU_OutBUS;
output		[2:0]	SC_MIR_Cond_OutBUS;
output		[10:0]	SC_MIR_JumpAddr_OutBUS;
input		SC_MIR_CLOCK_50;
input		SC_MIR_RESET_InHigh;
input		[MIR_DATAWIDTH-1:0]	SC_MIR_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [MIR_DATAWIDTH-1:0] MIR_Register;
reg [MIR_DATAWIDTH-1:0] MIR_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	MIR_Signal = SC_MIR_data_InBUS;
end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_MIR_CLOCK_50, posedge SC_MIR_RESET_InHigh)
begin
	if (SC_MIR_RESET_InHigh == 1'b1)
		MIR_Register <= 0;
	else
		MIR_Register <= MIR_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_MIR_A_OutBUS = MIR_Register[40:35];
assign SC_MIR_AMUX_Out = MIR_Register[34];
assign SC_MIR_B_OutBUS = MIR_Register[33:28];
assign SC_MIR_BMUX_Out = MIR_Register[27];
assign SC_MIR_C_OutBUS = MIR_Register[26:21];
assign SC_MIR_CMUX_Out = MIR_Register[20];
assign SC_MIR_Read_Out = MIR_Register[19];
assign SC_MIR_Write_Out = MIR_Register[18];
assign SC_MIR_ALU_OutBUS = MIR_Register[17:14];
assign SC_MIR_Cond_OutBUS = MIR_Register[13:11];
assign SC_MIR_JumpAddr_OutBUS = MIR_Register[10:0];

endmodule
