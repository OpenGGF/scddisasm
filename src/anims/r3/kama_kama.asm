; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
.Anims:
	dc.w	.Walk-.Anims
	dc.w	.Watch-.Anims
	dc.w	.Throw-.Anims
	dc.w	.Recover-.Anims
	dc.w	.Static-.Anims

.Walk:
	dc.b	7
	dc.b	0, 1, 2, 3
	dc.b	$FF
	even

.Watch:
	dc.b	7
	dc.b	5, 6
	dc.b	$FF
	even

.Throw:
	dc.b	7
	dc.b	0, 4
	dc.b	$FF
	even

.Recover:
	dc.b	7
	dc.b	7, 4
	dc.b	$FF
	even

.Static:
	dc.b	7
	dc.b	0
	dc.b	$FF

; ------------------------------------------------------------------------------
