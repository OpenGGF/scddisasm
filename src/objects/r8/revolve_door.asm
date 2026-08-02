; ------------------------------------------------------------------------------

RevolveDoorObject:
	lea	(player_object).w,a6
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B80E(pc,d0.w),d0
	jsr	off_20B80E(pc,d0.w)
	tst.b	obj.routine(a0)
	beq.s	loc_20B808
	jsr	DrawObject
	cmpi.b	#8,obj.routine(a0)
	bcs.s	loc_20B802
	move.w	obj.var_2a(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20B802:
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_20B808:
	jmp	DespawnObject

; ------------------------------------------------------------------------------

off_20B80E:
	dc.w	RevolveDoorObject_0_Routine0-*
	dc.w	RevolveDoorObject_0_Routine2-off_20B80E
	dc.w	RevolveDoorObject_0_Routine4-off_20B80E
	dc.w	RevolveDoorObject_0_Routine6-off_20B80E
	dc.w	RevolveDoorObject_0_Routine8-off_20B80E
	dc.w	RevolveDoorObject_0_RoutineA-off_20B80E

; ------------------------------------------------------------------------------

RevolveDoorObject_0_Routine0:
	move.l	a0,-(sp)
	moveq	#3,d6

loc_20B81E:
	jsr	SpawnObjectAfter
	bne.w	loc_20B920
	movea.l	a1,a0
	dbf	d6,loc_20B81E
	movea.l	(sp)+,a0
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$28,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.l	#Spr_20BA84,obj.sprite_data(a0)
	move.w	#$41B,obj.sprite_tile(a0)
	jsr	SpawnObjectAfter
	move.b	#$3E,obj.id(a1)
	move.b	#4,obj.sprite_flags(a1)
	move.b	#1,obj.sprite_layer(a1)
	move.l	#Spr_20BA84,obj.sprite_data(a1)
	move.w	#$41B,obj.sprite_tile(a1)
	move.b	#$28,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$B0,obj.y(a1)
	move.b	#1,obj.subtype(a1)
	addq.b	#2,obj.routine(a1)
	moveq	#2,d6

loc_20B8AA:
	jsr	SpawnObjectAfter
	move.b	#$3E,obj.id(a1)
	move.b	#4,obj.sprite_flags(a1)
	move.b	#1,obj.sprite_layer(a1)
	move.l	#Spr_20BA84,obj.sprite_data(a1)
	move.w	#$41B,obj.sprite_tile(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#$50,obj.height(a1)
	move.b	byte_20B924(pc,d6.w),obj.var_2d(a1)
	move.b	#2,obj.sprite_frame(a1)
	move.b	#8,obj.routine(a1)
	move.w	obj.x(a0),obj.var_2a(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$58,obj.y(a1)
	move.b	obj.var_2d(a1),d0
	jsr	SineCosine
	muls.w	#$20,d1
	lsr.l	#8,d1
	move.w	obj.var_2a(a1),obj.x(a1)
	add.w	d1,obj.x(a1)
	dbf	d6,loc_20B8AA
	rts

; ------------------------------------------------------------------------------

loc_20B920:
	movea.l	(sp)+,a0
	rts

; ------------------------------------------------------------------------------

byte_20B924:
	dc.b	$40
	dc.b	$95
	dc.b	$EA
	dc.b	0

; ------------------------------------------------------------------------------

RevolveDoorObject_0_Routine2:
	tst.b	obj.subtype(a0)
	beq.s	loc_20B942
	cmpi.b	#$33,obj.anim_id(a6)
	bcs.s	locret_20B99A
	lea	(Ani_20BA7E).l,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

loc_20B942:
	bsr.w	sub_20B9F0
	beq.s	loc_20B994
	move.w	obj.x(a0),d0
	sub.w	obj.x(a6),d0
	addq.w	#8,d0
	bcs.s	loc_20B994
	cmpi.w	#$10,d0
	bcc.s	loc_20B994
	bset	#0,obj.var_2c(a0)
	bne.s	locret_20B99A
	bset	#0,obj.var_2c(a6)
	move.w	obj.x(a0),obj.x(a6)
	move.w	#0,obj.x_speed(a6)
	move.w	#0,obj.ground_speed(a6)
	move.b	#$33,obj.anim_id(a6)
	tst.b	(stage_layer).l
	beq.s	loc_20B98E
	move.b	#$34,obj.anim_id(a6)

loc_20B98E:
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B994:
	move.b	#0,obj.var_2c(a0)

locret_20B99A:
	rts

; ------------------------------------------------------------------------------

RevolveDoorObject_0_Routine4:
	lea	(Ani_20BA7E).l,a1
	jsr	AnimateObject
	cmpi.b	#5,obj.anim_id(a6)
	bne.w	sub_20B9F0
	addq.b	#2,obj.routine(a0)

RevolveDoorObject_0_Routine6:
	bclr	#0,obj.var_2c(a6)
	bsr.w	sub_20B9F0
	eori.b	#1,(stage_layer).l
	eori.b	#1,obj.sprite_flags(a6)
	eori.b	#1,obj.flags(a6)
	ori.w	#$8000,obj.sprite_tile(a6)
	tst.b	(stage_layer).l
	beq.s	loc_20B9E8
	andi.w	#$7FFF,obj.sprite_tile(a6)

loc_20B9E8:
	move.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

sub_20B9F0:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	movea.l	a6,a1
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

RevolveDoorObject_0_Routine8:
	cmpi.b	#$33,obj.anim_id(a6)
	bcs.s	locret_20BA18
	addq.b	#2,obj.routine(a0)
	move.b	obj.var_2d(a0),obj.var_2e(a0)
	addi.b	#-$80,obj.var_2e(a0)

locret_20BA18:
	rts

; ------------------------------------------------------------------------------

RevolveDoorObject_0_RoutineA:
	cmpi.b	#$33,obj.anim_id(a6)
	bcc.s	loc_20BA2E
	subq.b	#2,obj.routine(a0)
	move.b	obj.var_2e(a0),obj.var_2d(a0)
	bra.s	loc_20BA50

; ------------------------------------------------------------------------------

loc_20BA2E:
	moveq	#4,d0
	btst	#0,obj.flags(a6)
	bne.s	loc_20BA42
	tst.b	(stage_layer).l
	beq.s	loc_20BA4C
	bra.s	loc_20BA4A

; ------------------------------------------------------------------------------

loc_20BA42:
	tst.b	(stage_layer).l
	bne.s	loc_20BA4C

loc_20BA4A:
	neg.b	d0

loc_20BA4C:
	add.b	d0,obj.var_2d(a0)

loc_20BA50:
	move.b	obj.var_2d(a0),d0
	jsr	SineCosine
	muls.w	#$18,d1
	lsr.l	#8,d1
	move.w	obj.var_2a(a0),obj.x(a0)
	add.w	d1,obj.x(a0)
	move.b	#1,obj.sprite_layer(a0)
	tst.b	obj.var_2d(a0)
	bmi.s	locret_20BA7C
	move.b	#4,obj.sprite_layer(a0)

locret_20BA7C:
	rts

; ------------------------------------------------------------------------------

Ani_20BA7E:
	dc.w	@Ani_20BA7E_0-*

@Ani_20BA7E_0:
	dc.b	2
	dc.b	0, 1
	dc.b	$FF

Spr_20BA84:
	dc.w	@Spr_20BA84_0-*
	dc.w	@Spr_20BA84_1-Spr_20BA84
	dc.w	@Spr_20BA84_2-Spr_20BA84

@Spr_20BA84_0:
	dc.b	3
	dc.b	$F8, 5, 0, 0, $D8
	dc.b	$F8, $D, 0, 4, $E8
	dc.b	$F8, $D, 0, $C, 8

@Spr_20BA84_1:
	dc.b	3
	dc.b	$F8, 5, 0, 0, $D8
	dc.b	$F8, $D, 8, 4, $E8
	dc.b	$F8, $D, 0, $C, 8

@Spr_20BA84_2:
	dc.b	5
	dc.b	$B0, 3, 0, $14, $FC
	dc.b	$D0, 3, 0, $14, $FC
	dc.b	$F0, 3, 0, $14, $FC
	dc.b	$10, 3, 0, $14, $FC
	dc.b	$30, 3, 0, $14, $FC

Spr_20BAC4:
	dc.w	@Spr_20BAC4_0-*

@Spr_20BAC4_0:
	dc.b	6
	dc.b	$A0, 7, 8, 0, $F8
	dc.b	$C0, 7, 8, 0, $F8
	dc.b	$E0, 7, 8, 0, $F8
	dc.b	0, 7, 8, 0, $F8
	dc.b	$20, 7, 8, 0, $F8
	dc.b	$40, 7, 8, 0, $F8
	dc.b	0

; ------------------------------------------------------------------------------