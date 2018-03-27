;Heating commands to keep S3D from inserting its own!
;M104 S[extruder0_temperature]

; Disable Bed Compensation
M561

;Lift the Nozzle
M98 P"/macros/print_scripts/start_lift.g"

;Set Extruder and Bed Active Temperatures
G10 P0 R0 S[extruder0_temperature]
M140 S[bed0_temperature]

;Home X and Y and go to preheat position
G32
M98 P"/macros/print_scripts/start_gotopreheat.g"

;Wait for Extruder and Bed to reach target temperatures
M116
M190 S[bed0_temperature]

; Establish final Z offset used for printing
G28 Z

;Print a prime line
M98 P"/macros/print_scripts/start_prime.g"
