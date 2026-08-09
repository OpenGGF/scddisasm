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
	dc.b	$A
	dc.b	$E0, 5, 0, $C, $F0
	dc.b	$E0, 5, 0, $18, 0
	dc.b	$F0, 5, 0, $10, $F0
	dc.b	$F0, 5, 0, $18, 0
	dc.b	0, 5, 0, $14, $F0
	dc.b	0, 5, 0, $18, 0
	dc.b	$10, 5, $10, $C, $F0
	dc.b	$10, 5, 0, $18, 0
	dc.b	$18, $E, $10, 0, $F0
	dc.b	$D0, $E, 0, 0, $F0

.Sprite1:
	dc.b	1
	dc.b	$F4, $E, 0, 0, $F0

.Sprite2:
	dc.b	1
	dc.b	$F8, 5, 0, $C, $F8

.Sprite3:
	dc.b	1
	dc.b	$F8, 5, 0, $10, $F8

.Sprite4:
	dc.b	1
	dc.b	$F8, 5, 0, $14, $F8

.Sprite5:
	dc.b	1
	dc.b	$F8, 5, 0, $18, $F8

.Sprite6:
	dc.b	1
	dc.b	$F4, $E, $10, 0, $F0

.Sprite7:
	dc.b	1
	dc.b	$F8, 5, $10, $C, $F8

; ------------------------------------------------------------------------------
