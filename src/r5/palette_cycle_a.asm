; ------------------------------------------------------------------------------

CyclePalette:
	lea	(palette_cycle_timers).w,a4
	lea	(palette_cycle_steps).w,a5
	bsr.s	sub_2001AA
	btst	#0,(r5_bg_change).l
	beq.s	loc_2001A2
	lea	(byte_200292).l,a1
	bra.w	loc_2001BA

; ------------------------------------------------------------------------------

loc_2001A2:
	lea	(byte_200216).l,a1
	bra.s	loc_2001BA

; ------------------------------------------------------------------------------

sub_2001AA:
	lea	byte_200200(pc),a1
	tst.b	(r5_conveyor_reverse).l
	beq.s	loc_2001BA
	lea	byte_2002A8(pc),a1

loc_2001BA:
	subq.b	#1,(a4)
	bpl.s	loc_2001F6
	move.b	3(a1),(a4)
	moveq	#0,d0
	move.b	(a5),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_2001D0
	moveq	#0,d0

loc_2001D0:
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

loc_2001F0:
	move.w	(a1)+,(a2)+
	dbf	d1,loc_2001F0

loc_2001F6:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

byte_200200:
	dc.b	$2A, 3, 3, 4
	dc.w	$A68, $EAC, $824
	dc.w	$824, $A68, $EAC
	dc.w	$EAC, $824, $A68

byte_200216:
	dc.b	$3A, $C, 5, 5
	dc.w	$EA0, $A60, $840, $620, $400
	dc.w	$EA2, $A62, $842, $622, $402
	dc.w	$EA4, $A64, $844, $624, $404
	dc.w	$EA6, $A66, $846, $626, $406
	dc.w	$EA8, $A68, $848, $628, $408
	dc.w	$EAA, $A6A, $84A, $62A, $40A
	dc.w	$EAA, $A6A, $84A, $62A, $40A
	dc.w	$EA8, $A68, $848, $628, $408
	dc.w	$EA6, $A66, $846, $626, $406
	dc.w	$EA4, $A64, $844, $624, $404
	dc.w	$EA2, $A62, $842, $622, $402
	dc.w	$EA0, $A60, $840, $620, $400

byte_200292:
	dc.b	$38, 3, 3, 4
	dc.w	$A00, $E40, $EA0
	dc.w	$EA0, $A00, $E40
	dc.w	$E40, $EA0, $A000

byte_2002A8:
	dc.b	$2A, 3, 3, 4
	dc.w	$6C, $EE, 4
	dc.w	$EE, 4, $6C
	dc.w	4, $6C, $EE

; ------------------------------------------------------------------------------