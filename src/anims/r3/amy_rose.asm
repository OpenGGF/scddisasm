; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.Anim0-.Anims
	dc.w	.Anim1-.Anims
	dc.w	.Anim2-.Anims
	dc.w	.Anim3-.Anims

.Anim0:
	dc.b	3
	dc.b	$27, 4, 9, 5, $27, 4, 9
	dc.b	$FF
	even

.Anim1:
	dc.b	0
	dc.b	3, 1, 2, 2, 3, 1, 2
	dc.b	$FF
	even

.Anim2:
	dc.b	6
	dc.b	$D, 7, $D
	dc.b	$FF
	even

.Anim3:
	dc.b	8
	dc.b	$13, 9, 9
	dc.b	$FF

; ------------------------------------------------------------------------------
