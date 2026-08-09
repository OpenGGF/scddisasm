; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$E4, $D, 0, $3F, $F4
	even

.Sprite1:
	dc.b	1
	dc.b	$E4, $D, 0, $47, $F4
	even

.Sprite2:
	dc.b	2
	dc.b	$E4, $D, 0, $47, $F4
	dc.b	$D4, 5, 0, $5F, $F4
	even

.Sprite3:
	dc.b	2
	dc.b	$E4, $D, 0, $47, $F4
	dc.b	$D4, 5, 0, $63, $F4

; ------------------------------------------------------------------------------
