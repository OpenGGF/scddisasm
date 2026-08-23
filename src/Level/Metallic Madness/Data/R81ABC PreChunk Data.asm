; -------------------------------------------------------------------------
; Shared R81A/R81B/R81C non-USA pre-chunk data
; -------------------------------------------------------------------------

R81ABC_CopyRecordTail:
	move.w	(a2)+,$12(a1)
	move.w	(a2)+,$30(a1)
	move.w	(a2)+,$32(a1)
	addq.w	#8,d4
R81ABC_CopyLoopBack equ *-$62
	dbra	d3,R81ABC_CopyLoopBack
	tst.b	$35(a0)
	beq.s	.Done
	lea	($FFFFD000).w,a1
	jsr	$207AE8
.Done:
	jmp	$203986

	include	"Level/Metallic Madness/Data/R81ABC Retained Blink Display.asm"

R81ABC_FindMarker:
	lea	($FFFFD080).w,a1
	moveq	#$7D,d1
.Loop:
	cmp.b	$0(a1),d0
	bne.s	.Done
	rts
.Done:
	adda.w	#$40,a1
	dbra	d1,.Loop
	moveq	#$FF,d1
	rts

R81ABC_RetainedMarkerMappings:
	dc.w	$0004, $000A
	dc.w	$01F0, $0F00, $00F0
	dc.w	$01F0, $0300, $00FC

R81ABC_Object:
	moveq	#0,d0
	move.b	$24(a0),d0
	move.w	.Index(pc,d0.w),d0
	jsr	.Index(pc,d0.w)
	jsr	$2038DA
	jsr	$2077DA
	cmpi.b	#$33,$0(a0)
	beq.s	.Done
	lea	$200716,a3
	bsr.w	R81ABC_LoadPaletteFromA3
.Done:
	rts

.Index:
	dc.w	R81ABC_Init-.Index
	dc.w	R81ABC_State_174-.Index
	dc.w	R81ABC_State_1BC-.Index
	dc.w	R81ABC_State_1BC-.Index
	dc.w	R81ABC_State_30E-.Index
	dc.w	R81ABC_State_34C-.Index
	dc.w	R81ABC_State_3A4-.Index
	dc.w	R81ABC_State_2D6-.Index
	dc.w	R81ABC_State_30E-.Index

R81ABC_Init:
	ori.b	#4,$1(a0)
	move.w	#$A3CB,$2(a0)
	move.b	#1,$18(a0)
	move.l	#$21E278,$4(a0)
	move.b	#$C,$19(a0)
	move.b	#$10,$16(a0)
	move.w	$8(a0),$36(a0)
	move.b	#$F5,$20(a0)
	tst.b	$FF156A
	bne.s	R81ABC_Main
	move.w	#$3F43,$8(a0)
	move.w	#$1AB,$C(a0)

R81ABC_Main:
	lea	($FFFFD000).w,a1
	move.w	$8(a1),d0
	sub.w	$8(a0),d0
	bcc.s	.DistanceReady
	neg.w	d0
.DistanceReady:
	move.b	#6,$1C(a0)
	tst.b	$21(a0)
	beq.s	.NoSpawn
	jsr	$2077A4
	bne.s	.Done
	move.b	#$18,$0(a1)
	move.b	#1,$25(a1)
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
	bra.w	R81ABC_Animate
R81ABC_State_174:
	tst.b	$3C(a0)
	bmi.s	.Falling
	addi.w	#$10,$12(a0)
	bsr.w	R81ABC_ApplyVerticalVelocity
	move.w	$C(a0),d0
	cmpi.w	#$1D0,d0
	bcs.s	.Done
	move.w	#$1D0,$C(a0)
	clr.w	$12(a0)
	move.b	#$FF,$3C(a0)
.Done:
	rts
.Falling:
	lea	($FFFFD000).w,a1
	bsr.w	R81ABC_FacePlayer
	move.b	#$3C,$3F(a0)
	addq.b	#2,$24(a0)
	lea	$21E3CE,a1
	bra.w	R81ABC_Animate
R81ABC_State_1BC:
	bsr.w	R81ABC_SpawnChild
	lea	($FFFFD000).w,a1
	bsr.w	R81ABC_FacePlayer
	tst.w	$30(a0)
	beq.s	.CheckDelay
	subq.w	#1,$30(a0)
	beq.w	.Delete
