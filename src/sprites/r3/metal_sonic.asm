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
	dc.w	.Spritef-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$F4, $B, 0, 0, $E8
	dc.b	$F4, $B, 0, $C, 0
	even

.Sprite1:
	dc.b	2
	dc.b	$F4, $B, 0, $18, $E8
	dc.b	$F4, $B, 0, $24, 0
	even

.Sprite2:
	dc.b	6
	dc.b	$E8, $F, 0, $30, $EC
	dc.b	8, 9, 0, $40, $F4
	dc.b	$E8, $A, 0, $5C, $E0
	dc.b	0, $A, 0, $65, $E0
	dc.b	$E8, $A, $18, $5C, 8
	dc.b	0, $A, $18, $65, 8
	even

.Sprite3:
	dc.b	6
	dc.b	$E8, $F, 0, $30, $EC
	dc.b	8, 9, 0, $40, $F4
	dc.b	$E8, $A, $18, $65, 8
	dc.b	0, $A, $18, $5C, 8
	dc.b	$E8, $A, 0, $65, $E0
	dc.b	0, $A, 0, $5C, $E0
	even

.Sprite4:
	dc.b	6
	dc.b	$E8, $F, 0, $30, $EC
	dc.b	8, 9, 0, $40, $F4
	dc.b	$E8, $A, $10, $65, $E0
	dc.b	0, $A, $10, $5C, $E0
	dc.b	$E8, $A, 8, $65, 8
	dc.b	0, $A, 8, $5C, 8
	even

.Sprite5:
	dc.b	6
	dc.b	$E8, $F, 0, $30, $EC
	dc.b	8, 9, 0, $40, $F4
	dc.b	$E8, $A, 8, $5C, 8
	dc.b	0, $A, 8, $65, 8
	dc.b	$E8, $A, $10, $5C, $E0
	dc.b	0, $A, $10, $65, $E0
	even

.Sprite6:
	dc.b	6
	dc.b	$E8, $F, 0, $30, $EC
	dc.b	8, 9, 0, $40, $F4
	dc.b	$E8, $A, 0, $5C, $E0
	dc.b	0, $A, 0, $65, $E0
	dc.b	$E8, $A, $10, $5C, 8
	dc.b	0, $A, $10, $65, 8
	even

.Sprite7:
	dc.b	6
	dc.b	$E8, $F, 0, $30, $EC
	dc.b	8, 9, 0, $40, $F4
	dc.b	$E8, $A, $18, $65, $10
	dc.b	0, $A, $18, $5C, $10
	dc.b	$E8, $A, 8, $65, $D8
	dc.b	0, $A, 8, $5C, $D8
	even

.Sprite8:
	dc.b	6
	dc.b	$E8, $F, 0, $30, $EC
	dc.b	8, 9, 0, $40, $F4
	dc.b	$E0, $A, $10, $65, $D8
	dc.b	8, $A, $10, $5C, $D8
	dc.b	$E0, $A, 0, $65, $10
	dc.b	8, $A, 0, $5C, $10
	even

.Sprite9:
	dc.b	6
	dc.b	$E8, $F, 0, $30, $EC
	dc.b	8, 9, 0, $40, $F4
	dc.b	$E0, $A, 8, $5C, $18
	dc.b	8, $A, 8, $65, $18
	dc.b	$E0, $A, $18, $5C, $D0
	dc.b	8, $A, $18, $65, $D0
	even

.Spritea:
	dc.b	1
	dc.b	$F8, 5, 0, $6E, $F8
	even

.Spriteb:
	dc.b	1
	dc.b	$F8, 5, 0, $72, $F8
	even

.Spritec:
	dc.b	1
	dc.b	$F4, $A, 0, $76, $F4
	even

.Sprited:
	dc.b	1
	dc.b	$F0, $F, 0, $7F, $F0
	even

.Spritee:
	dc.b	0
	even

.Spritef:
	dc.b	2
	dc.b	$E8, $F, 0, $30, $EC
	dc.b	8, 9, 0, $40, $F4

; ------------------------------------------------------------------------------
