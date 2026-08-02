; ------------------------------------------------------------------------------

InitJoypads:
	bsr.w	StopZ80
	moveq	#$40,d0
	move.b	d0,(IO_CTRL_1).l
	move.b	d0,(IO_CTRL_2).l
	move.b	d0,(IO_CTRL_3).l
	bra.w	StartZ80

; ------------------------------------------------------------------------------

ReadJoypads:
	lea	(p1_joy_hold).w,a0
	lea	(IO_DATA_1).l,a1
	bsr.s	ReadJoypad
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