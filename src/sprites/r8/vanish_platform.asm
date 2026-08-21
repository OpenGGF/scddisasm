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
	dc.w	.Sprite0-.Sprites

.Sprite0:
	dc.b	4
	dc.b	$F0, 3, 0, 4, $F0
	dc.b	$F0, 3, 0, 4, $F8
	dc.b	$F0, 3, 0, 4, 0
	dc.b	$F0, 3, 0, 4, 8

.Sprite1:
	dc.b	4
	dc.b	$F0, 3, 0, 0, $F0
	dc.b	$F0, 3, 0, 0, $F8
	dc.b	$F0, 3, 0, 0, 0
	dc.b	$F0, 3, 0, 0, 8

.Sprite2:
	dc.b	2
	dc.b	$F0, 3, 0, 4, $F8
	dc.b	$F0, 3, 0, 4, 0

.Sprite3:
	dc.b	2
	dc.b	$F0, 3, 0, 0, $F8
	dc.b	$F0, 3, 0, 0, 0

.Sprite4:
	dc.b	1
	dc.b	$F0, 3, 0, 4, $FC

.Sprite5:
	dc.b	1
	dc.b	$F0, 3, 0, 0, $FC

.Sprite6:
	dc.b	0

; ------------------------------------------------------------------------------
