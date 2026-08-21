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
	dc.b	4
	dc.b	0, 0, 1, 1, 0, 2, 3, 3
	dc.b	2, 2, 1, 1, 0, 0, 1, 3
	dc.b	2, 2, 3, 3
	dc.b	$FF

.Anim1:
	dc.b	4
	dc.b	6, 4, 7, 5
	dc.b	$FF

.Anim2:
	dc.b	$FF
	dc.b	8
	dc.b	$FF

.Anim3:
	dc.b	$14
	dc.b	9, $A
	dc.b	$FF

.Anim4:
	dc.b	2
	dc.b	$B, $E, $D, $10, $C, $F, $D, $10
	dc.b	$FF

; ------------------------------------------------------------------------------
