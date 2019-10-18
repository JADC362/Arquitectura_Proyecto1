/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module CC_ALU #(parameter DATAWIDTH_BUS=32, parameter DATAWIDTH_ALU_SELECTION=4)(
	//////////// OUTPUTS //////////
	CC_ALU_overflow_OutLow,
	CC_ALU_carry_OutLow,
	CC_ALU_negative_OutLow,
	CC_ALU_zero_OutLow,
	CC_ALU_data_OutBUS,
	CC_ALU_Set_Flags_Out,
	//////////// INPUTS //////////
	CC_ALU_dataA_InBUS,
	CC_ALU_dataB_InBUS,
	CC_ALU_selection_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

//////////// OUTPUTS //////////
output 			CC_ALU_overflow_OutLow;
output 			CC_ALU_carry_OutLow;
output 			CC_ALU_negative_OutLow;
output 			CC_ALU_zero_OutLow;
output reg		CC_ALU_Set_Flags_Out;
output reg		[DATAWIDTH_BUS-1:0] CC_ALU_data_OutBUS;

//////////// INPUTS //////////
input			[DATAWIDTH_BUS-1:0] CC_ALU_dataA_InBUS;
input			[DATAWIDTH_BUS-1:0] CC_ALU_dataB_InBUS;
input			[DATAWIDTH_ALU_SELECTION-1:0] CC_ALU_selection_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
wire caover,cout;
wire [DATAWIDTH_BUS-2:0] addition0; // Variable usada para la operación suma y para determinar las flags
wire addition1;		// Variable usada para la operación suma y para determinar las flags
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always@(*)
begin
	case (CC_ALU_selection_InBUS)	
		4'b0000:  begin
			 CC_ALU_data_OutBUS = CC_ALU_dataA_InBUS & CC_ALU_dataB_InBUS;	//ANDCC
			 CC_ALU_Set_Flags_Out = 1'b0;
			 end
		4'b0001:  begin
			 CC_ALU_data_OutBUS = CC_ALU_dataA_InBUS | CC_ALU_dataB_InBUS;	//ORCC
			 CC_ALU_Set_Flags_Out = 1'b0;
			 end
		4'b0010:  begin
			 CC_ALU_data_OutBUS = CC_ALU_dataA_InBUS | CC_ALU_dataB_InBUS; //NORCC
			 CC_ALU_Set_Flags_Out = 1'b0;
			end
		4'b0011:  begin
			 CC_ALU_data_OutBUS = CC_ALU_dataA_InBUS + CC_ALU_dataB_InBUS;	//ADDCC
			 CC_ALU_Set_Flags_Out = 1'b0;
			 end
		4'b0100:  begin
			 CC_ALU_data_OutBUS = CC_ALU_dataA_InBUS;	//SRL
			 CC_ALU_Set_Flags_Out = 1'b1;
			 end
		4'b0101:  begin
			 CC_ALU_data_OutBUS = CC_ALU_dataA_InBUS & CC_ALU_dataB_InBUS;	 //AND
			 CC_ALU_Set_Flags_Out = 1'b1;
			 end
		4'b0110:  begin
			 CC_ALU_data_OutBUS = CC_ALU_dataA_InBUS | CC_ALU_dataB_InBUS;	 //OR
			 CC_ALU_Set_Flags_Out = 1'b1;
			 end
		4'b0111:  begin
			 CC_ALU_data_OutBUS = CC_ALU_dataA_InBUS | CC_ALU_dataB_InBUS;	//NOR
			 CC_ALU_Set_Flags_Out = 1'b1;
			 end
		4'b1000:  begin
			 CC_ALU_data_OutBUS = CC_ALU_dataA_InBUS + CC_ALU_dataB_InBUS;	//ADD
			 CC_ALU_Set_Flags_Out = 1'b1;
			 end
		4'b1001:  begin
			 CC_ALU_data_OutBUS = {CC_ALU_dataA_InBUS[DATAWIDTH_BUS-3:0], 2'b00};	//LSHIFT2
			 CC_ALU_Set_Flags_Out = 1'b1;
			 end
		4'b1010:  begin
			 CC_ALU_data_OutBUS = {CC_ALU_dataA_InBUS[DATAWIDTH_BUS-11:0], 10'b0000000000};	//LSHIFT10
			 CC_ALU_Set_Flags_Out = 1'b1;
			 end
		4'b1011:  begin
			 CC_ALU_data_OutBUS = {19'b0000000000000000000,CC_ALU_dataA_InBUS[DATAWIDTH_BUS-20:0]}; //SIMM13
			 CC_ALU_Set_Flags_Out = 1'b1;
			 end
		4'b1100:  begin
				if(CC_ALU_dataA_InBUS[12]==1) begin //SEXT13 
						CC_ALU_data_OutBUS = {19'b1111111111111111111, CC_ALU_dataA_InBUS[12:0]};
						CC_ALU_Set_Flags_Out = 1'b1;
					end
				else
					begin
						CC_ALU_data_OutBUS = {19'b0000000000000000000, CC_ALU_dataA_InBUS[12:0]};
						CC_ALU_Set_Flags_Out = 1'b1;
					end
			 end
		4'b1101:  begin
			 CC_ALU_data_OutBUS = CC_ALU_dataA_InBUS + 1'b1;		//INC
			 CC_ALU_Set_Flags_Out = 1'b1;
			 end
		4'b1110:  begin
			 CC_ALU_data_OutBUS = CC_ALU_dataA_InBUS + 3'b100;		//INCPC
			 CC_ALU_Set_Flags_Out = 1'b1;
			 end
		4'b1111:  begin
			 CC_ALU_data_OutBUS = {CC_ALU_dataA_InBUS[4:0], CC_ALU_dataA_InBUS[DATAWIDTH_BUS-1:5]};	//RSHIFT5
			 CC_ALU_Set_Flags_Out = 1'b1;
			 end	
		default : begin 
				CC_ALU_data_OutBUS = CC_ALU_dataA_InBUS; // Default
				CC_ALU_Set_Flags_Out = 1'b1;
			end
	endcase
end
//=======================================================
//  Outputs
//=======================================================
/*Flags*/
assign {caover,addition0[DATAWIDTH_BUS-2:0]}=CC_ALU_dataA_InBUS[DATAWIDTH_BUS-2:0] + CC_ALU_dataB_InBUS[DATAWIDTH_BUS-2:0]; 	// Determinación de carry del bit número 7
assign {cout,addition1}= CC_ALU_dataA_InBUS[DATAWIDTH_BUS-1] + CC_ALU_dataB_InBUS[DATAWIDTH_BUS-1] + caover;	// Determinación de la flag Carry y la suma de busA y busB
assign CC_ALU_zero_OutLow=(CC_ALU_data_OutBUS==8'b00000000) ? 1'b0 : 1'b1;	// Determinación de la flag Zero
assign CC_ALU_carry_OutLow = ~cout;
assign CC_ALU_overflow_OutLow = ~ (caover ^ cout);		// Determinación de la flag Ov a partir de la flag Carry y el carry del bit 7
assign CC_ALU_negative_OutLow = ~ (CC_ALU_data_OutBUS[DATAWIDTH_BUS-1]);	

endmodule


