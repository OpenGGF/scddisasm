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
	lea	SasoriAnims(pc),a1
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
	lea	SasoriSprites1(pc),a1
	move.l	#-$10000,d0
	move.w	#3,d1
	tst.b	obj.subtype(a0)
	beq.s	loc_20D2A0
	lea	SasoriSprites2(pc),a1
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
	move.l	#SasoriGunSprites,obj.sprite_data(a1)
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
	move.l	#SasoriMissileSprites,obj.sprite_data(a1)
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
	lea	SasoriMissileAnims(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

SasoriAnims:
	include	"src/anims/r5/sasori.asm"
	even

SasoriSprites1:
	include	"src/sprites/r5/sasori_1.asm"
	even

SasoriSprites2:
	include	"src/sprites/r5/sasori_2.asm"
	even

SasoriGunSprites:
	include	"src/sprites/r5/sasori_gun.asm"
	even

SasoriMissileAnims:
	include	"src/anims/r5/sasori_missile.asm"
	even

SasoriMissileSprites:
	include	"src/sprites/r5/sasori_missile.asm"
	even

; ------------------------------------------------------------------------------