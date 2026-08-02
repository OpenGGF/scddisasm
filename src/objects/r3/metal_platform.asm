; ------------------------------------------------------------------------------

MetalPlatformObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C466(pc,d0.w),d0
	jsr	off_20C466(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20C466:
	dc.w	MetalPlatformObject_0_Routine0-*
	dc.w	MetalPlatformObject_0_Routine2-off_20C466

; ------------------------------------------------------------------------------

MetalPlatformObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$34E,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20C7B0,obj.sprite_data(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	obj.x(a0),obj.var_32(a0)
	move.w	obj.y(a0),obj.var_30(a0)
	addq.b	#2,obj.routine(a0)

MetalPlatformObject_0_Routine2:
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.b	d0,d0
	move.w	off_20C4E0(pc,d0.w),d0
	jsr	off_20C4E0(pc,d0.w)
	jsr	sub_20C4F0(pc)
	move.w	obj.var_32(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20C4D2
	rts

; ------------------------------------------------------------------------------

loc_20C4D2:
	bra.w	DespawnObjectR3

; ------------------------------------------------------------------------------

sub_20C4D6:
	lea	(player_object).w,a1
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

off_20C4E0:
	dc.w	MetalPlatformObject_1_Routine0-*
	dc.w	MetalPlatformObject_1_Routine2-off_20C4E0
	dc.w	MetalPlatformObject_1_Routine2-off_20C4E0
	dc.w	MetalPlatformObject_1_Routine6-off_20C4E0
	dc.w	MetalPlatformObject_1_Routine6-off_20C4E0
	dc.w	MetalPlatformObject_1_RoutineA-off_20C4E0
	dc.w	MetalPlatformObject_1_RoutineA-off_20C4E0
	dc.w	MetalPlatformObject_1_RoutineA-off_20C4E0

; ------------------------------------------------------------------------------

sub_20C4F0:
	tst.b	obj.var_3f(a0)
	beq.s	locret_20C530
	btst	#3,obj.flags(a0)
	bne.s	loc_20C50A
	tst.b	obj.var_3e(a0)
	beq.s	locret_20C530
	subq.b	#8,obj.var_3e(a0)
	bra.s	loc_20C516

; ------------------------------------------------------------------------------

loc_20C50A:
	cmpi.b	#$40,obj.var_3e(a0)
	beq.s	locret_20C530
	addq.b	#8,obj.var_3e(a0)

loc_20C516:
	move.b	obj.var_3e(a0),d0
	jsr	SineCosine
	move.w	#$400,d1
	muls.w	d1,d0
	swap	d0
	add.w	obj.var_30(a0),d0
	move.w	d0,obj.y(a0)

locret_20C530:
	rts

; ------------------------------------------------------------------------------

MetalPlatformObject_1_Routine0:
	move.b	#1,obj.var_3f(a0)
	jsr	sub_20C4D6(pc)
	rts

; ------------------------------------------------------------------------------

MetalPlatformObject_1_Routine2:
	tst.b	obj.var_38(a0)
	bne.s	loc_20C582
	move.b	#1,obj.var_3f(a0)
	lea	(byte_20C5B4).l,a1
	cmpi.b	#1,obj.subtype(a0)
	beq.s	loc_20C55E
	lea	(byte_20C5D4).l,a1

loc_20C55E:
	moveq	#0,d0
	move.b	obj.var_39(a0),d0
	add.b	d0,d0
	add.b	d0,d0
	lea	(a1,d0.w),a1
	move.b	(a1)+,obj.var_38(a0)
	move.b	(a1)+,d0
	ext.w	d0
	move.w	d0,obj.var_36(a0)
	move.w	(a1)+,obj.var_34(a0)

loc_20C57C:
	jsr	sub_20C4D6(pc)
	rts

; ------------------------------------------------------------------------------

loc_20C582:
	move.w	obj.var_34(a0),d0
	move.w	d0,obj.x_speed(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.x(a0)
	move.w	obj.var_36(a0),d0
	add.w	d0,obj.var_34(a0)
	subq.b	#1,obj.var_38(a0)
	bne.s	loc_20C57C
	addq.b	#1,obj.var_39(a0)
	cmpi.b	#8,obj.var_39(a0)
	bne.s	MetalPlatformObject_1_Routine2
	move.b	#2,obj.var_39(a0)
	bra.s	MetalPlatformObject_1_Routine2

; ------------------------------------------------------------------------------

byte_20C5B4:
	dc.b	$1C
	dc.b	0
	dc.w	$300
	dc.b	8
	dc.b	-$30
	dc.w	$300
	dc.b	8
	dc.b	-$30
	dc.w	0
	dc.b	$38
	dc.b	0
	dc.w	-$300
	dc.b	8
	dc.b	$30
	dc.w	-$300
	dc.b	8
	dc.b	$30
	dc.w	0
	dc.b	$38
	dc.b	0
	dc.w	$300
	dc.b	8
	dc.b	-$30
	dc.w	$300

byte_20C5D4:
	dc.b	$1C
	dc.b	0
	dc.w	-$300
	dc.b	8
	dc.b	$30
	dc.w	-$300
	dc.b	8
	dc.b	$30
	dc.w	0
	dc.b	$38
	dc.b	0
	dc.w	$300
	dc.b	8
	dc.b	-$30
	dc.w	$300
	dc.b	8
	dc.b	-$30
	dc.w	0
	dc.b	$38
	dc.b	0
	dc.w	-$300
	dc.b	8
	dc.b	$30
	dc.w	-$300

; ------------------------------------------------------------------------------

MetalPlatformObject_1_Routine6:
	jsr	sub_20C4D6(pc)
	tst.b	obj.var_38(a0)
	bne.s	loc_20C636
	clr.b	obj.var_3f(a0)
	lea	(byte_20C670).l,a1
	cmpi.b	#3,obj.subtype(a0)
	beq.s	loc_20C616
	lea	(byte_20C690).l,a1

loc_20C616:
	moveq	#0,d0
	move.b	obj.var_39(a0),d0
	add.b	d0,d0
	add.b	d0,d0
	lea	(a1,d0.w),a1
	move.b	(a1)+,obj.var_38(a0)
	move.b	(a1)+,d0
	ext.w	d0
	move.w	d0,obj.var_36(a0)
	move.w	(a1)+,obj.var_34(a0)

locret_20C634:
	rts

; ------------------------------------------------------------------------------

loc_20C636:
	move.w	obj.var_34(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	move.w	obj.var_36(a0),d0
	add.w	d0,obj.var_34(a0)
	move.w	obj.var_34(a0),d0
	andi.w	#$FF00,d0
	move.w	d0,obj.y_speed(a0)
	subq.b	#1,obj.var_38(a0)
	bne.s	locret_20C634
	addq.b	#1,obj.var_39(a0)
	cmpi.b	#8,obj.var_39(a0)
	bne.s	MetalPlatformObject_1_Routine6
	move.b	#2,obj.var_39(a0)
	bra.s	MetalPlatformObject_1_Routine6

; ------------------------------------------------------------------------------

byte_20C670:
	dc.b	$23
	dc.b	0
	dc.w	-$200
	dc.b	8
	dc.b	$40
	dc.w	-$200
	dc.b	8
	dc.b	$40
	dc.w	0
	dc.b	$46
	dc.b	0
	dc.w	$200
	dc.b	8
	dc.b	-$40
	dc.w	$200
	dc.b	8
	dc.b	-$40
	dc.w	0
	dc.b	$46
	dc.b	0
	dc.w	-$200
	dc.b	8
	dc.b	$40
	dc.w	-$200

byte_20C690:
	dc.b	$23
	dc.b	0
	dc.w	$200
	dc.b	8
	dc.b	-$40
	dc.w	$200
	dc.b	8
	dc.b	-$40
	dc.w	0
	dc.b	$46
	dc.b	0
	dc.w	-$200
	dc.b	8
	dc.b	$40
	dc.w	-$200
	dc.b	8
	dc.b	$40
	dc.w	0
	dc.b	$46
	dc.b	0
	dc.w	$200
	dc.b	8
	dc.b	-$40
	dc.w	$200

; ------------------------------------------------------------------------------

MetalPlatformObject_1_RoutineA:
	jsr	sub_20C4D6(pc)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	move.w	off_20C6C2(pc,d0.w),d0
	jmp	off_20C6C2(pc,d0.w)

; ------------------------------------------------------------------------------

off_20C6C2:
	dc.w	MetalPlatformObject_2_Routine0-*
	dc.w	MetalPlatformObject_2_Routine2-off_20C6C2
	dc.w	MetalPlatformObject_2_Routine4-off_20C6C2

; ------------------------------------------------------------------------------

MetalPlatformObject_2_Routine0:
	tst.b	obj.var_38(a0)
	bne.s	loc_20C6F0
	move.b	#1,obj.var_3f(a0)
	bsr.w	sub_20CF36
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jsr	TopSolidObject
	beq.s	locret_20C6EE
	move.b	#$1E,obj.var_38(a0)

locret_20C6EE:
	rts

; ------------------------------------------------------------------------------

loc_20C6F0:
	subq.b	#1,obj.var_38(a0)
	bne.s	locret_20C6EE
	clr.b	obj.var_3f(a0)
	addq.b	#2,obj.var_3a(a0)
	rts

; ------------------------------------------------------------------------------

MetalPlatformObject_2_Routine2:
	tst.b	obj.var_38(a0)
	bne.s	loc_20C746
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	lea	(byte_20C78C).l,a1
	subq.b	#5,d0
	beq.s	loc_20C726
	lea	(byte_20C798).l,a1
	subq.b	#1,d0
	beq.s	loc_20C726
	lea	(byte_20C7A4).l,a1

loc_20C726:
	moveq	#0,d0
	move.b	obj.var_39(a0),d0
	add.b	d0,d0
	add.b	d0,d0
	lea	(a1,d0.w),a1
	move.b	(a1)+,obj.var_38(a0)
	move.b	(a1)+,d0
	ext.w	d0
	move.w	d0,obj.var_36(a0)
	move.w	(a1)+,obj.var_34(a0)

locret_20C744:
	rts

; ------------------------------------------------------------------------------

loc_20C746:
	move.w	obj.var_36(a0),d0
	add.w	d0,obj.var_34(a0)
	move.w	obj.var_34(a0),d0
	move.w	d0,d1
	andi.w	#$FF00,d1
	move.w	d1,obj.y_speed(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	subq.b	#1,obj.var_38(a0)
	bne.s	locret_20C744
	addq.b	#1,obj.var_39(a0)
	cmpi.b	#3,obj.var_39(a0)
	bne.s	MetalPlatformObject_2_Routine2
	clr.w	obj.y_speed(a0)
	move.b	#1,obj.var_3f(a0)
	move.w	obj.y(a0),obj.var_30(a0)
	addq.b	#2,obj.var_3a(a0)

MetalPlatformObject_2_Routine4:
	rts

; ------------------------------------------------------------------------------

byte_20C78C:
	dc.b	$10
	dc.b	-$10
	dc.w	0
	dc.b	$30
	dc.b	0
	dc.w	-$200
	dc.b	$10
	dc.b	$10
	dc.w	-$200

byte_20C798:
	dc.b	$10
	dc.b	-$30
	dc.w	0
	dc.b	$45
	dc.b	0
	dc.w	-$300
	dc.b	$10
	dc.b	$30
	dc.w	-$300

byte_20C7A4:
	dc.b	$10
	dc.b	-$40
	dc.w	0
	dc.b	$58
	dc.b	0
	dc.w	-$400
	dc.b	$10
	dc.b	$40
	dc.w	-$400

Spr_20C7B0:
	dc.w	@Spr_20C7B0_0-*

@Spr_20C7B0_0:
	dc.b	2
	dc.b	$F0, $F, 0, 0, $E0
	dc.b	$F0, $F, 8, 0, 0
	dc.b	0

; ------------------------------------------------------------------------------