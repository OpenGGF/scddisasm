; ------------------------------------------------------------------------------

TagaTagaObject:
	jsr	(DestroyInGoodFuture).l
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BACC(pc,d0.w),d0
	jsr	off_20BACC(pc,d0.w)
	jsr	(DrawObject).l
	move.w	obj.var_2a(a0),d0
	jmp	(CheckObjectDespawn2).l

; ------------------------------------------------------------------------------

off_20BACC:
	dc.w	TagaTagaObject_0_Routine0-*
	dc.w	TagaTagaObject_0_Routine2-off_20BACC
	dc.w	TagaTagaObject_0_Routine4-off_20BACC
	dc.w	TagaTagaObject_0_Routine6-off_20BACC
	dc.w	TagaTagaObject_0_Routine8-off_20BACC

; ------------------------------------------------------------------------------

TagaTagaObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$16,obj.height(a0)
	move.w	obj.x(a0),obj.var_2a(a0)
	move.w	obj.y(a0),obj.var_2c(a0)
	moveq	#3,d0
	jsr	(SetObjectSpriteTile).l
	tst.b	obj.subtype(a0)
	bne.s	loc_20BB28
	lea	TagaTagaSprites(pc),a1
	lea	TagaTagaAnims(pc),a2
	move.l	#-$3C000,d0
	move.l	#$1000,d1
	bra.s	loc_20BB3C

; ------------------------------------------------------------------------------

loc_20BB28:
	lea	TagaTagaDecaySprites(pc),a1
	lea	TagaTagaDecayAnims(pc),a2
	move.l	#-$30000,d0
	move.l	#$1000,d1

loc_20BB3C:
	move.l	a1,obj.sprite_data(a0)
	move.l	a2,obj.var_3c(a0)
	move.l	d0,obj.var_30(a0)
	move.l	d1,obj.var_38(a0)

TagaTagaObject_0_Routine2:
	addq.b	#2,obj.routine(a0)
	move.w	#$FF,obj.anim_id(a0)
	move.b	#0,obj.collide_type(a0)
	move.l	obj.var_2c(a0),obj.y(a0)

TagaTagaObject_0_Routine4:
	movea.l	obj.var_3c(a0),a1
	jmp	(AnimateObject).l

; ------------------------------------------------------------------------------

