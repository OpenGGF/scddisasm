; ------------------------------------------------------------------------------

PohBeeObject:
	tst.b	obj.subtype(a0)
	bmi.w	loc_20DF82
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DBA4(pc,d0.w),d0
	jsr	off_20DBA4(pc,d0.w)
	lea	Ani_20DE10(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20DBA4:
	dc.w	PohBeeObject_1_Routine0-*
	dc.w	PohBeeObject_1_Routine2-off_20DBA4
	dc.w	PohBeeObject_1_Routine4-off_20DBA4
	dc.w	PohBeeObject_1_Routine6-off_20DBA4
	dc.w	PohBeeObject_1_Routine8-off_20DBA4
	dc.w	PohBeeObject_1_RoutineA-off_20DBA4
	dc.w	PohBeeObject_1_RoutineC-off_20DBA4
	dc.w	PohBeeObject_1_RoutineE-off_20DBA4
	dc.w	PohBeeObject_1_Routine10-off_20DBA4
	dc.w	PohBeeObject_1_Routine12-off_20DBA4

; ------------------------------------------------------------------------------

PohBeeObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$18,obj.width(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.w	#$A457,obj.sprite_tile(a0)
	move.b	#$31,obj.collide_type(a0)
	move.w	#$FFF8,obj.var_30(a0)
	lea	Unk20DE1CSprites(pc),a1
	move.l	#-$10000,d0
	tst.b	obj.subtype(a0)
	beq.s	loc_20DC06
	lea	Unk20DF04Sprites(pc),a1
	move.l	#-$8000,d0

loc_20DC06:
	move.l	a1,obj.sprite_data(a0)
	move.l	d0,obj.var_2c(a0)

PohBeeObject_1_Routine2:
	addq.b	#2,obj.routine(a0)
	move.w	#$200,d0
	tst.b	obj.subtype(a0)
	beq.s	loc_20DC20
	move.w	#$400,d0

loc_20DC20:
	move.w	d0,obj.var_2a(a0)

PohBeeObject_1_Routine4:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	tst.b	obj.subtype(a0)
	bne.s	loc_20DC4E
	tst.w	obj.var_32(a0)
	beq.s	loc_20DC3E
	subq.w	#1,obj.var_32(a0)
	bra.s	loc_20DC4E

; ------------------------------------------------------------------------------

loc_20DC3E:
	lea	(player_object).w,a1
	bsr.s	sub_20DC5C
	beq.s	loc_20DC4E
	move.b	#$C,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20DC4E:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	locret_20DC5A
	move.b	#6,obj.routine(a0)

locret_20DC5A:
	rts

; ------------------------------------------------------------------------------

sub_20DC5C:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$60,d0
	subi.w	#$C0,d0
	bcc.s	loc_20DCA6
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	spl	d1
	subi.w	#-$78,d0
	subi.w	#$F0,d0
	bcc.s	loc_20DCA6
	btst	#0,obj.sprite_flags(a0)
	sne	d2
	eor.b	d1,d2
	beq.s	loc_20DCA2
	neg.l	obj.var_2c(a0)
	neg.w	obj.var_30(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)

loc_20DCA2:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_20DCA6:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

PohBeeObject_1_Routine6:
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)

PohBeeObject_1_Routine8:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	locret_20DCD8
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)
	neg.l	obj.var_2c(a0)
	neg.w	obj.var_30(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)

locret_20DCD8:
	rts

; ------------------------------------------------------------------------------

PohBeeObject_1_RoutineA:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	locret_20DCE6
	move.b	#2,obj.routine(a0)

locret_20DCE6:
	rts

; ------------------------------------------------------------------------------

PohBeeObject_1_RoutineC:
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)

PohBeeObject_1_RoutineE:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	locret_20DD2C
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)
	move.b	#1,obj.anim_id(a0)
	move.b	#$32,obj.collide_type(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.w	obj.var_30(a0),d0
	add.w	d0,obj.x(a0)
	addq.w	#4,obj.y(a0)

locret_20DD2C:
	rts

; ------------------------------------------------------------------------------

