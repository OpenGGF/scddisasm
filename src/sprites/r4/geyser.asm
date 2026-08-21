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
	dc.b	$B0, $B, $80, 0, $C8
	dc.b	$B0, $F, $80, $C, $E0
	dc.b	$B0, $F, $80, $C, 0
	dc.b	$B0, $B, $88, 0, $20
	dc.b	$30, $B, 0, 0, $C8
	dc.b	$30, $F, 0, $C, $E0
	dc.b	$30, $F, 0, $C, 0
	dc.b	$30, $B, 8, 0, $20
	dc.b	$C0, $F, 0, $1C, $E0
	dc.b	$C0, $F, 0, $1C, 0
	dc.b	$E0, $F, 0, $1C, $E0
	dc.b	$E0, $F, 0, $1C, 0
	dc.b	0, $F, 0, $1C, $E0
	dc.b	0, $F, 0, $1C, 0
	dc.b	$20, $F, 0, $1C, $E0
	dc.b	$20, $F, 0, $1C, 0
	even

.Sprite1:
	dc.b	$10
	dc.b	$B0, $B, $80, 0, $C8
	dc.b	$B0, $F, $80, $C, $E0
	dc.b	$B0, $F, $98, $C, 0
	dc.b	$B0, $B, $88, 0, $20
	dc.b	$30, $B, 0, 0, $C8
	dc.b	$30, $F, 0, $C, $E0
	dc.b	$30, $F, $18, $C, 0
	dc.b	$30, $B, 8, 0, $20
	dc.b	$C0, $F, 0, $1C, $E0
	dc.b	$C0, $F, 0, $1C, 0
	dc.b	$E0, $F, 0, $1C, $E0
	dc.b	$E0, $F, 0, $1C, 0
	dc.b	0, $F, 0, $1C, $E0
	dc.b	0, $F, 0, $1C, 0
	dc.b	$20, $F, 0, $1C, $E0
	dc.b	$20, $F, 0, $1C, 0
	even

.Sprite2:
	dc.b	$10
	dc.b	$B0, $B, $90, 0, $C8
	dc.b	$B0, $F, $88, $C, $E0
	dc.b	$B0, $F, $98, $C, 0
	dc.b	$B0, $B, $98, 0, $20
	dc.b	$30, $B, $10, 0, $C8
	dc.b	$30, $F, 8, $C, $E0
	dc.b	$30, $F, $18, $C, 0
	dc.b	$30, $B, $18, 0, $20
	dc.b	$C0, $F, 0, $1C, $E0
	dc.b	$C0, $F, 0, $1C, 0
	dc.b	$E0, $F, 0, $1C, $E0
	dc.b	$E0, $F, 0, $1C, 0
	dc.b	0, $F, 0, $1C, $E0
	dc.b	0, $F, 0, $1C, 0
	dc.b	$20, $F, 0, $1C, $E0
	dc.b	$20, $F, 0, $1C, 0
	even

.Sprite3:
	dc.b	$10
	dc.b	$B0, $B, $90, 0, $C8
	dc.b	$B0, $F, $90, $C, $E0
	dc.b	$B0, $F, $80, $C, 0
	dc.b	$B0, $B, $98, 0, $20
	dc.b	$30, $B, $10, 0, $C8
	dc.b	$30, $F, $10, $C, $E0
	dc.b	$30, $F, 0, $C, 0
	dc.b	$30, $B, $18, 0, $20
	dc.b	$C0, $F, 0, $1C, $E0
	dc.b	$C0, $F, 0, $1C, 0
	dc.b	$E0, $F, 0, $1C, $E0
	dc.b	$E0, $F, 0, $1C, 0
	dc.b	0, $F, 0, $1C, $E0
	dc.b	0, $F, 0, $1C, 0
	dc.b	$20, $F, 0, $1C, $E0
	dc.b	$20, $F, 0, $1C, 0
	even

.Sprite4:
	dc.b	$10
	dc.b	$B0, $B, $80, 0, $C8
	dc.b	$B0, $F, $98, $C, $E0
	dc.b	$B0, $F, $88, $C, 0
	dc.b	$B0, $B, $88, 0, $20
	dc.b	$30, $B, 0, 0, $C8
	dc.b	$30, $F, $18, $C, $E0
	dc.b	$30, $F, 8, $C, 0
	dc.b	$30, $B, 8, 0, $20
	dc.b	$C0, $F, 0, $1C, $E0
	dc.b	$C0, $F, 0, $1C, 0
	dc.b	$E0, $F, 0, $1C, $E0
	dc.b	$E0, $F, 0, $1C, 0
	dc.b	0, $F, 0, $1C, $E0
	dc.b	0, $F, 0, $1C, 0
	dc.b	$20, $F, 0, $1C, $E0
	dc.b	$20, $F, 0, $1C, 0
	even

.Sprite5:
	dc.b	1
	dc.b	$F0, $F, 0, $2C, $F0
	even

.Sprite6:
	dc.b	1
	dc.b	$F0, $F, $10, $2C, $F0
	even

.Sprite7:
	dc.b	1
	dc.b	$F0, $F, 8, $2C, $F0
	even

.Sprite8:
	dc.b	1
	dc.b	$F0, $F, $18, $2C, $F0

; ------------------------------------------------------------------------------
