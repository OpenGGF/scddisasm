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
	incbin	"../padding/r81a_e_1.bin",$1BC,$11A
R81ABC_State_2D6:
	incbin	"../padding/r81a_e_1.bin",$2D6,$38
R81ABC_State_30E:
	incbin	"../padding/r81a_e_1.bin",$30E,$3E
R81ABC_State_34C:
	incbin	"../padding/r81a_e_1.bin",$34C,$58
R81ABC_State_3A4:
	incbin	"../padding/r81a_e_1.bin",$3A4,$CE
R81ABC_Sub_472:
	incbin	"../padding/r81a_e_1.bin",$472,$1C
R81ABC_Sub_48E:
	incbin	"../padding/r81a_e_1.bin",$48E,$AC
R81ABC_Sub_53A:
	incbin	"../padding/r81a_e_1.bin",$53A,$2E
	incbin	"../padding/r81a_e_1.bin",$568,2
R81ABC_Sub_56A:
	incbin	"../padding/r81a_e_1.bin",$56A
