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
	dc.b	$1D
	dc.b	0, 1
	dc.b	$FF

.Anim1:
	dc.b	$3B
	dc.b	0
	dc.b	$FC

.Anim2:
	dc.b	9
	dc.b	4, 4, 5
	dc.b	$FC

.Anim3:
	dc.b	9
	dc.b	2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3
	dc.b	$FC

.Anim4:
	dc.b	9
	dc.b	2, 3
	dc.b	$FF

.Anim5:
	dc.b	9
	dc.b	5, 4, 4, $FC

; ------------------------------------------------------------------------------
