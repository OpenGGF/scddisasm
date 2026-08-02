; ------------------------------------------------------------------------------

CollapseFloorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C23A(pc,d0.w),d0
	jsr	off_20C23A(pc,d0.w)
	jsr	(DrawObject).l
	cmpi.b	#4,obj.routine(a0)
	bge.s	locret_20C238
	jmp	(CheckObjectDespawn).l

; ------------------------------------------------------------------------------

locret_20C238:
	rts

; ------------------------------------------------------------------------------

off_20C23A:
	dc.w	CollapseFloorObject_0_Routine0-*
	dc.w	CollapseFloorObject_0_Routine2-off_20C23A
	dc.w	CollapseFloorObject_0_Routine4-off_20C23A
	dc.w	CollapseFloorObject_0_Routine6-off_20C23A

; ------------------------------------------------------------------------------

CollapseFloorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$44BE,obj.sprite_tile(a0)
	lea	CollapseLedgeSprites(pc),a1
	lea	CollapseLedgeData(pc),a2
	move.b	obj.subtype(a0),d0
	bpl.s	loc_20C26E
	lea	CollapseFloorSprites(pc),a1
	lea	CollapseFloorData(pc),a2

loc_20C26E:
	move.l	a1,obj.sprite_data(a0)
	btst	#4,d0
	beq.s	loc_20C284
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)

loc_20C284:
	andi.w	#$F,d0
	move.b	d0,obj.sprite_frame(a0)
	add.w	d0,d0
	move.w	(a2,d0.w),d0
	move.b	(a2,d0.w),d1
	addq.b	#1,d1
	asl.b	#3,d1
	move.b	d1,obj.width(a0)
	move.b	d1,obj.width_2(a0)
	move.b	1(a2,d0.w),d1
	bpl.s	loc_20C2AA
	neg.b	d1

loc_20C2AA:
	addq.b	#1,d1
	asl.b	#3,d1
	addq.b	#2,d1
	move.b	d1,obj.height(a0)

CollapseFloorObject_0_Routine2:
	lea	(player_object).w,a1
	jsr	(TopSolidObject).l
	bne.s	loc_20C2C2
	rts

; ------------------------------------------------------------------------------

loc_20C2C2:
	jsr	(GetOffObject).l
	move.w	#$A3,d0
	jsr	(PlayFmSound).l
	addq.b	#2,obj.routine(a0)
	move.b	obj.subtype(a0),d0
	bpl.w	loc_20C33A
	bra.w	loc_20C43E

; ------------------------------------------------------------------------------

CollapseFloorObject_0_Routine4:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20C2EE
	addq.b	#2,obj.routine(a0)

loc_20C2EE:
	move.b	obj.var_3e(a0),d0
	beq.s	locret_20C30C
	lea	(player_object).w,a1
	jsr	(TopSolidObject).l
	beq.s	locret_20C30C
	tst.w	obj.var_2a(a0)
	bne.s	locret_20C30C
	jsr	(GetOffObject).l

locret_20C30C:
	rts

; ------------------------------------------------------------------------------

CollapseFloorObject_0_Routine6:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.y(a0)
	addi.l	#$4000,obj.var_2c(a0)
	move.w	obj.y(a0),d0
	lea	(player_object).w,a1
	sub.w	obj.y(a1),d0
	cmpi.w	#$200,d0
	bgt.w	loc_20C334
	rts

; ------------------------------------------------------------------------------

loc_20C334:
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20C33A:
	move.b	obj.subtype(a0),d0
	suba.l	a4,a4
	btst	#4,d0
	beq.s	loc_20C34A
	lea	loc_20C33A(pc),a4

loc_20C34A:
	lea	CollapseLedgeData(pc),a6
	andi.w	#$F,d0
	add.w	d0,d0
	move.w	(a6,d0.w),d0
	lea	(a6,d0.w),a6
	moveq	#0,d0
	move.b	(a6)+,d0
	movea.w	d0,a5
	asl.w	#3,d0
	move.w	#$FFF0,d1
	cmpa.w	#0,a4
	bne.s	loc_20C372
	neg.w	d0
	neg.w	d1

loc_20C372:
	add.w	obj.x(a0),d0
	movea.w	d0,a2
	movea.w	d1,a3
	moveq	#0,d6
	move.b	(a6)+,d6
	move.w	d6,d4
	asl.w	#3,d4
	add.w	obj.y(a0),d4
	move.w	#9,d2
	move.b	obj.id(a0),obj.var_3f(a0)

