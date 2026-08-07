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

.Anim0:
	dc.b	$F
	dc.b	4, 5, 6, 7, 8, 9, $A, $B
	dc.b	$A, $B, 0, 1, 2, 3, 4, 5
	dc.b	$FF
	even

.Anim1:
	dc.b	0
	dc.b	4, $C, 4, $C, 4, $C, 4, $C
	dc.b	4, $C, 4, $C, 4, $C, 4, $C
	dc.b	5, $C, 5, $C, 5, $C, 5, $C
	dc.b	5, $C, 5, $C, 5, $C, 5, $C
	dc.b	4, $C, 4, $C, 4, $C, 4, $C
	dc.b	4, $C, 4, $C, 4, $C, 4, $C
	dc.b	5, $C, 5, $C, 5, $C, 5, $C
	dc.b	5, $C, 5, $C, 5, $C, 5, $C
	dc.b	6, $C, 6, $C, 6, $C, 6, $C
	dc.b	6, $C, 6, $C, 6, $C, 6, $C
	dc.b	7, $C, 7, $C, 7, $C, 7, $C
	dc.b	7, $C, 7, $C, 7, $C, 7, $C
	dc.b	8, $C, 8, $C, 8, $C, 8, $C
	dc.b	8, $C, 8, $C, 8, $C, 8, $C
	dc.b	9, $C, 9, $C, 9, $C, 9, $C
	dc.b	9, $C, 9, $C, 9, $C, 9, $C
	dc.b	$A, $C, $A, $C, $A, $C, $A, $C
	dc.b	$A, $C, $A, $C, $A, $C, $A, $C
	dc.b	$B, $C, $B, $C, $B, $C, $B, $C
	dc.b	$B, $C, $B, $C, $B, $C, $B, $C
	dc.b	$A, $C, $A, $C, $A, $C, $A, $C
	dc.b	$A, $C, $A, $C, $A, $C, $A, $C
	dc.b	$B, $C, $B, $C, $B, $C, $B, $C
	dc.b	$B, $C, $B, $C, $B, $C, $B, $C
	dc.b	0, $C, 0, $C, 0, $C, 0, $C
	dc.b	0, $C, 0, $C, 0, $C, 0, $C
	dc.b	1, $C, 1, $C, 1, $C, 1, $C
	dc.b	1, $C, 1, $C, 1, $C, 1, $C
	dc.b	2, $C, 2, $C, 2, $C, 2, $C
	dc.b	2, $C, 2, $C, 2, $C, 2, $C
	dc.b	3, $C, 3, $C, 3, $C, 3, $C
	dc.b	3, $C, 3, $C, 3, $C, 3, $C
	dc.b	$FF
	even

