; ------------------------------------------------------------------------------

CyclePalette:
	lea	(palette_cycle_timers).w,a5
	lea	(palette_cycle_steps).w,a4
	lea	(byte_2001F2).l,a1
	lea	(word_2001FA).l,a2
	bsr.s	CycleColor
	lea	(byte_200200).l,a1
	lea	(word_200224).l,a2
	bsr.s	CycleColor
	lea	(byte_200236).l,a1
	lea	(word_200258).l,a2

; ------------------------------------------------------------------------------

CycleColor:
	subq.b	#1,(a5)
	bpl.s	loc_2001E8
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
	bcs.s	loc_2001D4
	moveq	#0,d0

loc_2001D4:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	(a1,d0.w),(a5)
	move.b	1(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	move.w	(a2,d0.w),(a3)

loc_2001E8:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

byte_2001F2:
	dc.b	$2A, 3
	dc.b	2, 0
	dc.b	1, 1
	dc.b	2, 2

word_2001FA:
	dc.w	$EE0
	dc.w	$6C0
	dc.w	0

byte_200200:
	dc.b	$3B, $11
	dc.b	9, 0
	dc.b	9, 1
	dc.b	9, 2
	dc.b	9, 3
	dc.b	9, 4
	dc.b	9, 5
	dc.b	9, 6
	dc.b	9, 7
	dc.b	9, 8
	dc.b	9, 7
	dc.b	9, 6
	dc.b	9, 5
	dc.b	9, 4
	dc.b	9, 3
	dc.b	9, 2
	dc.b	9, 1
	dc.b	9, 0

word_200224:
	dc.w	$E0E
	dc.w	$E08
	dc.w	$E80
	dc.w	$EE0
	dc.w	$8E0
	dc.w	$E0
	dc.w	$E8
	dc.w	$EE
	dc.w	$8EE

byte_200236:
	dc.b	$3D, $10
	dc.b	$C, 0
	dc.b	9, 1
	dc.b	9, 2
	dc.b	9, 3
	dc.b	9, 4
	dc.b	9, 5
	dc.b	9, 6
	dc.b	9, 7
	dc.b	9, 8
	dc.b	9, 7
	dc.b	9, 6
	dc.b	9, 5
	dc.b	9, 4
	dc.b	9, 3
	dc.b	9, 2
	dc.b	9, 1

word_200258:
	dc.w	$EE
	dc.w	$AE
	dc.w	$8C
	dc.w	$6A
	dc.w	$48
	dc.w	$26
	dc.w	4
	dc.w	2
	dc.w	0

; ------------------------------------------------------------------------------