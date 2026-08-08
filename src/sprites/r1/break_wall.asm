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
	dc.b	6
	dc.b	$E8, 5, 0, $29, $F0
	dc.b	$F8, 5, 0, $31, $F0
	dc.b	8, 5, 0, $29, $F0
	dc.b	$E8, 5, 0, $2D, 0
	dc.b	$F8, 5, 0, $35, 0
	dc.b	8, 5, 0, $2D, 0

.Sprite1:
	dc.b	6
	dc.b	$E8, 5, 0, $29, $F0
	dc.b	$F8, 5, 0, $31, $F0
	dc.b	8, 5, 0, $29, $F0
	dc.b	$E8, 5, 0, $33, 0
	dc.b	$F8, 5, 0, $2B, 0
	dc.b	8, 5, 0, $33, 0

.Sprite2:
	dc.b	6
	dc.b	$E8, 5, 0, $33, $F0
	dc.b	$F8, 5, 0, $2B, $F0
	dc.b	8, 5, 0, $33, $F0
	dc.b	$E8, 5, 0, $33, 0
	dc.b	$F8, 5, 0, $2B, 0
	dc.b	8, 5, 0, $33, 0

.Sprite3:
	dc.b	6
	dc.b	$E8, 5, 0, $33, $F0
	dc.b	$F8, 5, 0, $2B, $F0
	dc.b	8, 5, 0, $33, $F0
	dc.b	$E8, 5, 0, $2D, 0
	dc.b	$F8, 5, 0, $35, 0
	dc.b	8, 5, 0, $2D, 0

.Sprite4:
	dc.b	6
	dc.b	$E8, 5, 0, $31, $F0
	dc.b	$F8, 5, 0, $29, $F0
	dc.b	8, 5, 0, $31, $F0
	dc.b	$E8, 5, 0, $35, 0
	dc.b	$F8, 5, 0, $2D, 0
	dc.b	8, 5, 0, $35, 0

.Sprite5:
	dc.b	6
	dc.b	$E8, 5, 0, $31, $F0
	dc.b	$F8, 5, 0, $29, $F0
	dc.b	8, 5, 0, $31, $F0
	dc.b	$E8, 5, 0, $2B, 0
	dc.b	$F8, 5, 0, $33, 0
	dc.b	8, 5, 0, $2B, 0

.Sprite6:
	dc.b	6
	dc.b	$E8, 5, 0, $2B, $F0
	dc.b	$F8, 5, 0, $33, $F0
	dc.b	8, 5, 0, $2B, $F0
	dc.b	$E8, 5, 0, $2B, 0
	dc.b	$F8, 5, 0, $33, 0
	dc.b	8, 5, 0, $2B, 0

.Sprite7:
	dc.b	6
	dc.b	$E8, 5, 0, $2B, $F0
	dc.b	$F8, 5, 0, $33, $F0
	dc.b	8, 5, 0, $2B, $F0
	dc.b	$E8, 5, 0, $35, 0
	dc.b	$F8, 5, 0, $2D, 0
	dc.b	8, 5, 0, $35, 0

.Sprite8:
	dc.b	1
	dc.b	$F8, 5, 0, $29, $F8

.Sprite9:
	dc.b	1
	dc.b	$F8, 5, 0, $31, $F8

.SpriteA:
	dc.b	1
	dc.b	$F8, 5, 0, $33, $F8

.SpriteB:
	dc.b	1
	dc.b	$F8, 5, 0, $2B, $F8

.SpriteC:
	dc.b	1
	dc.b	$F8, 5, 0, $2D, $F8

.SpriteD:
	dc.b	1
	dc.b	$F8, 5, 0, $35, $F8

; ------------------------------------------------------------------------------
