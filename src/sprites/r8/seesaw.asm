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
	dc.b	$10
	dc.b	$F0, 4, 0, $13, $F0
	dc.b	$E8, 3, 0, $15, $E8
	dc.b	8, 2, 0, $19, $E8
	dc.b	$20, 2, 0, $1C, $E8
	dc.b	$F0, 4, 8, $13, 0
	dc.b	$E8, 3, 8, $15, $10
	dc.b	8, 2, 8, $19, $10
	dc.b	$20, 2, 8, $1C, $10
	dc.b	$C8, 0, 0, $1F, $D8
	dc.b	$D0, 6, 0, $20, $D8
	dc.b	$E8, 7, 0, $26, $E0
	dc.b	$C8, 0, 8, $1F, $20
	dc.b	$D0, 6, 8, $20, $18
	dc.b	$E8, 7, 8, $26, $10
	dc.b	0, 9, 0, $D, $E8
	dc.b	0, 9, 8, $D, 0
	even

.Sprite1:
	dc.b	$12
	dc.b	$F0, 4, 0, $13, $F0
	dc.b	$E8, 3, 0, $15, $E8
	dc.b	8, 2, 0, $19, $E8
	dc.b	$20, 2, 0, $1C, $E8
	dc.b	$F0, 4, 8, $13, 0
	dc.b	$E8, 3, 8, $15, $10
	dc.b	8, 2, 8, $19, $10
	dc.b	$20, 2, 8, $1C, $10
	dc.b	$D8, 0, 0, $2E, $D8
	dc.b	$E0, 5, 0, $2F, $D8
	dc.b	$F0, 4, 0, $33, $E0
	dc.b	$F8, 0, 0, $35, $E8
	dc.b	$D8, 0, 8, $2E, $20
	dc.b	$E0, 5, 8, $2F, $18
	dc.b	$F0, 4, 8, $33, $10
	dc.b	$F8, 0, 8, $35, $10
	dc.b	$F8, 9, 0, $D, $E8
	dc.b	$F8, 9, 8, $D, 0
	even

.Sprite2:
	dc.b	6
	dc.b	$E8, 3, 0, $15, $E8
	dc.b	8, 2, 0, $19, $E8
	dc.b	$20, 2, 0, $1C, $E8
	dc.b	$E8, 3, 8, $15, $10
	dc.b	8, 2, 8, $19, $10
	dc.b	$20, 2, 8, $1C, $10
	even

.Sprite3:
	dc.b	$12
	dc.b	$F0, 4, 0, $13, $F0
	dc.b	$E8, 3, 0, $15, $E8
	dc.b	8, 2, 0, $19, $E8
	dc.b	$20, 2, 0, $1C, $E8
	dc.b	$F0, 4, 8, $13, 0
	dc.b	$E8, 3, 8, $15, $10
	dc.b	8, 2, 8, $19, $10
	dc.b	$20, 2, 8, $1C, $10
	dc.b	$E0, 0, 0, $36, $E8
	dc.b	$E8, 4, 0, $37, $E0
	dc.b	$F0, 5, 0, $39, $D8
	dc.b	0, 0, 0, $3D, $D8
	dc.b	$E0, 0, 8, $36, $10
	dc.b	$E8, 4, 8, $37, $10
	dc.b	$F0, 5, 8, $39, $18
	dc.b	0, 0, 8, $3D, $20
	dc.b	$E5, 9, 0, $D, $E8
	dc.b	$E5, 9, 8, $D, 0
	even

.Sprite4:
	dc.b	$10
	dc.b	$F0, 4, 0, $13, $F0
	dc.b	$E8, 3, 0, $15, $E8
	dc.b	8, 2, 0, $19, $E8
	dc.b	$20, 2, 0, $1C, $E8
	dc.b	$F0, 4, 8, $13, 0
	dc.b	$E8, 3, 8, $15, $10
	dc.b	8, 2, 8, $19, $10
	dc.b	$20, 2, 8, $1C, $10
	dc.b	$D8, 7, 0, $3E, $E0
	dc.b	$F8, 6, 0, $46, $D8
	dc.b	$10, 0, 0, $4C, $D8
	dc.b	$D8, 7, 8, $3E, $10
	dc.b	$F8, 6, 8, $46, $18
	dc.b	$10, 0, 8, $4C, $20
	dc.b	$DD, 9, 0, $D, $E8
	dc.b	$DD, 9, 8, $D, 0
	even

.Sprite5:
	dc.b	2
	dc.b	$F0, 7, 0, $73, $F0
	dc.b	$F0, 7, 8, $73, 0
	even

.Sprite6:
	dc.b	6
	dc.b	$E8, 2, 0, $65, $F8
	dc.b	0, 2, 0, $68, $F8
	dc.b	$F0, 7, 0, $6B, $E8
	dc.b	$E8, 2, 8, $65, 0
	dc.b	0, 2, 8, $68, 0
	dc.b	$F0, 7, 8, $6B, 8
	even

.Sprite7:
	dc.b	$A
	dc.b	$E0, 3, 0, $4D, $F8
	dc.b	0, 3, 0, $51, $F8
	dc.b	$E8, 9, 0, $55, $E0
	dc.b	$F8, 5, 0, $5B, $E8
	dc.b	8, 9, 0, $5F, $E0
	dc.b	$E0, 3, 8, $4D, 0
	dc.b	0, 3, 8, $51, 0
	dc.b	$E8, 9, 8, $55, 8
	dc.b	$F8, 5, 8, $5B, 8
	dc.b	8, 9, 8, $5F, 8
	even

.Sprite8:
	dc.b	4
	dc.b	$F4, 0, 0, 0, $D8
	dc.b	$F4, $E, 0, 1, $E0
	dc.b	$F4, 0, 8, 0, $20
	dc.b	$F4, $E, 8, 1, 0

; ------------------------------------------------------------------------------