TagaTagaObject_0_Routine6:
	addq.b	#2,obj.routine(a0)
	move.w	#$1FF,obj.anim_id(a0)
	move.b	#$2E,obj.collide_type(a0)
	move.l	obj.var_2c(a0),obj.y(a0)
	move.l	obj.var_30(a0),obj.var_34(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	TagaTagaObject_0_Routine8
	move.w	#$A2,d0
	jsr	(PlayFmSound).l

TagaTagaObject_0_Routine8:
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.y(a0)
	move.l	obj.var_38(a0),d0
	add.l	d0,obj.var_34(a0)
	move.w	obj.y(a0),d0
	cmp.w	obj.var_2c(a0),d0
	ble.s	loc_20BBC8
	move.b	#2,obj.routine(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20BBC8
	move.w	#$A2,d0
	jsr	(PlayFmSound).l

loc_20BBC8:
	movea.l	obj.var_3c(a0),a1
	jmp	(AnimateObject).l

; ------------------------------------------------------------------------------

TagaTagaAnims:
	dc.w	@TagaTagaAnims_0-*
	dc.w	@TagaTagaAnims_1-TagaTagaAnims

@TagaTagaAnims_0:
	dc.b	$59
	dc.b	6
	dc.b	$FC

@TagaTagaAnims_1:
	dc.b	7
	dc.b	0, 0, 0, 1, 0, 1, 2, 3
	dc.b	5, 5, 5, 5, 4, 5, 4, 5
	dc.b	4, 5
	dc.b	$FF
	dc.b	0

TagaTagaDecayAnims:
	dc.w	@TagaTagaDecayAnims_0-*
	dc.w	@TagaTagaDecayAnims_1-TagaTagaDecayAnims

@TagaTagaDecayAnims_0:
	dc.b	$59
	dc.b	6
	dc.b	$FC

@TagaTagaDecayAnims_1:
	dc.b	4
	dc.b	0, 0, 0, 0, 0, 0, 0, 0
	dc.b	2, 2, 3, 3, 4, 4, 4, 4
	dc.b	4, 4, 4, 4, 4, 4, 4
	dc.b	$FF

TagaTagaSprites:
	dc.w	@TagaTagaDecaySprites_0-*
	dc.w	@TagaTagaDecaySprites_1-TagaTagaSprites
	dc.w	@TagaTagaDecaySprites_2-TagaTagaSprites
	dc.w	@TagaTagaSprites_3-TagaTagaSprites
	dc.w	@TagaTagaSprites_4-TagaTagaSprites
	dc.w	@TagaTagaSprites_5-TagaTagaSprites
	dc.w	@TagaTagaDecaySprites_6-TagaTagaSprites

@TagaTagaSprites_3:
	dc.b	4
	dc.b	$F0, 5, 0, $D, $F0
	dc.b	$F0, 5, 8, $D, 0
	dc.b	0, 5, 0, $11, $F0
	dc.b	0, 5, 8, $11, 0

@TagaTagaSprites_4:
	dc.b	6
	dc.b	$FA, 0, $10, 0, $F0
	dc.b	$EA, 3, 0, $15, $F8
	dc.b	$EA, 3, 8, $15, 0
	dc.b	$FA, 0, $18, 0, 8
	dc.b	$FE, 6, $10, $19, $F0
	dc.b	$FE, 6, $18, $19, 0

@TagaTagaSprites_5:
	dc.b	6
	dc.b	$FA, 0, $10, 0, $F0
	dc.b	$EA, 3, 0, $15, $F8
	dc.b	$EA, 3, 8, $15, 0
	dc.b	$FA, 0, $18, 0, 8
	dc.b	$FE, 6, $10, $1F, $F0
	dc.b	$FE, 6, $18, $1F, 0
	dc.b	0

TagaTagaDecaySprites:
	dc.w	@TagaTagaDecaySprites_0-*
	dc.w	@TagaTagaDecaySprites_1-TagaTagaDecaySprites
	dc.w	@TagaTagaDecaySprites_2-TagaTagaDecaySprites
	dc.w	@TagaTagaDecaySprites_3-TagaTagaDecaySprites
	dc.w	@TagaTagaDecaySprites_4-TagaTagaDecaySprites
	dc.w	@TagaTagaDecaySprites_5-TagaTagaDecaySprites
	dc.w	@TagaTagaDecaySprites_6-TagaTagaDecaySprites

@TagaTagaDecaySprites_3:
	dc.b	4
	dc.b	$F0, 5, 0, $25, $F0
	dc.b	$F0, 5, 8, $25, 0
	dc.b	0, 5, 0, $11, $F0
	dc.b	0, 5, 8, $11, 0

@TagaTagaDecaySprites_4:
	dc.b	6
	dc.b	$FA, 0, $10, 0, $F0
	dc.b	$EA, 3, 0, $29, $F8
	dc.b	$EA, 3, 8, $29, 0
	dc.b	$FA, 0, $18, 0, 8
	dc.b	$FE, 6, $10, $19, $F0
	dc.b	$FE, 6, $18, $19, 0

@TagaTagaDecaySprites_5:
	dc.b	6
	dc.b	$FA, 0, $10, 0, $F0
	dc.b	$EA, 3, 0, $29, $F8
	dc.b	$EA, 3, 8, $29, 0
	dc.b	$FA, 0, $18, 0, 8
	dc.b	$FE, 6, $10, $1F, $F0
	dc.b	$FE, 6, $18, $1F, 0
	dc.b	0

@TagaTagaDecaySprites_0:
	dc.b	6
	dc.b	$FE, 0, 0, 0, $F0
	dc.b	$F6, 3, 0, 1, $F8
	dc.b	$F6, 3, 8, 1, 0
	dc.b	$FE, 0, 8, 0, 8
	dc.b	$EA, 6, 0, $19, $F0
	dc.b	$EA, 6, 8, $19, 0
	dc.b	0

@TagaTagaDecaySprites_1:
	dc.b	6
	dc.b	$FE, 0, 0, 0, $F0
	dc.b	$F6, 3, 0, 1, $F8
	dc.b	$F6, 3, 8, 1, 0
	dc.b	$FE, 0, 8, 0, 8
	dc.b	$EA, 6, 0, $1F, $F0
	dc.b	$EA, 6, 8, $1F, 0
	dc.b	0

@TagaTagaDecaySprites_2:
	dc.b	2
	dc.b	$F0, 7, 0, 5, $F0
	dc.b	$F0, 7, 8, 5, 0
	dc.b	0

@TagaTagaDecaySprites_6:
	dc.b	0
	dc.b	0

; ------------------------------------------------------------------------------