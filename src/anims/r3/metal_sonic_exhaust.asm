; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

; One standard object-animation script. The first byte is the frame duration;
; $FF restarts the four-frame exhaust flicker.
.Table:
	dc.w	.Flicker-.Table

.Flicker:
	dc.b	1
	dc.b	$C, $E, $D, $E
	dc.b	$FF

; ------------------------------------------------------------------------------
