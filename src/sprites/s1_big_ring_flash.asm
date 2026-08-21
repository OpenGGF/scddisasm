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

.Sprite0:
	dc.b	2
	dc.b	$E0, $F, 0, 0, 0
	dc.b	0, $F, $10, 0, 0

.Sprite1:
	dc.b	4
	dc.b	$E0, $F, 0, $10, $F0
	dc.b	$E0, 7, 0, $20, $10
	dc.b	0, $F, $10, $10, $F0
	dc.b	0, 7, $10, $20, $10

.Sprite2:
	dc.b	4
	dc.b	$E0, $F, 0, $28, $E8
	dc.b	$E0, $B, 0, $38, 8
	dc.b	0, $F, $10, $28, $E8
	dc.b	0, $B, $10, $38, 8

.Sprite3:
	dc.b	4
	dc.b	$E0, $F, 8, $34, $E0
	dc.b	$E0, $F, 0, $34, 0
	dc.b	0, $F, $18, $34, $E0
	dc.b	0, $F, $10, $34, 0

.Sprite4:
	dc.b	4
	dc.b	$E0, $B, 8, $38, $E0
	dc.b	$E0, $F, 8, $28, $F8
	dc.b	0, $B, $18, $38, $E0
	dc.b	0, $F, $18, $28, $F8

.Sprite5:
	dc.b	4
	dc.b	$E0, 7, 8, $20, $E0
	dc.b	$E0, $F, 8, $10, $F0
	dc.b	0, 7, $18, $20, $E0
	dc.b	0, $F, $18, $10, $F0

.Sprite6:
	dc.b	2
	dc.b	$E0, $F, 8, 0, $E0
	dc.b	0, $F, $18, 0, $E0

.Sprite7:
	dc.b	4
	dc.b	$E0, $F, 0, $44, $E0
	dc.b	$E0, $F, 8, $44, 0
	dc.b	0, $F, $10, $44, $E0
	dc.b	0, $F, $18, $44, 0

; ------------------------------------------------------------------------------
