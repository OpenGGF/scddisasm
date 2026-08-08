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
	dc.w	.SpriteF-.Sprites
	dc.w	.Sprite10-.Sprites
	dc.w	.Sprite11-.Sprites
	dc.w	.Sprite12-.Sprites
	dc.w	.Sprite13-.Sprites

.Sprite0:
	dc.b	4
	dc.b	$F6, 5, 0, $12, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Sprite1:
	dc.b	4
	dc.b	$F6, 5, 0, $16, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Sprite2:
	dc.b	4
	dc.b	$F6, 5, 0, $1A, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Sprite3:
	dc.b	4
	dc.b	$F6, 5, 0, $1E, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Sprite4:
	dc.b	4
	dc.b	$F6, 5, 0, $22, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Sprite5:
	dc.b	4
	dc.b	$F6, 5, 0, $26, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Sprite6:
	dc.b	4
	dc.b	$F6, 5, 0, $2A, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Sprite7:
	dc.b	4
	dc.b	$F6, 5, 0, $2E, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Sprite8:
	dc.b	4
	dc.b	$F6, 5, 0, $48, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Sprite9:
	dc.b	4
	dc.b	$F6, 5, 8, $48, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.SpriteA:
	dc.b	5
	dc.b	$D8, $D, 0, $32, $F0
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
	even

.SpriteB:
	dc.b	5
	dc.b	$D8, $D, 8, $32, $F0
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
	even

.SpriteC:
	dc.b	5
	dc.b	$D8, $D, 0, $3A, $F0
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
	even

.SpriteD:
	dc.b	5
	dc.b	$D8, $D, 8, $3A, $F0
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
	even

.SpriteE:
	dc.b	5
	dc.b	$D8, 5, 0, $42, $F8
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
	even

.SpriteF:
	dc.b	5
	dc.b	$D8, 1, 0, $46, $FC
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
	even

.Sprite10:
	dc.b	3
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Sprite11:
	dc.b	1
	dc.b	0, $D, 0, $A, $F0
	even

.Sprite12:
	dc.b	1
	dc.b	$F8, $D, 0, $32, $F0
	even

.Sprite13:
	dc.b	1
	dc.b	$F8, $D, 0, $3A, $F0

; ------------------------------------------------------------------------------
