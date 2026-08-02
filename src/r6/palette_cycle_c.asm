; ------------------------------------------------------------------------------

CyclePalette:
	lea	(palette_cycle_timers).w,a5
	lea	(palette_cycle_steps).w,a4
	lea	(byte_200212).l,a1
	lea	(word_20021A).l,a2
	bsr.w	CycleColor
	lea	(byte_200220).l,a1
	lea	(word_200228).l,a2
	bsr.w	CycleColor
	lea	(byte_20022E).l,a1
	lea	(word_200236).l,a2
	bsr.s	CycleColor
	lea	(byte_20023C).l,a1
	lea	(word_20024A).l,a2
	btst	#5,(boss_flags).w
	beq.s	CycleColor
	lea	(byte_200252).l,a2

; ------------------------------------------------------------------------------

CycleColor:
	subq.b	#1,(a5)
	bpl.s	loc_200208
	moveq	#0,d0
	move.b	(a1)+,d0
	move.b	(a1)+,d1
	add.w	d0,d0
	lea	(palette).w,a3
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
	dc.w	$EE
	dc.w	$C0
	dc.w	$40

byte_200220:
	dc.b	$22, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

word_200228:
	dc.w	$C0
	dc.w	$40
	dc.w	$EE

byte_20022E:
	dc.b	$23, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

word_200236:
	dc.w	$40
	dc.w	$EE
	dc.w	$C0

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
	dc.w	$E04
	dc.w	$EE
	dc.w	$EEE

byte_200252:
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0

; ------------------------------------------------------------------------------