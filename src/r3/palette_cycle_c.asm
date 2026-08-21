; ------------------------------------------------------------------------------

CyclePalette:
	lea	palette_cycle_timers,a5
	lea	palette_cycle_steps,a4
	lea	byte_2001E4,a1
	lea	word_2001EC,a2
	bsr.s	CycleColor
	lea	byte_2001F2,a1
	lea	word_200214,a2

; ------------------------------------------------------------------------------

CycleColor:
	subq.b	#1,(a5)
	bpl.s	loc_2001DA
	moveq	#0,d0
	move.b	(a1)+,d0
	move.b	(a1)+,d1
	add.w	d0,d0
	lea	palette,a3
	lea	(a3,d0.w),a3
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	d1,d0
	bcs.s	loc_2001C6
	moveq	#0,d0

loc_2001C6:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	(a1,d0.w),(a5)
	move.b	1(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	move.w	(a2,d0.w),(a3)

loc_2001DA:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

byte_2001E4:
	dc.b	$2C, 3
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 2

word_2001EC:
	dc.w	$EEE
	dc.w	$E0E
	dc.w	0

byte_2001F2:
	dc.b	$3D, $10
	dc.b	$1E, 0
	dc.b	5, 1
	dc.b	$F, 0
	dc.b	5, 1
	dc.b	1, 0
	dc.b	5, 1
	dc.b	1, 0
	dc.b	$3C, 1
	dc.b	1, 0
	dc.b	8, 1
	dc.b	1, 0
	dc.b	8, 1
	dc.b	1, 0
	dc.b	8, 1
	dc.b	1, 0
	dc.b	8, 1

word_200214:
	dc.w	$AE
	dc.w	0

; ------------------------------------------------------------------------------