loc_20C390:
	move.w	a5,d5
	move.w	a2,d3
	move.w	d2,d1

loc_20C396:
	jsr	(SpawnObject).l
	bne.w	loc_20C426
	move.b	(a6)+,d0
	bmi.w	loc_20C410
	move.b	d0,obj.sprite_frame(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.b	#3,obj.sprite_layer(a1)
	move.w	#$44BE,obj.sprite_tile(a1)
	move.l	#CollapseLedgeSprites2,obj.sprite_data(a1)
	move.l	#$20000,obj.var_2c(a1)
	move.b	obj.var_3f(a0),obj.id(a1)
	move.b	obj.routine(a0),obj.routine(a1)
	cmpa.w	#0,a4
	beq.s	loc_20C3EA
	bset	#0,obj.sprite_flags(a1)
	bset	#0,obj.flags(a1)

loc_20C3EA:
	tst.w	d6
	bne.s	loc_20C404
	st	obj.var_3e(a1)
	move.b	#8,obj.width(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#9,obj.height(a1)

loc_20C404:
	move.w	d4,obj.y(a1)
	move.w	d3,obj.x(a1)
	move.w	d1,obj.var_2a(a1)

loc_20C410:
	add.w	a3,d3
	addi.w	#$C,d1
	dbf	d5,loc_20C396
	addi.w	#-$10,d4
	addq.w	#5,d2
	dbf	d6,loc_20C390
	bra.s	loc_20C438

; ------------------------------------------------------------------------------

loc_20C426:
	lea	(player_object).w,a1
	jsr	(TopSolidObject).l
	beq.s	loc_20C438
	jsr	(GetOffObject).l

loc_20C438:
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20C43E:
	move.b	obj.subtype(a0),d2
	lea	CollapseFloorData(pc),a6
	move.b	d2,d0
	andi.w	#$1F,d0
	add.w	d0,d0
	move.w	(a6,d0.w),d0
	lea	(a6,d0.w),a6
	move.b	(a6)+,d5
	move.b	(a6)+,d1
	addq.b	#1,d1
	asl.b	#3,d1
	addq.b	#2,d1
	andi.w	#$FF,d5
	move.w	d5,d4
	lsl.w	#3,d4
	neg.w	d4
	move.w	#$10,d3
	moveq	#1,d6
	btst	#6,d2
	bne.w	loc_20C47C
	lsl.b	#2,d2
	bra.s	loc_20C48E

; ------------------------------------------------------------------------------

loc_20C47C:
	lea	(player_object).w,a1
	move.w	obj.x_speed(a1),d0
	btst	#5,d2
	beq.s	loc_20C48C
	neg.w	d0

loc_20C48C:
	tst.w	d0

loc_20C48E:
	bpl.s	loc_20C49A
	lea	(a6,d5.w),a6
	neg.w	d4
	neg.w	d3
	neg.w	d6

loc_20C49A:
	add.w	obj.x(a0),d4
	move.w	#9,d2
	move.b	obj.id(a0),obj.var_3f(a0)

loc_20C4A8:
	jsr	(SpawnObject).l
	bne.w	loc_20C516
	move.b	#3,obj.sprite_layer(a1)
	move.w	#$44BE,obj.sprite_tile(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.l	#CollapseFloorSprites2,obj.sprite_data(a1)
	move.l	#$20000,obj.var_2c(a1)
	move.b	obj.var_3f(a0),obj.id(a1)
	move.b	obj.routine(a0),obj.routine(a1)
	move.w	obj.y(a0),obj.y(a1)
	st	obj.var_3e(a1)
	move.b	#8,obj.width(a1)
	move.b	#8,obj.width_2(a1)
	move.b	d1,obj.height(a1)
	move.b	(a6),obj.sprite_frame(a1)
	lea	(a6,d6.w),a6
	move.w	d4,obj.x(a1)
	add.w	d3,d4
	move.w	d2,obj.var_2a(a1)
	addi.w	#$C,d2
	dbf	d5,loc_20C4A8
	bra.s	loc_20C528

; ------------------------------------------------------------------------------

loc_20C516:
	lea	(player_object).w,a1
	jsr	(TopSolidObject).l
	beq.s	loc_20C528
	jsr	(GetOffObject).l

loc_20C528:
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------