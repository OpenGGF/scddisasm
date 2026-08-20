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
	dc.w	.Sprite0-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$F8, 5, 0, 0, $F0
	dc.b	$F8, 5, 8, 0, 0

.Sprite1:
	dc.b	3
	dc.b	$F4, 8, 0, 4, $F0
	dc.b	$FC, $C, 0, 7, $F0
	dc.b	4, 8, 0, $B, $F8

.Sprite2:
	dc.b	3
	dc.b	$F0, 4, 0, $E, $F4
	dc.b	$F8, 9, 0, $10, $F4
	dc.b	8, 4, 0, $16, $FC

.Sprite3:
	dc.b	3
	dc.b	$F0, 4, 0, $18, $F8
	dc.b	$F8, 5, 0, $1A, $F8
	dc.b	8, 4, $10, $18, $F8

.Sprite4:
	dc.b	3
	dc.b	$F0, 4, 8, $E, $FC
	dc.b	$F8, 9, 8, $10, $F4
	dc.b	8, 4, 8, $16, $F4

.Sprite5:
	dc.b	3
	dc.b	$F4, 8, 8, 4, $F8
	dc.b	$FC, $C, 8, 7, $F0
	dc.b	4, 8, 8, $B, $F0

; ------------------------------------------------------------------------------
