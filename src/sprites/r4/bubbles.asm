; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite6-.Sprites
	dc.w	.Sprite7-.Sprites
	dc.w	.Sprite7-.Sprites
	dc.w	.Sprite9-.Sprites
	dc.w	.SpriteA-.Sprites
	dc.w	.SpriteB-.Sprites
	dc.w	.SpriteC-.Sprites
	dc.w	.SpriteD-.Sprites
	dc.w	.SpriteE-.Sprites
	dc.w	.SpriteF-.Sprites
	dc.w	.Sprite10-.Sprites
	dc.w	.Sprite11-.Sprites
	dc.w	.Sprite12-.Sprites
	dc.w	.Sprite13-.Sprites
	dc.w	.Sprite14-.Sprites
	dc.w	.Sprite15-.Sprites
	dc.w	.Sprite16-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$FC, 0, 0, $C, $FC
	even

.Sprite1:
	dc.b	1
	dc.b	$FC, 0, 0, $D, $FC
	even

.Sprite2:
	dc.b	1
	dc.b	$FC, 0, 0, $E, $FC
	even

.Sprite3:
	dc.b	1
	dc.b	$F8, 5, 0, $F, $F8
	even

.Sprite4:
	dc.b	1
	dc.b	$F8, 5, 0, $13, $F8
	even

.Sprite6:
	dc.b	1
	dc.b	$F0, $F, 0, $17, $F0
	even

.Sprite7:
	dc.b	4
	dc.b	$F0, 5, 0, $27, $F0
	dc.b	$F0, 5, 8, $27, 0
	dc.b	0, 5, $10, $27, $F0
	dc.b	0, 5, $18, $27, 0
	even

.Sprite9:
	dc.b	1
	dc.b	$F4, 6, 0, $2B, $F8
	even

.SpriteA:
	dc.b	1
	dc.b	$F4, 6, 0, $31, $F8
	even

.SpriteB:
	dc.b	1
	dc.b	$F4, 6, 0, $37, $F8
	even

.SpriteC:
	dc.b	1
	dc.b	$F4, 6, 0, $3D, $F8
	even

.SpriteD:
	dc.b	1
	dc.b	$F4, 6, 0, $43, $F8
	even

.SpriteE:
	dc.b	1
	dc.b	$F4, 6, 0, $61, $F8
	even

.SpriteF:
	dc.b	1
	dc.b	$F4, 6, 0, $5B, $F8
	even

.Sprite10:
	dc.b	1
	dc.b	$F4, 6, 0, $55, $F8
	even

.Sprite11:
	dc.b	1
	dc.b	$F4, 6, 0, $4F, $F8
	even

.Sprite12:
	dc.b	1
	dc.b	$F4, 6, 0, $49, $F8
	even

.Sprite13:
	dc.b	1
	dc.b	$F0, 5, 0, 0, $F8
	even

.Sprite14:
	dc.b	1
	dc.b	$F0, 5, 0, 4, $F8
	even

.Sprite15:
	dc.b	1
	dc.b	$F0, 5, 0, 8, $F8
	even

.Sprite16:
	dc.b	0

; ------------------------------------------------------------------------------
