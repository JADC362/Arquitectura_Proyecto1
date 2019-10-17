onerror {resume}
quietly WaveActivateNextPane {} 0
delete wave *
add wave -noupdate /TB_SYSTEM/eachvec

add wave  -divider uDATAPATH
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_CLOCK_50
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_RESET_InHigh

add wave  -divider REGISTERS
add wave  -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/uDATAPATH_u0/Scratchpath_DataPath/SC_RegGENERAL_g1/SC_RegGENERAL_DataBUS_Out
add wave  -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/uDATAPATH_u0/Scratchpath_DataPath/SC_RegGENERAL_g2/SC_RegGENERAL_DataBUS_Out
add wave  -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/uDATAPATH_u0/Scratchpath_DataPath/SC_RegGENERAL_g3/SC_RegGENERAL_DataBUS_Out
add wave  -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/uDATAPATH_u0/Scratchpath_DataPath/SC_RegGENERAL_g4/SC_RegGENERAL_DataBUS_Out
add wave  -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/Data_Memory_u0/DataMemory_Data_Out

add wave  -divider DATAPATH
add wave  -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/uDATAPATH_u0/uDataPath_Reg_IR_IR13
add wave  -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/uDATAPATH_u0/uDataPath_Reg_IR_OP

add wave  -divider SISTEMACONTROL
add wave  -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SistemaControl_u0/Psr/SC_Psr_Out

add wave  -divider ALU
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/uDATAPATH_u0/CC_Datapath_ALU/CC_ALU_dataA_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/uDATAPATH_u0/CC_Datapath_ALU/CC_ALU_dataB_InBUS
add wave  -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/uDATAPATH_u0/CC_Datapath_ALU/CC_ALU_data_OutBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/uDATAPATH_u0/CC_Datapath_ALU/CC_ALU_selection_InBUS


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
