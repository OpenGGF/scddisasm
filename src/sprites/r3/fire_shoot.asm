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
	dc.w	.Sprite5-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$FC, $C, 0, $E, $F0
	even

.Sprite1:
	dc.b	7
	dc.b	$EC, $C, 0, 0, $F0
	dc.b	$F4, 4, 0, 4, $F0
	dc.b	$F4, 4, 0, 6, 0
	dc.b	$FC, 5, 0, 8, $F0
	dc.b	$FC, 5, 8, 8, 0
	dc.b	$C, 4, 0, $C, $F0
	dc.b	$C, 4, 8, $C, 0
	even

.Sprite2:
	dc.b	7
	dc.b	$EC, $C, 0, $12, $F0
	dc.b	$F4, 4, 0, 4, $F0
	dc.b	$F4, 4, 0, 6, 0
	dc.b	$FC, 5, 0, 8, $F0
	dc.b	$FC, 5, 8, 8, 0
	dc.b	$C, 4, 0, $C, $F0
	dc.b	$C, 4, 8, $C, 0
	even

.Sprite3:
	dc.b	2
	dc.b	$F8, 4, 0, $16, $F8
	dc.b	0, 4, $10, $16, $F8
	even

.Sprite4:
	dc.b	2
	dc.b	$F8, 4, 8, $16, $F8
	dc.b	0, 4, $18, $16, $F8
	even

.Sprite5:
	dc.b	0
	dc.b	0, 0, 0, 0, 0

; ------------------------------------------------------------------------------
