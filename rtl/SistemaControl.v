
module SistemaControl #(
	parameter DATAWIDTH_ALU_SELECTION=4,
	parameter DATAWIDTH_COND_MIR =3, 
	parameter DATAWIDTH_BANDERAS=4,
	parameter DATAWIDTH_BUS_OUT_BC=2,
	parameter DATAWIDTH_BUS_REG_MIR_FIELD=6,
	parameter DATAWIDTH_BUS_MUX=11,
	parameter DATAWIDTH_BUS_MIR=41,
	parameter DATAWIDTH_BUS_REG_IR_OP=8
)(
	//////////// INPUT //////////
	SistemaControl_CLOCK_50,
	SistemaControl_Overflow_InLow,
	SistemaControl_Carry_InLow,
	SistemaControl_Negative_InLow,
	SistemaControl_Zero_InLow,
	SistemaControl_ALU_Flags_Write_PCR,
	SistemaControl_Reg_IR_IR13,
	SistemaControl_RESET_InHigh,
	SistemaControl_Reg_IR_OP_In,
	//////////// OUTPUT //////////
   SistemaControl_ALU_Selection_Out,
	SistemaControl_MUX_A_MIR,
	SistemaControl_MUX_B_MIR,
	SistemaControl_MUX_C_MIR,
	SistemaControl_MUX_A_MIR_Selector,
	SistemaControl_MUX_B_MIR_Selector,
	SistemaControl_MUX_C_MIR_Selector,
	SistemaControl_Selector_RD,
	SistemaControl_Selector_WR
);


//=======================================================
//  PORT declarations
//=======================================================

	//////////// INPUT //////////
	input SistemaControl_CLOCK_50;
	input SistemaControl_Overflow_InLow;
	input SistemaControl_Carry_InLow;
	input SistemaControl_Negative_InLow;
	input SistemaControl_Zero_InLow;
	input SistemaControl_ALU_Flags_Write_PCR;
	input SistemaControl_Reg_IR_IR13;
	input SistemaControl_RESET_InHigh;
	input [DATAWIDTH_BUS_REG_IR_OP-1:0] SistemaControl_Reg_IR_OP_In;
	
	//////////// OUTPUT //////////
	output [DATAWIDTH_ALU_SELECTION-1:0] SistemaControl_ALU_Selection_Out;
	output [DATAWIDTH_BUS_REG_MIR_FIELD-1:0] SistemaControl_MUX_A_MIR;
	output [DATAWIDTH_BUS_REG_MIR_FIELD-1:0] SistemaControl_MUX_B_MIR;
	output [DATAWIDTH_BUS_REG_MIR_FIELD-1:0] SistemaControl_MUX_C_MIR;
	output SistemaControl_MUX_A_MIR_Selector;
	output SistemaControl_MUX_B_MIR_Selector;
	output SistemaControl_MUX_C_MIR_Selector;
	output SistemaControl_Selector_RD;
	output SistemaControl_Selector_WR;

//=======================================================
//  REG/WIRE declarations
//=======================================================
// ARC_REGISTERS OUTPUTS WIRES (registros vitales)


// WIRES PSR
	wire [DATAWIDTH_ALU_SELECTION-1:0] Psr_Out ;

//WIRES CSAI
	wire [DATAWIDTH_BUS_MUX-1:0] CSAI_Out;

//WIRES BRANCH CONTROL
	wire [DATAWIDTH_BUS_OUT_BC-1:0] Branch_CONTROL_Out;

//WIRES MUX MIM
	wire [DATAWIDTH_BUS_MUX-1:0] MUX_MIM_Out;

//WIRES MIM
	wire [DATAWIDTH_BUS_MIR-1:0] MIM_Out;
	
//WIRES MIR
	wire [DATAWIDTH_BUS_MUX-1:0] MIR_JumpAddr_Out;
	wire [DATAWIDTH_COND_MIR-1:0] MIR_Cond_Out;

//WIRES 

//=======================================================
//  Structural coding
//=======================================================

