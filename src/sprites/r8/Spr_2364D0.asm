; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	$C
	dc.b	$C4, $F, 0, $C7, $C
	dc.b	$E4, $D, 0, $D7, $14
	dc.b	$F4, 0, 0, $DF, $2C
	dc.b	$24, 9, 0, $53, $F4
	dc.b	$DC, $D, 0, $59, $DC
	dc.b	$EC, $F, 0, 0, $DC
	dc.b	$C, $E, 0, $10, $DC
	dc.b	$DC, $F, 0, $1C, $FC
	dc.b	$FC, $F, 0, $2C, $FC
	dc.b	$1C, $C, 0, $3C, $FC
	dc.b	$E4, 3, 0, $40, $1C
	dc.b	4, 2, 0, $44, $1C
	dc.b	0

.Sprite1:
	dc.b	$C
	dc.b	$C4, $F, 0, $C7, $C
	dc.b	$E4, $D, 0, $D7, $14
	dc.b	$F4, 0, 0, $DF, $2C
	dc.b	$24, 9, 0, $53, $F4
	dc.b	$DC, $D, 0, $61, $DC
	dc.b	$EC, $F, 0, 0, $DC
	dc.b	$C, $E, 0, $10, $DC
	dc.b	$DC, $F, 0, $1C, $FC
	dc.b	$FC, $F, 0, $2C, $FC
	dc.b	$1C, $C, 0, $3C, $FC
	dc.b	$E4, 3, 0, $40, $1C
	dc.b	4, 2, 0, $44, $1C
	dc.b	0

.Sprite2:
	dc.b	$C
	dc.b	$C4, $F, 0, $C7, $C
	dc.b	$E4, $D, 0, $D7, $14
	dc.b	$F4, 0, 0, $DF, $2C
	dc.b	$24, 9, 0, $53, $F4
	dc.b	$DC, $D, 0, $69, $DC
	dc.b	$EC, $F, 0, 0, $DC
	dc.b	$C, $E, 0, $10, $DC
	dc.b	$DC, $F, 0, $1C, $FC
	dc.b	$FC, $F, 0, $2C, $FC
	dc.b	$1C, $C, 0, $3C, $FC
	dc.b	$E4, 3, 0, $40, $1C
	dc.b	4, 2, 0, $44, $1C
	dc.b	0

.Sprite3:
	dc.b	8
	dc.b	$DC, $F, 0, $71, $DC
	dc.b	$DC, $F, 0, $81, $FC
	dc.b	$DC, 3, 0, $91, $1C
	dc.b	$FC, $F, 0, $95, $DC
	dc.b	$FC, $F, 0, $A5, $FC
	dc.b	$FC, 3, 0, $B5, $1C
	dc.b	$1C, $C, 0, $B9, $DC
	dc.b	$1C, $C, 0, $BD, $FC
	dc.b	0

; ------------------------------------------------------------------------------
