; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; KamaKama normal-variant mapping frames; each piece is
; Y, size/shape, tile high byte, tile low byte, X.
; Each frame begins with its piece count.
; ------------------------------------------------------------------------------
.Sprites:
	dc.w	.WalkA-.Sprites
	dc.w	.WalkB-.Sprites
	dc.w	.WalkC-.Sprites
	dc.w	.WalkD-.Sprites
	dc.w	.Throw-.Sprites
	dc.w	.WatchA-.Sprites
	dc.w	.WatchB-.Sprites
	dc.w	.Recover-.Sprites

.WalkA:
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

.WalkB:
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

.WalkC:
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

.WalkD:
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

.Throw:
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

.WatchA:
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

.WatchB:
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

.Recover:
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
