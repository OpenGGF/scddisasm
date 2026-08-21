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
	dc.w	.AnimA-.Anims
	dc.w	.AnimB-.Anims
	dc.w	.AnimC-.Anims
	dc.w	.AnimD-.Anims

.Anim0:
	dc.b	$13
	dc.b	0
	dc.b	$FF

.Anim1:
	dc.b	$13
	dc.b	2, 1, 2, 1, 2, 1, 2, 0
	dc.b	$FF

.Anim2:
	dc.b	9
	dc.b	4, 5, 6
	dc.b	$FF

.Anim3:
	dc.b	9
	dc.b	6
	dc.b	$FF

.Anim4:
	dc.b	1
	dc.b	7, 6, 8, 6
	dc.b	$FF

.Anim5:
	dc.b	1
	dc.b	$A, 9, $B, 9
	dc.b	$FF

.Anim6:
	dc.b	1
	dc.b	$D, $C, $E, $C
	dc.b	$FF

.Anim7:
	dc.b	1
	dc.b	$10, $F, $11, $F
	dc.b	$FF

.Anim8:
	dc.b	$13
	dc.b	$12
	dc.b	$FF

.Anim9:
	dc.b	1
	dc.b	$13, $14
	dc.b	$FF

.AnimA:
	dc.b	1
	dc.b	$15, $C
	dc.b	$FF

.AnimB:
	dc.b	$FE
	dc.b	$16
	dc.b	$FF

.AnimC:
	dc.b	$13
	dc.b	2, 1
	dc.b	$FF

.AnimD:
	dc.b	$FE
	dc.b	$17
	dc.b	$FF

; ------------------------------------------------------------------------------
