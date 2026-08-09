; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	4
	dc.b	$E8, 0, 0, 7, 0
	dc.b	$F0, $C, 0, 8, $F0
	dc.b	$F8, $D, 0, $C, $F0
	dc.b	8, $C, 0, $14, $F0

.Sprite1:
	dc.b	5
	dc.b	$F8, 4, 0, $18, $F0
	dc.b	$E8, 0, 0, 7, 0
	dc.b	$F0, $C, 0, 8, $F0
	dc.b	$F8, $D, 0, $C, $F0
	dc.b	8, $C, 0, $14, $F0

.Sprite2:
	dc.b	5
	dc.b	$E8, 1, 0, 0, $F0
	dc.b	$F0, 0, 0, 2, $F8
	dc.b	$E8, 5, 0, 3, 0
	dc.b	$F8, $D, 0, $C, $F0
	dc.b	8, $C, 0, $14, $F0

.Sprite3:
	dc.b	6
	dc.b	$E8, 1, 0, 0, $F0
	dc.b	$F0, 0, 0, 2, $F8
	dc.b	$E8, 5, 0, 3, 0
	dc.b	$F8, 4, 0, $18, $F0
	dc.b	$F8, $D, 0, $C, $F0
	dc.b	8, $C, 0, $14, $F0

; ------------------------------------------------------------------------------
