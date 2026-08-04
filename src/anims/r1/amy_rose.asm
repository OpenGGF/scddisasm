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

.Anim1:
	dc.b	3
	dc.b	$B, 4, $B, 5, $B, 4, $B
	dc.b	$FF
	dc.b	0

.Anim2:
	dc.b	0
	dc.b	3, 1, 2, 2, 3, 1, 2
	dc.b	$FF
	dc.b	0

.Anim3:
	dc.b	$E
	dc.b	9
	dc.b	$FF
	dc.b	0

.Anim0:
	dc.b	$B
	dc.b	$13, $C, $13
	dc.b	$FF
	dc.b	0

.Anim4:
	dc.b	6
	dc.b	9, 7, 9
	dc.b	$FF
	dc.b	0

.Anim5:
	dc.b	$B
	dc.b	$1D, $C, $1D, $B, $1D, $C, $31
	dc.b	$FF

; ------------------------------------------------------------------------------