.CheckDelay:
	tst.b	$3F(a0)
	beq.s	.CheckCollision
	subq.b	#1,$3F(a0)
	bne.s	.Move
.CheckCollision:
	bsr.w	R81ABC_CheckPlayerCollision
	btst	#2,$3E(a0)
	bne.w	.WideRange
	tst.w	$10(a1)
	bne.s	.Move
	move.w	$8(a1),d0
	sub.w	$8(a0),d0
	bcc.s	.PositiveDistance
	neg.w	d0
.PositiveDistance:
	cmpi.w	#$A,d0
	bcc.s	.Move
.SetContact:
	bset	#2,$3E(a0)
	clr.w	$10(a0)
	bra.w	.SetStoppedAnimation
.WideRange:
	move.w	$8(a1),d0
	sub.w	$8(a0),d0
	bcc.s	.PositiveWideDistance
	neg.w	d0
.PositiveWideDistance:
	cmpi.w	#$20,d0
	bcs.s	.SetContact
	bclr	#2,$3E(a0)
.Move:
	move.w	#$FFE0,d0
	btst	#0,$22(a0)
	bne.s	.FacingLeft
	neg.w	d0
.FacingLeft:
	add.w	$10(a0),d0
	move.w	d0,d1
	move.w	#$280,d2
	tst.w	d1
	bpl.s	.PositiveSpeed
	neg.w	d1
	neg.w	d2
.PositiveSpeed:
	cmpi.w	#$280,d1
	bcs.s	.StoreSpeed
	move.w	d2,d0
.StoreSpeed:
	move.w	d0,$10(a0)
	tst.w	$10(a0)
	bpl.s	.CheckPlayer
	move.w	#$60,d1
	tst.b	$FF156A
	bne.s	.GotStopDistance
	move.w	#$80,d1
.GotStopDistance:
	move.w	$36(a0),d0
	sub.w	d1,d0
	cmp.w	$8(a0),d0
	bcs.s	.CheckPlayer
	bra.w	.Stop
.CheckPlayer:
	jsr	$206A0A
	cmpi.w	#7,d1
	bpl.s	.SetMovingAnimation
	cmpi.w	#-7,d1
	bmi.s	.SetMovingAnimation
	add.w	d1,$C(a0)
.SetMovingAnimation:
	bsr.w	R81ABC_ApplyHorizontalVelocity
	move.b	#2,$1C(a0)
	lea	$21E3CE,a1
	bra.w	R81ABC_Animate
.Stop:
	clr.w	$10(a0)
.SetStoppedAnimation:
	move.b	#1,$1C(a0)
	lea	$21E3CE,a1
	bra.w	R81ABC_Animate
.Delete:
	move.b	#$FF,$38(a0)
	clr.b	$FF1510
	move.b	#1,$2A(a0)
	jmp	$20A0EC
R81ABC_State_2D6:
	move.b	#6,$1A(a0)
	move.w	#$80,d0
	btst	#0,$22(a0)
	bne.s	.FacingLeft
	neg.w	d0
.FacingLeft:
	move.w	d0,$10(a0)
	move.w	$8(a0),d0
	sub.w	$36(a0),d0
	bcc.s	.PositiveDistance
	neg.w	d0
.PositiveDistance:
	cmpi.w	#$80,d0
	bcs.s	.Accelerate
	clr.w	$10(a0)
.Accelerate:
	move.w	#$FD00,$12(a0)
	addq.b	#2,$24(a0)
R81ABC_State_30E:
	bsr.w	R81ABC_ApplyVelocity
	addi.w	#$40,$12(a0)
	tst.w	$12(a0)
	bmi.s	.CheckPosition
	move.b	#7,$1A(a0)
.CheckPosition:
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
R81ABC_State_34C:
	bsr.w	R81ABC_SpawnChild
	lea	($FFFFD000).w,a1
	bset	#0,($FFFFF7CC).w
	move.w	#0,($FFFFF602).w
	move.b	#5,$1C(a1)
	bsr.w	R81ABC_FacePlayer
	moveq	#$C,d0
	btst	#0,$22(a1)
	bne.s	.FacingLeft
	neg.w	d0
.FacingLeft:
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
R81ABC_State_3A4:
	bsr.w	R81ABC_SpawnChild
	lea	($FFFFD000).w,a1
	bsr.w	R81ABC_FacePlayer
	moveq	#$C,d0
	btst	#0,$22(a1)
	bne.s	.FacingLeft
	neg.w	d0
