; ------------------------------------------------------------------------------

CyclePalette:
	lea	palette_cycle_timers,a5
	lea	palette_cycle_steps,a4
	lea	byte_200206,a1
	lea	word_20020E,a2
	bsr.w	CycleColor
	lea	byte_200214,a1
	lea	word_20021C,a2
	bsr.w	CycleColor
	lea	byte_200222,a1
	lea	word_20022A,a2
	bsr.w	CycleColor
	lea	byte_200230,a1
	lea	word_2002E8,a2

; ------------------------------------------------------------------------------

CycleColor:
	subq.b	#1,(a5)
	bpl.s	loc_2001FC
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
	bcs.s	loc_2001E8
	moveq	#0,d0

loc_2001E8:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	(a1,d0.w),(a5)
	move.b	1(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	move.w	(a2,d0.w),(a3)

loc_2001FC:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

byte_200206:
	dc.b	$21, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

word_20020E:
	dc.w	$EE
	dc.w	$E
	dc.w	0

byte_200214:
	dc.b	$22, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

word_20021C:
	dc.w	$E
	dc.w	0
	dc.w	$EE

byte_200222:
	dc.b	$23, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

word_20022A:
	dc.w	0
	dc.w	$EE
	dc.w	$E

byte_200230:
	dc.b	$31, $5B
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
	dc.b	$1E, 1

word_2002E8:
	dc.w	0
	dc.w	$C28
	dc.w	$EE
	dc.w	$EEE

; ------------------------------------------------------------------------------
