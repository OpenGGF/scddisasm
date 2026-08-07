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
	dc.b	0, 1, 2, 3, 4
	dc.b	$FF

.Anim1:
	dc.b	$FF
	dc.b	4
	dc.b	$FF

.Anim2:
	dc.b	$13
	dc.b	4, 5, 6
	dc.b	$FF

.Anim3:
	dc.b	$FF
	dc.b	6
	dc.b	$FF

.Anim4:
	dc.b	$13
	dc.b	7, 8
	dc.b	$FC

; ------------------------------------------------------------------------------
