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
	dc.b	6
	dc.b	$F4, $A, 0, $C, $B0
	dc.b	$F4, $E, 0, 0, $C8
	dc.b	$F4, 9, 0, $15, $E8
	dc.b	$F4, 9, 0, $15, 0
	dc.b	$F4, $E, 0, 0, $18
	dc.b	$F4, $E, 0, 0, $38
	dc.b	0

.Sprite1:
	dc.b	2
	dc.b	$F8, $A, 0, $C, $E4
	dc.b	$F8, $E, 0, 0, $FC
	dc.b	0

.Sprite2:
	dc.b	2
	dc.b	$F8, $E, 0, 0, $E4
	dc.b	$F8, $A, 0, $C, 4
	dc.b	0

.Sprite3:
	dc.b	2
	dc.b	$F8, 9, 0, $15, $E8
	dc.b	$F8, 9, 0, $15, 0
	dc.b	0

.Sprite4:
	dc.b	1
	dc.b	$F8, $A, 0, $C, $F4

.Sprite5:
	dc.b	3
	dc.b	$F8, $E, 0, 0, $D4
	dc.b	$F8, $E, 0, 0, $F4
	dc.b	$F8, $A, 0, $C, $14

.Sprite6:
	dc.b	0
	dc.b	$FC
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	$FC

; ------------------------------------------------------------------------------
