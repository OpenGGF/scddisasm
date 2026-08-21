; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.Anim0-.Anims
	dc.w	.Anim1-.Anims
	dc.w	.Anim2-.Anims
	dc.w	.Anim3-.Anims
	dc.w	.Anim4-.Anims

.Anim0:
	dc.b	9
	dc.b	0, 1, 0, 3, 2, 3
	dc.b	$FF

.Anim1:
	dc.b	7
	dc.b	4, 5
	dc.b	$FF

.Anim2:
	dc.b	$7F
	dc.b	6
	dc.b	$FF

.Anim3:
	dc.b	$7F
	dc.b	7
	dc.b	$FF

.Anim4:
	dc.b	7
	dc.b	8, 9
	dc.b	$FF

; ------------------------------------------------------------------------------
