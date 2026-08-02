; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Platform sprites (R5)
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite5-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, $10, 0
	even

.Sprite1:
	dc.b	4
	dc.b	$F0, 5, 0, $18, $F0
	dc.b	$F0, 5, 0, $24, 0
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, $10, 0
	even

.Sprite2:
	dc.b	4
	dc.b	$F0, 7, 0, 0, $E0
	dc.b	$F0, 7, 0, 8, $F0
	dc.b	$F0, 7, 0, 8, 0
	dc.b	$F0, 7, 0, $10, $10
	even

.Sprite3:
	dc.b	7
	dc.b	$F0, 5, 0, $18, $E0
	dc.b	$F0, $D, 0, $1C, $F0
	dc.b	$F0, 5, 0, $24, $10
	dc.b	$F0, 7, 0, 0, $E0
	dc.b	$F0, 7, 0, 8, $F0
	dc.b	$F0, 7, 0, 8, 0
	dc.b	$F0, 7, 0, $10, $10
	even

.Sprite4:
	dc.b	6
	dc.b	$F0, 7, 0, 0, $D0
	dc.b	$F0, 7, 0, 8, $E0
	dc.b	$F0, 7, 0, 8, $F0
	dc.b	$F0, 7, 0, 8, 0
	dc.b	$F0, 7, 0, 8, $10
	dc.b	$F0, 7, 0, $10, $20
	even

.Sprite5:
	dc.b	$A
	dc.b	$F0, 5, 0, $18, $D0
	dc.b	$F0, $D, 0, $1C, $E0
	dc.b	$F0, $D, 0, $1C, 0
	dc.b	$F0, 5, 0, $24, $20
	dc.b	$F0, 7, 0, 0, $D0
	dc.b	$F0, 7, 0, 8, $E0
	dc.b	$F0, 7, 0, 8, $F0
	dc.b	$F0, 7, 0, 8, 0
	dc.b	$F0, 7, 0, 8, $10
	dc.b	$F0, 7, 0, $10, $20

; ------------------------------------------------------------------------------