; bed.g
; called to perform automatic bed compensation via G32


; Clear any bed transform
M561

; Home all axes
G28

; Activate the z probe and lower the z motor currents
M98 P"/macros/probe_scripts/activate_z_probe.g"
M98 P"/macros/print_scripts/z_current_low.g"

; Probe the bed at 4 points
G30 P0 X275 Y275 H0 Z-99999
G30 P1 X275 Y70 H0 Z-99999 
G30 P2 X50 Y70 H0 Z-99999
G30 P3 X50 Y275 H0 Z-99999 S4

; Repeat right away for more precision
G30 P0 X275 Y275 H0 Z-99999
G30 P1 X275 Y70 H0 Z-99999 
G30 P2 X50 Y70 H0 Z-99999
G30 P3 X50 Y275 H0 Z-99999 S4

; Restore high current and select z switch
M98 P"/macros/print_scripts/z_current_high.g"
M98 P"/macros/probe_scripts/activate_z_switch.g"