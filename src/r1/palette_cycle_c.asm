; ------------------------------------------------------------------------------

CyclePalette:
	lea	word_2001F4,a0
	subq.b	#1,palette_cycle_timers
	bpl.s	loc_2001BA
	move.b	#7,palette_cycle_timers
	moveq	#0,d0
	move.b	palette_cycle_steps,d0
	cmpi.b	#2,d0
	bne.s	loc_2001A6
	moveq	#0,d0
	bra.s	loc_2001A8

; ------------------------------------------------------------------------------

loc_2001A6:
	addq.b	#1,d0

loc_2001A8:
	move.b	d0,palette_cycle_steps
	lsl.w	#3,d0
	lea	palette+$6A,a1
	move.l	(a0,d0.w),(a1)+
	move.l	4(a0,d0.w),(a1)

loc_2001BA:
	adda.w	#$18,a0
	subq.b	#1,palette_cycle_timers+1
	bpl.s	locret_2001F2
	move.b	#5,palette_cycle_timers+1
	moveq	#0,d0
	move.b	palette_cycle_steps+1,d0
	cmpi.b	#2,d0
	bne.s	loc_2001DA
	moveq	#0,d0
	bra.s	loc_2001DC

; ------------------------------------------------------------------------------

loc_2001DA:
	addq.b	#1,d0

loc_2001DC:
	move.b	d0,palette_cycle_steps+1
	andi.w	#3,d0
	lsl.w	#3,d0
	lea	palette+$58,a1
	move.l	(a0,d0.w),(a1)+
	move.l	4(a0,d0.w),(a1)

locret_2001F2:
	rts

; ------------------------------------------------------------------------------

word_2001F4:
	dc.w	$ECC
	dc.w	$ECA
	dc.w	$EEE
	dc.w	$EA8
	dc.w	$EA8
	dc.w	$ECC
	dc.w	$ECC
	dc.w	$ECA
	dc.w	$ECA
	dc.w	$EA8
	dc.w	$ECA
	dc.w	$ECC
	dc.w	$ECA
	dc.w	$EA8
	dc.w	$C60
	dc.w	$E86
	dc.w	$EA8
	dc.w	$E86
	dc.w	$C60
	dc.w	$ECA
	dc.w	$E86
	dc.w	$ECA
	dc.w	$C60
	dc.w	$EA8

; ------------------------------------------------------------------------------
