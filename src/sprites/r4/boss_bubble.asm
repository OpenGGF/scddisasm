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
	dc.b	$FC, 0, 0, $AE, $FC
	even

.Sprite1:
	dc.b	1
	dc.b	$FC, 0, 0, $AF, $FC
	even

.Sprite2:
	dc.b	1
	dc.b	$FC, 0, 0, $B0, $FC
	even

.Sprite3:
	dc.b	1
	dc.b	$F8, 5, 0, $B1, $F8
	even

.Sprite4:
	dc.b	1
	dc.b	$F8, 5, 0, $B5, $F8
	even

.Sprite5:
	dc.b	1
	dc.b	$F4, $A, 0, $B9, $F4
	even

.Sprite6:
	dc.b	1
	dc.b	$F0, $F, 0, $C2, $F0
	even

.Sprite7:
	dc.b	1
	dc.b	$F0, $F, 0, $D2, $F0
	even

.Sprite8:
	dc.b	1
	dc.b	$F0, $F, 0, $E2, $F0

; ------------------------------------------------------------------------------
