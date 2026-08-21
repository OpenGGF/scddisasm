; ------------------------------------------------------------------------------

CyclePalette:
	lea	palette_cycle_timers,a4
	lea	palette_cycle_steps,a5
	tst.b	boss_flags
	beq.s	loc_20019C
	adda.w	#1,a4
	adda.w	#1,a5
	bra.s	loc_20019E

; ------------------------------------------------------------------------------

loc_20019C:
	bsr.s	sub_2001BA

loc_20019E:
	btst	#0,r5_bg_change
	bne.s	loc_2001AA
	rts

; ------------------------------------------------------------------------------

loc_2001AA:
	lea	byte_200226,a1
	bsr.s	sub_2001CA
	lea	byte_200242,a1
	bra.s	sub_2001CA

; ------------------------------------------------------------------------------

sub_2001BA:
	lea	byte_200210(pc),a1
	tst.b	r5_conveyor_reverse
	beq.s	sub_2001CA
	lea	byte_200266(pc),a1

; ------------------------------------------------------------------------------

sub_2001CA:
	subq.b	#1,(a4)
	bpl.s	loc_200206
	move.b	3(a1),(a4)
	moveq	#0,d0
	move.b	(a5),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_2001E0
	moveq	#0,d0

loc_2001E0:
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

loc_200200:
	move.w	(a1)+,(a2)+
	dbf	d1,loc_200200

loc_200206:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

byte_200210:
	dc.b	$2A, 3, 3, 4
	dc.w	$CEE, $466, 0
	dc.w	0, $CEE, $466
	dc.w	$466, 0, $CEE

byte_200226:
	dc.b	$36, 3, 4, $C
	dc.w	$428, $42A, $44C, $46C
	dc.w	$42A, $42C, $44E, $46E
	dc.w	$44E, $42E, $44E, $46E

byte_200242:
	dc.b	$3C, 4, 4, 5
	dc.w	$EE, $88, $44, $22
	dc.w	$88, $44, $22, $EE
	dc.w	$44, $22, $EE, $88
	dc.w	$22, $EE, $88, $44

byte_200266:
	dc.b	$2A, 3, 3, 4
	dc.w	$A0E, $80A, $604
	dc.w	$80A, $604, $A0E
	dc.w	$604, $A0E, $80A

; ------------------------------------------------------------------------------
