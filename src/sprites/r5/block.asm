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
	dc.b	4
	dc.b	$F0, 5, $80, 0, $F0
	dc.b	$F0, 5, $80, 4, 0
	dc.b	0, 5, $80, 8, $F0
	dc.b	0, 5, $80, $C, 0

.Sprite1:
	dc.b	1
	dc.b	$F8, 5, $80, $C, $F8

.Sprite2:
	dc.b	1
	dc.b	$F8, 5, $80, 8, $F8

.Sprite3:
	dc.b	1
	dc.b	$F8, 5, $80, 4, $F8

.Sprite4:
	dc.b	1
	dc.b	$F8, 5, $80, 0, $F8

; ------------------------------------------------------------------------------
