; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites

.Sprite0:
	dc.b	4
	dc.b	4, $D, 0, 0, $E0
	dc.b	$FC, 4, 0, 8, $F0
	dc.b	$F4, $E, 0, $A, 0
	dc.b	$C, 8, 0, $16, 0
	even

.Sprite1:
	dc.b	2
	dc.b	$F4, $E, 0, $19, $E0
	dc.b	$F4, $E, 0, $25, 0
	even

.Sprite2:
	dc.b	4
	dc.b	$EC, $D, $10, 0, $E0
	dc.b	$FC, 4, $10, 8, $F0
	dc.b	$F4, $E, $10, $A, 0
	dc.b	$EC, 8, $10, $16, 0

; -------------------------------------------------------------------------
