; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	6
	dc.b	$FC, 0, 0, 0, $EC
	dc.b	$F4, 1, 0, 1, $F4
	dc.b	$F4, 1, 0, 3, $FC
	dc.b	$F4, 1, 0, 5, 4
	dc.b	4, 4, 0, 7, $EC
	dc.b	4, 0, 0, 9, 4

.Sprite1:
	dc.b	6
	dc.b	$F4, 0, 0, $A, $F4
	dc.b	$F4, 0, 0, $B, $FC
	dc.b	$F4, 0, 0, $C, 4
	dc.b	$FC, 0, 0, $D, $EC
	dc.b	$FC, 8, 0, $E, $F4
	dc.b	4, $C, 0, $11, $EC

.Sprite2:
	dc.b	1
	dc.b	$FC, 0, 0, $15, $FC

.Sprite3:
	dc.b	1
	dc.b	$FC, 0, 0, $16, $FC

; ------------------------------------------------------------------------------
