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

.Sprite0:
	dc.b	$A
	dc.b	$EC, 4, 0, 0, $EE
	dc.b	$F4, 0, 0, 2, $EE
	dc.b	$F4, 0, 0, 3, $F6
	dc.b	$FC, 1, 0, 8, $F4
	dc.b	$FC, 4, 0, $A, $FC
	dc.b	4, 0, 0, $C, $FC
	dc.b	4, 0, 0, $D, 4
	dc.b	4, 0, 0, $E, $FE
	dc.b	4, 0, 0, $F, 6
	dc.b	$C, 4, 0, $10, $FE
	even

.Sprite1:
	dc.b	$A
	dc.b	$ED, 4, 0, 0, $EE
	dc.b	$F5, 0, 0, 2, $EE
	dc.b	$F5, 0, 0, 3, $F6
	dc.b	$FD, 1, 0, 8, $F4
	dc.b	$FD, 4, 0, $A, $FC
	dc.b	5, 0, 0, $C, $FC
	dc.b	5, 0, 0, $D, 4
	dc.b	4, 0, 0, $E, $FE
	dc.b	4, 0, 0, $12, 6
	dc.b	$C, 4, 0, $13, $FE
	even

.Sprite2:
	dc.b	8
	dc.b	$EC, 4, 0, 0, $EE
	dc.b	$F4, 0, 0, 2, $EE
	dc.b	$F4, 0, 0, 3, $F6
	dc.b	$FC, 1, 0, 8, $F4
	dc.b	$FC, 4, 0, $A, $FC
	dc.b	4, 0, 0, $C, $FC
	dc.b	4, 0, 0, $D, 4
	dc.b	4, 5, 0, $15, $FE
	even

.Sprite3:
	dc.b	$A
	dc.b	$ED, 4, 0, 0, $EE
	dc.b	$F5, 0, 0, 2, $EE
	dc.b	$F5, 0, 0, 3, $F6
	dc.b	$FD, 1, 0, 8, $F4
	dc.b	$FD, 4, 0, $A, $FC
	dc.b	5, 0, 0, $C, $FC
	dc.b	5, 0, 0, $D, 4
	dc.b	4, 0, 0, $E, $FE
	dc.b	4, 0, 0, $12, 6
	dc.b	$C, 4, 0, $13, $FE
	even

.Sprite4:
	dc.b	$A
	dc.b	$ED, 4, 0, 0, $EE
	dc.b	$F5, 0, 0, 2, $EE
	dc.b	$F5, 0, 0, 3, $F6
	dc.b	$FD, 1, 0, 8, $F4
	dc.b	$FD, 4, 0, $A, $FC
	dc.b	5, 0, 0, $C, $FC
	dc.b	5, 0, 0, $D, 4
	dc.b	4, 0, 0, $E, $FE
	dc.b	4, 0, 0, $12, 6
	dc.b	$C, 4, 0, $13, $FE
	even

.Sprite5:
	dc.b	$C
	dc.b	$EC, 4, 0, 0, $EE
	dc.b	$F4, 0, 0, 2, $EE
	dc.b	$F4, 0, 0, 3, $F6
	dc.b	$F4, 5, 8, $19, $F0
	dc.b	$F6, 5, 8, $19, $E8
	dc.b	$FC, 1, 0, 8, $F4
	dc.b	$FC, 4, 0, $A, $FC
	dc.b	4, 0, 0, $C, $FC
	dc.b	4, 0, 0, $D, 4
	dc.b	4, 0, 0, $E, $FE
	dc.b	4, 0, 0, $F, 6
	dc.b	$C, 4, 0, $10, $FE
	even

.Sprite6:
	dc.b	$C
	dc.b	$ED, 4, 0, 0, $EE
	dc.b	$F5, 0, 0, 2, $EE
	dc.b	$F5, 0, 0, 3, $F6
	dc.b	$F6, 5, 8, $19, $F0
	dc.b	$F5, 5, 8, $19, $E8
	dc.b	$FD, 1, 0, 8, $F4
	dc.b	$FD, 4, 0, $A, $FC
	dc.b	5, 0, 0, $C, $FC
	dc.b	5, 0, 0, $D, 4
	dc.b	4, 0, 0, $E, $FE
	dc.b	4, 0, 0, $12, 6
	dc.b	$C, 4, 0, $13, $FE
	even

.Sprite7:
	dc.b	8
	dc.b	$EC, 5, 0, 4, $EE
	dc.b	$FC, 1, 0, 8, $F4
	dc.b	$FC, 4, 0, $A, $FC
	dc.b	4, 0, 0, $C, $FC
	dc.b	4, 0, 0, $D, 4
	dc.b	4, 0, 0, $E, $FE
	dc.b	4, 0, 0, $F, 6
	dc.b	$C, 4, 0, $10, $FE

; ------------------------------------------------------------------------------
