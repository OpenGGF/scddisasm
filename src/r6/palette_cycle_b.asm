; ------------------------------------------------------------------------------

CyclePalette:
	lea	palette_cycle_timers,a5
	lea	palette_cycle_steps,a4
	lea	byte_200204,a1
	lea	word_20020C,a2
	bsr.w	CycleColor
	lea	byte_200212,a1
	lea	word_20021A,a2
	bsr.w	CycleColor
	lea	byte_200220,a1
	lea	word_200228,a2
	bsr.s	CycleColor
	lea	byte_20022E,a1
	lea	word_2002AA,a2

; ------------------------------------------------------------------------------

CycleColor:
	subq.b	#1,(a5)
	bpl.s	loc_2001FA
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
	bcs.s	loc_2001E6
	moveq	#0,d0

loc_2001E6:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	(a1,d0.w),(a5)
	move.b	1(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	move.w	(a2,d0.w),(a3)

loc_2001FA:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

byte_200204:
	dc.b	$21, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

word_20020C:
	dc.w	$E0E
	dc.w	$606
	dc.w	0

byte_200212:
	dc.b	$22, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

word_20021A:
	dc.w	$606
	dc.w	0
	dc.w	$E0E

byte_200220:
	dc.b	$23, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

word_200228:
	dc.w	0
	dc.w	$E0E
	dc.w	$606

byte_20022E:
	dc.b	$31, $3D
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	$3C, 1

word_2002AA:
	dc.w	0
	dc.w	$842
	dc.w	$EE
	dc.w	$EEE

; ------------------------------------------------------------------------------
