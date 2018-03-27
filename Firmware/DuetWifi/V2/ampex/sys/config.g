; Configuration file for Duet WiFi (firmware version 1.20 or newer)
; executed by the firmware on start-up

; General preferences
M111 S0 ; Debugging off
G21     ; Work in millimetres
G90     ; Send absolute coordinates...
M83     ; ...but relative extruder moves
M555 P2 ; Set firmware compatibility to look like Marlin

; General setup
M667 S1                ; Select CoreXY mode
M208 X0 Y0 Z0 S1       ; Set axis minima
M208 X325 Y325 Z300 S0 ; Set axis maxima

; Endstops
M574 X2 Y2 S0 ; Set active low for x and y
M574 Z2 S1    ; Set active high for z

; Zprobe
M98 P"/macros/probe_scripts/activate_z_switch.g" ; activate the Z switch (Type 5)
G31 T7 P500 Y20 Z1.112                           ; Set parameters for inductive Probe (Type 7, NC connected to Z endstop GND and SIG)
G31 T5 P500 Y0 Z1.72 							 ; Set parameters for z switch        (Type 5, NC connected to probe port GND and SIG)


; Drive directions
M569 P0 S0 ; Extruder goes forward
M569 P1 S0 ; Z1 goes forward (FRONT_LEFT)
M569 P2 S1 ; Z2 goes backward (BACK_LEFT)
M569 P3 S0 ; A goes forward
M569 P4 S0 ; B goes forward
M569 P5 S1 ; Z3 goes backward (BACK_RIGHT)
M569 P6 S0 ; Z4 goes forward (BACK_LEFT)

; Motor mapping and steps per mm
M584 X3 Y4 Z1:2:5:6 E0
M350 X16 Y16 Z16 E16 I1 ; Configure 16x microstepping with interpolation
M92 X160 Y160 Z160 E317 ; Set steps per mm (0.9deg on A and B, 1.8deg with 2:1 reduction on Z MK8 with 2:1 reduction on E)

; Accelerations and speed
M566 X900 Y900 Z60 E1600        ; Set maximum instantaneous speed changes (mm/min) (15mm/s for XY, 1mm/s for Z, 26.6mm/s for E)
M203 X18000 Y18000 Z6000 E12000 ; Set maximum speeds (mm/min)  (3000mm/s for XY, 100 mm/s for Z, 200 mm/s for E)
M201 X2000 Y2000 Z250 E1800     ; Set maximum accelerations (mm/s^2) 
M204 P1500 T2000                ; Set printing acceleration and travel accelerations

; Firmware retract
M207 S4 F9000 T6000 Z0.5 		; Set Firmware Retraction

; Drive currents
M98 P"/macros/print_scripts/xy_current_high.g"	; XY (AB) currents high
M98 P"/macros/print_scripts/z_current_high.g"   ; Z currents high
M906 E1000                                      ; E current
M84 S30                                         ; Set idle timeout

; Bed Heater
M305 P0 T100000 B4085 C0 R4700 ; Set thermistor + ADC parameters for heater 0
M143 H0 S120                   ; Set temperature limit for bed heater to 120C

; Hotend 0 heater
M305 P1 T100000 B4725 C7.060000e-8 R4700 ; Set thermistor + ADC parameters for heater 1
M143 H1 S300                             ; Set temperature limit for heater 1 to 300C


; Tools
M563 P0 D0 H1   ; Define tool 0
G10 P0 X0 Y0 Z0 ; Set tool 0 axis offsets
G10 P0 R0 S0    ; Set initial tool 0 active and standby temperatures to 0C

; Network
M550 PVoron V2.010 ; Set machine name
M552 S1            ; Enable network
M586 P0 S1         ; Enable HTTP
M586 P1 S0         ; Disable FTP
M586 P2 S0         ; Disable Telnet

; Fans
M106 P0 S0 I0 F100 H-1   ; Part cooling fan 100 hz, no thermostatic control
M106 P3 S1 I0 F20 H1 T45 ; Hotend fan, 20 Hz, turns on if temperature sensor 1 reaches 45 degrees

; Bed
M671 X385:385:-60:-60 Y-39:364:364:-39 S20 ; define z belt locations (Front_Left, Back_Left, Back_Right, Front_Right)
M557 X10:290 Y10:290 S40                   ; Define mesh grid (not really needed since we don't use compensation

; Pressure advance
;M572 D0 S0.3

M501  ; load config-override.g
T0    ; select tool 0