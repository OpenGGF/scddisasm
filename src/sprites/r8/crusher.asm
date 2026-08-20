; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	4
	dc.b	$E1, $F, 0, 0, $E0
	dc.b	$E1, $F, 0, $10, 0
	dc.b	1, $F, $10, 0, $E0
	dc.b	1, $F, $10, $10, 0
	even
	
.Sprite1:
	dc.b	$C
	dc.b	$A1, $F, 0, 0, $E0
	dc.b	$A1, $F, 0, $10, 0
	dc.b	$C1, $F, $10, 0, $E0
	dc.b	$C1, $F, $10, $10, 0
	dc.b	$E1, $F, 0, 0, $E0
	dc.b	$E1, $F, 0, $10, 0
	dc.b	1, $F, $10, 0, $E0
	dc.b	1, $F, $10, $10, 0
	dc.b	$21, $F, 0, 0, $E0
	dc.b	$21, $F, 0, $10, 0
	dc.b	$41, $F, $10, 0, $E0
	dc.b	$41, $F, $10, $10, 0
	even

.Sprite2:
	dc.b	4
	dc.b	$ED, $F, 0, 0, $E0
	dc.b	$ED, $F, 0, $10, 0
	dc.b	$D, $F, 0, $20, $E0
	dc.b	$D, $F, 0, $30, 0
	even
	
.Sprite3:
	dc.b	0

; ------------------------------------------------------------------------------
