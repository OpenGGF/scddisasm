; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.PressFromAbove-.Anims
	dc.w	.PressFromBelow-.Anims

; Animation records contain a frame delay, frame indices, and an $FF loop marker.
.PressFromAbove:
	dc.b	3
	dc.b	1, 2, 3, 0
	dc.b	$FF
	even

.PressFromBelow:
	dc.b	3
	dc.b	3, 2, 1, 0
	dc.b	$FF

; ------------------------------------------------------------------------------