PohBeeObject_1_Routine10:
	subq.w	#1,obj.var_2a(a0)
	bpl.w	locret_20DDD0
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)
	jsr	SpawnObject
	bne.w	locret_20DDD0
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	#Spr_20E00E,obj.sprite_data(a1)
	move.b	#1,obj.sprite_layer(a1)
	move.b	#$10,obj.height(a1)
	move.b	#$10,obj.width(a1)
	move.b	#$10,obj.width_2(a1)
	move.b	#$B3,obj.collide_type(a1)
	move.w	obj.y(a0),obj.y(a1)
	addi.w	#$17,obj.y(a1)
	move.l	#$20000,obj.var_30(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	#7,d0
	move.l	#$20000,d1
	btst	#0,obj.sprite_flags(a0)
	bne.s	loc_20DDB8
	neg.w	d0
	neg.l	d1

loc_20DDB8:
	add.w	d0,obj.x(a1)
	move.l	d1,obj.var_2c(a1)
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_20DDD0
	move.w	#$A0,d0
	jsr	PlayFmSound

locret_20DDD0:
	rts

; ------------------------------------------------------------------------------

PohBeeObject_1_Routine12:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	locret_20DE0E
	move.b	#2,obj.routine(a0)
	move.w	#$3C,obj.var_32(a0)
	move.b	#0,obj.anim_id(a0)
	move.b	#$31,obj.collide_type(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$18,obj.width(a0)
	move.b	#$18,obj.width_2(a0)
	move.w	obj.var_30(a0),d0
	sub.w	d0,obj.x(a0)
	subq.w	#4,obj.y(a0)

locret_20DE0E:
	rts

; ------------------------------------------------------------------------------

Ani_20DE10:
	dc.w	@Ani_20DE10_0-*
	dc.w	@Ani_20DE10_1-Ani_20DE10

@Ani_20DE10_0:
	dc.b	1
	dc.b	0, 1
	dc.b	$FF

@Ani_20DE10_1:
	dc.b	1
	dc.b	2, 3
	dc.b	$FF

Unk20DE1CSprites:
	dc.w	Unk20DE1CSprite_0-*
	dc.w	Unk20DE1CSprite_1-Unk20DE1CSprites
	dc.w	Unk20DE1CSprite_2-Unk20DE1CSprites
	dc.w	Unk20DE1CSprite_3-Unk20DE1CSprites

Unk20DE1CSprite_0:
	dc.b	$D
	dc.b	$EE, $C, 0, $10, $E9
	dc.b	$EE, 0, 0, $14, 9
	dc.b	$F4, 5, 0, 0, $E8
	dc.b	$F4, 1, 0, 4, $F8
	dc.b	$F4, 0, 0, 6, 0
	dc.b	$F4, 0, 0, 7, 8
	dc.b	$F4, 0, 0, 8, $10
	dc.b	$FC, 8, 0, 9, 0
	dc.b	4, 4, 0, $C, $E8
	dc.b	4, 0, 0, $E, $F8
	dc.b	4, 0, 0, $F, 0
	dc.b	4, 0, $10, 7, 8
	dc.b	4, 0, $10, 8, $10

Unk20DE1CSprite_1:
	dc.b	$D
	dc.b	$F1, $C, 0, $15, $E9
	dc.b	$F1, 0, 0, $19, 9
	dc.b	$F4, 5, 0, 0, $E8
	dc.b	$F4, 1, 0, 4, $F8
	dc.b	$F4, 0, 0, 6, 0
	dc.b	$F4, 0, 0, 7, 8
	dc.b	$F4, 0, 0, 8, $10
	dc.b	$FC, 8, 0, 9, 0
	dc.b	4, 4, 0, $C, $E8
	dc.b	4, 0, 0, $E, $F8
	dc.b	4, 0, 0, $F, 0
	dc.b	4, 0, $10, 7, 8
	dc.b	4, 0, $10, 8, $10

Unk20DE1CSprite_2:
	dc.b	9
	dc.b	$EA, $C, 0, $10, $F1
	dc.b	$EA, 0, 0, $14, $11
	dc.b	$F0, 5, 0, 0, $F0
	dc.b	$F0, 1, 0, 4, 0
	dc.b	$F0, 0, 0, 6, 8
	dc.b	$F8, 0, 0, $1A, 8
	dc.b	0, 4, 0, $C, $F0
	dc.b	0, 4, 0, $1B, 0
	dc.b	8, 8, 0, $1D, $F8

Unk20DE1CSprite_3:
	dc.b	9
	dc.b	$ED, $C, 0, $15, $F1
	dc.b	$ED, 0, 0, $19, $11
	dc.b	$F0, 5, 0, 0, $F0
	dc.b	$F0, 1, 0, 4, 0
	dc.b	$F0, 0, 0, 6, 8
	dc.b	$F8, 0, 0, $1A, 8
	dc.b	0, 4, 0, $C, $F0
	dc.b	0, 4, 0, $1B, 0
	dc.b	8, 8, 0, $1D, $F8