.FacingLeft:
	add.w	$8(a1),d0
	nop
	nop
	nop
	nop
	move.w	d0,$8(a0)
	move.b	#$E,$1A(a0)
	rts
R81ABC_CheckPlayerCollision:
	lea	($FFFFD000).w,a1
	tst.b	$FF1906
	bne.w	.Done
	btst	#0,$22(a1)
	bne.s	.PlayerFacingLeft
	move.w	$8(a1),d0
	sub.w	$8(a0),d0
	bra.s	.CheckHorizontalDistance
.PlayerFacingLeft:
	move.w	$8(a0),d0
	sub.w	$8(a1),d0
.CheckHorizontalDistance:
	bcs.w	.Done
	cmpi.w	#8,d0
	bcs.w	.Done
	cmpi.w	#$1C,d0
	bcc.s	.Done
	moveq	#8,d1
	move.w	$C(a1),d0
	sub.w	$C(a0),d0
	add.w	d1,d0
	bmi.s	.Done
	move.w	d1,d2
	add.w	d2,d2
	cmp.w	d2,d0
	bcc.s	.Done
	move.w	$10(a1),d0
	bpl.s	.PositiveSpeed
	neg.w	d0
.PositiveSpeed:
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
.Done:
	rts
.SetAlternateState:
	move.b	#$E,$24(a0)
	rts

R81ABC_ApplyVelocity:
	bsr.s	R81ABC_ApplyHorizontalVelocity
