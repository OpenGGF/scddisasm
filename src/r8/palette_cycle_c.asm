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
	tst.b	(act).l
	bne.s	locret_2001D2
	lea	(byte_20023C).l,a1
	lea	(word_20024A).l,a2
	bra.w	CycleColor

; ------------------------------------------------------------------------------

locret_2001D2:
	rts

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
	dc.b	$26, 3
	dc.b	4, 2
	dc.b	4, 1
	dc.b	4, 0

word_20021A:
	dc.w	$EE6
	dc.w	$CA0
	dc.w	$A60

byte_200220:
	dc.b	$27, 3
	dc.b	4, 2
	dc.b	4, 1
	dc.b	4, 0

word_200228:
	dc.w	$CA0
	dc.w	$A60
	dc.w	$EE6

byte_20022E:
	dc.b	$28, 3
	dc.b	4, 2
	dc.b	4, 1
	dc.b	4, 0

word_200236:
	dc.w	$A60
	dc.w	$EE6
	dc.w	$CA0

byte_20023C:
	dc.b	$31, 6
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, $16
	dc.b	0, 2
	dc.b	1, $42
	dc.b	2, 0

word_20024A:
	dc.w	$EE
	dc.w	$EE0
	dc.w	0

; ------------------------------------------------------------------------------

CycleBossPalette:
	tst.b	(boss_started).w
	beq.s	locret_20027C
	addq.b	#1,(a4)
	cmpi.b	#4,(a4)
	bcs.s	locret_20027C
	clr.b	(a4)
	moveq	#0,d0
	move.b	(a3),d0
	addq.w	#8,d0
	cmpi.w	#$50,d0
	bcs.s	loc_20026E
	moveq	#0,d0

loc_20026E:
	move.b	d0,(a3)
	lea	word_20027E(pc,d0.w),a3
	lea	((palette+$30)).w,a4
	move.l	(a3)+,(a4)+
	move.l	(a3),(a4)

locret_20027C:
	rts

; ------------------------------------------------------------------------------

word_20027E:
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