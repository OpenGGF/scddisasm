; ------------------------------------------------------------------------------

ProjectorObject:
	tst.b	obj.subtype(a0)
	bne.w	loc_20E6F6
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E514(pc,d0.w),d0
	jsr	off_20E514(pc,d0.w)
	jsr	(DrawObject).l
	cmpi.b	#2,obj.routine(a0)
	bgt.s	locret_20E512
	jsr	(CheckObjectDespawn).l
	tst.b	(a0)
	bne.s	locret_20E512
	move.w	#4,d0
	jmp	(AddGfxQueue).l

; ------------------------------------------------------------------------------

locret_20E512:
	rts

; ------------------------------------------------------------------------------

off_20E514:
	dc.w	ProjectorObject_0_Routine0-*
	dc.w	ProjectorObject_0_Routine2-off_20E514
	dc.w	ProjectorObject_0_Routine4-off_20E514
	dc.w	ProjectorObject_0_Routine6-off_20E514
	dc.w	ProjectorObject_0_Routine8-off_20E514

; ------------------------------------------------------------------------------

loc_20E51E:
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

ProjectorObject_0_Routine0:
	tst.b	(projector_destroyed).l
	bne.s	loc_20E51E
	move.w	#5,d0
	jsr	(AddGfxQueue).l
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$C,obj.width(a0)
	move.b	#$C,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$FB,obj.collide_type(a0)
	move.w	#$403,d0
	tst.b	(act).l
	beq.s	loc_20E56E
	move.w	#$3AF,d0

loc_20E56E:
	move.w	d0,obj.sprite_tile(a0)
	move.l	#ProjectorSprites,obj.sprite_data(a0)
	move.l	#byte_20E7F8,obj.var_2c(a0)
	jsr	(SpawnObject).l
	bne.w	loc_20E51E
	move.b	obj.id(a0),obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$15,obj.x(a1)
	subq.w	#7,obj.y(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	(SpawnObject).l
	bne.w	loc_20E51E
	move.b	obj.id(a0),obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$58,obj.x(a1)
	subq.w	#4,obj.y(a1)
	move.b	#1,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	(SpawnObject).l
	bne.w	loc_20E51E
	move.b	#$24,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$58,obj.x(a1)
	addi.w	#-$18,obj.y(a1)
	move.b	#$80,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	(SpawnObject).l
	bne.w	loc_20E51E
	move.b	#$24,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$64,obj.x(a1)
	addq.w	#4,obj.y(a1)
	move.b	#$81,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)

ProjectorObject_0_Routine2:
	tst.b	obj.collide_status(a0)
	beq.s	loc_20E652
	clr.w	obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)

loc_20E652:
	lea	(player_object).w,a1
	jmp	(SolidObject).l

; ------------------------------------------------------------------------------

ProjectorObject_0_Routine4:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.sprite_frame(a0)
	st	obj.var_3f(a0)
	move.w	#4,d0
	jsr	(AddGfxQueue).l
	lea	(player_object).w,a1
	jsr	(SolidObject).l
	beq.s	ProjectorObject_0_Routine6
	jsr	(GetOffObject).l

ProjectorObject_0_Routine6:
	movea.l	obj.var_2c(a0),a6
	move.b	(a6)+,d0
	bmi.s	loc_20E6D8
	addq.b	#1,obj.var_2a(a0)
	cmp.b	obj.var_2a(a0),d0
	bne.s	locret_20E6D6
	move.b	(a6)+,d5
	move.b	(a6)+,d6
	move.l	a6,obj.var_2c(a0)
	ext.w	d5
	ext.w	d6
	jsr	(SpawnObject).l
	bne.s	locret_20E6D6
	move.b	#$18,obj.id(a1)
	move.b	#1,obj.routine_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	add.w	d5,obj.x(a1)
	add.w	d6,obj.y(a1)
	move.w	#$9E,d0
	jsr	(PlayFmSound).l

locret_20E6D6:
	rts

; ------------------------------------------------------------------------------

loc_20E6D8:
	addq.b	#2,obj.routine(a0)
	move.w	#$3C,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

