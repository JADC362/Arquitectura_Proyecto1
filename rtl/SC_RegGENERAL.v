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
module SC_RegGENERAL #(parameter DATAWIDTH_BUS=32)(
	//////////// OUTPUTS //////////
	SC_RegGENERAL_DataBUS_Out,
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
output   [DATAWIDTH_BUS-1:0]	SC_RegGENERAL_DataBUS_Out;
input		SC_RegGENERAL_CLOCK_50;
input		SC_RegGENERAL_RESET_InHigh;
input		SC_RegGENERAL_Write_InLow;	
input		[DATAWIDTH_BUS-1:0]	SC_RegGENERAL_DataBUS_In;

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
begin
	if (SC_RegGENERAL_Write_InLow == 1'b0)	
		RegGENERAL_Signal = SC_RegGENERAL_DataBUS_In;
	else 	
		RegGENERAL_Signal = RegGENERAL_Register;
end

//STATE REGISTER: SEQUENTIAL
always @(negedge SC_RegGENERAL_CLOCK_50, posedge SC_RegGENERAL_RESET_InHigh)
begin
	if (SC_RegGENERAL_RESET_InHigh == 1'b1)
		RegGENERAL_Register <= 0;
	else
		RegGENERAL_Register <= RegGENERAL_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_RegGENERAL_DataBUS_Out = RegGENERAL_Register;

endmodule
