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
	dc.w	.Sprite8-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$F8, 5, 0, 0, $F8

.Sprite1:
	dc.b	1
	dc.b	$F8, 5, 0, 4, $F8

.Sprite2:
	dc.b	1
	dc.b	$F8, 1, 0, 8, $FC

.Sprite3:
	dc.b	1
	dc.b	$F8, 5, 8, 4, $F8

.Sprite4:
	dc.b	1
	dc.b	$F8, 5, 0, $A, $F8

.Sprite5:
	dc.b	1
	dc.b	$F8, 5, $18, $A, $F8

.Sprite6:
	dc.b	1
	dc.b	$F8, 5, $10, $A, $F8
	
.Sprite7:
	dc.b	1
	dc.b	$F8, 5, 8, $A, $F8
	
.Sprite8:
	dc.b	0

; ------------------------------------------------------------------------------
