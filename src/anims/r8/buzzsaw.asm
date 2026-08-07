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
	dc.w	.Anim7-.Anims
	dc.w	.Anim8-.Anims
	dc.w	.Anim8-.Anims

.Anim0:
	dc.b	1
	dc.b	0, 1
	dc.b	$FF
	even

.Anim1:
	dc.b	1
	dc.b	2, 3
	dc.b	$FF
	even

.Anim2:
	dc.b	1
	dc.b	4, 5
	dc.b	$FF
	even

.Anim3:
	dc.b	1
	dc.b	6, 7
	dc.b	$FF
	even

.Anim4:
	dc.b	1
	dc.b	8, 9
	dc.b	$FF
	even

.Anim5:
	dc.b	1
	dc.b	$A, $B
	dc.b	$FF
	even

.Anim6:
	dc.b	1
	dc.b	$C, $D
	dc.b	$FF
	even

.Anim7:
	dc.b	1
	dc.b	$E, $F
	dc.b	$FF
	even

.Anim8:
	dc.b	1
	dc.b	$10, $11
	dc.b	$FF

; ------------------------------------------------------------------------------
