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
	dc.w	.Sprite7-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$F0, 1, 0, 0, $FC

.Sprite1:
	dc.b	1
	dc.b	$F0, 1, 8, 0, $FC

.Sprite2:
	dc.b	1
	dc.b	$F0, 5, 0, 2, $F8

.Sprite3:
	dc.b	1
	dc.b	$F0, 5, 0, 6, $F8

.Sprite4:
	dc.b	2
	dc.b	$E8, 9, 0, $20, $F4
	dc.b	$F8, 0, 0, $26, $FC
	dc.b	0

.Sprite5:
	dc.b	1
	dc.b	$F0, 5, 0, $A, $F8

.Sprite6:
	dc.b	3
	dc.b	$D0, $A, 0, $E, $F4
	dc.b	$E8, 9, 0, $20, $F4
	dc.b	$F8, 0, 0, $26, $FC

.Sprite7:
	dc.b	3
	dc.b	$D0, $A, 0, $17, $F4
	dc.b	$E8, 9, 0, $20, $F4
	dc.b	$F8, 0, 0, $26, $FC

; ------------------------------------------------------------------------------