ProjectorObject_0_Routine8:
	subq.w	#1,obj.var_2a(a0)
	bne.s	locret_20E6F4
	st	(projector_destroyed).l
	bra.w	loc_20E51E

; ------------------------------------------------------------------------------

locret_20E6F4:
	rts

; ------------------------------------------------------------------------------

loc_20E6F6:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$2E,obj.id(a1)
	bne.w	loc_20E51E
	tst.b	obj.var_3f(a1)
	bne.w	loc_20E51E
	tst.b	obj.routine(a0)
	bne.s	loc_20E760
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.w	#$403,d0
	tst.b	(act).l
	beq.s	loc_20E732
	move.w	#$3AF,d0

loc_20E732:
	move.w	d0,obj.sprite_tile(a0)
	move.l	#ProjectorSprites,obj.sprite_data(a0)
	moveq	#8,d0
	moveq	#4,d1
	moveq	#0,d2
	tst.b	obj.subtype(a0)
	bmi.s	loc_20E750
	moveq	#$14,d0
	moveq	#$18,d1
	moveq	#1,d2

loc_20E750:
	move.b	d0,obj.width(a0)
	move.b	d0,obj.width_2(a0)
	move.b	d1,obj.height(a0)
	move.b	d2,obj.anim_id(a0)

loc_20E760:
	lea	HologramAnims(pc),a1
	jsr	(AnimateObject).l
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

HologramAnims:
	dc.w	@HologramAnims_0-*
	dc.w	@HologramAnims_1-HologramAnims

@HologramAnims_0:
	dc.b	0
	dc.b	2, 1, 3, 1
	dc.b	$FF

@HologramAnims_1:
	dc.b	0
	dc.b	4, 4, 1, 4, 4, 1, 4, 4
	dc.b	1, 4, 4, 1, 4, 4, 1, 1
	dc.b	4, 4, 1, 1, 4, 4, 1, 1
	dc.b	4, 4, 1, 1, 5, 5, 1, 5
	dc.b	5, 1, 5, 5, 1, 5, 5, 1
	dc.b	5, 5, 1, 1, 5, 5, 1, 1
	dc.b	5, 5, 1, 1, 5, 5, 1, 1
	dc.b	$FF

ProjectorSprites:
	dc.w	@ProjectorSprites_0-*
	dc.w	@ProjectorSprites_1-ProjectorSprites
	dc.w	@ProjectorSprites_2-ProjectorSprites
	dc.w	@ProjectorSprites_3-ProjectorSprites
	dc.w	@ProjectorSprites_4-ProjectorSprites
	dc.w	@ProjectorSprites_5-ProjectorSprites

@ProjectorSprites_0:
	dc.b	1
	dc.b	$F4, $A, 0, $28, $F4

@ProjectorSprites_1:
	dc.b	0

@ProjectorSprites_2:
	dc.b	1
	dc.b	$FC, 4, 0, $31, $F8

@ProjectorSprites_3:
	dc.b	1
	dc.b	$FC, 4, $10, $31, $F8

@ProjectorSprites_4:
	dc.b	3
	dc.b	$E8, $A, 8, 0, $FC
	dc.b	$F8, 5, 8, 9, $EC
	dc.b	0, 5, 8, $D, $FC

@ProjectorSprites_5:
	dc.b	4
	dc.b	$E8, $F, 8, $11, $F4
	dc.b	$E8, 0, 8, $21, $EC
	dc.b	0, 1, 8, $22, $EC
	dc.b	8, $C, 8, $24, $F4

byte_20E7F8:
	dc.b	1, 0, 0
	dc.b	5, $EE, $F6
	dc.b	$A, $F6, $A
	dc.b	$F, 0, $EE
	dc.b	$14, $F6, $12
	dc.b	$16, 8, $17
	dc.b	$19, $D, $F6
	dc.b	$1C, $FD, $E7
	dc.b	$1E, $A, $14
	dc.b	$20, $F6, 2
	dc.b	$23, $D, $F6
	dc.b	$28, $F6, $A
	dc.b	$FF, 0

; ------------------------------------------------------------------------------