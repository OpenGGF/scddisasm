; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Anims:
	dc.w	.Anim0-.Anims
	dc.w	.Anim1-.Anims
	dc.w	.Anim2-.Anims
	dc.w	.Anim3-.Anims

.Anim0:
	dc.b	3
	dc.b	0, 1
	dc.b	$FF
	even

.Anim1:
	dc.b	3
	dc.b	2, 3, 2, 3
	dc.b	$FC
	even

.Anim2:
	dc.b	1
	dc.b	5, 5, 4, 6
	dc.b	$FC
	even

.Anim3:
	dc.b	$13
	dc.b	6, 7
	dc.b	$FF

; ------------------------------------------------------------------------------
