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
	bsr.w	R81D_ApplyVerticalVelocity
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
	bsr.w	R81D_FacePlayer
	move.b	#$3C,$3F(a0)
	addq.b	#2,$24(a0)
	lea	$21E3CE,a1
	bra.w	R81D_CommonState

R81D_UpdateActive:
	bsr.w	R81D_SpawnChild
	lea	($FFFFD000).w,a1
	bsr.w	R81D_FacePlayer
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
	bsr.w	R81D_CheckPlayerCollision
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
	bsr.w	R81D_ApplyHorizontalVelocity
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
	bsr.w	R81D_SpawnChild
	lea	($FFFFD000).w,a1
	bset	#0,($FFFFF7CC).w
	move.w	#0,($FFFFF602).w
	move.b	#5,$1C(a1)
	bsr.w	R81D_FacePlayer
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
	bsr.w	R81D_SpawnChild
	lea	($FFFFD000).w,a1
	bsr.w	R81D_FacePlayer
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

R81D_CheckPlayerCollision:
	lea	($FFFFD000).w,a1
	tst.b	$FF1906
	bne.w	.Return
	btst	#0,$22(a1)
	bne.s	.PlayerFacingRight
	move.w	$8(a1),d0
	sub.w	$8(a0),d0
	bra.s	.CheckHorizontalRange
.PlayerFacingRight:
	move.w	$8(a0),d0
	sub.w	$8(a1),d0
.CheckHorizontalRange:
	bcs.w	.Return
	cmpi.w	#8,d0
	bcs.w	.Return
	cmpi.w	#$1C,d0
	bcc.s	.Return
	moveq	#8,d1
	move.w	$C(a1),d0
	sub.w	$C(a0),d0
	add.w	d1,d0
	bmi.s	.Return
	move.w	d1,d2
	add.w	d2,d2
	cmp.w	d2,d0
	bcc.s	.Return
	move.w	$10(a1),d0
	bpl.s	.CheckPlayerState
	neg.w	d0
.CheckPlayerState:
	btst	#1,$22(a1)
	bne.s	.SetAlternateState
	btst	#2,$22(a1)
	bne.s	.SetAlternateState
	bclr	#2,$22(a1)
	ori.b	#$81,$3E(a0)
	clr.w	$12(a0)
	clr.w	$10(a0)
	move.b	#7,$1A(a0)
	move.b	#$A,$24(a0)
	move.w	#$7C,d0
	jsr	$205AA4
.Return:
	rts
.SetAlternateState:
	move.b	#$E,$24(a0)
	rts

R81D_ApplyVelocity:
	bsr.s	R81D_ApplyHorizontalVelocity
