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
	dc.w	.Sprite9-.Sprites
	dc.w	.SpriteA-.Sprites
	dc.w	.SpriteB-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$F8, $D, 0, 0, $E0
	dc.b	$F8, $D, 8, 0, 0
	even

.Sprite1:
	dc.b	4
	dc.b	$E0, $D, 0, 8, $F0
	dc.b	$F0, $D, 0, 8, $F0
	dc.b	0, $E, 0, $10, $F0
	dc.b	$18, 4, 0, $1C, $F8
	even

.Sprite2:
	dc.b	4
	dc.b	$D8, $D, 0, 8, $F0
	dc.b	$E8, $D, 0, 8, $F0
	dc.b	$F8, $E, 0, $10, $F0
	dc.b	$10, 4, 0, $1C, $F8
	even

.Sprite3:
	dc.b	2
	dc.b	$E0, $E, 0, $10, $F0
	dc.b	$F8, 4, 0, $1C, $F8
	even

.Sprite4:
	dc.b	4
	dc.b	$E0, $D, 8, 8, $F0
	dc.b	$F0, $D, 8, 8, $F0
	dc.b	0, $E, 8, $10, $F0
	dc.b	$18, 4, 8, $1C, $F8
	even

.Sprite5:
	dc.b	4
	dc.b	$D8, $D, 8, 8, $F0
	dc.b	$E8, $D, 8, 8, $F0
	dc.b	$F8, $E, 8, $10, $F0
	dc.b	$10, 4, 8, $1C, $F8
	even

.Sprite6:
	dc.b	2
	dc.b	$E0, $E, 8, $10, $F0
	dc.b	$F8, 4, 8, $1C, $F8
	even

.Sprite7:
	dc.b	$FF
	even

.Sprite8:
	dc.b	4
	dc.b	$E8, $F, 0, 0, $E8
	dc.b	$E8, 7, 0, $10, 8
	dc.b	8, $D, 0, $18, $E8
	dc.b	8, 5, 0, $20, 8
	even

.Sprite9:
	dc.b	1
	dc.b	$F4, 6, 0, $24, $F8
	even

.SpriteA:
	dc.b	1
	dc.b	$F8, 5, 0, $2A, $F8
	even

.SpriteB:
	dc.b	1
	dc.b	$FC, 0, 0, $2E, $FC

; ------------------------------------------------------------------------------
