; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.SpinPrimary-.Anims
	dc.w	.SpinAlternate-.Anims

; Animation records contain a frame delay, frame indices, and an $FF loop marker.
.SpinPrimary:
	dc.b	2
	dc.b	0, 2, 1
	dc.b	$FF

.SpinAlternate:
	dc.b	2
	dc.b	0, 1, 2
	dc.b	$FF

; ------------------------------------------------------------------------------
