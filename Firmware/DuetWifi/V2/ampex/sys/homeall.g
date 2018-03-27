; homeall.g
; called to home all axes

; Relative positioning
G91

; Lift Z
G1 Z15 F2000 S2

; Lower AB currents
M98 P"/macros/print_scripts/xy_current_low.g"

; Course home X or Y
G1 X600 Y600 F2400 S1

; Course home X
G1 X600 S1

; Course home Y
G1 Y600 S1

; Move away from the endstops
G1 X-5 Y-5 F9000

; Fine home X
G1 X600 F360 S1

; Fine home Y
G1 Y600 S1

; Restore high AB currents
M98 P"/macros/print_scripts/xy_current_high.g"

; Absolute positioning
G90

; Activate the z switch
M98 P"/macros/probe_scripts/activate_z_switch.g"

; Go to first bed probe point and home the Z axis
G1 X322.4 Y317.3 F9000
M98 P"/macros/print_scripts/z_current_low.g"
G30 Z-99999
M98 P"/macros/print_scripts/z_current_high.g"

; Raise the gantry
G0 Z5 F2000
