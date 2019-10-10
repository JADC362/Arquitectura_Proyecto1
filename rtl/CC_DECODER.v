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
module CC_DECODER #(parameter DATAWIDTH_DECODER_SELECTION=4, parameter DATAWIDTH_DECODER_OUT=16)(
	//////////// OUTPUTS //////////
	CC_DECODER_Selection_OutBUS,
	//////////// INPUTS //////////
	CC_DECODER_Selection_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output reg	[DATAWIDTH_DECODER_OUT-1:0] CC_DECODER_Selection_OutBUS;
input		[DATAWIDTH_DECODER_SELECTION-1:0] CC_DECODER_Selection_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always@(*)
begin
	case (CC_DECODER_Selection_InBUS)	
	
		//General registers
		4'b0000: CC_DECODER_DataDecoder_Out = 16'b1111111111111110;//g0
		4'b0001: CC_DECODER_DataDecoder_Out = 16'b1111111111111101;//g1
		4'b0010: CC_DECODER_DataDecoder_Out = 16'b1111111111111011;//g2
		4'b0011: CC_DECODER_DataDecoder_Out = 16'b1111111111110111;//g3
		4'b0100: CC_DECODER_DataDecoder_Out = 16'b1111111111101111;//g4
		4'b0101: CC_DECODER_DataDecoder_Out = 16'b1111111111011111;//g5
		4'b0110: CC_DECODER_DataDecoder_Out = 16'b1111111110111111;//g6
		4'b0111: CC_DECODER_DataDecoder_Out = 16'b1111111101111111;//g7
				
		//Specifig registers
				
		4'b1000: CC_DECODER_DataDecoder_Out = 16'b1111111011111111;//PC (8)
		4'b1001: CC_DECODER_DataDecoder_Out = 16'b1111110111111111;//Temp0 (9)
		4'b1010: CC_DECODER_DataDecoder_Out = 16'b1111101111111111;//Temp1 (10)
		4'b1011: CC_DECODER_DataDecoder_Out = 16'b1111011111111111;//Temp2 (11)
		4'b1100: CC_DECODER_DataDecoder_Out = 16'b1110111111111111;//Temp3 (12)
		4'b1101: CC_DECODER_DataDecoder_Out = 16'b1101111111111111;//IR (13)
		default: CC_DECODER_DataDecoder_Out = 16'b1111111111111111; //Default 
	endcase
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL

endmodule
