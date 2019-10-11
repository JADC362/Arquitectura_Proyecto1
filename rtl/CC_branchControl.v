//Módulo encargado de definir los saltos que debe realizar la memoria de microinstrucciones


//=======================================================
//  MODULE Definition
//=======================================================
module CC_branchControl #(parameter DATAWIDTH_COND_MIR=3, parameter DATAWIDTH_BANDERAS=4, parameter DATAWIDTH_BUS_OUT=2)(
	//OUTPUTS
	Brach_output,			//Salida de 2 bits conectada al CS Adress Mux
	//INPUTS	
	Branch_Flags,			//Banderas del %psr
	Branch_Ir13,			//Bit 13 
	Branch_Condition		//Condición de la memoria de microinstrucciones
	
);

//=======================================================
//  PORT declarations
//=======================================================
	//OUTPUTS//
	output reg	[DATAWIDTH_BUS_OUT-1:0] Brach_output;
	//INPUTS//
	input			[DATAWIDTH_COND_MIR-1:0] Branch_Condition;
   input			[DATAWIDTH_BANDERAS-1:0] Branch_Flags;
	input			Branch_Ir13;
	
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always@(*) //poner clock!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	begin
	case (Branch_Condition)	
		// Salto a la siguiente dirección
		3'b000: Brach_output =2'b00 ;
		// Verificación bandera negativo
		3'b001:  begin 
						if (Branch_Flags[3] == 1'b0)
							Brach_output = 2'b01 ;
						else
							Brach_output = 2'b00 ;
					end 
		// Verificación bandera cero
      3'b010:  begin 
						if (Branch_Flags[2] == 1'b0)
							Brach_output = 2'b01 ;
						else
							Brach_output = 2'b00 ;
					end 
		// Verificación bandera overflow			
		3'b011:  begin 
						if (Branch_Flags[1] == 1'b0)
							Brach_output = 2'b01 ;
						else
							Brach_output = 2'b00 ;
					end 
		// Verificación bandera carry		
		3'b100:  begin 
						if (Branch_Flags[0] == 1'b0)
							Brach_output = 2'b01 ;
						else
							Brach_output = 2'b00 ;
					end 
		// Verificación bit 13 IR			
		3'b101: begin 
						if (Branch_Ir13 == 1'b1)
							Brach_output = 2'b01 ;
						else
							Brach_output = 2'b00 ;
					end 
		
		// Usar salto a dirección
		3'b110: Brach_output = 2'b01 ;
		
		// Decodificar 
		3'b111: Brach_output = 2'b10 ;
		
		
		default :  Brach_output = 2'b00; 
		
		endcase
		
	end

endmodule

