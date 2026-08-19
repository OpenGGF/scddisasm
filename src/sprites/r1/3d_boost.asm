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
	dc.b	8
	dc.b	$E8, 1, 0, 0, $F8
	dc.b	$F8, 8, 0, 2, $E8
	dc.b	$E8, 1, 8, 0, 0
	dc.b	$F8, 8, 8, 2, 0
	dc.b	0, 8, $10, 2, $E8
	dc.b	0, 8, $18, 2, 0
	dc.b	8, 1, $10, 0, $F8
	dc.b	8, 1, $18, 0, 0
	even

.Sprite1:
	dc.b	9
	dc.b	$E8, 9, 0, 5, $F4
	dc.b	$F8, $C, 0, $B, $E4
	dc.b	$F8, 4, 0, $F, 4
	dc.b	0, $C, $10, $B, $E4
	dc.b	0, 4, $10, $F, 4
	dc.b	8, 9, $10, 5, $F4
	dc.b	$E8, 5, 0, $37, $ED
	dc.b	$F8, 5, 0, $3B, $DD
	dc.b	8, 5, $10, $37, $ED
	even

.Sprite2:
	dc.b	9
	dc.b	$E8, 9, 0, $11, $F3
	dc.b	$F8, $C, 0, $17, $E3
	dc.b	$F8, 4, 0, $1B, 3
	dc.b	0, $C, $10, $17, $E3
	dc.b	0, 4, $10, $1B, 3
	dc.b	8, 9, $10, $11, $F3
	dc.b	$E8, 5, 0, $37, $E6
	dc.b	$F8, 5, 0, $3B, $D8
	dc.b	8, 5, $10, $37, $E6
	even

.Sprite3:
	dc.b	9
	dc.b	$E8, 9, 0, $1D, $ED
	dc.b	$F8, $C, 0, $23, $E5
	dc.b	$F8, 0, 0, $10, 5
	dc.b	0, $C, $10, $23, $E5
	dc.b	0, 0, $10, $10, 5
	dc.b	8, 9, $10, $1D, $ED
	dc.b	$E8, 5, 0, $37, $E2
	dc.b	$F8, 5, 0, $3B, $D5
	dc.b	8, 5, $10, $37, $E2
	even

.Sprite4:
	dc.b	7
	dc.b	$E8, 3, 0, $27, $D8
	dc.b	$E8, 3, 0, $27, $E0
	dc.b	$E8, 3, 0, $27, $E8
	dc.b	$E8, 6, 0, $2B, $F0
	dc.b	$E8, 6, 0, $31, 0
	dc.b	0, 6, $18, $31, $F0
	dc.b	0, 6, $18, $2B, 0
	even

.Sprite5:
	dc.b	6
	dc.b	$F8, 3, $10, $27, $D8
	dc.b	$F8, 3, $10, $27, $E0
	dc.b	$E8, 6, 8, $31, $F0
	dc.b	$E8, 6, 8, $2B, 0
	dc.b	0, 6, $10, $2B, $F0
	dc.b	0, 6, $10, $31, 0
	even

.Sprite6:
	dc.b	$10
	dc.b	$E8, 9, 0, $11, $F3
	dc.b	$F8, $C, 0, $17, $E3
	dc.b	$F8, 4, 0, $1B, 3
	dc.b	0, $C, $10, $17, $E3
	dc.b	0, 4, $10, $1B, 3
	dc.b	8, 9, $10, $11, $F3
	dc.b	$E8, 3, 0, $27, $D8
	dc.b	$E8, 3, 0, $27, $E0
	dc.b	$E8, 3, 0, $27, $E8
	dc.b	$E8, 6, 0, $2B, $F0
	dc.b	$E8, 6, 0, $31, 0
	dc.b	0, 6, $18, $31, $F0
	dc.b	0, 6, $18, $2B, 0
	dc.b	$E8, 5, 0, $37, $E6
	dc.b	$F8, 5, 0, $3B, $D8
	dc.b	8, 5, 0, $37, $E6
	even

.Sprite7:
	dc.b	$F
	dc.b	$E8, 9, 0, $1D, $ED
	dc.b	$F8, $C, 0, $23, $E5
	dc.b	$F8, 0, 0, $10, 5
	dc.b	0, $C, $10, $23, $E5
	dc.b	0, 0, $10, $10, 5
	dc.b	8, 9, $10, $1D, $ED
	dc.b	$F8, 3, $10, $27, $D8
	dc.b	$F8, 3, $10, $27, $E0
	dc.b	$E8, 6, 8, $31, $F0
	dc.b	$E8, 6, 8, $2B, 0
	dc.b	0, 6, $10, $2B, $F0
	dc.b	0, 6, $10, $31, 0
	dc.b	$E8, 5, 0, $37, $E2
	dc.b	$F8, 5, 0, $3B, $D5
	dc.b	8, 5, 0, $37, $E2
	even

.Sprite8:
	dc.b	$C
	dc.b	$E8, 1, 0, 0, $F8
	dc.b	$F8, 8, 0, 2, $E8
	dc.b	$E8, 1, 8, 0, 0
	dc.b	$F8, 8, 8, 2, 0
	dc.b	0, 8, $10, 2, $E8
	dc.b	0, 8, $18, 2, 0
	dc.b	8, 1, $10, 0, $F8
	dc.b	8, 1, $18, 0, 0
	dc.b	$E8, 6, 0, $2B, $EC
	dc.b	$E8, 6, 0, $31, 4
	dc.b	0, 6, $18, $2B, 4
	dc.b	0, 6, $18, $31, $EC
	; Unused
	dc.b	$EC, 3, 0, $27, $E4
	dc.b	$F4, 3, $18, $27, $14
	even

.Sprite9:
	dc.b	$C
	dc.b	$E8, 1, 0, 0, $F8
	dc.b	$F8, 8, 0, 2, $E8
	dc.b	$E8, 1, 8, 0, 0
	dc.b	$F8, 8, 8, 2, 0
	dc.b	0, 8, $10, 2, $E8
	dc.b	0, 8, $18, 2, 0
	dc.b	8, 1, $10, 0, $F8
	dc.b	8, 1, $18, 0, 0
	dc.b	$E8, 6, $10, $2B, 4
	dc.b	$E8, 6, $10, $31, $EC
	dc.b	0, 6, 8, $2B, $EC
	dc.b	0, 6, 8, $31, 4

; ------------------------------------------------------------------------------
