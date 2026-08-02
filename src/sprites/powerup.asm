; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Powerup sprites
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

.Sprite1:
	dc.b	4
	dc.b	$E8, $A, 0, 0, $E8
	dc.b	$E8, $A, 0, 9, 0

.Sprite0:
	dc.b	0, $A, $10, 0, $E8
	dc.b	0, $A, $10, 9, 0

.Sprite2:
	dc.b	4
	dc.b	$E8, $A, 0, $12, $E8
	dc.b	$E8, $A, 0, $1B, 0
	dc.b	0, $A, $10, $12, $E8
	dc.b	0, $A, $10, $1B, 0

.Sprite3:
	dc.b	4
	dc.b	$E8, $A, 8, 9, $E8
	dc.b	$E8, $A, 8, 0, 0
	dc.b	0, $A, $18, 9, $E8
	dc.b	0, $A, $18, 0, 0

.Sprite4:
	dc.b	4
	dc.b	$E8, $A, 0, 0, $E8
	dc.b	$E8, $A, 0, 9, 0
	dc.b	0, $A, $18, 9, $E8
	dc.b	0, $A, $18, 0, 0

.Sprite5:
	dc.b	4
	dc.b	$E8, $A, 8, 9, $E8
	dc.b	$E8, $A, 8, 0, 0
	dc.b	0, $A, $10, 0, $E8
	dc.b	0, $A, $10, 9, 0

.Sprite6:
	dc.b	4
	dc.b	$E8, $A, 0, $12, $E8
	dc.b	$E8, $A, 0, $1B, 0
	dc.b	0, $A, $18, $1B, $E8
	dc.b	0, $A, $18, $12, 0

.Sprite7:
	dc.b	4
	dc.b	$E8, $A, 8, $1B, $E8
	dc.b	$E8, $A, 8, $12, 0
	dc.b	0, $A, $10, $12, $E8
	dc.b	0, $A, $10, $1B, 0
	even

.Sprite8:
	dc.b	4
	dc.b	$F0, 5, 0, 0, $F0
	dc.b	$F0, 5, 8, 0, 0
	dc.b	0, 5, $10, 0, $F0
	dc.b	0, 5, $18, 0, 0
	even

.Sprite9:
	dc.b	4
	dc.b	$F0, 5, 0, 4, $F0
	dc.b	$F0, 5, 8, 4, 0
	dc.b	0, 5, $10, 4, $F0
	dc.b	0, 5, $18, 4, 0
	even

.SpriteA:
	dc.b	4
	dc.b	$E8, $A, 0, 8, $E8
	dc.b	$E8, $A, 8, 8, 0
	dc.b	0, $A, $10, 8, $E8
	dc.b	0, $A, $18, 8, 0
	even

.SpriteB:
	dc.b	4
	dc.b	$F0, 5, 0, $11, $F0
	dc.b	$F0, 5, 0, $15, 0
	dc.b	0, 5, $18, $15, $F0
	dc.b	0, 5, $18, $11, 0
	even

.SpriteC:
	dc.b	2
	dc.b	$F4, 6, 0, $19, $F0
	dc.b	$F4, 6, 8, $19, 0

; ------------------------------------------------------------------------------