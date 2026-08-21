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
	dc.w	.AnimE-.Anims
	dc.w	.AnimD-.Anims

.Anim0:
	dc.b	5
	dc.b	0, 1, 2, 3, 4, 9, $D
	dc.b	$FC
	even

.Anim1:
	dc.b	5
	dc.b	0, 1, 2, 3, 4, $C, $12
	dc.b	$FC
	even

.Anim2:
	dc.b	5
	dc.b	0, 1, 2, 3, 4, $C, $11
	dc.b	$FC
	even

.Anim3:
	dc.b	5
	dc.b	0, 1, 2, 3, 4, $B, $10
	dc.b	$FC
	even

.Anim4:
	dc.b	5
	dc.b	0, 1, 2, 3, 4, 9, $F
	dc.b	$FC
	even

.Anim5:
	dc.b	5
	dc.b	0, 1, 2, 3, 4, $A, $E
	dc.b	$FC
	even

.Anim6:
	dc.b	$E
	dc.b	0, 1, 2
	dc.b	$FC
	even

.Anim7:
	dc.b	7
	dc.b	$16, $D, $16, $D, $16, $D
	dc.b	$FC
	even

.Anim8:
	dc.b	7
	dc.b	$16, $12, $16, $12, $16, $12
	dc.b	$FC
	even

.Anim9:
	dc.b	7
	dc.b	$16, $11, $16, $11, $16, $11
	dc.b	$FC
	even

.AnimA:
	dc.b	7
	dc.b	$16, $10, $16, $10, $16, $10
	dc.b	$FC
	even

.AnimB:
	dc.b	7
	dc.b	$16, $F, $16, $F, $16, $F
	dc.b	$FC
	even

.AnimC:
	dc.b	7
	dc.b	$16, $E, $16, $E, $16, $E
	dc.b	$FC
	even

.AnimD:
	dc.b	$E
	dc.b	$FC
	even

.AnimE:
	dc.b	$E
	dc.b	1, 2, 3, 4
	dc.b	$FC

; ------------------------------------------------------------------------------
