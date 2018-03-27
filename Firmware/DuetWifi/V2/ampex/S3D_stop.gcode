; turn off extruder
G10 P0 S0 

; turn off bed
M140 S0 

; turn off all fans
M106 P0 S0 
M106 P2 S0

; Lift Z 5 mm
G91
G0 Z+5
G90

; Go to front left position
G0 X5 Y5 F9000

; disable motors
M84 