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
	dc.w	.Sprite6-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$F4, $A, 0, $AF, $F4
	even

.Sprite1:
	dc.b	1
	dc.b	$F0, $F, 0, $B8, $F0
	even

.Sprite2:
	dc.b	1
	dc.b	$F0, $E, 0, $C8, $F0
	even

.Sprite3:
	dc.b	1
	dc.b	$F0, $B, 0, $D4, $F4
	even

.Sprite4:
	dc.b	1
	dc.b	$F0, $B, 0, $E0, $F4
	even

.Sprite5:
	dc.b	1
	dc.b	$F0, $B, 8, $D4, $F4
	even

.Sprite6:
	dc.b	1
	dc.b	$F0, $B, 8, $E0, $F4

; ------------------------------------------------------------------------------
