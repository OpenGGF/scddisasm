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
	dc.b	2
	dc.b	5, $D
	dc.b	$FF

.Anim1:
	dc.b	2
	dc.b	6, $E
	dc.b	$FF

.Anim2:
	dc.b	2
	dc.b	7, $F
	dc.b	$FF

.Anim3:
	dc.b	2
	dc.b	8, $10
	dc.b	$FF

.Anim4:
	dc.b	2
	dc.b	9, $11
	dc.b	$FF

.Anim5:
	dc.b	2
	dc.b	$A, $12
	dc.b	$FF

.Anim6:
	dc.b	2
	dc.b	$B, $13
	dc.b	$FF

.Anim7:
	dc.b	2
	dc.b	$C, $14
	dc.b	$FF

.Anim8:
	dc.b	2
	dc.b	3, 4
	dc.b	$FF

; ------------------------------------------------------------------------------
