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
	dc.b	9
	dc.b	$20, 5, 0, $B5, $F8
	dc.b	$E8, $B, 0, $B9, $E8
	dc.b	$E8, $B, 8, $B9, 0
	dc.b	8, 8, 0, $C5, $E8
	dc.b	8, 8, 8, $C5, 0
	dc.b	$10, 8, 0, $C8, $E8
	dc.b	$10, 8, 8, $C8, 0
	dc.b	$18, $C, 0, $CB, $F0
	dc.b	$20, 4, 0, $CF, $F8

.Sprite1:
	dc.b	6
	dc.b	$1C, 5, 0, $B5, $E6
	dc.b	$DE, $F, 0, $D1, $E2
	dc.b	$E6, $E, 0, $E1, 2
	dc.b	$FE, $F, 0, $ED, $E2
	dc.b	$FE, $B, 0, $FD, 2
	dc.b	$1E, 8, 1, 9, $EA
	dc.b	0

.Sprite2:
	dc.b	5
	dc.b	$18, 5, 0, $B5, $D9
	dc.b	$E0, $F, 1, $C, $E0
	dc.b	$E0, $F, 1, $1C, 0
	dc.b	0, $F, 1, $2C, $E0
	dc.b	0, $F, 1, $3C, 0

.Sprite3:
	dc.b	6
	dc.b	8, 5, 0, $B5, $D2
	dc.b	$E4, $E, 1, $4C, $E0
	dc.b	$DC, $B, 1, $58, 0
	dc.b	$FC, $F, 1, $64, $D8
	dc.b	$FC, $F, 1, $74, $F8
	dc.b	$FC, 2, 1, $84, $18
	dc.b	0

.Sprite4:
	dc.b	9
	dc.b	$F8, 5, 0, $B5, $D0
	dc.b	$E8, $E, 1, $87, $F8
	dc.b	0, $E, $11, $87, $F8
	dc.b	$E8, 2, 1, $93, $F0
	dc.b	0, 2, $11, $93, $F0
	dc.b	$E8, 2, 1, $96, $E8
	dc.b	0, 2, $11, $96, $E8
	dc.b	$F0, 3, 1, $99, $E0
	dc.b	$F8, 1, 1, $9D, $D8

; ------------------------------------------------------------------------------