SC_CSAI CSAI(

	//entradas
	.SC_CSAI_CLOCK_50(SistemaControl_CLOCK_50),
	.CSAI_DATA_INPUT(MUX_MIM_Out),
	.SC_CSAI_RESET_InHigh(SistemaControl_RESET_InHigh),
	//Salidas
	.CSAI_DATA_OUTPUT(CSAI_Out)
);


SC_Psr #(.DATAWIDTH_ALU_SELECTION(DATAWIDTH_ALU_SELECTION))Psr(
	//salida
	.SC_Psr_Out(Psr_Out),
	//entradas
	.SC_Psr_CLOCK_50(SistemaControl_CLOCK_50),
	.SC_Psr_RESET_InHigh(SistemaControl_RESET_InHigh),
	.SC_Psr_Write_InLow(SistemaControl_ALU_Flags_Write_PCR),
	.SC_Psr_negativo(SistemaControl_Negative_InLow),
	.SC_Psr_cero(SistemaControl_Zero_InLow),
	.SC_Psr_overflow(SistemaControl_Overflow_InLow),
	.SC_Psr_carry(SistemaControl_Carry_InLow)	
);

CC_branchControl #(
	.DATAWIDTH_COND_MIR(DATAWIDTH_COND_MIR),
	.DATAWIDTH_BANDERAS(DATAWIDTH_BANDERAS),
	.DATAWIDTH_BUS_OUT(DATAWIDTH_BUS_OUT_BC)
)branchControl(
	// salida
	.Brach_output(Branch_CONTROL_Out),
	//entradas
	.Branch_Flags(Psr_Out),
	.Branch_Ir13(SistemaControl_Reg_IR_IR13),
	.Branch_Condition(MIR_Cond_Out)
);

CC_MUX_MIM #(
	.DATAWIDTH_BUS(DATAWIDTH_BUS_MUX)
)MUX_MIM(
	//salidas
	.CC_MUX_data_OutBUS(MUX_MIM_Out),
	//entradas
	.CC_MUX_Next_InBUS(CSAI_Out),
	.CC_MUX_Decode_InBUS(SistemaControl_Reg_IR_OP_In),
	.CC_MUX_Jump_InBUS(MIR_JumpAddr_Out),
	.CC_MUX_selection_InBUS(Branch_CONTROL_Out)
);

CC_MIM_ControlStore #(
	.DATAWIDTH_OUTPUT_BUS(DATAWIDTH_BUS_MIR),
	.DATAWIDTH_INPUT_BUS(DATAWIDTH_BUS_MUX)
)MIM_ControlStore(
	//salidas
	.CC_MIM_ControlStore_data_OutBUS(MIM_Out),
	//entradas
	.CC_MIM_ControlStore_data_InBUS(MUX_MIM_Out)
);

SC_MIR #(
	.MIR_DATAWIDTH(DATAWIDTH_BUS_MIR)
)MIR(
	//salidas
	.SC_MIR_A_OutBUS(SistemaControl_MUX_A_MIR),
	.SC_MIR_AMUX_Out(SistemaControl_MUX_A_MIR_Selector),
	.SC_MIR_B_OutBUS(SistemaControl_MUX_B_MIR),
	.SC_MIR_BMUX_Out(SistemaControl_MUX_B_MIR_Selector),
	.SC_MIR_C_OutBUS(SistemaControl_MUX_C_MIR),
	.SC_MIR_CMUX_Out(SistemaControl_MUX_C_MIR_Selector),
	.SC_MIR_Read_Out(SistemaControl_Selector_RD),
	.SC_MIR_Write_Out(SistemaControl_Selector_WR),
	.SC_MIR_ALU_OutBUS(SistemaControl_ALU_Selection_Out),
	.SC_MIR_Cond_OutBUS(MIR_Cond_Out),
	.SC_MIR_JumpAddr_OutBUS(MIR_JumpAddr_Out),
	//entradas
	.SC_MIR_CLOCK_50(SistemaControl_CLOCK_50),
	.SC_MIR_RESET_InHigh(SistemaControl_RESET_InHigh),
	.SC_MIR_data_InBUS(MIM_Out)
);

endmodule
