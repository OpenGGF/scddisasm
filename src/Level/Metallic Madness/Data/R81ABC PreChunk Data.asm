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
	bsr.w	R81ABC_Sub_56A
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
	bsr.w	R81ABC_Sub_472
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
	bsr.w	R81ABC_Sub_53A
	move.b	#$3C,$3F(a0)
	addq.b	#2,$24(a0)
	lea	$21E3CE,a1
	bra.w	R81ABC_Sub_48E
R81ABC_State_1BC:
	bsr.w	R81ABC_Sub_4F0
	lea	($FFFFD000).w,a1
	bsr.w	R81ABC_Sub_53A
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
	bsr.w	R81ABC_Sub_3D4
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
	bsr.w	R81ABC_Sub_480
	move.b	#2,$1C(a0)
	lea	$21E3CE,a1
	bra.w	R81ABC_Sub_48E
.Stop:
	clr.w	$10(a0)
.SetStoppedAnimation:
	move.b	#1,$1C(a0)
	lea	$21E3CE,a1
	bra.w	R81ABC_Sub_48E
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
	bsr.w	R81ABC_Sub_470
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
	bsr.w	R81ABC_Sub_4F0
	lea	($FFFFD000).w,a1
	bset	#0,($FFFFF7CC).w
	move.w	#0,($FFFFF602).w
	move.b	#5,$1C(a1)
	bsr.w	R81ABC_Sub_53A
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
	bsr.w	R81ABC_Sub_4F0
	lea	($FFFFD000).w,a1
	bsr.w	R81ABC_Sub_53A
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
R81ABC_Sub_3D4:
	incbin	"../padding/r81a_e_1.bin",$3D4,$9C
R81ABC_Sub_470:
	incbin	"../padding/r81a_e_1.bin",$470,2
R81ABC_Sub_472:
	incbin	"../padding/r81a_e_1.bin",$472,$E
R81ABC_Sub_480:
	incbin	"../padding/r81a_e_1.bin",$480,$E
R81ABC_Sub_48E:
	incbin	"../padding/r81a_e_1.bin",$48E,$62
R81ABC_Sub_4F0:
	incbin	"../padding/r81a_e_1.bin",$4F0,$4A
R81ABC_Sub_53A:
	incbin	"../padding/r81a_e_1.bin",$53A,$2E
	incbin	"../padding/r81a_e_1.bin",$568,2
R81ABC_Sub_56A:
	incbin	"../padding/r81a_e_1.bin",$56A
