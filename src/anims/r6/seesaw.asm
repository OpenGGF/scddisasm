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

.Anim0:
	dc.b	2
	dc.b	0, 1
	dc.b	$FF
	even

.Anim1:
	dc.b	2
	dc.b	0, 1, 2, 3
	dc.b	$FF
	even

.Anim2:
	dc.b	2
	dc.b	2, 3
	dc.b	$FF
	even

.Anim3:
	dc.b	2
	dc.b	4, 5
	dc.b	$FF
	even

.Anim4:
	dc.b	2
	dc.b	4, 5, 6, 7
	dc.b	$FF
	even

.Anim5:
	dc.b	2
	dc.b	6, 7
	dc.b	$FF

; ------------------------------------------------------------------------------