R81D_ApplyVerticalVelocity:
	move.w	$12(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,$C(a0)
	rts

R81D_ApplyHorizontalVelocity:
	move.w	$10(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,$8(a0)
	rts

R81D_CommonState:
	moveq	#0,d0
	move.b	$1C(a0),d0
	cmp.b	$1D(a0),d0
	beq.s	.Advance
	move.b	d0,$1D(a0)
	clr.b	$1B(a0)
	clr.b	$1E(a0)
.Advance:
	subq.b	#1,$1E(a0)
	bpl.s	.Done
	add.w	d0,d0
	adda.w	(a1,d0.w),a1
.ReadFrame:
	move.b	$1B(a0),d0
	lea	(a1,d0.w),a2
	move.b	(a2),d0
	bpl.s	.SetFrame
	clr.b	$1B(a0)
	bra.s	.ReadFrame
.SetFrame:
	move.b	d0,d1
	andi.b	#$1F,d0
	move.b	d0,$1A(a0)
	move.b	$22(a0),d0
	rol.b	#3,d1
	eor.b	d0,d1
	andi.b	#3,d1
	andi.b	#$FC,$1(a0)
	or.b	d1,$1(a0)
	move.b	$1(a2),$1E(a0)
	addq.b	#2,$1B(a0)
.Done:
	rts

R81D_SpawnChild:
	addq.b	#6,$3B(a0)
	bcc.s	.Done
	jsr	$2077A4
	bne.s	.Done
	move.b	#$34,$0(a1)
	moveq	#8,d1
	btst	#0,$22(a0)
	beq.s	.CheckAlternateDirection
	move.w	#$FFF6,d1
.CheckAlternateDirection:
	btst	#0,$3E(a0)
	beq.s	.Position
	neg.w	d1
.Position:
	move.w	$8(a0),d0
	add.w	d1,d0
	move.w	d0,$8(a1)
	move.w	$C(a0),d0
	subi.w	#$C,d0
	move.w	d0,$C(a1)
.Done:
	rts

R81D_LoadPlayer:
	lea	($FFFFD000).w,a1
	rts

R81D_FacePlayer:
	bsr.s	R81D_ClearDirection
	move.w	$8(a0),d0
	sub.w	$8(a1),d0
	bcs.s	.Done
	bsr.s	R81D_SetDirection
.Done:
	rts

R81D_ClearDirection:
	bclr	#0,$22(a0)
	bclr	#0,$1(a0)
	rts

R81D_SetDirection:
	bset	#0,$22(a0)
	bset	#0,$1(a0)
	rts

R81D_LoadPalette:
	lea	.Palette(pc),a3
	lea	($FFFFFB20).w,a4
	movem.l	(a3)+,d0-d3
	movem.l	d0-d3,(a4)
	movem.l	(a3)+,d0-d3
	movem.l	d0-d3,$10(a4)
	rts

.Palette:
	dc.w	0, 0, $628, $84A, $E6E, $EAE, $EEE, $AAA
	dc.w	$888, $444, $8AE, $6C, $C2, $80, $806, $E

R81D_ChildObject:
	moveq	#0,d0
	move.b	$24(a0),d0
	move.w	.Index(pc,d0.w),d0
	jsr	.Index(pc,d0.w)
	jsr	$2038DA
	jmp	$2077DA

.Index:
	dc.w	.Init-.Index
	dc.w	.Update-.Index

.Init:
	addq.b	#2,$24(a0)
	ori.b	#4,$1(a0)
	move.w	#$3CB,$2(a0)
	move.l	#$21E278,$4(a0)
	move.b	#8,$1A(a0)
	move.w	#$FFA0,$12(a0)
	move.b	#3,$18(a0)
.Update:
	tst.b	$3C(a0)
	bne.s	.Move
	moveq	#0,d0
	move.b	$3A(a0),d0
	add.b	d0,d0
	add.b	$3A(a0),d0
	jsr	$2007C8
	asr.w	#2,d0
	move.w	d0,$10(a0)
.Move:
	bsr.w	R81D_ApplyVelocity
	addq.b	#1,$3A(a0)
	move.b	$3A(a0),d0
	cmpi.b	#$14,d0
	bne.s	.CheckStop
	addq.b	#1,$1A(a0)
.CheckStop:
	cmpi.b	#$6E,d0
	bne.s	.CheckDelete
	addq.b	#1,$1A(a0)
	clr.w	$12(a0)
	clr.w	$10(a0)
	st.b	$3C(a0)
.CheckDelete:
	cmpi.b	#$78,d0
	bne.s	.Done
	jmp	$203986
.Done:
	rts

R81D_OverlayObject:
	tst.b	$24(a0)
	bne.s	.Update
	addq.b	#2,$24(a0)
	ori.b	#4,$1(a0)
	move.b	#$20,$17(a0)
	move.b	#$20,$19(a0)
	move.b	#$11,$16(a0)
	move.l	#$20F4B4,$4(a0)
.Update:
	move.b	$FF1588,$1A(a0)
	tst.b	$FF1956
	beq.s	.CheckRelease
	lea	($FFFFD000).w,a1
	jsr	$207C36
	sne.b	$2A(a0)
	bra.s	.Display
.CheckRelease:
	tst.b	$2A(a0)
	beq.s	.Display
	clr.b	$2A(a0)
	lea	($FFFFD000).w,a1
	jsr	$207AE8
.Display:
	jsr	$2038DA
	jmp	$2077DA

R81D_OverlayMappings:
	dc.w	$0004, $0005, $0002, $F00F, $0000, $E0F0, $0F00, $0000

R81D_ExternalTrampoline:
	jmp	$206358

	incbin	"../padding/r81d_e_1.bin",$5A2
