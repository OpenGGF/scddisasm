; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.Anim0-.Anims
	dc.w	.Anim1-.Anims
	dc.w	.Anim2-.Anims
	dc.w	.Anim3-.Anims
	dc.w	.Anim4-.Anims
	dc.w	.Anim5-.Anims

.Anim0:
	dc.b	$FF
	dc.b	2
	dc.b	$FF

.Anim1:
	dc.b	3
	dc.b	5, 6, 5, 7
	dc.b	$FF

.Anim2:
	dc.b	$F
	dc.b	8, 0, 1, 2
	dc.b	$FF

.Anim3:
	dc.b	$FF
	dc.b	4
	dc.b	$FF

.Anim4:
	dc.b	7
	dc.b	2, 3
	dc.b	$FF

.Anim5:
	dc.b	$FF
	dc.b	8
	dc.b	$FF

; ------------------------------------------------------------------------------
