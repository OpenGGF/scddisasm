; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	$A
	dc.b	$F0, 0, 0, 0, $F0
	dc.b	$F0, 0, 0, 1, $F8
	dc.b	$F0, 0, 8, 1, 0
	dc.b	$F0, 0, 8, 0, 8
	dc.b	$F8, 4, 0, $18, $F0
	dc.b	$F8, 4, 8, $18, 0
	dc.b	0, 1, 0, 4, $F0
	dc.b	0, 1, 0, $1A, $F8
	dc.b	0, 1, 8, $1A, 0
	dc.b	0, 1, 8, 4, 8

.Sprite1:
	dc.b	9
	dc.b	$FB, 9, 0, 9, $F4
	dc.b	$F0, 0, 0, 0, $F0
	dc.b	$F0, 0, 0, 8, $F8
	dc.b	$F0, 0, 8, 8, 0
	dc.b	$F0, 0, 8, 0, 8
	dc.b	$F8, 4, 0, $1C, $F0
	dc.b	$F8, 4, 8, $1C, 0
	dc.b	0, 1, 0, $1E, $F8
	dc.b	0, 1, 8, $1E, 0

.Sprite2:
	dc.b	$A
	dc.b	$FD, 1, 0, $F, $EC
	dc.b	$FD, 1, 8, $F, $C
	dc.b	$F0, 0, 0, 0, $F0
	dc.b	$F0, 0, 0, 8, $F8
	dc.b	$F0, 0, 8, 8, 0
	dc.b	$F0, 0, 8, 0, 8
	dc.b	$F8, 4, 0, $1C, $F0
	dc.b	$F8, 4, 8, $1C, 0
	dc.b	0, 1, 0, $1E, $F8
	dc.b	0, 1, 8, $1E, 0

.Sprite3:
	dc.b	9
	dc.b	$FB, 9, 8, 9, $F4
	dc.b	$F0, 0, 0, 0, $F0
	dc.b	$F0, 0, 0, 8, $F8
	dc.b	$F0, 0, 8, 8, 0
	dc.b	$F0, 0, 8, 0, 8
	dc.b	$F8, 4, 0, $1C, $F0
	dc.b	$F8, 4, 8, $1C, 0
	dc.b	0, 1, 0, $1E, $F8
	dc.b	0, 1, 8, $1E, 0

; ------------------------------------------------------------------------------
