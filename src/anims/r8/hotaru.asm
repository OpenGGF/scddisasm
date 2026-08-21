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
	dc.w	.Anim6-.Anims
	dc.w	.Anim6-.Anims
	dc.w	.Anim9-.Anims

.Anim0:
	dc.b	1
	dc.b	5, 0, 5, 0
	dc.b	$FF
	even

.Anim1:
	dc.b	$FF
	dc.b	4, $A, $A
	dc.b	$FF
	even

.Anim2:
	dc.b	7
	dc.b	$B, $C
	dc.b	$FF
	even

.Anim3:
	dc.b	3
	dc.b	6, $F
	dc.b	$FF
	even

.Anim4:
	dc.b	$FF
	dc.b	4, $A
	dc.b	$FF
	even

.Anim5:
	dc.b	7
	dc.b	4, $A
	dc.b	$FF
	even

.Anim6:
	dc.b	$FF
	dc.b	6, $A
	dc.b	$FF
	even

.Anim9:
	dc.b	$FF
	dc.b	9, $A, $10, $A
	dc.b	$FF

; ------------------------------------------------------------------------------
