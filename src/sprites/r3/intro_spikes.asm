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
	dc.w	.SpriteC-.Sprites
	dc.w	.SpriteD-.Sprites
	dc.w	.SpriteE-.Sprites

.Sprite0:
	dc.b	4
	dc.b	$F0, 5, 0, 0, $F0
	dc.b	0, 5, 0, 4, $F0
	dc.b	$F0, 5, 0, 0, 0
	dc.b	0, 5, 0, 4, 0
	even

.Sprite1:
	dc.b	1
	dc.b	$F0, 5, 0, 0, $F0
	even

.Sprite2:
	dc.b	1
	dc.b	0, 5, 0, 4, $F0
	even

.Sprite3:
	dc.b	1
	dc.b	$F0, 5, 0, 0, 0
	even

.Sprite4:
	dc.b	1
	dc.b	0, 5, 0, 4, 0
	even

.Sprite5:
	dc.b	1
	dc.b	$F0, 5, 8, $C, $F0
	even

.Sprite6:
	dc.b	1
	dc.b	0, 5, 8, $C, $F0
	even

.Sprite7:
	dc.b	1
	dc.b	$F0, 5, 8, 8, 0
	even

.Sprite8:
	dc.b	1
	dc.b	0, 5, 8, 8, 0
	even

.Sprite9:
	dc.b	4
	dc.b	$F0, 5, 8, $C, $F0
	dc.b	0, 5, 8, $C, $F0
	dc.b	$F0, 5, 8, 8, 0
	dc.b	0, 5, 8, 8, 0
	even

.SpriteA:
	dc.b	1
	dc.b	$F0, 5, 0, 8, $F0
	even

.SpriteB:
	dc.b	1
	dc.b	0, 5, 0, 8, $F0
	even

.SpriteC:
	dc.b	1
	dc.b	$F0, 5, 0, $C, 0
	even

.SpriteD:
	dc.b	1
	dc.b	0, 5, 0, $C, 0
	even

.SpriteE:
	dc.b	4
	dc.b	$F0, 5, 0, 8, $F0
	dc.b	0, 5, 0, 8, $F0
	dc.b	$F0, 5, 0, $C, 0
	dc.b	0, 5, 0, $C, 0
	even

; ------------------------------------------------------------------------------
