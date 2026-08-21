; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites

.Sprite0:
	dc.b	$C
	dc.b	$F4, 8, 0, $A, $E4
	dc.b	$FC, 4, 0, $D, $E4
	dc.b	$FC, 0, 0, $F, $F4
	dc.b	4, 4, 0, $10, $EC
	dc.b	$F4, 0, 0, 0, $FC
	dc.b	$F4, 8, 0, 1, 4
	dc.b	$FC, $C, 0, 4, $FC
	dc.b	4, 4, 0, 8, $FC
	dc.b	$F0, $C, 0, $14, $E3
	dc.b	$F0, 0, 0, $18, 3
	dc.b	$EF, $C, 0, $14, $EA
	dc.b	$EF, 0, 0, $18, $A

.Sprite1:
	dc.b	$C
	dc.b	$F4, 8, 0, $A, $E4
	dc.b	$FC, 4, 0, $D, $E4
	dc.b	$FC, 0, 0, $F, $F4
	dc.b	4, 4, 0, $10, $EC
	dc.b	$F4, 0, 0, 0, $FC
	dc.b	$F4, 8, 0, 1, 4
	dc.b	$FC, $C, 0, 4, $FC
	dc.b	4, 4, 0, 8, $FC
	dc.b	$F2, $C, 0, $19, $E3
	dc.b	$F2, 0, 0, $1D, 3
	dc.b	$F1, $C, 0, $19, $EA
	dc.b	$F1, 0, 0, $1D, $A

.Sprite2:
	dc.b	$C
	dc.b	$F4, 8, 0, $A, $E4
	dc.b	$FC, 4, 0, $12, $E4
	dc.b	$FC, 0, 0, $F, $F4
	dc.b	4, 4, 0, $10, $EC
	dc.b	$F4, 0, 0, 0, $FC
	dc.b	$F4, 8, 0, 1, 4
	dc.b	$FC, $C, 0, 4, $FC
	dc.b	4, 4, 0, 8, $FC
	dc.b	$F0, $C, 0, $14, $E3
	dc.b	$F0, 0, 0, $18, 3
	dc.b	$EF, $C, 0, $14, $EA
	dc.b	$EF, 0, 0, $18, $A

; ------------------------------------------------------------------------------
