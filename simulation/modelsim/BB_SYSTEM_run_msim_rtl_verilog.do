transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/WB_uProcesador.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/uDataPath.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/SistemaControl.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/Scratchpath.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/SC_RegGENERAL_IR.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/SC_RegGENERAL.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/SC_RegFIXED.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/SC_Psr.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/SC_MIR.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/SC_CSAI.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/MUX_Datapath.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/MUX_C.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/Data_Memory.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/CC_MUXX.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/CC_MUX_MIM.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/CC_MIM_ControlStore.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/CC_DECODER.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/CC_branchControl.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/rtl {C:/Arquitectura_Proyecto1-master/rtl/CC_ALU.v}
vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master {C:/Arquitectura_Proyecto1-master/BB_SYSTEM.v}

vlog -vlog01compat -work work +incdir+C:/Arquitectura_Proyecto1-master/simulation/modelsim {C:/Arquitectura_Proyecto1-master/simulation/modelsim/BB_SYSTEM.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  BB_SYSTEM_vlg_tst

do C:/Arquitectura_Proyecto1-master/simulation/modelsim/BB_SYSTEM.do
