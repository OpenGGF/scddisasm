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
	dc.w	.Spritea-.Sprites
	dc.w	.Spriteb-.Sprites
	dc.w	.Spritec-.Sprites
	dc.w	.Sprited-.Sprites
	dc.w	.Spritee-.Sprites

.Sprite0:
	dc.b	4
	dc.b	$F0, 5, 0, 0, $F0
	dc.b	0, 5, 0, 4, $F0
	dc.b	$F0, 5, 0, 0, 0
	dc.b	0, 5, 0, 4, 0
	dc.b	0

.Sprite1:
	dc.b	1
	dc.b	$F0, 5, 0, 0, $F0

.Sprite2:
	dc.b	1
	dc.b	0, 5, 0, 4, $F0

.Sprite3:
	dc.b	1
	dc.b	$F0, 5, 0, 0, 0

.Sprite4:
	dc.b	1
	dc.b	0, 5, 0, 4, 0

.Sprite5:
	dc.b	1
	dc.b	$F0, 5, 8, $C, $F0

.Sprite6:
	dc.b	1
	dc.b	0, 5, 8, $C, $F0

.Sprite7:
	dc.b	1
	dc.b	$F0, 5, 8, 8, 0

.Sprite8:
	dc.b	1
	dc.b	0, 5, 8, 8, 0

.Sprite9:
	dc.b	4
	dc.b	$F0, 5, 8, $C, $F0
	dc.b	0, 5, 8, $C, $F0
	dc.b	$F0, 5, 8, 8, 0
	dc.b	0, 5, 8, 8, 0
	dc.b	0

.Spritea:
	dc.b	1
	dc.b	$F0, 5, 0, 8, $F0

.Spriteb:
	dc.b	1
	dc.b	0, 5, 0, 8, $F0

.Spritec:
	dc.b	1
	dc.b	$F0, 5, 0, $C, 0

.Sprited:
	dc.b	1
	dc.b	0, 5, 0, $C, 0

.Spritee:
	dc.b	4
	dc.b	$F0, 5, 0, 8, $F0
	dc.b	0, 5, 0, 8, $F0
	dc.b	$F0, 5, 0, $C, 0
	dc.b	0, 5, 0, $C, 0
	dc.b	0

; ------------------------------------------------------------------------------
