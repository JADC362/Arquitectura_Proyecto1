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
module CC_MUXX #(parameter DATAWIDTH_MUX_SELECTION=4, parameter DATAWIDTH_BUS=32)(
	//////////// OUTPUTS //////////
	CC_MUX_data_OutBUS,
	//////////// INPUTS //////////
	CC_MUX_DataBUS_In_g0,
	CC_MUX_DataBUS_In_g1,
	CC_MUX_DataBUS_In_g2,	
	CC_MUX_DataBUS_In_g3,	
	CC_MUX_DataBUS_In_g4,	
	CC_MUX_DataBUS_In_g5,	
	CC_MUX_DataBUS_In_g6,	
	CC_MUX_DataBUS_In_g7,	
	CC_MUX_DataBUS_PC,
	CC_MUX_DataBUS_Temp0,
	CC_MUX_DataBUS_Temp1,
	CC_MUX_DataBUS_Temp2,
	CC_MUX_DataBUS_Temp3,
	CC_MUX_DataBUS_IR,
	CC_MUX_Selection_In
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output reg	[DATAWIDTH_BUS-1:0] CC_MUX_data_OutBUS;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_In_g0;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_In_g1;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_In_g2;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_In_g3;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_In_g4;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_In_g5;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_In_g6;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_In_g7;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_PC;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_Temp0;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_Temp1;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_Temp2;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_Temp3;
input			[DATAWIDTH_BUS-1:0] CC_MUX_DataBUS_IR;
input			[DATAWIDTH_MUX_SELECTION-1:0] CC_MUX_Selection_In;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always@(*)
begin
	case (CC_MUX_Selection_In)	
		
		//General registers
		4'b0000: CC_MUX_data_OutBUS = CC_MUX_DataBUS_In_g0;
		4'b0001: CC_MUX_data_OutBUS = CC_MUX_DataBUS_In_g1;
		4'b0010: CC_MUX_data_OutBUS = CC_MUX_DataBUS_In_g2;
		4'b0011: CC_MUX_data_OutBUS = CC_MUX_DataBUS_In_g3;
		4'b0100: CC_MUX_data_OutBUS = CC_MUX_DataBUS_In_g4;
		4'b0101: CC_MUX_data_OutBUS = CC_MUX_DataBUS_In_g5;
		4'b0110: CC_MUX_data_OutBUS = CC_MUX_DataBUS_In_g6;
		4'b0111: CC_MUX_data_OutBUS = CC_MUX_DataBUS_In_g7;
				
		//Specifig registers
				
		4'b1000: CC_MUX_data_OutBUS = CC_MUX_DataBUS_PC;
		4'b1001: CC_MUX_data_OutBUS = CC_MUX_DataBUS_Temp0;
		4'b1010: CC_MUX_data_OutBUS = CC_MUX_DataBUS_Temp1;
		4'b1011: CC_MUX_data_OutBUS = CC_MUX_DataBUS_Temp2;
		4'b1100: CC_MUX_data_OutBUS = CC_MUX_DataBUS_Temp3;
		4'b1101: CC_MUX_data_OutBUS = CC_MUX_DataBUS_IR;

		default :   CC_MUX_data_OutBUS = CC_MUX_DataBUS_In_g0; // channel 0 is selected 
		
		
	endcase
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL

endmodule

