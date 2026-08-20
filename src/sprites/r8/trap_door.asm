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

.Sprite10:
	dc.b	0
	even

.Sprite11:
	dc.b	4
	dc.b	$F8, $D, 0, 0, $C0
	dc.b	$F8, $D, 0, 8, $E0
	dc.b	$F8, $D, 8, 8, 0
	dc.b	$F8, $D, 8, 0, $20
	even

.Sprite0:
	dc.b	1
	dc.b	$F8, 1, 0, $E, $FC
	even

.Sprite1:
	dc.b	1
	dc.b	$F8, 5, 0, $C, $F8
	even

.Sprite2:
	dc.b	1
	dc.b	$F8, 9, 0, $A, $F4
	even

.Sprite3:
	dc.b	1
	dc.b	$F8, $D, 0, 8, $F0
	even

.Sprite4:
	dc.b	2
	dc.b	$F8, $D, 0, 8, $F4
	dc.b	$F8, 1, 0, 6, $EC
	even

.Sprite5:
	dc.b	2
	dc.b	$F8, $D, 0, 8, $F8
	dc.b	$F8, 5, 0, 4, $E8
	even

.Sprite6:
	dc.b	2
	dc.b	$F8, $D, 0, 8, $FC
	dc.b	$F8, 9, 0, 2, $E4
	even

.Sprite7:
	dc.b	2
	dc.b	$F8, $D, 0, 8, 0
	dc.b	$F8, $D, 0, 0, $E0
	even

.Sprite8:
	dc.b	1
	dc.b	$F8, 1, 8, $E, $FC
	even

.Sprite9:
	dc.b	1
	dc.b	$F8, 5, 8, $C, $F8
	even

.SpriteA:
	dc.b	1
	dc.b	$F8, 9, 8, $A, $F4
	even

.SpriteB:
	dc.b	1
	dc.b	$F8, $D, 8, 8, $F0
	even

.SpriteC:
	dc.b	2
	dc.b	$F8, $D, 8, 8, $EC
	dc.b	$F8, 1, 8, 6, $C
	even

.SpriteD:
	dc.b	2
	dc.b	$F8, $D, 8, 8, $E8
	dc.b	$F8, 5, 8, 4, 8
	even

.SpriteE:
	dc.b	2
	dc.b	$F8, $D, 8, 8, $E4
	dc.b	$F8, 9, 8, 2, 4
	even
	
.SpriteF:
	dc.b	2
	dc.b	$F8, $D, 8, 8, $E0
	dc.b	$F8, $D, 8, 0, 0

; ------------------------------------------------------------------------------
