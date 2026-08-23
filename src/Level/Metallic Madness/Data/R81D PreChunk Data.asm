; ------------------------------------------------------------------------------
; R81D non-USA pre-chunk code and data.
; ------------------------------------------------------------------------------

R81D_SpawnObject:
	move.b	#$6,$1C(a0)
	tst.b	$21(a0)
	beq.s	.NoSpawn
	jsr	$2077A4
	bne.s	.Done
	move.b	#$18,$0(a1)
	move.b	#$1,$25(a1)
	move.w	$8(a0),$8(a1)
	move.w	$C(a0),$C(a1)
	move.w	#$9E,d0
	jsr	$2022C4
.Done:
	lea	($FFFFD000).w,a1
	neg.w	$12(a1)
	addq.b	#2,$24(a0)
	move.w	#$258,$30(a0)
	rts

.NoSpawn:
	lea	$21E3CE,a1
	bra.w	R81D_CommonState

R81D_UpdateFalling:
	tst.b	$3C(a0)
	bmi.s	.NegativeState
	addi.w	#$10,$12(a0)
	bsr.w	R81D_Sub_352
	move.w	$C(a0),d0
	cmpi.w	#$1D0,d0
	bcs.s	.Done
	move.w	#$1D0,$C(a0)
	clr.w	$12(a0)
	move.b	#$FF,$3C(a0)
.Done:
	rts

.NegativeState:
	lea	($FFFFD000).w,a1
	bsr.w	R81D_Sub_41A
	move.b	#$3C,$3F(a0)
	addq.b	#2,$24(a0)
	lea	$21E3CE,a1
	bra.w	R81D_CommonState

	incbin	"../padding/r81d_e_1.bin",$9C,$2B6
R81D_Sub_352:
	incbin	"../padding/r81d_e_1.bin",$352,$1C
R81D_CommonState:
	incbin	"../padding/r81d_e_1.bin",$36E,$AC
R81D_Sub_41A:
	incbin	"../padding/r81d_e_1.bin",$41A
