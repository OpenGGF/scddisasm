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

.Sprite0:
	dc.b	2
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$FA, 4, 0, $18, $F8

.Sprite1:
	dc.b	2
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$FA, 4, $10, $18, $F8

.Sprite2:
	dc.b	2
	dc.b	$F8, 5, 0, 4, $F8
	dc.b	$FA, 8, 0, $1C, $F4

.Sprite3:
	dc.b	2
	dc.b	$F8, 5, 0, 4, $F8
	dc.b	$FA, 8, 0, $1F, $F4

.Sprite4:
	dc.b	2
	dc.b	$FB, 0, 0, $22, $F6
	dc.b	$F8, 5, 0, 8, $F8

.Sprite5:
	dc.b	2
	dc.b	$FB, 0, $10, $22, $F6
	dc.b	$F8, 5, 0, 8, $F8

.Sprite6:
	dc.b	2
	dc.b	$FA, 8, 0, $1C, $F4
	dc.b	$F8, 5, 0, $C, $F8

.Sprite7:
	dc.b	2
	dc.b	$FA, 8, 0, $1F, $F4
	dc.b	$F8, 5, 0, $C, $F8

.Sprite8:
	dc.b	2
	dc.b	$FA, 4, 0, $18, $F8
	dc.b	$F8, 5, 0, $10, $F8

.Sprite9:
	dc.b	2
	dc.b	$FA, 4, $10, $18, $F8
	dc.b	$F8, 5, 0, $10, $F8

.SpriteA:
	dc.b	2
	dc.b	$FB, 0, 0, $1A, $FF
	dc.b	$F8, 5, 0, $14, $F8

.SpriteB:
	dc.b	2
	dc.b	$FB, 0, 0, $1B, $FF
	dc.b	$F8, 5, 0, $14, $F8

.SpriteC:
	dc.b	0

.SpriteD:
	dc.b	2
	dc.b	$FB, 0, $80, $22, $F6
	dc.b	$F8, 5, $80, 8, $F8

; ------------------------------------------------------------------------------
