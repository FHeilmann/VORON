; Select mechanic plunger switch

; P5:       connected to Probe Port SIG and GND
; (I0:)     P5 expects NC, switch is wired NC
; T3000:    Move to probe points at 50mm/s
; F300:     Probing Speed: 5mm/s
; H3:       Dive height: 3mm
; A5 S0.01: Perform up to 5 touches until change is below 0.01mm

M558 P5 F300 H3 T3000 A5 S0.01

