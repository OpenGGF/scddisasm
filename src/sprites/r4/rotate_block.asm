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
	dc.b	4
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F0, $F, $10, 4, $F0
	dc.b	$D0, $F, 0, 4, $F0
	dc.b	$F0, $F, $18, 4, $D0
	even

.Sprite1:
	dc.b	4
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F0, $F, 0, 4, $F0
	dc.b	$F0, $F, 8, 4, $D0
	dc.b	$10, $F, $10, 4, $F0
	even

.Sprite2:
	dc.b	4
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F0, $F, 8, 4, $F0
	dc.b	$10, $F, $18, 4, $F0
	dc.b	$F0, $F, 0, 4, $10
	even

.Sprite3:
	dc.b	4
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F0, $F, $18, 4, $F0
	dc.b	$F0, $F, $10, 4, $10
	dc.b	$D0, $F, 8, 4, $F0
	even

.Sprite4:
	dc.b	8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F0, 7, 0, $1C, 8
	dc.b	$E0, $F, 0, $24, $E8
	dc.b	0, $F, $10, $24, $E8
	dc.b	$D0, $D, 0, $14, $D8
	dc.b	$E0, $B, 0, $34, $D0
	dc.b	0, $B, $10, $34, $D0
	dc.b	$20, $D, $10, $14, $D8
	even

.Sprite5:
	dc.b	8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$E8, $D, 0, $14, $F0
	dc.b	$F8, $F, 8, $24, $E0
	dc.b	$F8, $F, 0, $24, 0
	dc.b	8, 7, 8, $1C, $D0
	dc.b	8, 7, 0, $1C, $20
	dc.b	$18, $E, 0, $40, $E0
	dc.b	$18, $E, 8, $40, 0
	even

.Sprite6:
	dc.b	8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F0, 7, 8, $1C, $E8
	dc.b	$E0, $F, 8, $24, $F8
	dc.b	0, $F, $18, $24, $F8
	dc.b	$D0, $D, 8, $14, 8
	dc.b	$E0, $B, 8, $34, $18
	dc.b	0, $B, $18, $34, $18
	dc.b	$20, $D, $18, $14, 8
	even

.Sprite7:
	dc.b	8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	8, $D, $10, $14, $F0
	dc.b	$E8, $F, $18, $24, $E0
	dc.b	$E8, $F, $10, $24, 0
	dc.b	$D8, 7, $18, $1C, $D0
	dc.b	$D8, 7, $10, $1C, $20
	dc.b	$D0, $E, $10, $40, $E0
	dc.b	$D0, $E, $18, $40, 0
	even

.Sprite8:
	dc.b	0

; ------------------------------------------------------------------------------
