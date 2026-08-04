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
	dc.b	4
	dc.b	$E4, 5, $20, $47, 4
	dc.b	$F4, $D, $20, $4B, $F4
	dc.b	$E4, $B, 0, $E0, $E8
	dc.b	$E4, $B, 8, $E0, 0
	dc.b	0

.Sprite1:
	dc.b	4
	dc.b	$E4, 5, $20, $47, 4
	dc.b	$F4, $D, $20, $4B, $F4
	dc.b	$E4, $B, 0, $EC, $E8
	dc.b	$E4, $B, 8, $EC, 0
	dc.b	0

.Sprite2:
	dc.b	4
	dc.b	$E4, 5, $20, $47, 4
	dc.b	$F4, $D, $20, $4B, $F4
	dc.b	$E4, $B, 0, $F8, $E8
	dc.b	$E4, $B, 8, $F8, 0
	dc.b	0

.Sprite3:
	dc.b	4
	dc.b	$E4, 5, $20, $47, 4
	dc.b	$F4, $D, $20, $4B, $F4
	dc.b	$E4, $B, 1, 4, $E8
	dc.b	$E4, $B, 9, 4, 0
	dc.b	0

.Sprite4:
	dc.b	3
	dc.b	$F4, 9, 0, $C1, $F4
	dc.b	$E4, $F, 1, $12, $E8
	dc.b	$E4, 7, 1, $22, 8

.Sprite5:
	dc.b	4
	dc.b	$E4, 5, $20, $47, 4
	dc.b	$F4, $D, $20, $4B, $F4
	dc.b	$E4, $F, 1, $12, $E8
	dc.b	$E4, 7, 1, $22, 8
	dc.b	0

.Sprite6:
	dc.b	5
	dc.b	$D4, 5, 1, $2A, $E8
	dc.b	$E4, 5, $20, $47, 4
	dc.b	$F4, $D, $20, $4B, $F4
	dc.b	$E4, $F, 1, $12, $E8
	dc.b	$E4, 7, 1, $22, 8

.Sprite7:
	dc.b	5
	dc.b	$D4, 5, 1, $2E, $E8
	dc.b	$E4, 5, $20, $47, 4
	dc.b	$F4, $D, $20, $4B, $F4
	dc.b	$E4, $F, 1, $12, $E8
	dc.b	$E4, 7, 1, $22, 8

.Sprite8:
	dc.b	2
	dc.b	$E4, 5, $20, $47, 4
	dc.b	$F4, $D, $20, $4B, $F4
	dc.b	0

; ------------------------------------------------------------------------------
