; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite1-.Sprites

.Sprite0:
	dc.b	4
	dc.b	$E8, $B, 0, $B9, $E8
	dc.b	$E8, $B, 8, $B9, 0
	dc.b	8, 8, 0, $C5, $E8
	dc.b	8, 8, 8, $C5, 0
	even

.Sprite1:
	dc.b	6
	dc.b	$DE, $F, 0, $D1, $E2
	dc.b	$E6, $E, 0, $E1, 2
	dc.b	$FE, $C, 1, $9F, $E2
	dc.b	6, 4, 1, $A3, $F2
	dc.b	$FE, 9, 1, $A5, 2
	dc.b	$E, 0, 1, $AB, $A
	even

.Sprite2:
	dc.b	7
	dc.b	$E0, $F, 1, $C, $E0
	dc.b	$E0, $F, 1, $1C, 0
	dc.b	0, 0, 1, $AC, $E0
	dc.b	0, 5, 1, $AD, $F0
	dc.b	0, 6, 1, $B1, 0
	dc.b	0, 5, 1, $B7, $10
	dc.b	$18, 0, 1, $BB, 0
	even

.Sprite3:
	dc.b	5
	dc.b	$E4, $E, 1, $4C, $E0
	dc.b	$DC, $B, 1, $58, 0
	dc.b	$FC, 1, 1, $BC, $F0
	dc.b	$FC, $F, 1, $74, $F8
	dc.b	$FC, 2, 1, $84, $18
	even

.Sprite4:
	dc.b	4
	dc.b	$E8, $E, 1, $87, $F8
	dc.b	0, $E, $11, $87, $F8
	dc.b	$E8, 2, 1, $93, $F0
	dc.b	0, 2, $11, $93, $F0

; ------------------------------------------------------------------------------
