; ------------------------------------------------------------------------------

CyclePalette:
	tst.b	(act).l
	bne.s	loc_2001AA
	cmpi.w	#$280,(scroll_fg_x).w
	bcc.s	loc_2001AA
	cmpi.w	#$160,(scroll_fg_y).w
	bcs.s	loc_2001F2
	bset	#7,(palette_cycle_timers+4).w
	bne.s	loc_2001AA
	moveq	#4,d0
	bsr.w	LoadPalette

loc_2001AA:
	lea	(palette_cycle_timers).w,a5
	lea	(palette_cycle_steps).w,a4
	lea	(byte_20032C).l,a1
	lea	(word_200354).l,a2
	bsr.w	CycleColor
	lea	(byte_200336).l,a1
	lea	(word_200354).l,a2
	bsr.w	CycleColor
	lea	(byte_200340).l,a1
	lea	(word_200354).l,a2
	bsr.w	CycleColor
	lea	(byte_20034A).l,a1
	lea	(word_200354).l,a2
	bra.w	CycleColor

; ------------------------------------------------------------------------------

loc_2001F2:
	lea	(palette_cycle_timers).w,a5
	lea	(palette_cycle_steps).w,a4
	lea	(byte_200294).l,a1
	lea	(word_2002A6).l,a2
	bsr.w	CycleColor
	lea	(byte_2002AE).l,a1
	lea	(word_2002C0).l,a2
	bsr.w	CycleColor
	lea	(byte_2002CA).l,a1
	lea	(word_2002DC).l,a2
	bsr.w	CycleColor
	lea	(byte_2002E4).l,a1
	lea	(word_2002F6).l,a2
	bsr.w	CycleColor
	lea	(byte_200300).l,a1
	lea	(word_200312).l,a2
	bsr.w	CycleColor
	lea	(byte_200316).l,a1
	lea	(word_200328).l,a2

; ------------------------------------------------------------------------------

CycleColor:
	subq.b	#1,(a5)
	bpl.s	loc_20028A
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
	bcs.s	loc_200276
	moveq	#0,d0

loc_200276:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	(a1,d0.w),(a5)
	move.b	1(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	move.w	(a2,d0.w),(a3)

loc_20028A:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

byte_200294:
	dc.b	$20, 8
	dc.b	$3C, 0
	dc.b	8, 1
	dc.b	8, 2
	dc.b	8, 3
	dc.b	8, 3
	dc.b	8, 0
	dc.b	6, 0
	dc.b	6, 0

word_2002A6:
	dc.w	2
	dc.w	$4A
	dc.w	$28
	dc.w	4

byte_2002AE:
	dc.b	$32, 8
	dc.b	$3C, 0
	dc.b	8, 1
	dc.b	8, 2
	dc.b	8, 3
	dc.b	8, 4
	dc.b	8, 0
	dc.b	6, 0
	dc.b	6, 0

word_2002C0:
	dc.w	$A80
	dc.w	$A4E
	dc.w	$E8C
	dc.w	$A48
	dc.w	$A60

byte_2002CA:
	dc.b	$33, 8
	dc.b	$3C, 0
	dc.b	8, 1
	dc.b	8, 2
	dc.b	8, 3
	dc.b	8, 3
	dc.b	8, 0
	dc.b	6, 0
	dc.b	6, 0

word_2002DC:
	dc.w	$620
	dc.w	$408
	dc.w	$A48
	dc.w	$624

byte_2002E4:
	dc.b	$34, 8
	dc.b	$3C, 0
	dc.b	8, 1
	dc.b	8, 2
	dc.b	8, 3
	dc.b	8, 4
	dc.b	8, 0
	dc.b	6, 0
	dc.b	6, 0

word_2002F6:
	dc.w	$A60
	dc.w	$82C
	dc.w	$C6A
	dc.w	$826
	dc.w	$842

byte_200300:
	dc.b	$39, 8
	dc.b	$3C, 0
	dc.b	8, 1
	dc.b	8, 1
	dc.b	8, 0
	dc.b	8, 0
	dc.b	8, 0
	dc.b	6, 0
	dc.b	6, 0

word_200312:
	dc.w	$64C
	dc.w	$66C

byte_200316:
	dc.b	$3A, 8
	dc.b	$3C, 0
	dc.b	8, 1
	dc.b	8, 1
	dc.b	8, 0
	dc.b	8, 0
	dc.b	8, 0
	dc.b	6, 0
	dc.b	6, 0

word_200328:
	dc.w	$408
	dc.w	$42A

byte_20032C:
	dc.b	$31, 4
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 2
	dc.b	2, 3

byte_200336:
	dc.b	$32, 4
	dc.b	2, 1
	dc.b	2, 2
	dc.b	2, 3
	dc.b	2, 0

byte_200340:
	dc.b	$33, 4
	dc.b	2, 2
	dc.b	2, 3
	dc.b	2, 0
	dc.b	2, 1

byte_20034A:
	dc.b	$34, 4
	dc.b	2, 3
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 2

word_200354:
	dc.w	$EEE
	dc.w	$ECA
	dc.w	$EA8
	dc.w	$E86

; ------------------------------------------------------------------------------