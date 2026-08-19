; ------------------------------------------------------------------------------

CyclePalette:
	lea	palette_cycle_timers,a5
	lea	palette_cycle_steps,a4
	lea	byte_200212,a1
	lea	word_20021A,a2
	bsr.w	CycleColor
	lea	byte_200220,a1
	lea	word_200228,a2
	bsr.w	CycleColor
	lea	byte_20022E,a1
	lea	word_200236,a2
	bsr.s	CycleColor
	lea	byte_20023C,a1
	lea	word_20024A,a2
	btst	#5,boss_flags
	beq.s	CycleColor
	lea	word_200252,a2

; ------------------------------------------------------------------------------

CycleColor:
	subq.b	#1,(a5)
	bpl.s	loc_200208
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
	bcs.s	loc_2001F4
	moveq	#0,d0

loc_2001F4:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	(a1,d0.w),(a5)
	move.b	1(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	move.w	(a2,d0.w),(a3)

loc_200208:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

byte_200212:
	dc.b	$21, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

word_20021A:
	dc.w	$ACA
	dc.w	$464
	dc.w	0

byte_200220:
	dc.b	$22, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

word_200228:
	dc.w	$464
	dc.w	0
	dc.w	$ACA

byte_20022E:
	dc.b	$23, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

word_200236:
	dc.w	0
	dc.w	$ACA
	dc.w	$464

byte_20023C:
	dc.b	$31, 6
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0

word_20024A:
	dc.w	0
	dc.w	$404
	dc.w	$EE
	dc.w	$EEE

word_200252:
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0

; ------------------------------------------------------------------------------
