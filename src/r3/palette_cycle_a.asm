; ------------------------------------------------------------------------------

CyclePalette:
	lea	palette_cycle_timers,a5
	lea	palette_cycle_steps,a4
	lea	byte_200200,a1
	lea	word_200208,a2
	bsr.s	CycleColor
	lea	byte_20020E,a1
	lea	word_200230,a2
	bsr.s	CycleColor
	lea	byte_200234,a1
	lea	word_200254,a2
	bsr.s	CycleColor
	lea	byte_20025A,a1
	lea	word_200260,a2

; ------------------------------------------------------------------------------

CycleColor:
	subq.b	#1,(a5)
	bpl.s	loc_2001F6
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
	bcs.s	loc_2001E2
	moveq	#0,d0

loc_2001E2:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	(a1,d0.w),(a5)
	move.b	1(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	move.w	(a2,d0.w),(a3)

loc_2001F6:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

byte_200200:
	dc.b	$2F, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	2, 2

word_200208:
	dc.w	$EE
	dc.w	$E
	dc.w	0

byte_20020E:
	dc.b	$3C, $10
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	8, 1

word_200230:
	dc.w	$EE
	dc.w	0

byte_200234:
	dc.b	$3D, $F
	dc.b	$16, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	1, 2
	dc.b	2, 1
	dc.b	1, 2
	dc.b	2, 1
	dc.b	1, 2
	dc.b	2, 1

word_200254:
	dc.w	0
	dc.w	$E0E
	dc.w	$EAE

byte_20025A:
	dc.b	$3F, 2
	dc.b	1, 0
	dc.b	2, 1

word_200260:
	dc.w	$EE0
	dc.w	0

; ------------------------------------------------------------------------------
