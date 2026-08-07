; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.Anim0-.Anims
	dc.w	.Anim1-.Anims
	dc.w	.Anim2-.Anims
	dc.w	.Anim3-.Anims
	dc.w	.Anim3-.Anims
	dc.w	.Anim5-.Anims
	dc.w	.Anim6-.Anims

.Anim0:
	dc.b	$E
	dc.b	0, 1, 2
	dc.b	$FC
	even

.Anim1:
	dc.b	$E
	dc.b	1, 2, 3, 4
	dc.b	$FC
	even

.Anim2:
	dc.b	$E
	dc.b	2, 3, 4, 5, 6
	dc.b	$FC
	even

.Anim3:
	dc.b	4
	dc.b	$FC
	even

.Anim5:
	dc.b	4
	dc.b	6, 7, 8
	dc.b	$FC
	even

.Anim6:
	dc.b	$F
	dc.b	$13, $14, $15
	dc.b	$FF

; ------------------------------------------------------------------------------
