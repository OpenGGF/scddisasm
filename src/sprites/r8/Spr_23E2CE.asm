; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite5-.Sprites
	dc.w	.Sprite6-.Sprites
	dc.w	.Sprite7-.Sprites
	dc.w	.Sprite8-.Sprites
	dc.w	.Sprite9-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Spriteb-.Sprites
	dc.w	.Spritec-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Spritef-.Sprites
	dc.w	.Sprite10-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$E6, 9, 0, $1E, $F4
	dc.b	$F6, $A, 0, $2A, $F4
	dc.b	0

.Sprite1:
	dc.b	2
	dc.b	$E6, 9, 0, $24, $F4
	dc.b	$F6, $A, 0, $2A, $F4
	dc.b	0

.Sprite4:
	dc.b	1
	dc.b	$F4, $A, 0, 0, $F4

.Sprite5:
	dc.b	1
	dc.b	$F4, $A, 0, 9, $F4

.Sprite6:
	dc.b	1
	dc.b	$F8, 1, 0, $12, $FC

.Sprite7:
	dc.b	1
	dc.b	$F8, 1, 0, $14, $FC

.Sprite8:
	dc.b	1
	dc.b	$F8, 1, 0, $16, $FC

.Sprite9:
	dc.b	1
	dc.b	$F8, 9, 0, $18, $F4

.Sprite2:
	dc.b	0
	dc.b	0

.Spriteb:
	dc.b	3
	dc.b	$F4, $A, 0, 9, $F4
	dc.b	$E6, 9, 0, $1E, $F4
	dc.b	$F6, $A, 0, $2A, $F4

.Spritec:
	dc.b	3
	dc.b	$F4, $A, 0, 9, $F4
	dc.b	$E6, 9, 0, $24, $F4
	dc.b	$F6, $A, 0, $2A, $F4

.Spritef:
	dc.b	1
	dc.b	$F8, 9, 0, $18, $F4

.Sprite10:
	dc.b	1
	dc.b	$F8, 9, 8, $18, $F4

; ------------------------------------------------------------------------------
