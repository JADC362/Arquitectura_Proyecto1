onerror {resume}
quietly WaveActivateNextPane {} 0
delete wave *
add wave -noupdate /BB_SYSTEM_vlg_tst/eachvec

add wave  -divider uDATAPATH
add wave -noupdate /BB_SYSTEM_vlg_tst/BB_SYSTEM_CLOCK_50
add wave -noupdate /BB_SYSTEM_vlg_tst/BB_SYSTEM_RESET_InHigh

add wave  -divider REGISTERS
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/SC_RegGENERAL_g1/SC_RegGENERAL_DataBUS_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/SC_RegGENERAL_g2/SC_RegGENERAL_DataBUS_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/SC_RegGENERAL_g3/SC_RegGENERAL_DataBUS_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/SC_RegGENERAL_g4/SC_RegGENERAL_DataBUS_Out

add wave  -divider DATAPATH
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/uDataPath_ALU_Flags_Write_PCR
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/Scratchpath_Reg_IR_RS1
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/Scratchpath_Reg_IR_RS2
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/Scratchpath_Reg_IR_RD
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/Scratchpath_Reg_IR_OP
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/Scratchpath_Reg_IR_IR13
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/SC_RegGENERAL_Temp0/SC_RegGENERAL_DataBUS_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/SC_RegGENERAL_Temp1/SC_RegGENERAL_DataBUS_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/SC_RegGENERAL_Temp2/SC_RegGENERAL_DataBUS_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/SC_RegGENERAL_Temp3/SC_RegGENERAL_DataBUS_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/Scratchpath_DataPath/SC_RegGeneral_PC/SC_RegGENERAL_DataBUS_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/uDataPath_MUX_C/CC_MUX_DataBUS_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/MUX_Datapath_A/CC_MUX_DataBUS_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/MUX_Datapath_B/CC_MUX_DataBUS_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/MUX_Datapath_C/CC_MUX_DataBUS_Out

add wave  -divider DATA_MEMORY
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/Data_Memory_u0/DataMemory_Address_In
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/Data_Memory_u0/DataMemory_Data_In
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/Data_Memory_u0/DataMemory_Data_Out

add wave  -divider SISTEMACONTROL
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/Psr/SC_Psr_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/branchControl/Brach_output
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/CSAI/CSAI_DATA_OUTPUT
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/MUX_MIM/CC_MUX_data_OutBUS
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/MIM_ControlStore/CC_MIM_ControlStore_data_OutBUS
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/MIR/SC_MIR_A_OutBUS
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/MIR/SC_MIR_B_OutBUS
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/MIR/SC_MIR_C_OutBUS
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/MIR/SC_MIR_Read_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/MIR/SC_MIR_Write_Out
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/MIR/SC_MIR_ALU_OutBUS
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/MIR/SC_MIR_Cond_OutBUS
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/SistemaControl_u0/MIR/SC_MIR_JumpAddr_OutBUS

add wave  -divider ALU
add wave -noupdate /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/CC_Datapath_ALU/CC_ALU_dataA_InBUS
add wave -noupdate /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/CC_Datapath_ALU/CC_ALU_dataB_InBUS
add wave  -noupdate -radix Unsigned /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/CC_Datapath_ALU/CC_ALU_data_OutBUS
add wave -noupdate /BB_SYSTEM_vlg_tst/BB_SYSTEM_u0/WB_uProcesador_u0/uDataPath_u0/CC_Datapath_ALU/CC_ALU_selection_InBUS


restart
run 1ms

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {319999492 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 445
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {59829352 ps} {60892417 ps}
