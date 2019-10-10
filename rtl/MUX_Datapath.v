module MUX_Datapath #(
	parameter DATAWIDTH_MUX_SELECTION=4, 
	parameter DATAWIDTH_BUS=32,
	parameter DATAWIDTH_BUS_REG_IR=5,
	parameter DATAWIDTH_BUS_REG_MIR_FIELD=6,
	parameter DATAWIDTH_BUS_MUX_DATAPATH_OUT=6
	)(
	//////////// OUTPUTS //////////
	CC_MUX_DataBUS_Out,
	//////////// INPUTS //////////
	CC_MUX_In_Register,
	CC_MUX_In_MIRField,
	CC_MUX_In_Selector_Field_inLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
	output reg	[DATAWIDTH_BUS_MUX_DATAPATH_OUT-1:0] CC_MUX_DataBUS_Out;
	input			[DATAWIDTH_BUS_REG_MIR_FIELD-1:0] CC_MUX_In_MIRField;
	input			[DATAWIDTH_BUS_REG_IR-1:0] CC_MUX_In_Register;
	input 	 CC_MUX_In_Selector_Field_inLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always@(*)
	begin
	case (CC_MUX_In_Selector_Field_inLow)	
	// Example to more outputs: WaitStart: begin sResetCounter = 0; sCuenteUP = 0; end
		
		1'b0: CC_MUX_DataBUS_Out = CC_MUX_In_MIRField;
		1'b1: CC_MUX_DataBUS_Out = {1'b0,CC_MUX_In_Register};

		default :   CC_MUX_DataBUS_Out = CC_MUX_In_MIRField;
		endcase
	end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL

endmodule