Unk20DF04Sprites:
	dc.w	Unk20DF04Sprite_0-*
	dc.w	Unk20DF04Sprite_1-Unk20DF04Sprites

Unk20DF04Sprite_0:
	dc.b	$C
	dc.b	$EE, $C, 0, $10, $E9
	dc.b	$EE, 0, 0, $14, 9
	dc.b	$F4, 5, 0, 0, $E8
	dc.b	$F4, 0, 0, $28, $F8
	dc.b	$F4, 0, 0, 6, 0
	dc.b	$F4, 0, 0, 7, 8
	dc.b	$F4, 0, 0, $29, $10
	dc.b	$FC, $C, 0, $2A, $F8
	dc.b	4, 8, 0, $2E, $E8
	dc.b	4, 0, 0, $F, 0
	dc.b	4, 0, $10, 7, 8
	dc.b	4, 0, $10, $29, $10

Unk20DF04Sprite_1:
	dc.b	$C
	dc.b	$F1, $C, 0, $15, $E9
	dc.b	$F1, 0, 0, $19, 9
	dc.b	$F4, 5, 0, 0, $E8
	dc.b	$F4, 0, 0, $28, $F8
	dc.b	$F4, 0, 0, 6, 0
	dc.b	$F4, 0, 0, 7, 8
	dc.b	$F4, 0, 0, $29, $10
	dc.b	$FC, $C, 0, $2A, $F8
	dc.b	4, 8, 0, $2E, $E8
	dc.b	4, 0, 0, $F, 0
	dc.b	4, 0, $10, 7, 8
	dc.b	4, 0, $10, $29, $10

; ------------------------------------------------------------------------------

loc_20DF82:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DF9C(pc,d0.w),d0
	jsr	off_20DF9C(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20DF9C:
	dc.w	PohBeeObject_0_Routine0-*
	dc.w	PohBeeObject_0_Routine2-off_20DF9C
	dc.w	PohBeeObject_0_Routine4-off_20DF9C
	dc.w	PohBeeObject_0_Routine6-off_20DF9C

; ------------------------------------------------------------------------------

PohBeeObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.w	#3,obj.var_2a(a0)

PohBeeObject_0_Routine2:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	locret_20DFC4
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.sprite_frame(a0)
	move.w	#$A,obj.var_2a(a0)

locret_20DFC4:
	rts

; ------------------------------------------------------------------------------

PohBeeObject_0_Routine4:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.y(a0)
	subq.w	#1,obj.var_2a(a0)
	bpl.s	locret_20DFE0
	addq.b	#2,obj.routine(a0)

locret_20DFE0:
	rts

; ------------------------------------------------------------------------------

PohBeeObject_0_Routine6:
	tst.b	obj.sprite_flags(a0)
	bmi.s	loc_20DFEE
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20DFEE:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.y(a0)
	lea	Ani_20E008(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

Ani_20E008:
	dc.w	@Ani_20E008_0-*

@Ani_20E008_0:
	dc.b	1
	dc.b	2, 3
	dc.b	$FF

Spr_20E00E:
	dc.w	@Spr_20E00E_0-*
	dc.w	@Spr_20E00E_1-Spr_20E00E
	dc.w	@Spr_20E00E_2-Spr_20E00E
	dc.w	@Spr_20E00E_3-Spr_20E00E

@Spr_20E00E_0:
	dc.b	1
	dc.b	$F8, 5, 0, $20, $F8

@Spr_20E00E_1:
	dc.b	2
	dc.b	$F8, 4, 0, $24, $F8
	dc.b	0, 4, $18, $24, $F8

@Spr_20E00E_2:
	dc.b	4
	dc.b	$F8, 0, 0, $26, $F8
	dc.b	$F8, 0, 8, $26, 0
	dc.b	0, 0, $10, $26, $F8
	dc.b	0, 0, $18, $26, 0

@Spr_20E00E_3:
	dc.b	4
	dc.b	$F8, 0, 0, $27, $F8
	dc.b	$F8, 0, 8, $27, 0
	dc.b	0, 0, $10, $27, $F8
	dc.b	0, 0, $18, $27, 0
	dc.b	0

; ------------------------------------------------------------------------------