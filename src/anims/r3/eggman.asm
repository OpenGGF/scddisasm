; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.Operating-.Anims
	dc.w	.Reeling-.Anims
	dc.w	.Defeated-.Anims
	dc.w	.FinalPhase-.Anims
	dc.w	.Escape-.Anims

; Animation records contain a frame delay, frame indices, and an $FF loop marker.
.Operating:
	dc.b	9
	dc.b	0, 1, 0, 3, 2, 3
	dc.b	$FF

.Reeling:
	dc.b	7
	dc.b	4, 5
	dc.b	$FF

.Defeated:
	dc.b	$7F
	dc.b	6
	dc.b	$FF

.FinalPhase:
	dc.b	$7F
	dc.b	7
	dc.b	$FF

.Escape:
	dc.b	7
	dc.b	8, 9
	dc.b	$FF

; ------------------------------------------------------------------------------
