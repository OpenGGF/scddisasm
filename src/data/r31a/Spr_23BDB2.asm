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
	dc.w	.Sprite8-.Sprites
	dc.w	.Spritea-.Sprites
	dc.w	.Spriteb-.Sprites
	dc.w	.Spritec-.Sprites
	dc.w	.Sprite8-.Sprites

.Sprite0:
	dc.b	4
	dc.b	$EC, $D, 0, $28, $F0
	dc.b	$FC, $C, 0, $30, $F0
	dc.b	4, 8, 0, $34, $F0
	dc.b	$C, $C, 0, $37, $F0
	dc.b	0

.Sprite1:
	dc.b	2
	dc.b	$EC, 9, 0, 0, $F4
	dc.b	$FC, $A, 0, $1F, $F4
	dc.b	0

.Sprite2:
	dc.b	2
	dc.b	$EC, $D, 0, $28, $F0
	dc.b	$FC, $E, 0, $3B, $F0
	dc.b	0

.Sprite3:
	dc.b	4
	dc.b	$EC, 9, 0, 0, $F4
	dc.b	$FC, 8, 0, 6, $F4
	dc.b	4, 4, 0, 9, $FC
	dc.b	$C, 8, 0, $B, $F4
	dc.b	0

.Sprite4:
	dc.b	4
	dc.b	$EC, 9, 0, 0, $F4
	dc.b	$FC, 8, 0, $E, $F4
	dc.b	4, 4, 0, $11, $FC
	dc.b	$C, 8, 0, $13, $F4
	dc.b	0

.Sprite5:
	dc.b	2
	dc.b	$EC, 9, 0, 0, $F4
	dc.b	$FC, $A, 0, $16, $F4
	dc.b	0

.Sprite6:
	dc.b	2
	dc.b	$EC, 9, 0, $47, $F4
	dc.b	$FC, $A, 0, $4D, $F4
	dc.b	0

.Sprite7:
	dc.b	2
	dc.b	$EC, 9, 0, $56, $F4
	dc.b	$FC, $A, 0, $5C, $F4
	dc.b	0

.Sprite8:
	dc.b	0
	dc.b	0

.Spritea:
	dc.b	1
	dc.b	$F8, 5, 0, $65, $F8

.Spriteb:
	dc.b	1
	dc.b	$F8, 5, 0, $69, $F8

.Spritec:
	dc.b	1
	dc.b	$F8, 5, 0, $6D, $F8

; ------------------------------------------------------------------------------
