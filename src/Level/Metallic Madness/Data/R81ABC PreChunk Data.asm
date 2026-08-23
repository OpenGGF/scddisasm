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

	incbin	"../padding/r81a_e_1.bin",$28,$38

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

	incbin	"../padding/r81a_e_1.bin",$7A,$10

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
	incbin	"../padding/r81a_e_1.bin",$110,$64
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

	incbin	"../padding/r81a_e_1.bin",$6C2
