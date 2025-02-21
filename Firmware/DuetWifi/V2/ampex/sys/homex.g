; homex.g
; called to home the X axis

; Lower AB currents
M98 P"/macros/print_scripts/xy_current_low.g"

; Move quickly to X axis endstop and stop there (first pass)
G1 X600 F2400 S1

; Go back a few mm
G91
G1 X-5 F9000
G90

; Move slowly to X axis endstop once more (second pass)
G1 X600 F360 S1

; Restore AB currents
M98 P"/macros/print_scripts/xy_current_high.g"
