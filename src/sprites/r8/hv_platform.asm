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

.Sprite0:
	dc.b	7
	dc.b	$C8, 5, 0, 4, $F8
	dc.b	$D8, 5, 0, 4, $F8
	dc.b	$E8, 5, 0, 4, $F8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	8, 5, 0, 4, $F8
	dc.b	$18, 5, 0, 4, $F8
	dc.b	$28, 5, 0, 4, $F8

.Sprite1:
	dc.b	5
	dc.b	$D8, 5, 0, 4, $F8
	dc.b	$E8, 5, 0, 4, $F8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	8, 5, 0, 4, $F8
	dc.b	$18, 5, 0, 4, $F8

.Sprite2:
	dc.b	3
	dc.b	$E8, 5, 0, 4, $F8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	8, 5, 0, 4, $F8

.Sprite3:
	dc.b	1
	dc.b	$F8, 5, 0, 0, $F8

.Sprite4:
	dc.b	3
	dc.b	$F8, 5, 0, 4, $E8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F8, 5, 0, 4, 8

.Sprite5:
	dc.b	5
	dc.b	$F8, 5, 0, 4, $D8
	dc.b	$F8, 5, 0, 4, $E8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F8, 5, 0, 4, 8
	dc.b	$F8, 5, 0, 4, $18

.Sprite6:
	dc.b	7
	dc.b	$F8, 5, 0, 4, $C8
	dc.b	$F8, 5, 0, 4, $D8
	dc.b	$F8, 5, 0, 4, $E8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F8, 5, 0, 4, 8
	dc.b	$F8, 5, 0, 4, $18
	dc.b	$F8, 5, 0, 4, $28

; ------------------------------------------------------------------------------
