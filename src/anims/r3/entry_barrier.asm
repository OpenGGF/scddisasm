; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.Stationary-.Anims
	dc.w	.Transition-.Anims

; Animation records contain a frame delay, frame indices, and an $FF loop marker.
.Stationary:
	dc.b	$7F
	dc.b	0
	dc.b	$FF

.Transition:
	dc.b	0
	dc.b	0, 1
	dc.b	$FF

; ------------------------------------------------------------------------------
