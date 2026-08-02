; ------------------------------------------------------------------------------

TamabbohObject:
	cmpi.b	#1,obj.subtype(a0)
	beq.w	loc_20B9B4
	jsr	(DestroyInGoodFuture).l
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B7A0(pc,d0.w),d0
	jsr	off_20B7A0(pc,d0.w)
	jsr	(DrawObject).l
	move.w	obj.var_2a(a0),d0
	jmp	(CheckObjectDespawn2).l

; ------------------------------------------------------------------------------

off_20B7A0:
	dc.w	TamabbohObject_1_Routine0-*
	dc.w	TamabbohObject_1_Routine2-off_20B7A0
	dc.w	TamabbohObject_1_Routine4-off_20B7A0
	dc.w	TamabbohObject_1_Routine6-off_20B7A0
	dc.w	TamabbohObject_1_Routine8-off_20B7A0
	dc.w	TamabbohObject_1_RoutineA-off_20B7A0

; ------------------------------------------------------------------------------

TamabbohObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$2C,obj.collide_type(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$F,obj.height(a0)
	move.w	obj.x(a0),obj.var_2a(a0)
	moveq	#4,d0
	jsr	(SetObjectSpriteTile).l
	tst.b	obj.subtype(a0)
	bne.s	loc_20B7F8
	lea	TamabbohSprites(pc),a1
	lea	TamabbohAnims(pc),a2
	move.l	#-$A000,d0
	bra.s	loc_20B806

; ------------------------------------------------------------------------------

loc_20B7F8:
	lea	TamabbohDecaySprites(pc),a1
	lea	TamabbohDecayAnims(pc),a2
	move.l	#-$5000,d0

loc_20B806:
	move.l	a1,obj.sprite_data(a0)
	move.l	a2,obj.var_30(a0)
	move.l	d0,obj.var_2c(a0)

TamabbohObject_1_Routine2:
	move.l	#$10000,d0
	add.l	d0,obj.y(a0)
	jsr	(CheckBlockDown).l
	tst.w	d1
	bpl.s	locret_20B82A
	addq.b	#2,obj.routine(a0)

locret_20B82A:
	rts

; ------------------------------------------------------------------------------

TamabbohObject_1_Routine4:
	tst.w	(debug_mode).l
	bne.s	loc_20B84E
	tst.b	obj.subtype(a0)
	bne.s	loc_20B84E
	tst.w	obj.var_34(a0)
	beq.s	loc_20B846
	subq.w	#1,obj.var_34(a0)
	bra.s	loc_20B84E

; ------------------------------------------------------------------------------

loc_20B846:
	lea	(player_object).w,a1
	bsr.s	sub_20B8A0
	bcs.s	loc_20B89A

loc_20B84E:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.w	obj.x(a0),d0
	sub.w	obj.var_2a(a0),d0
	bpl.s	loc_20B862
	neg.w	d0

loc_20B862:
	cmpi.w	#$80,d0
	bge.s	loc_20B888
	jsr	(CheckBlockDown).l
	cmpi.w	#-7,d1
	blt.s	loc_20B888
	cmpi.w	#7,d1
	bgt.s	loc_20B888
	add.w	d1,obj.y(a0)
	movea.l	obj.var_30(a0),a1
	jmp	(AnimateObject).l

; ------------------------------------------------------------------------------

loc_20B888:
	neg.l	obj.var_2c(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	bra.s	TamabbohObject_1_Routine4

; ------------------------------------------------------------------------------

loc_20B89A:
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

sub_20B8A0:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$50,d0
	subi.w	#$A0,d0
	bcc.s	locret_20B8C4
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	move.w	d0,d1
	subi.w	#-$50,d1
	subi.w	#$A0,d1

locret_20B8C4:
	rts

; ------------------------------------------------------------------------------

TamabbohObject_1_Routine6:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.anim_id(a0)

TamabbohObject_1_Routine8:
	movea.l	obj.var_30(a0),a1
	jmp	(AnimateObject).l

; ------------------------------------------------------------------------------

TamabbohObject_1_RoutineA:
	move.b	#4,obj.routine(a0)
	move.b	#0,obj.anim_id(a0)
	move.w	#$78,obj.var_34(a0)
	tst.b	obj.subtype(a0)
	bne.s	locret_20B91E
	jsr	(SpawnObject).l
	bne.s	locret_20B91E
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20B90A
	move.w	#$A0,d0
	jsr	(PlayFmSound).l

loc_20B90A:
	bsr.s	sub_20B920
	sf	obj.var_3f(a1)
	jsr	(SpawnObject).l
	bne.s	locret_20B91E
	bsr.s	sub_20B920
	st	obj.var_3f(a1)

locret_20B91E:
	rts

; ------------------------------------------------------------------------------

sub_20B920:
	move.b	obj.id(a0),obj.id(a1)
	move.b	#1,obj.subtype(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	addq.b	#1,obj.sprite_layer(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$A,obj.y(a1)
	rts

; ------------------------------------------------------------------------------

TamabbohAnims:
	dc.w	@TamabbohAnims_0-*
	dc.w	@TamabbohAnims_1-TamabbohAnims

@TamabbohAnims_0:
	dc.b	$1D
	dc.b	0, 1
	dc.b	$FF

@TamabbohAnims_1:
	dc.b	$3B
	dc.b	2
	dc.b	$FC
	dc.b	0

TamabbohDecayAnims:
	dc.w	@TamabbohDecayAnims_0-*
	dc.w	@TamabbohDecayAnims_1-TamabbohDecayAnims

@TamabbohDecayAnims_0:
	dc.b	5
	dc.b	0, 1, 0, 1, 0, 1, 0, 1
	dc.b	0, 1, 0, 1, 0, 1, 0, 1
	dc.b	$FC

@TamabbohDecayAnims_1:
	dc.b	$B
	dc.b	2
	dc.b	$FC
	dc.b	0

TamabbohSprites:
	dc.w	@TamabbohSprites_0-*
	dc.w	@TamabbohDecaySprites_1-TamabbohSprites
	dc.w	@TamabbohDecaySprites_2-TamabbohSprites

@TamabbohSprites_0:
	dc.b	3
	dc.b	$F1, $D, 0, 0, $F0
	dc.b	1, $C, 0, 8, $F0
	dc.b	9, 8, 0, $C, $F8

TamabbohDecaySprites:
	dc.w	@TamabbohDecaySprites_0-*
	dc.w	@TamabbohDecaySprites_1-TamabbohDecaySprites
	dc.w	@TamabbohDecaySprites_2-TamabbohDecaySprites

@TamabbohDecaySprites_0:
	dc.b	1
	dc.b	$F0, $F, 0, $2B, $F0

@TamabbohDecaySprites_1:
	dc.b	3
	dc.b	$F2, $D, 0, 0, $F0
	dc.b	2, $C, 0, $F, $F0
	dc.b	$A, 8, 0, $13, $F8

@TamabbohDecaySprites_2:
	dc.b	2
	dc.b	$F0, 8, 0, $16, $F7
	dc.b	$F8, $E, 0, $19, $EF
	dc.b	0

; ------------------------------------------------------------------------------

loc_20B9B4:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B9C8(pc,d0.w),d0
	jsr	off_20B9C8(pc,d0.w)
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

off_20B9C8:
	dc.w	TamabbohObject_0_Routine0-*
	dc.w	TamabbohObject_0_Routine2-off_20B9C8

; ------------------------------------------------------------------------------

TamabbohObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#$AD,obj.collide_type(a0)
	move.b	#8,obj.width(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.l	#TamabbohMissileSprites,obj.sprite_data(a0)
	move.l	#0,obj.var_32(a0)
	move.l	#$2000,obj.var_36(a0)
	tst.b	obj.var_3f(a0)
	bne.s	loc_20BA1A
	move.l	#$20000,d0
	move.l	#-$40000,d1
	bra.s	loc_20BA26

; ------------------------------------------------------------------------------

loc_20BA1A:
	move.l	#-$20000,d0
	move.l	#-$40000,d1

loc_20BA26:
	move.l	d0,obj.var_2a(a0)
	move.l	d1,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

TamabbohObject_0_Routine2:
	tst.b	obj.sprite_flags(a0)
	bmi.s	loc_20BA3C
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20BA3C:
	jsr	(CheckBlockDown).l
	tst.w	d1
	bpl.s	loc_20BA4C
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20BA4C:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	move.l	obj.var_32(a0),d0
	add.l	d0,obj.var_2a(a0)
	move.l	obj.var_36(a0),d0
	add.l	d0,obj.var_2e(a0)
	lea	TamabbohMissileAnims(pc),a1
	jmp	(AnimateObject).l

; ------------------------------------------------------------------------------

TamabbohMissileAnims:
	dc.w	@TamabbohMissileAnims_0-*

@TamabbohMissileAnims_0:
	dc.b	2
	dc.b	0, 1, 2, 3
	dc.b	$FF

TamabbohMissileSprites:
	dc.w	@TamabbohMissileSprites_0-*
	dc.w	@TamabbohMissileSprites_1-TamabbohMissileSprites
	dc.w	@TamabbohMissileSprites_2-TamabbohMissileSprites
	dc.w	@TamabbohMissileSprites_3-TamabbohMissileSprites

@TamabbohMissileSprites_0:
	dc.b	1
	dc.b	$FC, 0, 0, $25, $FC

@TamabbohMissileSprites_1:
	dc.b	1
	dc.b	$FC, 0, 0, $26, $FC

@TamabbohMissileSprites_2:
	dc.b	2
	dc.b	$F8, 4, 0, $27, $F8
	dc.b	0, 4, $10, $27, $F8

@TamabbohMissileSprites_3:
	dc.b	2
	dc.b	$F8, 4, 0, $29, $F8
	dc.b	0, 4, $10, $29, $F8

; ------------------------------------------------------------------------------