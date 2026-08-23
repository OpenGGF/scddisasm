; ------------------------------------------------------------------------------

InitJoypads:
	bsr.w	StopZ80
	moveq	#$40,d0
	move.b	d0,IO_CTRL_1
	move.b	d0,IO_CTRL_2
	move.b	d0,IO_CTRL_3
	bra.w	StartZ80

; ------------------------------------------------------------------------------

ReadJoypads:
	lea	p1_joy_hold,a0
	lea	IO_DATA_1,a1
	bsr.s	ReadJoypad
	if DEMO<>0
		movea.l	demo_data,a2
		tst.w	stage_demo
		beq.s	.NotDemo
		move.w	demo_index,d0
		cmpi.w	#$800,d0
		bcc.s	.NotDemo
		move.w	d0,d1
		add.w	d0,d0
		move.w	-2(a0),d2
		andi.w	#$80,d2
		move.w	(a2,d0.w),-2(a0)
		or.w	d2,-2(a0)
		addq.w	#1,d1
		move.w	d1,demo_index

.NotDemo:
	endif
	addq.w	#2,a1

; ------------------------------------------------------------------------------

ReadJoypad:
	move.b	#0,(a1)
	nop
	nop
	move.b	(a1),d0
	lsl.b	#2,d0
	andi.b	#$C0,d0
	move.b	#$40,(a1)
	nop
	nop
	move.b	(a1),d1
	andi.b	#$3F,d1
	or.b	d1,d0
	not.b	d0
	move.b	(a0),d1
	eor.b	d0,d1
	move.b	d0,(a0)+
	and.b	d0,d1
	move.b	d1,(a0)+
	rts

; ------------------------------------------------------------------------------
