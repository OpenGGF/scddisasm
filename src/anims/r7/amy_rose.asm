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
	dc.w	.Anim6-.Anims

.Anim1:
	dc.b	3
	dc.b	$B, 4, $B, 5, $B, 4, $B
	dc.b	$FF
	even

.Anim2:
	dc.b	0
	dc.b	3, 1, 2, 2, 3, 1, 2
	dc.b	$FF
	even

.Anim3:
	dc.b	$E
	dc.b	9
	dc.b	$FF
	even

.Anim0:
	dc.b	$B
	dc.b	$13, $C, $13
	dc.b	$FF
	even

.Anim4:
	dc.b	6
	dc.b	9, 7, 9
	dc.b	$FF
	dc.b	0

.Anim5:
	dc.b	$B
	dc.b	$13, $C, $13, $B, $13, $C, $13
	dc.b	$FF
	even

.Anim6:
	dc.b	$11
	dc.b	7, $12, 7, $11, 7, $13, 7
	dc.b	$FF

; ------------------------------------------------------------------------------
