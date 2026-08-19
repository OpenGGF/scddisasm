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
	dc.b	2
	dc.b	$FC, 0, $20, $1E, $EC
	dc.b	$F4, $E, $20, $46, $F4

.Sprite1:
	dc.b	2
	dc.b	$EC, 9, $20, 0, $F4
	dc.b	$FC, $A, $20, $3D, $F4

.Sprite2:
	dc.b	2
	dc.b	$EC, 9, $20, 6, $F4
	dc.b	$FC, $A, $20, $3D, $F4

.Sprite3:
	dc.b	3
	dc.b	$EC, 9, $20, 0, $F4
	dc.b	$FC, $A, $20, $3D, $F4
	dc.b	$F9, $A, $20, $15, $F5

.Sprite4:
	dc.b	3
	dc.b	$EC, 9, $20, 6, $F4
	dc.b	$FC, $A, $20, $3D, $F4
	dc.b	$F9, $A, $20, $15, $F5

; ------------------------------------------------------------------------------
