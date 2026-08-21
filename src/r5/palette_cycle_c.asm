; ------------------------------------------------------------------------------

CyclePalette:
	tst.b	boss_flags
	beq.s	loc_20018C
	rts

; ------------------------------------------------------------------------------

loc_20018C:
	lea	palette_cycle_timers,a4
	lea	palette_cycle_steps,a5
	bra.w	loc_200198

; ------------------------------------------------------------------------------

loc_200198:
	lea	byte_2001EE(pc),a1
	tst.b	r5_conveyor_reverse
	beq.s	loc_2001A8
	lea	byte_200204(pc),a1

loc_2001A8:
	subq.b	#1,(a4)
	bpl.s	loc_2001E4
	move.b	3(a1),(a4)
	moveq	#0,d0
	move.b	(a5),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_2001BE
	moveq	#0,d0

loc_2001BE:
	move.b	d0,(a5)
	moveq	#0,d1
	move.b	2(a1),d1
	mulu.w	d1,d0
	add.w	d0,d0
	lea	palette,a2
	moveq	#0,d2
	move.b	0(a1),d2
	add.w	d2,d2
	adda.w	d2,a2
	lea	4(a1,d0.w),a1
	subq.b	#1,d1

loc_2001DE:
	move.w	(a1)+,(a2)+
	dbf	d1,loc_2001DE

loc_2001E4:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

byte_2001EE:
	dc.b	$2A, 3, 3, 4
	dc.w	$20, $80, $6C2
	dc.w	$6C2, $20, $80
	dc.w	$80, $6C2, $20

byte_200204:
	dc.b	$2A, 3, 3, 4
	dc.w	$404, $A08, $E0E
	dc.w	$A08, $E0E, $404
	dc.w	$E0E, $404, $A08

; ------------------------------------------------------------------------------
