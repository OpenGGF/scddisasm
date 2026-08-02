; ------------------------------------------------------------------------------

SasoriObject:
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20D212
	bpl.w	loc_20D502
	bra.w	loc_20D502

; ------------------------------------------------------------------------------

loc_20D212:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D240(pc,d0.w),d0
	jsr	off_20D240(pc,d0.w)
	lea	Ani_20D538(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	move.w	obj.var_2a(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20D240:
	dc.w	SasoriObject_0_Routine0-*
	dc.w	SasoriObject_0_Routine2-off_20D240
	dc.w	SasoriObject_0_Routine4-off_20D240
	dc.w	SasoriObject_0_Routine6-off_20D240
	dc.w	SasoriObject_0_Routine8-off_20D240
	dc.w	SasoriObject_0_RoutineA-off_20D240
	dc.w	SasoriObject_0_RoutineC-off_20D240
	dc.w	SasoriObject_0_RoutineE-off_20D240
	dc.w	SasoriObject_0_Routine10-off_20D240
	dc.w	SasoriObject_0_Routine12-off_20D240
	dc.w	SasoriObject_0_Routine14-off_20D240

; ------------------------------------------------------------------------------

SasoriObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$18,obj.width(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$31,obj.collide_type(a0)
	move.w	obj.x(a0),obj.var_2a(a0)
	lea	Unk20D53ESprites(pc),a1
	move.l	#-$10000,d0
	move.w	#3,d1
	tst.b	obj.subtype(a0)
	beq.s	loc_20D2A0
	lea	Unk20D576Sprites(pc),a1
	move.l	#-$8000,d0
	move.w	#7,d1

loc_20D2A0:
	move.l	a1,obj.sprite_data(a0)
	move.l	d0,obj.var_2c(a0)
	move.w	d1,obj.var_32(a0)
	movea.w	a0,a1
	bra.s	loc_20D2CC

; ------------------------------------------------------------------------------

loc_20D2B0:
	move.b	obj.id(a0),obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	move.w	a0,obj.var_2a(a1)

loc_20D2CC:
	ori.b	#4,obj.sprite_flags(a1)
	move.w	#$23B6,obj.sprite_tile(a1)
	rts

; ------------------------------------------------------------------------------

SasoriObject_0_Routine2:
	addq.w	#1,obj.y(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20D32A
	add.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)
	jsr	SpawnObjectAfter
	bne.w	loc_20D4FC
	move.w	a1,obj.var_30(a0)
	move.b	#1,obj.subtype_2(a1)
	move.b	#$18,obj.width(a1)
	move.b	#$18,obj.width_2(a1)
	move.b	#$10,obj.height(a1)
	move.l	#Spr_20D5AE,obj.sprite_data(a1)
	move.b	obj.subtype(a0),obj.sprite_frame(a1)
	bsr.s	loc_20D2B0
	subq.b	#1,obj.sprite_layer(a1)

locret_20D32A:
	rts

; ------------------------------------------------------------------------------

SasoriObject_0_Routine4:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.w	obj.x(a0),d0
	sub.w	obj.var_2a(a0),d0
	bpl.s	loc_20D340
	neg.w	d0

loc_20D340:
	cmpi.w	#$50,d0
	bge.s	loc_20D396
	jsr	CheckBlockDown
	move.w	d1,d0
	addq.w	#7,d0
	subi.w	#$E,d0
	bcc.s	loc_20D396
	add.w	d1,obj.y(a0)
	movea.w	obj.var_30(a0),a1
	move.w	obj.x(a0),8(a1)
	move.w	obj.y(a0),$C(a1)
	move.w	obj.var_32(a0),d0
	add.w	d0,8(a1)
	addi.w	#-$10,$C(a1)
	lea	(player_object).w,a1
	bsr.s	loc_20D3C4
	bcs.s	loc_20D382
	rts

; ------------------------------------------------------------------------------

loc_20D382:
	addq.b	#2,obj.routine(a0)
	tst.w	d0
	smi	d0
	tst.b	obj.var_2c(a0)
	smi	d1
	eor.b	d1,d0
	bne.s	loc_20D396
	rts

; ------------------------------------------------------------------------------

loc_20D396:
	move.l	obj.var_2c(a0),d0
	sub.l	d0,obj.x(a0)
	neg.l	obj.var_2c(a0)
	neg.w	obj.var_32(a0)
	movea.w	obj.var_30(a0),a1
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.sprite_flags(a1)
	bchg	#0,obj.flags(a0)
	bchg	#0,obj.flags(a1)
	rts

; ------------------------------------------------------------------------------

loc_20D3C4:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$28,d0
	subi.w	#$50,d0
	bcc.s	locret_20D3E8
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	move.w	d0,d1
	subi.w	#-$50,d1
	subi.w	#$A0,d1

locret_20D3E8:
	rts

; ------------------------------------------------------------------------------

SasoriObject_0_Routine6:
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_34(a0)
	movea.w	obj.var_30(a0),a1
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.var_32(a0),d0
	add.w	d0,obj.x(a1)
	addi.w	#-$10,obj.y(a1)

SasoriObject_0_Routine8:
	subq.w	#1,obj.var_34(a0)
	bne.s	locret_20D434
	addq.b	#2,obj.routine(a0)
	movea.w	obj.var_30(a0),a1
	subq.w	#5,obj.y(a1)
	move.w	#5,d0
	tst.b	obj.var_2c(a0)
	bmi.s	loc_20D430
	neg.w	d0

loc_20D430:
	add.w	d0,obj.x(a1)

locret_20D434:
	rts

; ------------------------------------------------------------------------------

SasoriObject_0_RoutineA:
	addq.b	#2,obj.routine(a0)
	move.w	#$A,obj.var_34(a0)

SasoriObject_0_RoutineC:
	subq.w	#1,obj.var_34(a0)
	bne.s	locret_20D4B4
	addq.b	#2,obj.routine(a0)
	tst.b	obj.subtype(a0)
	bne.s	locret_20D4B4
	jsr	SpawnObject
	bne.s	locret_20D4B4
	move.b	#$FF,obj.subtype_2(a1)
	move.b	#$10,obj.width(a1)
	move.b	#$10,obj.width_2(a1)
	move.b	#$10,obj.height(a1)
	move.b	#$B2,obj.collide_type(a1)
	move.l	#Spr_20D5C4,obj.sprite_data(a1)
	bsr.w	loc_20D2B0
	addi.w	#-$18,obj.y(a1)
	move.w	#-4,d0
	move.l	#-$30000,d1
	tst.b	obj.var_2c(a0)
	bmi.s	loc_20D49C
	neg.w	d0
	neg.l	d1

loc_20D49C:
	add.w	d0,obj.x(a1)
	move.l	d1,obj.var_2c(a1)
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_20D4B4
	move.w	#$A0,d0
	jsr	PlayFmSound

locret_20D4B4:
	rts

; ------------------------------------------------------------------------------

SasoriObject_0_RoutineE:
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_34(a0)

SasoriObject_0_Routine10:
	subq.w	#1,obj.var_34(a0)
	bne.s	locret_20D4E2
	addq.b	#2,obj.routine(a0)
	movea.w	obj.var_30(a0),a1
	addq.w	#5,$C(a1)
	move.w	#5,d0
	tst.b	obj.var_2c(a0)
	bmi.s	loc_20D4DE
	neg.w	d0

loc_20D4DE:
	sub.w	d0,8(a1)

locret_20D4E2:
	rts

; ------------------------------------------------------------------------------

SasoriObject_0_Routine12:
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_34(a0)

SasoriObject_0_Routine14:
	subq.w	#1,obj.var_34(a0)
	bne.s	locret_20D4FA
	move.b	#4,obj.routine(a0)

locret_20D4FA:
	rts

; ------------------------------------------------------------------------------

loc_20D4FC:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20D502:
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$21,obj.id(a1)
	bne.s	loc_20D4FC
	tst.b	obj.subtype_2(a0)
	bmi.s	loc_20D51A
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20D51A:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	lea	Ani_20D5BE(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

Ani_20D538:
	dc.w	@Ani_20D538_0-*

@Ani_20D538_0:
	dc.b	$1D
	dc.b	0, 1
	dc.b	$FF

Unk20D53ESprites:
	dc.w	Unk20D53ESprite_0-*
	dc.w	Unk20D53ESprite_1-Unk20D53ESprites

Unk20D53ESprite_0:
	dc.b	5
	dc.b	$FD, $D, 0, $19, $EB
	dc.b	$F0, 8, 0, 0, $F0
	dc.b	$F8, $D, 0, 3, $E8
	dc.b	$F0, 7, 0, $B, 8
	dc.b	$FC, $D, 0, $19, $E0

Unk20D53ESprite_1:
	dc.b	5
	dc.b	$FD, $D, 0, $19, $E7
	dc.b	$F0, 8, 0, 0, $F0
	dc.b	$F8, $D, 0, 3, $E8
	dc.b	$F0, 7, 0, $B, 8
	dc.b	$FC, $D, 0, $19, $E4

Unk20D576Sprites:
	dc.w	Unk20D576Sprite_0-*
	dc.w	Unk20D576Sprite_1-Unk20D576Sprites

Unk20D576Sprite_0:
	dc.b	5
	dc.b	$FD, $D, 0, $38, $E9
	dc.b	$F0, 8, 0, $21, $F0
	dc.b	$F8, $D, 0, $24, $E8
	dc.b	$F0, 7, 0, $2C, 8
	dc.b	$FC, $D, 0, $38, $E1

Unk20D576Sprite_1:
	dc.b	5
	dc.b	$FD, $D, 0, $38, $E8
	dc.b	$F0, 8, 0, $21, $F0
	dc.b	$F8, $D, 0, $24, $E8
	dc.b	$F0, 7, 0, $2C, 8
	dc.b	$FC, $D, 0, $38, $E2

Spr_20D5AE:
	dc.w	@Spr_20D5AE_0-*
	dc.w	@Spr_20D5AE_1-Spr_20D5AE

@Spr_20D5AE_0:
	dc.b	1
	dc.b	$F8, 9, 0, $13, $F4

@Spr_20D5AE_1:
	dc.b	1
	dc.b	$F8, 5, 0, $34, $F8

Ani_20D5BE:
	dc.w	@Ani_20D5BE_0-*

@Ani_20D5BE_0:
	dc.b	1
	dc.b	0, 1
	dc.b	$FF

Spr_20D5C4:
	dc.w	@Spr_20D5C4_0-*
	dc.w	@Spr_20D5C4_1-Spr_20D5C4

@Spr_20D5C4_0:
	dc.b	1
	dc.b	$F8, 5, 0, $40, $F8

@Spr_20D5C4_1:
	dc.b	1
	dc.b	$F8, 5, 0, $44, $F8

; ------------------------------------------------------------------------------; ------------------------------------------------------------------------------

KemusiObject:
	tst.b	obj.subtype_2(a0)
	bne.s	loc_20D5E0
	jsr	DestroyInGoodFuture

loc_20D5E0:
	tst.b	obj.routine(a0)
	beq.s	loc_20D604
	movem.w	obj.var_3a(a0),a1-a3
	cmpi.b	#$22,obj.id(a1)
	bne.s	loc_20D634
	cmpi.b	#$22,obj.id(a2)
	bne.s	loc_20D634
	cmpi.b	#$22,obj.id(a3)
	bne.s	loc_20D634

loc_20D604:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D62A(pc,d0.w),d0
	jsr	off_20D62A(pc,d0.w)
	jsr	DrawObject
	tst.b	obj.subtype_2(a0)
	bne.s	locret_20D628
	move.w	obj.var_34(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

locret_20D628:
	rts

; ------------------------------------------------------------------------------

off_20D62A:
	dc.w	KemusiObject_0_Routine0-*
	dc.w	KemusiObject_0_Routine2-off_20D62A
	dc.w	KemusiObject_0_Routine4-off_20D62A
	dc.w	KemusiObject_0_Routine6-off_20D62A
	dc.w	KemusiObject_0_Routine8-off_20D62A

; ------------------------------------------------------------------------------

loc_20D634:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

KemusiObject_0_Routine0:
	move.w	#3,obj.var_2a(a0)
	move.b	#1,obj.sprite_frame(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$33,obj.collide_type(a0)
	movea.w	a0,a1
	bsr.w	sub_20D710
	tst.b	obj.subtype(a0)
	bne.s	loc_20D668
	move.w	#$24,d0
	move.w	#6,d1
	bra.s	loc_20D670

; ------------------------------------------------------------------------------

loc_20D668:
	move.w	#$24,d0
	move.w	#$C,d1

loc_20D670:
	move.w	d0,obj.var_2c(a0)
	move.w	d1,obj.var_30(a0)
	lea	obj.var_3a(a0),a6
	move.w	#2,d6
	move.w	obj.x(a0),d5
	tst.b	obj.subtype(a0)
	bne.s	loc_20D692
	moveq	#2,d4
	moveq	#$B,d3
	moveq	#$FFFFFFB4,d2
	bra.s	loc_20D698

; ------------------------------------------------------------------------------

loc_20D692:
	moveq	#3,d4
	moveq	#7,d3
	moveq	#$33,d2

loc_20D698:
	jsr	SpawnObjectAfter
	bne.s	loc_20D634
	move.w	a1,(a6)+
	move.w	d6,obj.var_2a(a1)
	addi.w	#$C,d5
	move.w	d5,obj.x(a1)
	move.b	d4,obj.sprite_frame(a1)
	move.b	d3,obj.height(a1)
	move.b	d2,obj.collide_type(a1)
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.var_2c(a0),obj.var_2c(a1)
	move.w	obj.var_30(a0),obj.var_30(a1)
	move.b	#$FF,obj.subtype_2(a1)
	bsr.s	sub_20D710
	dbf	d6,loc_20D698
	movem.w	obj.var_3a(a0),a1-a3
	move.w	a0,obj.var_3a(a1)
	move.w	a2,obj.var_3c(a1)
	move.w	a3,obj.var_3e(a1)
	move.w	a0,obj.var_3a(a2)
	move.w	a1,obj.var_3c(a2)
	move.w	a3,obj.var_3e(a2)
	move.w	a0,obj.var_3a(a3)
	move.w	a1,obj.var_3c(a3)
	move.w	a2,obj.var_3e(a3)
	rts

; ------------------------------------------------------------------------------

sub_20D710:
	move.b	#2,obj.routine(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.b	#3,obj.sprite_layer(a1)
	move.b	#8,obj.width(a1)
	move.b	#8,obj.width_2(a1)
	move.w	#$23FE,obj.sprite_tile(a1)
	move.l	#Spr_20D81E,obj.sprite_data(a1)
	move.w	obj.x(a0),obj.var_34(a1)
	rts

; ------------------------------------------------------------------------------

KemusiObject_0_Routine2:
	addq.w	#1,obj.y(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20D76A
	add.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)
	movea.w	a0,a1
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20D766
	movea.w	obj.var_3a(a0),a1

loc_20D766:
	addq.w	#1,obj.var_36(a1)

locret_20D76A:
	rts

; ------------------------------------------------------------------------------

KemusiObject_0_Routine4:
	tst.b	obj.subtype_2(a0)
	bne.s	locret_20D792
	cmpi.w	#4,obj.var_36(a0)
	bne.s	locret_20D792
	movem.w	obj.var_3a(a0),a1-a3
	addq.b	#2,obj.routine(a0)
	addq.b	#2,obj.routine(a1)
	addq.b	#2,obj.routine(a2)
	addq.b	#2,obj.routine(a3)
	bra.s	KemusiObject_0_Routine6

; ------------------------------------------------------------------------------

locret_20D792:
	rts

; ------------------------------------------------------------------------------

KemusiObject_0_Routine6:
	addq.b	#2,obj.routine(a0)
	eori.w	#3,obj.var_2a(a0)
	move.w	obj.var_2c(a0),obj.var_2e(a0)
	move.w	obj.var_30(a0),obj.var_32(a0)
	tst.b	obj.subtype_2(a0)
	bne.s	KemusiObject_0_Routine8
	eori.b	#1,obj.sprite_frame(a0)

KemusiObject_0_Routine8:
	move.w	obj.var_2a(a0),d0
	sub.w	d0,obj.var_32(a0)
	bne.s	loc_20D7EE
	move.w	obj.var_30(a0),obj.var_32(a0)
	bsr.s	sub_20D80A
	move.w	obj.var_34(a0),d0
	sub.w	obj.x(a0),d0
	bpl.s	loc_20D7D4
	neg.w	d0

loc_20D7D4:
	cmpi.w	#$50,d0
	bge.s	loc_20D7FA
	jsr	CheckBlockDown
	move.w	d1,d0
	addq.w	#7,d0
	subi.w	#$E,d0
	bcc.s	loc_20D7FA
	add.w	d1,obj.y(a0)

loc_20D7EE:
	subq.w	#1,obj.var_2e(a0)
	bne.s	locret_20D7F8
	subq.b	#2,obj.routine(a0)

locret_20D7F8:
	rts

; ------------------------------------------------------------------------------

loc_20D7FA:
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	bsr.s	sub_20D80A
	bra.s	KemusiObject_0_Routine8

; ------------------------------------------------------------------------------

sub_20D80A:
	btst	#0,obj.sprite_flags(a0)
	bne.s	loc_20D818
	subq.w	#1,obj.x(a0)
	bra.s	locret_20D81C

; ------------------------------------------------------------------------------

loc_20D818:
	addq.w	#1,obj.x(a0)

locret_20D81C:
	rts

; ------------------------------------------------------------------------------

Spr_20D81E:
	dc.w	@Spr_20D81E_0-*
	dc.w	@Spr_20D81E_1-Spr_20D81E
	dc.w	@Spr_20D81E_2-Spr_20D81E
	dc.w	@Spr_20D81E_3-Spr_20D81E

@Spr_20D81E_0:
	dc.b	1
	dc.b	$F4, 6, 0, 0, $F8

@Spr_20D81E_1:
	dc.b	1
	dc.b	$F4, 6, 0, 6, $F8

@Spr_20D81E_2:
	dc.b	1
	dc.b	$F4, 6, 0, $C, $F8

@Spr_20D81E_3:
	dc.b	1
	dc.b	$F8, 5, 0, $12, $F8

; ------------------------------------------------------------------------------