.Anim2:
	dc.b	0
	dc.b	2, $C, $C, $C, 2, $C, $C, $C
	dc.b	2, $C, $C, $C, 2, $C, $C, $C
	dc.b	3, $C, $C, $C, 3, $C, $C, $C
	dc.b	3, $C, $C, $C, 3, $C, $C, $C
	dc.b	4, $C, $C, $C, 4, $C, $C, $C
	dc.b	4, $C, $C, $C, 4, $C, $C, $C
	dc.b	5, $C, $C, $C, 5, $C, $C, $C
	dc.b	5, $C, $C, $C, 5, $C, $C, $C
	dc.b	4, $C, $C, $C, 4, $C, $C, $C
	dc.b	4, $C, $C, $C, 4, $C, $C, $C
	dc.b	5, $C, $C, $C, 5, $C, $C, $C
	dc.b	5, $C, $C, $C, 5, $C, $C, $C
	dc.b	6, $C, $C, $C, 6, $C, $C, $C
	dc.b	6, $C, $C, $C, 6, $C, $C, $C
	dc.b	7, $C, $C, $C, 7, $C, $C, $C
	dc.b	7, $C, $C, $C, 7, $C, $C, $C
	dc.b	8, $C, $C, $C, 8, $C, $C, $C
	dc.b	8, $C, $C, $C, 8, $C, $C, $C
	dc.b	9, $C, $C, $C, 9, $C, $C, $C
	dc.b	9, $C, $C, $C, 9, $C, $C, $C
	dc.b	$A, $C, $C, $C, $A, $C, $C, $C
	dc.b	$A, $C, $C, $C, $A, $C, $C, $C
	dc.b	$B, $C, $C, $C, $B, $C, $C, $C
	dc.b	$B, $C, $C, $C, $B, $C, $C, $C
	dc.b	$A, $C, $C, $C, $A, $C, $C, $C
	dc.b	$A, $C, $C, $C, $A, $C, $C, $C
	dc.b	$B, $C, $C, $C, $B, $C, $C, $C
	dc.b	$B, $C, $C, $C, $B, $C, $C, $C
	dc.b	0, $C, $C, $C, 0, $C, $C, $C
	dc.b	0, $C, $C, $C, 0, $C, $C, $C
	dc.b	1, $C, $C, $C, 1, $C, $C, $C
	dc.b	1, $C, $C, $C, 1, $C, $C, $C
	dc.b	$FF
	even

.Anim3:
	dc.b	0
	dc.b	0, $C, $C, $C, $C, $C, $C, $C
	dc.b	0, $C, $C, $C, $C, $C, $C, $C
	dc.b	1, $C, $C, $C, $C, $C, $C, $C
	dc.b	1, $C, $C, $C, $C, $C, $C, $C
	dc.b	2, $C, $C, $C, $C, $C, $C, $C
	dc.b	2, $C, $C, $C, $C, $C, $C, $C
	dc.b	3, $C, $C, $C, $C, $C, $C, $C
	dc.b	3, $C, $C, $C, $C, $C, $C, $C
	dc.b	4, $C, $C, $C, $C, $C, $C, $C
	dc.b	4, $C, $C, $C, $C, $C, $C, $C
	dc.b	5, $C, $C, $C, $C, $C, $C, $C
	dc.b	5, $C, $C, $C, $C, $C, $C, $C
	dc.b	4, $C, $C, $C, $C, $C, $C, $C
	dc.b	4, $C, $C, $C, $C, $C, $C, $C
	dc.b	5, $C, $C, $C, $C, $C, $C, $C
	dc.b	5, $C, $C, $C, $C, $C, $C, $C
	dc.b	6, $C, $C, $C, $C, $C, $C, $C
	dc.b	6, $C, $C, $C, $C, $C, $C, $C
	dc.b	7, $C, $C, $C, $C, $C, $C, $C
	dc.b	7, $C, $C, $C, $C, $C, $C, $C
	dc.b	8, $C, $C, $C, $C, $C, $C, $C
	dc.b	8, $C, $C, $C, $C, $C, $C, $C
	dc.b	9, $C, $C, $C, $C, $C, $C, $C
	dc.b	9, $C, $C, $C, $C, $C, $C, $C
	dc.b	$A, $C, $C, $C, $C, $C, $C, $C
	dc.b	$A, $C, $C, $C, $C, $C, $C, $C
	dc.b	$B, $C, $C, $C, $C, $C, $C, $C
	dc.b	$B, $C, $C, $C, $C, $C, $C, $C
	dc.b	$A, $C, $C, $C, $C, $C, $C, $C
	dc.b	$A, $C, $C, $C, $C, $C, $C, $C
	dc.b	$B, $C, $C, $C, $C, $C, $C, $C
	dc.b	$B, $C, $C, $C, $C, $C, $C, $C
	dc.b	$FF
	even

.Anim4:
	dc.b	7
	dc.b	4, 5, 6, 7, 8, 9, $A, $B
	dc.b	$A, $B, 0, 1, 2, 3, 4, 5
	dc.b	$FF
	even

