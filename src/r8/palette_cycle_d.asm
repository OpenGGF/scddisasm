; ------------------------------------------------------------------------------

CyclePalette:
	lea	(palette_cycle_timers).w,a5
	lea	(palette_cycle_steps).w,a4
	lea	(byte_20028A).l,a1
	lea	(word_200292).l,a2
	bsr.w	CycleColor
	lea	(byte_200298).l,a1
	lea	(word_2002A0).l,a2
	bsr.w	CycleColor
	lea	(byte_2002A6).l,a1
	lea	(word_2002AE).l,a2
	bsr.w	CycleColor
	tst.b	(act).l
	bne.s	loc_2001F0
	lea	(byte_2002B4).l,a1
	lea	(word_2002BE).l,a2
	bsr.s	CycleColor
	lea	(byte_2002C2).l,a1
	lea	(word_2002CE).l,a2
	bsr.s	CycleColor
	lea	(byte_2002D2).l,a1
	lea	(word_2002DE).l,a2
	bra.w	CycleColor

; ------------------------------------------------------------------------------

loc_2001F0:
	cmpi.b	#1,(act).l
	bne.s	loc_200224
	lea	(byte_2002E2).l,a1
	lea	(word_2002F0).l,a2
	bsr.s	CycleColor
	lea	(byte_2002F8).l,a1
	lea	(word_2002FE).l,a2
	bsr.s	CycleColor
	lea	(byte_200302).l,a1
	lea	(word_200328).l,a2
	bra.s	CycleColor

; ------------------------------------------------------------------------------

loc_200224:
	lea	(byte_20032C).l,a1
	lea	(word_20033E).l,a2
	bsr.s	CycleColor
	lea	(byte_200346).l,a1
	lea	(word_200358).l,a2
	bsr.s	CycleColor
	lea	(byte_200362).l,a1
	lea	(word_200368).l,a2

; ------------------------------------------------------------------------------

CycleColor:
	subq.b	#1,(a5)
	bpl.s	loc_200280
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
	bcs.s	loc_20026C
	moveq	#0,d0

loc_20026C:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	(a1,d0.w),(a5)
	move.b	1(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	move.w	(a2,d0.w),(a3)

loc_200280:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

byte_20028A:
	dc.b	$26, 3
	dc.b	4, 2
	dc.b	4, 1
	dc.b	4, 0

word_200292:
	dc.w	$AE
	dc.w	$4C
	dc.w	$2A

byte_200298:
	dc.b	$27, 3
	dc.b	4, 2
	dc.b	4, 1
	dc.b	4, 0

word_2002A0:
	dc.w	$4C
	dc.w	$2A
	dc.w	$AE

byte_2002A6:
	dc.b	$28, 3
	dc.b	4, 2
	dc.b	4, 1
	dc.b	4, 0

word_2002AE:
	dc.w	$2A
	dc.w	$AE
	dc.w	$4C

byte_2002B4:
	dc.b	$31, 4
	dc.b	3, 0
	dc.b	3, 1
	dc.b	3, 0
	dc.b	$54, 1

word_2002BE:
	dc.w	$EE
	dc.w	0

byte_2002C2:
	dc.b	$32, 5
	dc.b	$C, 0
	dc.b	3, 1
	dc.b	3, 0
	dc.b	3, 1
	dc.b	$48, 0

word_2002CE:
	dc.w	0
	dc.w	$EE

byte_2002D2:
	dc.b	$33, 5
	dc.b	$18, 0
	dc.b	3, 1
	dc.b	3, 0
	dc.b	3, 1
	dc.b	$3C, 0

word_2002DE:
	dc.w	0
	dc.w	$EE

byte_2002E2:
	dc.b	$31, 6
	dc.b	$13, 0
	dc.b	$13, 1
	dc.b	$13, 2
	dc.b	$13, 3
	dc.b	$13, 2
	dc.b	$13, 1

word_2002F0:
	dc.w	$E
	dc.w	8
	dc.w	4
	dc.w	0

byte_2002F8:
	dc.b	$32, 2
	dc.b	2, 0
	dc.b	2, 1

word_2002FE:
	dc.w	$E0
	dc.w	0

byte_200302:
	dc.b	$33, $12
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	$37, 1
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	$A, 1
	dc.b	2, 0
	dc.b	$A, 1
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	$19, 1

word_200328:
	dc.w	$8E
	dc.w	0

byte_20032C:
	dc.b	$31, 8
	dc.b	$B, 0
	dc.b	$B, 1
	dc.b	$B, 2
	dc.b	$B, 3
	dc.b	$B, 3
	dc.b	$B, 3
	dc.b	$B, 2
	dc.b	$B, 1

word_20033E:
	dc.w	$E
	dc.w	$A
	dc.w	6
	dc.w	0

byte_200346:
	dc.b	$32, 8
	dc.b	$B, 0
	dc.b	$B, 1
	dc.b	$B, 2
	dc.b	$B, 3
	dc.b	$B, 4
	dc.b	$B, 3
	dc.b	$B, 2
	dc.b	$B, 1

word_200358:
	dc.w	$8E
	dc.w	$6C
	dc.w	$46
	dc.w	$22
	dc.w	0

byte_200362:
	dc.b	$33, 2
	dc.b	2, 0
	dc.b	2, 1

word_200368:
	dc.w	$E0
	dc.w	0

; ------------------------------------------------------------------------------

CycleBossPalette:
	tst.b	(boss_started).w
	beq.s	locret2_200398
	addq.b	#1,(a4)
	cmpi.b	#4,(a4)
	bcs.s	locret2_200398
	clr.b	(a4)
	moveq	#0,d0
	move.b	(a3),d0
	addq.w	#8,d0
	cmpi.w	#$50,d0
	bcs.s	loc_20038A
	moveq	#0,d0

loc_20038A:
	move.b	d0,(a3)
	lea	word_20039A(pc,d0.w),a3
	lea	(palette+$30).w,a4
	move.l	(a3)+,(a4)+
	move.l	(a3),(a4)

locret2_200398:
	rts

; ------------------------------------------------------------------------------

word_20039A:
	dc.w	0, $6E, $E00, $E0E
	dc.w	0, 0, 0, 0
	dc.w	$6C, $604, $EA0, $E8
	dc.w	0, 0, 0, 0
	dc.w	$EE, $E0, $E0E, 0
	dc.w	0, 0, 0, 0
	dc.w	$E, 0, $EE, $E60
	dc.w	0, 0, 0, 0
	dc.w	$E00, $EE, $EE0, $6E
	dc.w	0, 0, 0, 0

; ------------------------------------------------------------------------------