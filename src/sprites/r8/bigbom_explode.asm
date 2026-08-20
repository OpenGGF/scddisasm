; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$F8, 5, 0, 0, $F0
	dc.b	$F8, 5, 8, 0, 0

.Sprite1:
	dc.b	3
	dc.b	$F0, $D, 0, 4, $F0
	dc.b	0, 5, 0, $C, $F0
	dc.b	0, 5, 8, $C, 0

.Sprite2:
	dc.b	4
	dc.b	$F0, 5, 0, $10, $F0
	dc.b	$F0, 5, 0, $14, 0
	dc.b	0, 5, 0, $18, $F0
	dc.b	0, 5, $18, $10, 0

.Sprite3:
	dc.b	4
	dc.b	$E8, $A, 0, $1C, $E8
	dc.b	$E8, $A, 8, $1C, 0
	dc.b	0, $A, $10, $1C, $E8
	dc.b	0, $A, $18, $1C, 0

.Sprite4:
	dc.b	4
	dc.b	$E8, $A, 0, $25, $E8
	dc.b	$E8, $A, 8, $25, 0
	dc.b	0, $A, $10, $25, $E8
	dc.b	0, $A, $18, $25, 0

; ------------------------------------------------------------------------------
