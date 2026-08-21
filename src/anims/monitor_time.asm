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
	dc.w	.Anim9-.Anims

.Anim0:
	dc.b	1
	dc.b	$10, 0, 0, 8, 0, 0, 9, 0
	dc.b	0
	dc.b	$FF
	even

.Anim1:
	dc.b	1
	dc.b	$10, 1, 1, 8, 1, 1, 9, 1
	dc.b	1
	dc.b	$FF
	even

.Anim2:
	dc.b	1
	dc.b	$10, 2, 2, 8, 2, 2, 9, 2
	dc.b	2
	dc.b	$FF
	even

.Anim3:
	dc.b	1
	dc.b	$10, 3, 3, 8, 3, 3, 9, 3
	dc.b	3
	dc.b	$FF
	even

.Anim4:
	dc.b	1
	dc.b	$10, 4, 4, 8, 4, 4, 9, 4
	dc.b	4
	dc.b	$FF
	even

.Anim5:
	dc.b	1
	dc.b	$10, 5, 5, 8, 5, 5, 9, 5
	dc.b	5
	dc.b	$FF
	even

.Anim6:
	dc.b	1
	dc.b	$10, 6, 6, 8, 6, 6, 9, 6
	dc.b	6
	dc.b	$FF
	even

.Anim7:
	dc.b	1
	dc.b	$10, 7, 7, 8, 7, 7, 9, 7
	dc.b	7
	dc.b	$FF
	even

.Anim8:
	dc.b	1
	dc.b	$A, $E, $F, $E, $B, $E, $F, $E
	dc.b	$FF
	even

.Anim9:
	dc.b	1
	dc.b	$C, $E, $F, $E, $D, $E, $F, $E
	dc.b	$FF

; ------------------------------------------------------------------------------
