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
	dc.w	.Sprite9-.Sprites

.Sprite0:
	dc.b	3
	dc.b	$E8, $B, 0, 8, $E8
	dc.b	$F8, $B, 8, $1A, 0
	dc.b	8, 5, 0, $2A, $F8
	even

.Sprite1:
	dc.b	3
	dc.b	$E8, $B, 0, 8, $E8
	dc.b	$F8, $B, 8, $1A, 0
	dc.b	8, 5, 8, $2A, $F8
	even

.Sprite2:
	dc.b	3
	dc.b	$E8, $B, 0, 8, $E8
	dc.b	$F8, $B, 8, $1A, 0
	dc.b	8, 5, 0, $26, $F8
	even

.Sprite3:
	dc.b	3
	dc.b	$E8, $B, 0, 8, $E8
	dc.b	$F8, $B, 8, $1A, 0
	dc.b	8, 5, 8, $26, $F8
	even

.Sprite4:
	dc.b	3
	dc.b	$F8, $B, 0, $1A, $E8
	dc.b	$E8, $B, 8, 8, 0
	dc.b	8, 5, 0, $2A, $F8
	even

.Sprite5:
	dc.b	3
	dc.b	$F8, $B, 0, $1A, $E8
	dc.b	$E8, $B, 8, 8, 0
	dc.b	8, 5, 8, $2A, $F8
	even

.Sprite6:
	dc.b	3
	dc.b	$F8, $B, 0, $1A, $E8
	dc.b	$E8, $B, 8, 8, 0
	dc.b	8, 5, 0, $26, $F8
	even

.Sprite7:
	dc.b	3
	dc.b	$F8, $B, 0, $1A, $E8
	dc.b	$E8, $B, 8, 8, 0
	dc.b	8, 5, 8, $26, $F8
	even

.Sprite8:
	dc.b	3
	dc.b	$F8, 9, 0, $14, $E8
	dc.b	$F8, 9, 8, $14, 0
	dc.b	8, 5, 0, $2A, $F8
	even

.Sprite9:
	dc.b	1
	dc.b	$F9, $D, 0, 0, $F0

; ------------------------------------------------------------------------------
