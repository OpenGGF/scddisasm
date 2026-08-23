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

R81D_UpdateActive:
	bsr.w	R81D_Sub_3D0
	lea	($FFFFD000).w,a1
	bsr.w	R81D_Sub_41A
	tst.w	$30(a0)
	beq.s	.CheckTurnDelay
	subq.w	#1,$30(a0)
	beq.w	.Finish
.CheckTurnDelay:
	tst.b	$3F(a0)
	beq.s	.CheckPlayer
	subq.b	#1,$3F(a0)
	bne.s	.Accelerate
.CheckPlayer:
	bsr.w	R81D_Sub_2B4
	btst	#2,$3E(a0)
	bne.w	.CheckDetach
	tst.w	$10(a1)
	bne.s	.Accelerate
	move.w	$8(a1),d0
	sub.w	$8(a0),d0
	bcc.s	.CheckAttachDistance
	neg.w	d0
.CheckAttachDistance:
	cmpi.w	#$A,d0
	bcc.s	.Accelerate
.Attach:
	bset	#2,$3E(a0)
	clr.w	$10(a0)
	bra.w	.SetIdleAnimation
.CheckDetach:
	move.w	$8(a1),d0
	sub.w	$8(a0),d0
	bcc.s	.CheckDetachDistance
	neg.w	d0
.CheckDetachDistance:
	cmpi.w	#$20,d0
	bcs.s	.Attach
	bclr	#2,$3E(a0)
.Accelerate:
	move.w	#$FFE0,d0
	btst	#0,$22(a0)
	bne.s	.ApplyAcceleration
	neg.w	d0
.ApplyAcceleration:
	add.w	$10(a0),d0
	move.w	d0,d1
	move.w	#$280,d2
	tst.w	d1
	bpl.s	.CheckMaximumSpeed
	neg.w	d1
	neg.w	d2
.CheckMaximumSpeed:
	cmpi.w	#$280,d1
	bcs.s	.StoreSpeed
	move.w	d2,d0
.StoreSpeed:
	move.w	d0,$10(a0)
	tst.w	$10(a0)
	bpl.s	.Move
	move.w	#$60,d1
	tst.b	$FF156A
	bne.s	.CheckLeftBoundary
	move.w	#$80,d1
.CheckLeftBoundary:
	move.w	$36(a0),d0
	sub.w	d1,d0
	cmp.w	$8(a0),d0
	bcs.s	.Move
	bra.w	.Stop
.Move:
	jsr	$206A0A
	cmpi.w	#7,d1
	bpl.s	.UpdateAnimation
	cmpi.w	#$FFF9,d1
	bmi.s	.UpdateAnimation
	add.w	d1,$C(a0)
.UpdateAnimation:
	bsr.w	R81D_Sub_360
	move.b	#2,$1C(a0)
	lea	$21E3CE,a1
	bra.w	R81D_CommonState
.Stop:
	clr.w	$10(a0)
.SetIdleAnimation:
	move.b	#1,$1C(a0)
	lea	$21E3CE,a1
	bra.w	R81D_CommonState
.Finish:
	move.b	#$FF,$38(a0)
	clr.b	$FF1510
	move.b	#1,$2A(a0)
	jmp	$20A0EC

R81D_StartJump:
	move.b	#6,$1A(a0)
	move.w	#$80,d0
	btst	#0,$22(a0)
	bne.s	.SetHorizontalSpeed
	neg.w	d0
.SetHorizontalSpeed:
	move.w	d0,$10(a0)
	move.w	$8(a0),d0
	sub.w	$36(a0),d0
	bcc.s	.CheckHorizontalDistance
	neg.w	d0
.CheckHorizontalDistance:
	cmpi.w	#$80,d0
	bcs.s	.SetVerticalSpeed
	clr.w	$10(a0)
.SetVerticalSpeed:
	move.w	#$FD00,$12(a0)
	addq.b	#2,$24(a0)

R81D_UpdateJump:
	bsr.w	R81D_ApplyVelocity
	addi.w	#$40,$12(a0)
	tst.w	$12(a0)
	bmi.s	.CheckFloor
	move.b	#7,$1A(a0)
.CheckFloor:
	move.w	$C(a0),d0
	cmpi.w	#$1D0,d0
	bcs.s	.Done
	move.w	#$1D0,$C(a0)
	clr.w	$10(a0)
	clr.w	$12(a0)
	addi.b	#$10,$3A(a0)
	bcc.s	.Done
	move.b	#4,$24(a0)
.Done:
	rts

R81D_SyncWithPlayer:
	bsr.w	R81D_Sub_3D0
	lea	($FFFFD000).w,a1
	bset	#0,($FFFFF7CC).w
	move.w	#0,($FFFFF602).w
	move.b	#5,$1C(a1)
	bsr.w	R81D_Sub_41A
	moveq	#$C,d0
	btst	#0,$22(a1)
	bne.s	.Position
	neg.w	d0
.Position:
	add.w	$8(a1),d0
	move.w	d0,$8(a0)
	move.w	$C(a1),$C(a0)
	move.b	#$E,$1A(a0)
	tst.b	$38(a0)
	bne.s	.Done
	clr.b	$FF1510
	move.b	#1,$2A(a0)
	jmp	$20A0EC
.Done:
	rts

R81D_SyncPlayerX:
	bsr.w	R81D_Sub_3D0
	lea	($FFFFD000).w,a1
	bsr.w	R81D_Sub_41A
	moveq	#$C,d0
	btst	#0,$22(a1)
	bne.s	.Position
	neg.w	d0
.Position:
	add.w	$8(a1),d0
	nop
	nop
	nop
	nop
	move.w	d0,$8(a0)
	move.b	#$E,$1A(a0)
	rts

R81D_Sub_2B4:
	incbin	"../padding/r81d_e_1.bin",$2B4,$9C
R81D_ApplyVelocity:
	incbin	"../padding/r81d_e_1.bin",$350,$2
R81D_Sub_352:
	incbin	"../padding/r81d_e_1.bin",$352,$E
R81D_Sub_360:
	incbin	"../padding/r81d_e_1.bin",$360,$E
R81D_CommonState:
	incbin	"../padding/r81d_e_1.bin",$36E,$62
R81D_Sub_3D0:
	incbin	"../padding/r81d_e_1.bin",$3D0,$4A
R81D_Sub_41A:
	incbin	"../padding/r81d_e_1.bin",$41A
