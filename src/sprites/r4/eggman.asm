; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite5-.Sprites
	dc.w	.Sprite6-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$E4, $D, 0, $38, $E0
	dc.b	$E4, 5, 0, $40, 0
	even

.Sprite1:
	dc.b	2
	dc.b	$E4, $D, 0, $44, $E0
	dc.b	$E4, 5, 0, $4C, 0
	even

.Sprite2:
	dc.b	2
	dc.b	$E4, $D, 0, $50, $E0
	dc.b	$E4, 5, 0, $58, 0
	even

.Sprite3:
	dc.b	2
	dc.b	$E4, $D, 0, $5C, $E0
	dc.b	$E4, 5, 0, $64, 0
	even

.Sprite4:
	dc.b	2
	dc.b	$E4, $D, 0, $68, $E0
	dc.b	$E4, 5, 0, $70, 0
	even

.Sprite5:
	dc.b	3
	dc.b	$E4, $D, 0, $68, $E0
	dc.b	$E4, 5, 0, $70, 0
	dc.b	$D4, 5, 8, $F2, 4
	even

.Sprite6:
	dc.b	3
	dc.b	$E4, $D, 0, $68, $E0
	dc.b	$E4, 5, 0, $70, 0
	dc.b	$D4, 5, 8, $F6, 4

; ------------------------------------------------------------------------------