.Anim5:
	dc.b	0
	dc.b	5, $C, 5, $C, 5, $C, 5, $C
	dc.b	4, $C, 4, $C, 4, $C, 4, $C
	dc.b	5, $C, 5, $C, 5, $C, 5, $C
	dc.b	6, $C, 6, $C, 6, $C, 6, $C
	dc.b	7, $C, 7, $C, 7, $C, 7, $C
	dc.b	8, $C, 8, $C, 8, $C, 8, $C
	dc.b	9, $C, 9, $C, 9, $C, 9, $C
	dc.b	$A, $C, $A, $C, $A, $C, $A, $C
	dc.b	$B, $C, $B, $C, $B, $C, $B, $C
	dc.b	$A, $C, $A, $C, $A, $C, $A, $C
	dc.b	$B, $C, $B, $C, $B, $C, $B, $C
	dc.b	0, $C, 0, $C, 0, $C, 0, $C
	dc.b	1, $C, 1, $C, 1, $C, 1, $C
	dc.b	2, $C, 2, $C, 2, $C, 2, $C
	dc.b	3, $C, 3, $C, 3, $C, 3, $C
	dc.b	4, $C, 4, $C, 4, $C, 4, $C
	dc.b	$FF
	even

.Anim6:
	dc.b	0
	dc.b	4, $C, $C, $C, 4, $C, $C, $C
	dc.b	5, $C, $C, $C, 5, $C, $C, $C
	dc.b	4, $C, $C, $C, 4, $C, $C, $C
	dc.b	5, $C, $C, $C, 5, $C, $C, $C
	dc.b	6, $C, $C, $C, 6, $C, $C, $C
	dc.b	7, $C, $C, $C, 7, $C, $C, $C
	dc.b	8, $C, $C, $C, 8, $C, $C, $C
	dc.b	9, $C, $C, $C, 9, $C, $C, $C
	dc.b	$A, $C, $C, $C, $A, $C, $C, $C
	dc.b	$B, $C, $C, $C, $B, $C, $C, $C
	dc.b	$A, $C, $C, $C, $A, $C, $C, $C
	dc.b	$B, $C, $C, $C, $B, $C, $C, $C
	dc.b	0, $C, $C, $C, 0, $C, $C, $C
	dc.b	1, $C, $C, $C, 1, $C, $C, $C
	dc.b	2, $C, $C, $C, 2, $C, $C, $C
	dc.b	3, $C, $C, $C, 3, $C, $C, $C
	dc.b	$FF
	even

.Anim7:
	dc.b	0
	dc.b	3, $C, $C, $C, $C, $C, $C, $C
	dc.b	4, $C, $C, $C, $C, $C, $C, $C
	dc.b	5, $C, $C, $C, $C, $C, $C, $C
	dc.b	4, $C, $C, $C, $C, $C, $C, $C
	dc.b	5, $C, $C, $C, $C, $C, $C, $C
	dc.b	6, $C, $C, $C, $C, $C, $C, $C
	dc.b	7, $C, $C, $C, $C, $C, $C, $C
	dc.b	8, $C, $C, $C, $C, $C, $C, $C
	dc.b	9, $C, $C, $C, $C, $C, $C, $C
	dc.b	$A, $C, $C, $C, $C, $C, $C, $C
	dc.b	$B, $C, $C, $C, $C, $C, $C, $C
	dc.b	$A, $C, $C, $C, $C, $C, $C, $C
	dc.b	$B, $C, $C, $C, $C, $C, $C, $C
	dc.b	0, $C, $C, $C, $C, $C, $C, $C
	dc.b	1, $C, $C, $C, $C, $C, $C, $C
	dc.b	2, $C, $C, $C, $C, $C, $C, $C
	dc.b	$FF
	even

.Anim8:
	dc.b	0
	dc.b	$D, $C
	dc.b	$FF

; ------------------------------------------------------------------------------
