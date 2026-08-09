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
	dc.b	$F0, 9, 0, 3, $E8
	dc.b	$F0, 9, 8, 3, 0
	even

.Sprite1:
	dc.b	2
	dc.b	$F4, 9, 0, 9, $E8
	dc.b	$F4, 9, 8, 9, 0
	even

.Sprite2:
	dc.b	2
	dc.b	$F8, 9, 0, $F, $E8
	dc.b	$F8, 9, 8, $F, 0
	even

.Sprite3:
	dc.b	2
	dc.b	$FC, 9, 0, $15, $E8
	dc.b	$FC, 9, 8, $15, 0
	even

.Sprite4:
	dc.b	2
	dc.b	$FC, 9, 0, $1B, $E8
	dc.b	$FC, 9, 8, $1B, 0
	even

.Sprite5:
	dc.b	2
	dc.b	$FC, 9, $10, $15, $E8
	dc.b	$FC, 9, $18, $15, 0
	even

.Sprite6:
	dc.b	2
	dc.b	$FC, 9, $10, $F, $E8
	dc.b	$FC, 9, $18, $F, 0
	even

.Sprite7:
	dc.b	2
	dc.b	$FC, 9, $10, 9, $E8
	dc.b	$FC, 9, $18, 9, 0
	even

.Sprite8:
	dc.b	2
	dc.b	0, 9, $10, 3, $E8
	dc.b	0, 9, $18, 3, 0
	even

.Sprite9:
	dc.b	2
	dc.b	0, 8, $10, 0, $E8
	dc.b	0, 8, $18, 0, 0
	even

.SpriteA:
	dc.b	0
	; Unused
	dc.b	$FC, 0, $10, 0, $E8
	even

.SpriteB:
	dc.b	2
	dc.b	$F8, 8, 0, 0, $E8
	dc.b	$F8, 8, 8, 0, 0

; ------------------------------------------------------------------------------
