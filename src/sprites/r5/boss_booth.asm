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

.Sprite0:
	dc.b	6
	dc.b	$E8, 7, 0, $18, $E0
	dc.b	8, 5, 0, $20, $E0
	dc.b	$E8, 7, 8, $18, $10
	dc.b	8, 5, 8, $20, $10
	dc.b	$18, $F, 0, $24, $E0
	dc.b	$18, $F, 0, $34, 0
	even

.Sprite1:
	dc.b	6
	dc.b	$E8, 7, 0, $18, $E0
	dc.b	8, 5, 0, $20, $E0
	dc.b	$E8, 7, 8, $18, $10
	dc.b	8, 5, 8, $20, $10
	dc.b	$18, $F, 0, $B7, $E0
	dc.b	$18, $F, 0, $C7, 0
	even

.Sprite2:
	dc.b	6
	dc.b	$E8, 7, 0, $18, $E0
	dc.b	8, 5, 0, $20, $E0
	dc.b	$E8, 7, 8, $18, $10
	dc.b	8, 5, 8, $20, $10
	dc.b	$18, $E, 0, $D7, $E0
	dc.b	$18, $E, 0, $E3, 0
	even

.Sprite3:
	dc.b	6
	dc.b	$E8, 7, 0, $18, $E0
	dc.b	8, 5, 0, $20, $E0
	dc.b	$E8, 7, 8, $18, $10
	dc.b	8, 5, 8, $20, $10
	dc.b	$18, $D, 0, $EF, $E0
	dc.b	$18, $D, 0, $F7, 0
	even

.Sprite4:
	dc.b	6
	dc.b	$E8, 7, 0, $18, $E0
	dc.b	8, 5, 0, $20, $E0
	dc.b	$E8, 7, 8, $18, $10
	dc.b	8, 5, 8, $20, $10
	dc.b	$18, $C, 0, $FF, $E0
	dc.b	$18, $C, 1, 3, 0
	even

.Sprite5:
	dc.b	7
	dc.b	$E8, 7, 0, $18, $E0
	dc.b	8, 5, 0, $20, $E0
	dc.b	$E8, 7, 8, $18, $10
	dc.b	8, 5, 8, $20, $10
	dc.b	$18, $C, 0, $FF, $E0
	dc.b	$18, $C, 1, 3, 0
	dc.b	$F4, 9, 0, $54, $E8

; ------------------------------------------------------------------------------
