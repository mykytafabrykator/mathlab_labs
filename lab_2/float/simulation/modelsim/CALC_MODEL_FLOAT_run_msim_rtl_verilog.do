transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Mykyta/Documents/MATLAB/lab_2/float/CALC_MODEL_FLOAT {C:/Users/Mykyta/Documents/MATLAB/lab_2/float/CALC_MODEL_FLOAT/nfp_sqrt_single.v}
vlog -vlog01compat -work work +incdir+C:/Users/Mykyta/Documents/MATLAB/lab_2/float/CALC_MODEL_FLOAT {C:/Users/Mykyta/Documents/MATLAB/lab_2/float/CALC_MODEL_FLOAT/nfp_mul_single.v}
vlog -vlog01compat -work work +incdir+C:/Users/Mykyta/Documents/MATLAB/lab_2/float/CALC_MODEL_FLOAT {C:/Users/Mykyta/Documents/MATLAB/lab_2/float/CALC_MODEL_FLOAT/nfp_atan2_single.v}
vlog -vlog01compat -work work +incdir+C:/Users/Mykyta/Documents/MATLAB/lab_2/float/CALC_MODEL_FLOAT {C:/Users/Mykyta/Documents/MATLAB/lab_2/float/CALC_MODEL_FLOAT/nfp_add_single.v}
vlog -vlog01compat -work work +incdir+C:/Users/Mykyta/Documents/MATLAB/lab_2/float/CALC_MODEL_FLOAT {C:/Users/Mykyta/Documents/MATLAB/lab_2/float/CALC_MODEL_FLOAT/CALC_MAGNITUDE_AND_PHASE_FLOAT.v}

vlog -vlog01compat -work work +incdir+C:/Users/Mykyta/Documents/MATLAB/lab_2/float/CALC_MODEL_FLOAT {C:/Users/Mykyta/Documents/MATLAB/lab_2/float/CALC_MODEL_FLOAT/CALC_MAGNITUDE_AND_PHASE_FLOAT_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  CALC_MAGNITUDE_AND_PHASE_FLOAT_tb

add wave *
view structure
view signals
run -all
