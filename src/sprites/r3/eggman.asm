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
	dc.b	4
	dc.b	$C8, 9, 0, 0, $E8
	dc.b	$C8, 9, 8, 0, 0
	dc.b	$D8, 8, 0, $C, $E8
	dc.b	$D8, 8, 0, $F, 0

.Sprite1:
	dc.b	4
	dc.b	$C8, 9, 0, 6, $E8
	dc.b	$C8, 9, 8, 6, 0
	dc.b	$D8, 8, 0, $C, $E8
	dc.b	$D8, 8, 0, $F, 0

.Sprite2:
	dc.b	4
	dc.b	$C8, 9, 0, 0, $E8
	dc.b	$C8, 9, 8, 0, 0
	dc.b	$D8, 8, 0, $12, $E8
	dc.b	$D8, 8, 0, $15, 0

.Sprite3:
	dc.b	4
	dc.b	$C8, 9, 0, 6, $E8
	dc.b	$C8, 9, 8, 6, 0
	dc.b	$D8, 8, 0, $12, $E8
	dc.b	$D8, 8, 0, $15, 0

.Sprite4:
	dc.b	4
	dc.b	$C0, $F, 0, $18, $E0
	dc.b	$C0, $B, 0, $28, 0
	dc.b	$E0, $B, 0, $4C, $E8
	dc.b	$E0, $B, 0, $58, 0

.Sprite5:
	dc.b	4
	dc.b	$C0, $F, 8, $18, 0
	dc.b	$C0, $B, 8, $28, $E8
	dc.b	$E0, $B, 0, $34, $E8
	dc.b	$E0, $B, 0, $40, 0

.Sprite6:
	dc.b	8
	dc.b	$C8, 9, 0, 8, $E8
	dc.b	$C8, 9, 8, 8, 0
	dc.b	$D8, 8, 0, $E, $E8
	dc.b	$D8, 8, 0, $11, 0
	dc.b	$E0, 8, 0, $1A, $E8
	dc.b	$E0, 8, 0, $1D, 0
	dc.b	$E8, $A, 0, $20, $E8
	dc.b	$E8, $A, 8, $20, 0

.Sprite7:
	dc.b	8
	dc.b	$C8, 9, 0, $14, $E8
	dc.b	$C8, 9, 8, $14, 0
	dc.b	$D8, 8, 0, $E, $E8
	dc.b	$D8, 8, 0, $11, 0
	dc.b	$E0, 8, 0, $1A, $E8
	dc.b	$E0, 8, 0, $1D, 0
	dc.b	$E8, $A, 0, $20, $E8
	dc.b	$E8, $A, 8, $20, 0

.Sprite8:
	dc.b	9
	dc.b	$C8, 5, 0, 0, $18
	dc.b	$F0, 5, 0, $68, 5
	dc.b	$F8, 5, 0, $70, $20
	dc.b	$C8, $F, 0, $29, 0
	dc.b	$C8, $F, 0, $39, $20
	dc.b	$C8, 3, 0, $49, $40
	dc.b	$E8, $E, 0, $4D, 0
	dc.b	$E8, $E, 0, $59, $20
	dc.b	$E8, 2, 0, $65, $40

.Sprite9:
	dc.b	9
	dc.b	$C8, 5, 0, 4, $18
	dc.b	$F0, 5, 0, $6C, 5
	dc.b	$F8, 5, 0, $74, $20
	dc.b	$C8, $F, 0, $29, 0
	dc.b	$C8, $F, 0, $39, $20
	dc.b	$C8, 3, 0, $49, $40
	dc.b	$E8, $E, 0, $4D, 0
	dc.b	$E8, $E, 0, $59, $20
	dc.b	$E8, 2, 0, $65, $40

; ------------------------------------------------------------------------------
