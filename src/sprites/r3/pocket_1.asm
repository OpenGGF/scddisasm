; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	0

.Sprite1:
	dc.b	2
	dc.b	$F8, 9, $C0, 0, $E8
	dc.b	$F8, 9, $C8, 0, 0

.Sprite2:
	dc.b	2
	dc.b	$E8, 5, 0, 6, $F0
	dc.b	$E8, 5, 8, 6, 0

.Sprite3:
	dc.b	2
	dc.b	$F0, 0, 0, $A, $F8
	dc.b	$F0, 0, 8, $A, 0

; ------------------------------------------------------------------------------
