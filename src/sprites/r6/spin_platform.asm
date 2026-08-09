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

.Sprite0:
	dc.b	3
	dc.b	$F0, $B, 0, 0, $E8
	dc.b	$F0, $B, 0, $C, 0
	dc.b	$10, 5, 0, $2C, $F8
	even

.Sprite1:
	dc.b	3
	dc.b	$F0, $B, 0, $18, $E8
	dc.b	$F0, $B, 8, $18, 0
	dc.b	$10, 5, 8, $28, $F8
	even

.Sprite2:
	dc.b	3
	dc.b	$F0, $B, 0, 0, $E8
	dc.b	$F0, $B, 0, $C, 0
	dc.b	$10, 5, 0, $24, $F8
	even

.Sprite3:
	dc.b	3
	dc.b	$F0, $B, 0, $18, $E8
	dc.b	$F0, $B, 8, $18, 0
	dc.b	$10, 5, 0, $24, $F8
	even

.Sprite4:
	dc.b	3
	dc.b	$F0, $B, 0, 0, $E8
	dc.b	$F0, $B, 0, $C, 0
	dc.b	$10, 5, 0, $24, $F8
	even

.Sprite5:
	dc.b	3
	dc.b	$F0, $B, 0, $18, $E8
	dc.b	$F0, $B, 8, $18, 0
	dc.b	$10, 5, 0, $28, $F8

; ------------------------------------------------------------------------------
