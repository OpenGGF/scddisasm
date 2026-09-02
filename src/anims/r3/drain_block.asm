; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.Raise-.Anims
	dc.w	.Lower-.Anims

; Animation records contain a frame delay, frame indices, and an $FC marker
; that advances the object's routine after the final frame.
.Raise:
	dc.b	9
	dc.b	0, 1, 2
	dc.b	$FC

.Lower:
	dc.b	9
	dc.b	2, 1, 0
	dc.b	$FC

; ------------------------------------------------------------------------------
