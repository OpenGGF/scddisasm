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
	dc.b	1
	dc.b	$F4, $A, 0, $28, $F4

.Sprite1:
	dc.b	0

.Sprite2:
	dc.b	1
	dc.b	$FC, 4, 0, $31, $F8

.Sprite3:
	dc.b	1
	dc.b	$FC, 4, $10, $31, $F8

.Sprite4:
	dc.b	3
	dc.b	$E8, $A, 8, 0, $FC
	dc.b	$F8, 5, 8, 9, $EC
	dc.b	0, 5, 8, $D, $FC

.Sprite5:
	dc.b	4
	dc.b	$E8, $F, 8, $11, $F4
	dc.b	$E8, 0, 8, $21, $EC
	dc.b	0, 1, 8, $22, $EC
	dc.b	8, $C, 8, $24, $F4

; ------------------------------------------------------------------------------
