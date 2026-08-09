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

.Sprite0:
	dc.b	9
	dc.b	$E0, 9, $20, $80, $E8
	dc.b	$E0, 9, $28, $80, 0
	dc.b	$D0, $D, 0, $D6, $F0
	dc.b	$F0, $F, 0, $86, $C0
	dc.b	$F0, $F, 0, $96, $E0
	dc.b	$F0, $F, 0, $96, 0
	dc.b	$F0, $F, 0, $96, $20
	dc.b	$E0, $F, $20, $64, $D0
	dc.b	$E0, $F, $28, $64, $10

.Sprite1:
	dc.b	9
	dc.b	$E0, 9, $20, $80, $E8
	dc.b	$E0, 9, $28, $80, 0
	dc.b	$D0, $D, 0, $D6, $F0
	dc.b	$F0, $F, 0, $C6, $C0
	dc.b	$F0, $F, 0, $C6, $E0
	dc.b	$F0, $F, 0, $C6, 0
	dc.b	$F0, $F, 0, $C6, $20
	dc.b	$E0, $F, $20, $64, $D0
	dc.b	$E0, $F, $28, $64, $10

.Sprite2:
	dc.b	6
	dc.b	$F0, $F, 0, $86, $C0
	dc.b	$F0, $F, 0, $96, $E0
	dc.b	$F0, $F, 0, $96, 0
	dc.b	$F0, $F, 0, $96, $20
	dc.b	$E0, $F, $20, $64, $D0
	dc.b	$E0, $F, $28, $64, $10

.Sprite3:
	dc.b	6
	dc.b	$F0, $F, 0, $C6, $C0
	dc.b	$F0, $F, 0, $C6, $E0
	dc.b	$F0, $F, 0, $C6, 0
	dc.b	$F0, $F, 0, $C6, $20
	dc.b	$E0, $F, $20, $64, $D0
	dc.b	$E0, $F, $28, $64, $10

.Sprite4:
	dc.b	6
	dc.b	$F0, $F, 0, $86, $C0
	dc.b	$F0, $F, 0, $96, $E0
	dc.b	$F0, $F, 0, $96, 0
	dc.b	$F0, $F, 0, $96, $20
	dc.b	$E0, $E, $20, $74, $D0
	dc.b	$E0, $E, $28, $74, $10

.Sprite5:
	dc.b	6
	dc.b	$F0, $F, 0, $C6, $C0
	dc.b	$F0, $F, 0, $C6, $E0
	dc.b	$F0, $F, 0, $C6, 0
	dc.b	$F0, $F, 0, $C6, $20
	dc.b	$E0, $E, $20, $74, $D0
	dc.b	$E0, $E, $28, $74, $10

.Sprite6:
	dc.b	4
	dc.b	$F0, $F, 0, $86, $C0
	dc.b	$F0, $F, 0, $96, $E0
	dc.b	$F0, $F, 0, $96, 0
	dc.b	$F0, $F, 0, $96, $20

; ------------------------------------------------------------------------------
