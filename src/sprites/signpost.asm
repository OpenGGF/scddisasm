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

.Sprite0:
	dc.b	4
	dc.b	$D4, $B, 0, 0, $E8
	dc.b	$D4, $B, 0, $C, 0
	dc.b	$F4, 5, 0, $44, $F8
	dc.b	4, $C, 0, $48, $F0
	even

.Sprite1:
	dc.b	3
	dc.b	$D4, $F, 0, $18, $F0
	dc.b	$F4, 5, 0, $44, $F8
	dc.b	4, $C, 0, $48, $F0
	even

.Sprite2:
	dc.b	3
	dc.b	$D4, 3, 0, $28, $FC
	dc.b	$F4, 5, 0, $44, $F8
	dc.b	4, $C, 0, $48, $F0
	even

.Sprite3:
	dc.b	4
	dc.b	$D4, $B, 0, $2C, $E8
	dc.b	$D4, $B, 0, $38, 0
	dc.b	$F4, 5, 0, $44, $F8
	dc.b	4, $C, 0, $48, $F0
	even

.Sprite4:
	dc.b	3
	dc.b	$D4, $F, 8, $18, $F0
	dc.b	$F4, 5, 0, $44, $F8
	dc.b	4, $C, 0, $48, $F0
	even

.Sprite5:
	dc.b	4
	dc.b	$E4, 2, 0, 0, $EC
	dc.b	$E4, $F, 0, 3, $F4
	dc.b	4, 1, 0, $13, $FC
	dc.b	$14, 8, 0, $15, $F4

; ------------------------------------------------------------------------------
