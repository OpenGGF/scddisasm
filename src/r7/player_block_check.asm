; ------------------------------------------------------------------------------

PlayerCheckBlock:
	move.b	(stage_frames+1).l,d0
	andi.b	#3,d0
	bne.s	locret_206578
	move.w	obj.x_speed(a0),d0
	bpl.s	loc2_206530
	neg.w	d0

loc2_206530:
	cmpi.w	#$A00,d0
	bcs.s	locret_206578
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	addq.w	#8,d2
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	moveq	#0,d1
	move.b	(time_zone).l,d1
	bclr	#7,d1
	cmpi.b	#2,d1
	bne.s	loc_206564
	add.b	(good_future).l,d1

loc_206564:
	add.w	d1,d1
	move.w	off_20657A(pc,d1.w),d1
	lea	off_20657A(pc,d1.w),a1

loc_20656E:
	move.w	(a1)+,d1
	bmi.s	locret_206578
	cmp.w	d1,d0
	bne.s	loc_20656E
	bra.s	loc_2065BA

; ------------------------------------------------------------------------------

locret_206578:
	rts

; ------------------------------------------------------------------------------

off_20657A:
	dc.w	word_206590-*
	dc.w	word_206582-off_20657A
	dc.w	word_2065AC-off_20657A
	dc.w	word_2065A0-off_20657A

word_206582:
	dc.w	$A
	dc.w	$BE
	dc.w	$14E
	dc.w	$14F
	dc.w	$158
	dc.w	$159
	dc.w	$FFFF

word_206590:
	dc.w	$A
	dc.w	$BE
	dc.w	$14E
	dc.w	$14F
	dc.w	$158
	dc.w	$159
	dc.w	$9A
	dc.w	$FFFF

word_2065A0:
	dc.w	$26A
	dc.w	$205
	dc.w	$20F
	dc.w	$23B
	dc.w	$245
	dc.w	$FFFF

word_2065AC:
	dc.w	$A
	dc.w	$D2
	dc.w	$162
	dc.w	$163
	dc.w	$16C
	dc.w	$16D
	dc.w	$FFFF

; ------------------------------------------------------------------------------

loc_2065BA:
	jsr	SpawnObject
	bne.s	locret_2065EA
	move.b	#9,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,obj.y(a1)
	tst.w	obj.x_speed(a0)
	bpl.s	locret_2065EA
	bset	#0,obj.flags(a1)

locret_2065EA:
	rts
	
; ------------------------------------------------------------------------------