R81ABC_ApplyVerticalVelocity:
	move.w	$12(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,$C(a0)
	rts

R81ABC_ApplyHorizontalVelocity:
	move.w	$10(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,$8(a0)
	rts

R81ABC_Animate:
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

R81ABC_SpawnChild:
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

R81ABC_LoadPlayer:
	lea	($FFFFD000).w,a1
	rts

R81ABC_FacePlayer:
	bsr.s	R81ABC_ClearDirection
	move.w	$8(a0),d0
	sub.w	$8(a1),d0
	bcs.s	.Done
	bsr.s	R81ABC_SetDirection
.Done:
	rts

R81ABC_ClearDirection:
	bclr	#0,$22(a0)
	bclr	#0,$1(a0)
	rts

R81ABC_SetDirection:
	bset	#0,$22(a0)
	bset	#0,$1(a0)
	rts

R81ABC_LoadPalette:
	lea	R81ABC_Palette(pc),a3
R81ABC_LoadPaletteFromA3:
	lea	($FFFFFB20).w,a4
	movem.l	(a3)+,d0-d3
	movem.l	d0-d3,(a4)
	movem.l	(a3)+,d0-d3
	movem.l	d0-d3,$10(a4)
	rts

R81ABC_Palette:
	dc.w	0, 0, $628, $84A, $E6E, $EAE, $EEE, $AAA
	dc.w	$888, $444, $8AE, $6C, $C2, $80, $806, $E

R81ABC_ChildObject:
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
	bsr.w	R81ABC_ApplyVelocity
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

R81ABC_OverlayObject:
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

R81ABC_OverlayMappings:
	dc.w	$0004, $0005, $0002, $F00F, $0000, $E0F0, $0F00, $0000

R81ABC_ExternalTrampoline:
	jmp	$206358

	incbin	"../padding/r81a_e_1.bin",$6C2,$2BC

R81ABC_BossObject:
	jsr	$20EC94
	moveq	#0,d0
	move.b	$24(a0),d0
	move.w	.Index(pc,d0.w),d0
	jsr	.Index(pc,d0.w)
	jsr	$2038CC
	jmp	$207928

.Index:
	dc.w	R81ABC_Boss_Init-.Index
	dc.w	R81ABC_Boss_Fall-.Index
	dc.w	R81ABC_Boss_BeginSlowMove-.Index
	dc.w	R81ABC_Boss_UpdatePath-.Index
	dc.w	R81ABC_Boss_AdvanceFrame-.Index
	dc.w	R81ABC_Boss_FollowPath-.Index
	dc.w	R81ABC_Boss_Lower-.Index
	dc.w	R81ABC_Boss_FollowPath-.Index
	dc.w	R81ABC_Boss_Raise-.Index
	dc.w	R81ABC_Boss_Attack-.Index
	dc.w	R81ABC_Boss_BeginFastMove-.Index
	dc.w	R81ABC_Boss_Attack-.Index
	dc.w	R81ABC_Boss_LowerAfterAttack-.Index
	dc.w	R81ABC_Boss_FollowPath-.Index
	dc.w	R81ABC_Boss_Reset-.Index

R81ABC_Boss_Init:
	addq.b	#2,$24(a0)
	ori.b	#4,$1(a0)
	move.b	#3,$18(a0)
	move.b	#$E,$17(a0)
	move.b	#$E,$19(a0)
	move.b	#9,$16(a0)
	move.b	#$2C,$20(a0)
	move.w	#$245D,d0
	tst.b	$FF152E
	bne.s	.SetTile
	move.w	#$23E9,d0
.SetTile:
	move.w	d0,$2(a0)
	lea	R81ABC_BossMappingsA(pc),a1
	lea	R81ABC_BossAnimationA(pc),a2
	tst.b	$28(a0)
	beq.s	.StoreData
	lea	R81ABC_BossMappingsB(pc),a1
	lea	R81ABC_BossAnimationB(pc),a2
.StoreData:
	move.l	a1,$4(a0)
	move.l	a2,$2E(a0)
	rts

R81ABC_Boss_Fall:
	addi.l	#$10000,$C(a0)
	jsr	$2069FC
	tst.w	d1
	bpl.s	.Done
	add.w	d1,$C(a0)
	addq.b	#2,$24(a0)
.Done:
	rts

R81ABC_Boss_BeginSlowMove:
	addq.b	#2,$24(a0)
	move.l	#$6000,d0
	move.l	#$1000,d1
	bra.w	R81ABC_Boss_SetMovement

R81ABC_Boss_UpdatePath:
	bsr.w	R81ABC_Boss_Move
	beq.s	R81ABC_Boss_Reverse
	move.w	($FFFFD008).w,d0
	sub.w	$8(a0),d0
	spl.b	d1
	subi.w	#$FF80,d0
	subi.w	#$100,d0
	bcc.s	R81ABC_Boss_FollowPath
	move.w	($FFFFD00C).w,d0
	sub.w	$C(a0),d0
	subi.w	#$FF80,d0
	subi.w	#$100,d0
	bcc.s	R81ABC_Boss_FollowPath
	btst	#0,$1(a0)
	sne.b	d0
	eor.b	d1,d0
	bne.s	R81ABC_Boss_FollowPath
	addq.b	#2,$24(a0)
R81ABC_Boss_FollowPath:
	movea.l	$2E(a0),a1
	jmp	$205AD6
R81ABC_Boss_Reverse:
	neg.l	$2A(a0)
	bchg	#0,$1(a0)
	bchg	#0,$22(a0)
	rts

R81ABC_Boss_AdvanceFrame:
	addq.b	#2,$24(a0)
	addq.b	#1,$1C(a0)
	rts

R81ABC_Boss_Lower:
	addq.b	#2,$24(a0)
	addq.b	#1,$1C(a0)
	subq.w	#6,$C(a0)
	move.b	#$10,$16(a0)
	rts

R81ABC_Boss_Raise:
	addq.b	#2,$24(a0)
	addq.b	#1,$1C(a0)
	addq.w	#3,$C(a0)
	move.b	#$D,$16(a0)
	move.b	#$ED,$20(a0)
	move.l	#0,$2A(a0)
	rts

R81ABC_Boss_BeginFastMove:
	addq.b	#2,$24(a0)
	addq.b	#1,$1C(a0)
	move.l	#$40000,d0
	move.l	#$10000,d1
	bra.w	R81ABC_Boss_SetMovement

R81ABC_Boss_Attack:
	tst.b	$21(a0)
	bne.s	.LaunchPlayer
	bsr.w	R81ABC_Boss_Move
	beq.s	.Advance
	movea.l	$2E(a0),a1
	jmp	$205AD6
.Advance:
	addq.b	#2,$24(a0)
	rts
.LaunchPlayer:
	lea	($FFFFD000).w,a1
	move.w	$8(a0),d1
	move.w	$C(a0),d2
	sub.w	$8(a1),d1
	sub.w	$C(a1),d2
	jsr	$200A60
	jsr	$2007C8
	muls.w	#$F900,d1
	asr.l	#8,d1
	move.w	d1,$10(a1)
	muls.w	#$F900,d0
	asr.l	#8,d0
	move.w	d0,$12(a1)
	bset	#1,$22(a1)
	bclr	#4,$22(a1)
	bclr	#5,$22(a1)
	clr.b	$3C(a1)
	clr.b	$21(a0)
	neg.w	d1
	ext.l	d1
	asl.l	#8,d1
	move.l	d1,$2A(a0)
	move.b	#4,$1C(a0)
	move.b	#$16,$24(a0)
	rts

R81ABC_Boss_LowerAfterAttack:
	addq.b	#2,$24(a0)
	addq.b	#1,$1C(a0)
	subq.w	#3,$C(a0)
	move.b	#$10,$16(a0)
	move.b	#$2C,$20(a0)
	rts

R81ABC_Boss_Reset:
	move.b	#4,$24(a0)
	move.b	#0,$1C(a0)
	addq.w	#6,$C(a0)
	move.b	#9,$16(a0)
	rts

R81ABC_Boss_SetMovement:
	tst.b	$28(a0)
	beq.s	.CheckDirection
	move.l	d1,d0
.CheckDirection:
	btst	#0,$1(a0)
	bne.s	.Store
	neg.l	d0
.Store:
	move.l	d0,$2A(a0)
	rts

R81ABC_Boss_Move:
	move.l	$2A(a0),d0
	add.l	d0,$8(a0)
	moveq	#0,d3
	move.b	$17(a0),d3
	lea	$206AC6,a1
	tst.w	$2A(a0)
	bpl.s	.CheckWall
	neg.w	d3
	lea	$206C68,a1
.CheckWall:
	jsr	(a1)
	tst.w	d1
	bmi.s	.Blocked
	jsr	$2069FC
	move.w	d1,d0
	addq.w	#7,d0
	subi.w	#$E,d0
	bcc.s	.Blocked
	add.w	d1,$C(a0)
	moveq	#$FF,d0
	rts
.Blocked:
	move.l	$2A(a0),d0
	sub.l	d0,$8(a0)
	moveq	#0,d0
	rts

R81ABC_BossAnimationA:
	include	"Level/Metallic Madness/Data/R8 Retained Boss Animation A.asm"
R81ABC_BossAnimationB:
	include	"Level/Metallic Madness/Data/R8 Retained Boss Animation B.asm"
R81ABC_BossMappingsA:
	include	"Level/Metallic Madness/Data/R8 Retained Boss Mappings A.asm"
R81ABC_BossMappingsB:
	include	"Level/Metallic Madness/Data/R8 Retained Boss Mappings B.asm"

R81ABC_BossOverlay:
	tst.b	$24(a0)
	bne.s	.Update
	addq.b	#2,$24(a0)
	ori.b	#4,$1(a0)
	move.b	#$20,$17(a0)
	move.b	#$20,$19(a0)
	move.b	#$11,$16(a0)
	move.l	#$20FBDE,$4(a0)
.Update:
	move.b	$FF1588,$1A(a0)
	tst.b	$FF1956
	beq.s	.CheckRelease
	lea	($FFFFD000).w,a1
	jsr	$2094BC
	sne.b	$2A(a0)
	bra.s	.Display
.CheckRelease:
	tst.b	$2A(a0)
	beq.s	.Display
	clr.b	$2A(a0)
	lea	($FFFFD000).w,a1
	jsr	$20936E
.Display:
	jsr	$2038CC
	jmp	$207928

R81ABC_BossOverlayMappings:
	incbin	"../padding/r81a_e_1.bin",$DD6,$10

R81ABC_PlatformObject:
	moveq	#0,d0
	move.b	$24(a0),d0
	move.w	.Index(pc,d0.w),d0
	jsr	.Index(pc,d0.w)
	move.w	$36(a0),d0
	jmp	$20792C

.Index:
	dc.w	.Init-.Index
	dc.w	.SetPosition-.Index

.Init:
	addq.b	#2,$24(a0)
	ori.b	#4,$1(a0)
	move.l	#$20FDFA,$4(a0)
	move.b	#$7F,$19(a0)
	move.b	#$7F,$16(a0)
	move.w	$8(a0),$36(a0)
	move.b	$29(a0),d0
	andi.b	#3,d0
	move.b	d0,$30(a0)
	move.b	#1,$18(a0)
	move.w	#$A4AF,$2(a0)
	btst	#3,$29(a0)
	beq.s	.SetPosition
	move.b	#3,$18(a0)
	move.w	#$24AF,$2(a0)
	cmpi.b	#1,$FF152E
	beq.s	.SetPosition
	addi.w	#$2000,$2(a0)
.SetPosition:
	move.w	($FFFFF704).w,d0
	addi.w	#$70,d0
	move.w	d0,$C(a0)
.Update:
	moveq	#0,d0
	move.b	$28(a0),d0
	add.w	d0,d0
	move.w	.Modes(pc,d0.w),d0
	jsr	.Modes(pc,d0.w)
	move.w	$FF1504,d0
	andi.b	#3,d0
	btst	#2,$29(a0)
	beq.s	.CheckPair
	cmp.b	$30(a0),d0
	bne.s	.Done
	jsr	$2038CC
.Done:
	rts
.CheckPair:
	andi.b	#1,d0
	cmp.b	$30(a0),d0
	bne.s	.DonePair
	jsr	$2038CC
.DonePair:
	rts

.Modes:
	dc.w	R81ABC_Platform_PathA-.Modes
	dc.w	R81ABC_Platform_PathB-.Modes
	dc.w	R81ABC_Platform_PathC-.Modes
	dc.w	R81ABC_Platform_PathD-.Modes
	dc.w	R81ABC_Platform_FrameA-.Modes
	dc.w	R81ABC_Platform_FrameA-.Modes
	dc.w	R81ABC_Platform_FrameA-.Modes
	dc.w	R81ABC_Platform_FrameB-.Modes
	dc.w	R81ABC_Platform_FrameB-.Modes

R81ABC_Platform_PathA:
	lea	.Path(pc),a2
	move.b	#$B,$3D(a0)
	bra.w	R81ABC_Platform_UpdatePath
.Path:
	include	"Level/Metallic Madness/Data/R8 Retained Platform Path A.asm"

R81ABC_Platform_UpdatePath:
	tst.b	$3A(a0)
	bne.s	.Countdown
	moveq	#0,d0
	move.b	$3C(a0),d0
	add.b	d0,d0
	add.b	d0,d0
	lea	(a2,d0.w),a2
	move.b	(a2)+,$1A(a0)
	move.b	(a2)+,$3A(a0)
	move.b	(a2)+,d1
	move.b	(a2)+,d0
	ext.w	d0
	add.w	$36(a0),d0
	move.w	d0,$8(a0)
	bclr	#0,$1(a0)
	bclr	#0,$22(a0)
	tst.b	d1
	beq.s	.Countdown
	bset	#0,$1(a0)
	bset	#0,$22(a0)
.Countdown:
	subq.b	#1,$3A(a0)
	bne.s	.Done
	addq.b	#1,$3C(a0)
	move.b	$3C(a0),d0
	cmp.b	$3D(a0),d0
	bcs.s	.Done
	clr.b	$3C(a0)
.Done:
	rts

R81ABC_Platform_PathB:
	lea	.Path(pc),a2
	move.b	#8,$3D(a0)
	bra.w	R81ABC_Platform_UpdatePath
.Path:
	include	"Level/Metallic Madness/Data/R8 Retained Platform Path B.asm"

R81ABC_Platform_PathC:
	lea	.Path(pc),a2
	move.b	#4,$3D(a0)
	bra.w	R81ABC_Platform_UpdatePath
.Path:
	include	"Level/Metallic Madness/Data/R8 Retained Platform Path C.asm"

R81ABC_Platform_PathD:
	lea	.Path(pc),a2
	move.b	#4,$3D(a0)
	bra.w	R81ABC_Platform_UpdatePath
.Path:
	include	"Level/Metallic Madness/Data/R8 Retained Platform Path D.asm"

R81ABC_Platform_FrameA:
	move.b	$28(a0),d0
	subq.b	#4,d0
	bcc.s	.Store
	moveq	#0,d0
.Store:
	move.b	d0,$1A(a0)
	rts

R81ABC_Platform_FrameB:
	move.b	$28(a0),d0
	subq.b	#6,d0
	bcc.s	.Store
	moveq	#0,d0
.Store:
	move.b	d0,$1A(a0)
	bset	#0,$1(a0)
	bset	#0,$22(a0)
	rts

	incbin	"../padding/r81a_e_1.bin",$FF2,$9A

R81ABC_FinalTrampoline:
	jmp	$20634A

	include	"Level/Metallic Madness/Data/R8 Retained Stage Tail Records.asm"
	dc.w	0
