onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/rst_n
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/ld
add wave -noupdate /testbench/clr
add wave -noupdate /testbench/inc
add wave -noupdate /testbench/dec
add wave -noupdate /testbench/shr
add wave -noupdate /testbench/shl
add wave -noupdate /testbench/input_carry
add wave -noupdate /testbench/data_in
add wave -noupdate /testbench/data_out
add wave -noupdate /testbench/output_carry
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {200 ps}