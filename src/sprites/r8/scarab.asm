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
	dc.b	4
	dc.b	$F4, $A, 0, 0, 0
	dc.b	$F4, $D, 0, $F, $E0
	dc.b	4, 4, 0, $17, $E0
	dc.b	4, 4, 0, $19, $F0

.Sprite1:
	dc.b	4
	dc.b	$F4, $A, 0, 0, 0
	dc.b	$F4, $D, 0, $24, $E0
	dc.b	4, 0, 0, $2C, $E0
	dc.b	4, 4, 0, $19, $F0

.Sprite2:
	dc.b	4
	dc.b	$F4, $A, 0, 0, 0
	dc.b	$F4, $D, 0, $35, $D8
	dc.b	$F4, 1, 0, $3D, $F8
	dc.b	4, 4, 0, $19, $F0

.Sprite3:
	dc.b	2
	dc.b	$F4, 4, 0, 9, $F0
	dc.b	$FC, 5, 0, $B, $E8

.Sprite4:
	dc.b	3
	dc.b	$F4, 8, 0, $1B, $E8
	dc.b	$FC, $C, 0, $1E, $E0
	dc.b	4, 4, 0, $22, $E0
	
.Sprite5:
	dc.b	1
	dc.b	$F4, $D, 0, $2D, $E0

; ------------------------------------------------------------------------------
