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
	dc.b	1
	dc.b	1, 0, 2, 0, 3, 0
	dc.b	$FF
	even

.Anim1:
	dc.b	5
	dc.b	4, 5, 6, 7
	dc.b	$FF
	even

.Anim2:
	dc.b	0
	dc.b	4, 4, 0, 4, 4, 0, 5, 5
	dc.b	0, 5, 5, 0, 6, 6, 0, 6
	dc.b	6, 0, 7, 7, 0, 7, 7, 0
	dc.b	$FF
	even

.Anim3:
	dc.b	0
	dc.b	4, 4, 0, 4, 0, 0, 5, 5
	dc.b	0, 5, 0, 0, 6, 6, 0, 6
	dc.b	0, 0, 7, 7, 0, 7, 0, 0
	dc.b	$FF
	even

.Anim4:
	dc.b	0
	dc.b	4, 0, 0, 4, 0, 0, 5, 0
	dc.b	0, 5, 0, 0, 6, 0, 0, 6
	dc.b	0, 0, 7, 0, 0, 7, 0, 0
	dc.b	$FF
	even

.Anim5:
	dc.b	0
	dc.b	8, 9, $A, $B, $C, $B, $A, 9
	dc.b	8, 0
	dc.b	$FF
	even

.Anim6:
	dc.b	0
	dc.b	8, 8, 0, 8, 8, 0, 9, 9
	dc.b	0, 9, 9, 0, $A, $A, 0, $A
	dc.b	$A, 0, $B, $B, 0, $B, $B, 0
	dc.b	$C, $C, 0, $C, $C, 0, $B, $B
	dc.b	0, $B, $B, 0, $A, $A, 0, $A
	dc.b	$A, 0, 9, 9, 0, 9, 9, 0
	dc.b	8, 8, 0, 8, 8, 0, 0
	dc.b	$FF
	even

.Anim7:
	dc.b	0
	dc.b	8, 8, 0, 8, 0, 0, 9, 9
	dc.b	0, 9, 0, 0, $A, $A, 0, $A
	dc.b	0, 0, $B, $B, 0, $B, 0, 0
	dc.b	$C, $C, 0, $C, 0, 0, $B, $B
	dc.b	0, $B, 0, 0, $A, $A, 0, $A
	dc.b	0, 0, 9, 9, 0, 9, 0, 0
	dc.b	8, 8, 0, 8, 0, 0, 0
	dc.b	$FF
	even

.Anim8:
	dc.b	0
	dc.b	8, 0, 0, 8, 0, 0, 9, 0
	dc.b	0, 9, 0, 0, $A, 0, 0, $A
	dc.b	0, 0, $B, 0, 0, $B, 0, 0
	dc.b	$C, 0, 0, $C, 0, 0, $B, 0
	dc.b	0, $B, 0, 0, $A, 0, 0, $A
	dc.b	0, 0, 9, 0, 0, 9, 0, 0
	dc.b	8, 0, 0, 8, 0, 0, 0
	dc.b	$FF

; ------------------------------------------------------------------------------
