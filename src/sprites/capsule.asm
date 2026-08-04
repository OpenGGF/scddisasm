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
	dc.w	.Sprite7-.Sprites
	dc.w	.Sprite8-.Sprites

.Sprite0:
	dc.b	$C
	dc.b	$E0, 1, 0, 0, $F8
	dc.b	$E0, 1, 8, 0, 0
	dc.b	$F0, 8, 0, 2, $E8
	dc.b	$F0, 8, 0, 5, 0
	dc.b	$F8, $D, 0, 8, $E0
	dc.b	$F8, $D, 0, $10, 0
	dc.b	8, $D, 0, $18, $E0
	dc.b	8, $D, 8, $18, 0
	dc.b	$18, $C, 0, $20, $E0
	dc.b	$18, $C, 8, $20, 0
	dc.b	$20, 7, 0, $54, $F0
	dc.b	$20, 7, 8, $54, 0
	dc.b	0

.Sprite1:
	dc.b	$C
	dc.b	$E0, 1, 0, $24, $F8
	dc.b	$E0, 1, 8, $24, 0
	dc.b	$F0, 8, 0, $26, $E8
	dc.b	$F0, 8, 0, $29, 0
	dc.b	$F8, $D, 0, $2C, $E0
	dc.b	$F8, $D, 0, $34, 0
	dc.b	8, $D, 0, $3C, $E0
	dc.b	8, $D, 8, $3C, 0
	dc.b	$18, $C, 0, $20, $E0
	dc.b	$18, $C, 8, $20, 0
	dc.b	$20, 7, 0, $54, $F0
	dc.b	$20, 7, 8, $54, 0
	dc.b	0

.Sprite2:
	dc.b	6
	dc.b	8, $D, 0, $44, $E0
	dc.b	8, $D, 0, $4C, 0
	dc.b	$18, $C, 0, $20, $E0
	dc.b	$18, $C, 8, $20, 0
	dc.b	$20, 7, 0, $54, $F0
	dc.b	$20, 7, 8, $54, 0
	dc.b	0

.Sprite3:
	dc.b	1
	dc.b	$F8, 5, 0, $5C, $F8

.Sprite4:
	dc.b	1
	dc.b	$F8, 5, 0, $60, $F8

.Sprite5:
	dc.b	1
	dc.b	$F8, 5, 0, $64, $F8

.Sprite6:
	dc.b	1
	dc.b	$F8, 5, 8, $64, $F8

.Sprite7:
	dc.b	1
	dc.b	$F8, 5, 8, $60, $F8

.Sprite8:
	dc.b	1
	dc.b	$F8, 5, 8, $5C, $F8

; ------------------------------------------------------------------------------
