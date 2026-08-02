; ------------------------------------------------------------------------------

CyclePalette:
	lea	(palette_cycle_timers).w,a4
	lea	(palette_cycle_steps).w,a5
	bsr.s	sub_2001A2
	btst	#0,(r5_bg_change).l
	beq.s	loc_20019A
	rts

; ------------------------------------------------------------------------------

loc_20019A:
	lea	(byte_20020E).l,a1
	bra.s	loc_2001B2

; ------------------------------------------------------------------------------

sub_2001A2:
	lea	byte_2001F8(pc),a1
	tst.b	(r5_conveyor_reverse).l
	beq.s	loc_2001B2
	lea	byte_200232(pc),a1

loc_2001B2:
	subq.b	#1,(a4)
	bpl.s	loc_2001EE
	move.b	3(a1),(a4)
	moveq	#0,d0
	move.b	(a5),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_2001C8
	moveq	#0,d0

loc_2001C8:
	move.b	d0,(a5)
	moveq	#0,d1
	move.b	2(a1),d1
	mulu.w	d1,d0
	add.w	d0,d0
	lea	(palette).w,a2
	moveq	#0,d2
	move.b	0(a1),d2
	add.w	d2,d2
	adda.w	d2,a2
	lea	4(a1,d0.w),a1
	subq.b	#1,d1

loc_2001E8:
	move.w	(a1)+,(a2)+
	dbf	d1,loc_2001E8

loc_2001EE:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

byte_2001F8:
	dc.b	$23, 3, 3, 4
	dc.w	$AAA, $666, 0
	dc.w	0, $AAA, $666
	dc.w	$666, 0, $AAA

byte_20020E:
	dc.b	$3E, 8, 2, $14
	dc.w	$EEE, $EE6
	dc.w	$EEE, $EE6
	dc.w	$EEE, $EE6
	dc.w	$EEA, $EEA
	dc.w	$EE6, $EEE
	dc.w	$EE6, $EEE
	dc.w	$EE6, $EEE
	dc.w	$EEA, $EEA

byte_200232:
	dc.b	$23, 3, 3, 4
	dc.w	$CE, $4E, 4
	dc.w	$4E, 4, $CE
	dc.w	4, $CE, $4E

; ------------------------------------------------------------------------------