onbreak resume
onerror resume
vsim -voptargs=+acc work.CALC_MAGNITUDE_AND_PHASE_FIXED_tb

add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/u_CALC_MAGNITUDE_AND_PHASE_FIXED/clk
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/u_CALC_MAGNITUDE_AND_PHASE_FIXED/reset
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/u_CALC_MAGNITUDE_AND_PHASE_FIXED/clk_enable
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/u_CALC_MAGNITUDE_AND_PHASE_FIXED/i_COMPLEX_VALUE_re
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/u_CALC_MAGNITUDE_AND_PHASE_FIXED/i_COMPLEX_VALUE_im
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/u_CALC_MAGNITUDE_AND_PHASE_FIXED/i_VALID
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/u_CALC_MAGNITUDE_AND_PHASE_FIXED/ce_out
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/u_CALC_MAGNITUDE_AND_PHASE_FIXED/o_PHASE
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/o_PHASE_ref
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/u_CALC_MAGNITUDE_AND_PHASE_FIXED/o_MAGNITUDE
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/o_MAGNITUDE_ref
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/u_CALC_MAGNITUDE_AND_PHASE_FIXED/o_VALID
add wave sim:/CALC_MAGNITUDE_AND_PHASE_FIXED_tb/o_VALID_ref
run -all
