
module SistemaControl #(
	parameter DATAWIDTH_ALU_SELECTION=4,
	parameter DATAWIDTH_COND_MIR =3, 
	parameter DATAWIDTH_BANDERAS=4, 
	parameter DATAWIDTH_BUS_OUT=2,
	parameter DATAWIDTH_BUS_REG_MIR_FIELD=6
)(
	//////////// INPUT //////////
	SistemaControl_CLOCK_50,
	SistemaControl_Overflow_InLow,
	SistemaControl_Carry_InLow,
	SistemaControl_Negative_InLow,
	SistemaControl_Zero_InLow,
	SistemaControl_ALU_Flags_Write_PCR,
	SistemaControl_Reg_IR_IR13,
	//////////// OUTPUT //////////
   SistemaControl_ALU_Selection_In,
	SistemaControl_MUX_A_MIR,
	SistemaControl_MUX_B_MIR,
	SistemaControl_MUX_C_MIR,
	SistemaControl_MUX_A_MIR_Selector,
	SistemaControl_MUX_B_MIR_Selector,
	SistemaControl_MUX_C_MIR_Selector
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
	
	//////////// OUTPUT //////////
	output [DATAWIDTH_ALU_SELECTION-1:0] SistemaControl_ALU_Selection_In;
	output [DATAWIDTH_BUS_REG_MIR_FIELD-1:0] SistemaControl_MUX_A_MIR;
	output [DATAWIDTH_BUS_REG_MIR_FIELD-1:0] SistemaControl_MUX_B_MIR;
	output [DATAWIDTH_BUS_REG_MIR_FIELD-1:0] SistemaControl_MUX_C_MIR;
	output SistemaControl_MUX_A_MIR_Selector;
	output SistemaControl_MUX_B_MIR_Selector;
	output SistemaControl_MUX_C_MIR_Selector;

//=======================================================
//  REG/WIRE declarations
//=======================================================
// ARC_REGISTERS OUTPUTS WIRES (registros vitales)


// WIRES PSR
	wire [DATAWIDTH_ALU_SELECTION-1:0] Psr_Out ;

//WIRES CSAI

//WIRES BRANCH CONTROL


//=======================================================
//  Structural coding
//=======================================================

SC_CSAI CSAI(

	//entradas
	.SC_CSAI_CLOCK_50(SistemaControl_CLOCK_50),
//	.CSAI_DATA_INPUT()
	//Salidas
// .CSAI_DATA_OUTPUT()
	
);


SC_Psr #(.DATAWIDTH_ALU_SELECTION(DATAWIDTH_ALU_SELECTION))Psr(
	//salida
	.SC_Psr_Out(Psr_Out),
	//entradas
	.SC_Psr_CLOCK_50(SistemaControl_CLOCK_50),
	.SC_Psr_Write_InLow(SistemaControl_ALU_Flags_Write_PCR),
	.SC_Psr_negativo(SistemaControl_Negative_InLow),
	.SC_Psr_cero(SistemaControl_Zero_InLow),
	.SC_Psr_overflow(SistemaControl_Overflow_InLow),
	.SC_Psr_carry(SistemaControl_Carry_InLow)	
);

CC_branchControl #(
	.DATAWIDTH_COND_MIR(DATAWIDTH_COND_MIR),
	.DATAWIDTH_BANDERAS(DATAWIDTH_BANDERAS),
	.DATAWIDTH_BUS_OUT(DATAWIDTH_BUS_OUT)
)branchControl(
	// salida
//	.Brach_output(),
	//entradas
	.Branch_Flags(Psr_Out),
	.Branch_Ir13(SistemaControl_Reg_IR_IR13),
//	.Branch_Condition()
);



endmodule
