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
	dc.b	2
	dc.b	$FC, $C, 0, 0, $E0
	dc.b	$FC, $C, 8, 0, 0

.Sprite1:
	dc.b	2
	dc.b	$FC, 8, 0, 4, $E8
	dc.b	$FC, 8, 0, 7, 0

.Sprite2:
	dc.b	1
	dc.b	$FC, $C, 0, $A, $F0

.Sprite3:
	dc.b	1
	dc.b	$FC, 0, 0, $E, $FC

.Sprite4:
	dc.b	1
	dc.b	$FC, $C, 8, $A, $F0

.Sprite5:
	dc.b	2
	dc.b	$FC, 8, 0, 4, $E8
	dc.b	$FC, 8, 0, 7, 0

.Sprite6:
	dc.b	2
	dc.b	$FC, 4, 0, $F, $F8
	dc.b	4, $D, 0, $11, $F0

.Sprite7:
	dc.b	1
	dc.b	$FC, $B, 0, $19, $F4

; ------------------------------------------------------------------------------
