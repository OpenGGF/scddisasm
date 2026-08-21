; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.Anim0-.Anims
	dc.w	.Anim1-.Anims
	dc.w	.Anim2-.Anims
	dc.w	.Anim3-.Anims
	dc.w	.Anim4-.Anims

.Anim0:
	dc.b	$3B
	dc.b	0
	dc.b	$FF

.Anim1:
	dc.b	7
	dc.b	2, 3
	dc.b	$FF

.Anim2:
	dc.b	3
	dc.b	1, 5, 4, 6
	dc.b	$FF

.Anim3:
	dc.b	3
	dc.b	7, 8
	dc.b	$FF

.Anim4:
	dc.b	3
	dc.b	9, $A
	dc.b	$FF

; ------------------------------------------------------------------------------
