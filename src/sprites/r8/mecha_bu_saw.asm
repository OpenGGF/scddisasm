; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$F8, 9, 0, $24, $F8
	dc.b	$F0, $B, 0, $18, $F4

.Sprite1:
	dc.b	2
	dc.b	$F8, 9, 0, $24, $F8
	dc.b	$EF, $B, $10, $18, $F4

.Sprite2:
	dc.b	2
	dc.b	$FE, 6, 0, $2A, $FC
	dc.b	$F0, $B, 0, $18, $F4

.Sprite3:
	dc.b	2
	dc.b	$FE, 6, 0, $2A, $FC
	dc.b	$EF, $B, $10, $18, $F4

; ------------------------------------------------------------------------------
