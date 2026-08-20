; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites

.Sprite0:
	dc.b	7
	dc.b	$D4, 2, 0, $55, $FC
	dc.b	3, $E, 0, 0, $F4
	dc.b	$13, 4, 0, $C, $E4
	dc.b	$EC, $F, 0, $34, $EC
	dc.b	$EC, 3, 0, $44, $C
	dc.b	$C, $C, 0, $48, $EC
	dc.b	$C, 0, 0, $4C, $C

.Sprite1:
	dc.b	7
	dc.b	$D2, 2, 0, $55, $FC
	dc.b	3, $E, 0, $E, $FC
	dc.b	$B, 5, 0, $1A, $EC
	dc.b	$EA, $F, 0, $34, $EC
	dc.b	$EA, 3, 0, $44, $C
	dc.b	$A, $C, 0, $48, $EC
	dc.b	$A, 0, 0, $4C, $C

.Sprite2:
	dc.b	7
	dc.b	$D4, 2, 0, $55, $FC
	dc.b	3, $A, 0, $1E, $FC
	dc.b	$13, 4, 0, $27, $EC
	dc.b	$EC, $F, 0, $34, $EC
	dc.b	$EC, 3, 0, $44, $C
	dc.b	$C, $C, 0, $48, $EC
	dc.b	$C, 0, 0, $4C, $C

.Sprite3:
	dc.b	7
	dc.b	$D2, 2, 0, $55, $FC
	dc.b	3, $A, 0, $29, $FC
	dc.b	$B, 1, 0, $32, $F4
	dc.b	$EA, $F, 0, $34, $EC
	dc.b	$EA, 3, 0, $44, $C
	dc.b	$A, $C, 0, $48, $EC
	dc.b	$A, 0, 0, $4C, $C

.Sprite4:
	dc.b	6
	dc.b	3, $E, 0, 0, $F4
	dc.b	$13, 4, 0, $C, $E4
	dc.b	$EC, $F, 0, $34, $EC
	dc.b	$EC, 3, 0, $44, $C
	dc.b	$C, $C, 0, $48, $EC
	dc.b	$C, 0, 0, $4C, $C

; ------------------------------------------------------------------------------
