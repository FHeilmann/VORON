; Select inductive Probe PL-08N

; P4:       connected to Zmin SIG and GND
; I1:       P4 expects NC, PL-08N is NO
; T9000:    Move to probe points at 150mm/s
; F300:     Probing Speed: 5mm/s
; H6:       Dive height: 6mm
; A5 S0.01: Perform up to 5 touches until change is below 0.01mm

M558 P4 I1 T9000 F300 H6 A5 S0.01 
