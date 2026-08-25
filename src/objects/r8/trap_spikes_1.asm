; ------------------------------------------------------------------------------

SpikesObject:
	tst.b	obj.subtype(a0)
	bmi.w	loc_20BEA4
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BDD8(pc,d0.w),d0
	jsr	off_20BDD8(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20BDD8:
	dc.w	SpikesObject_1_Routine0-*
	dc.w	SpikesObject_1_Routine2-off_20BDD8

; ------------------------------------------------------------------------------

SpikesObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$43F0,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#BlockSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	jsr	SpawnObject
	beq.s	loc_20BE20
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20BE20:
	cmpi.b	#1,obj.subtype(a0)
	beq.s	loc_20BE4C
	move.b	#$A,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#$E8,obj.var_39(a1)
	move.w	a0,obj.var_34(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	bra.s	SpikesObject_1_Routine2

; ------------------------------------------------------------------------------

loc_20BE4C:
	move.b	#$36,obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#$E8,obj.var_39(a1)
	move.w	a0,obj.var_34(a1)

SpikesObject_1_Routine2:
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20BE9A
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20BE86
	neg.w	d0

loc_20BE86:
	cmpi.w	#$20,d0
	bcc.s	locret_20BE9A
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jsr	SolidObject

locret_20BE9A:
	rts

; ------------------------------------------------------------------------------

BlockSprites:
	include	"sprites/r8/block.asm"
	even

; ------------------------------------------------------------------------------

loc_20BEA4:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BEF8(pc,d0.w),d0
	jsr	off_20BEF8(pc,d0.w)
	jsr	DrawObject
	moveq	#0,d1
	move.w	obj.var_34(a0),d1
	beq.s	loc_20BEE8
	movea.w	d1,a1
	tst.b	obj.id(a1)
	beq.s	loc_20BEF2
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	move.b	obj.var_38(a0),d0
	ext.w	d0
	add.w	d0,obj.x(a0)
	move.b	obj.var_39(a0),d0
	ext.w	d0
	add.w	d0,obj.y(a0)

loc_20BEE8:
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20BEF2:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20BEF8:
	dc.w	SpikesObject_0_Routine0-*
	dc.w	SpikesObject_0_Routine2-off_20BEF8

; ------------------------------------------------------------------------------

SpikesObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$488,obj.sprite_tile(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.l	#SpikesSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	btst	#0,obj.subtype(a0)
	bne.s	SpikesObject_0_Routine2
	move.b	#1,obj.sprite_frame(a0)
	move.b	#$12,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.b	#$83,obj.collide_type(a0)

SpikesObject_0_Routine2:
	moveq	#0,d5
	move.b	obj.subtype(a0),d5
	neg.b	d5
	cmpi.b	#5,d5
	bcc.s	loc_20BF68
	cmpi.b	#3,d5
	bcc.s	loc_20BF46
	bra.s	loc_20BF82

; ------------------------------------------------------------------------------

loc_20BF46:
	move.w	#$8488,obj.sprite_tile(a0)
	move.b	#$83,obj.collide_type(a0)
	tst.b	stage_layer
	beq.s	loc_20BF82
	clr.b	obj.collide_type(a0)

loc_20BF5E:
	lea	player_object,a1
	jmp	GetOffObject

; ------------------------------------------------------------------------------

loc_20BF68:
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$83,obj.collide_type(a0)
	tst.b	stage_layer
	bne.s	loc_20BF82
	clr.b	obj.collide_type(a0)
	bra.s	loc_20BF5E

; ------------------------------------------------------------------------------

loc_20BF82:
	tst.b	obj.sprite_frame(a0)
	bne.w	loc_20BFE4
	clr.b	obj.collide_type(a0)
	lea	player_object,a1
	jsr	SolidObject
	beq.s	locret_20BFE2
	btst	#3,obj.flags(a0)
	beq.s	locret_20BFE2
	tst.b	warping
	bne.s	locret_20BFE2
	tst.b	invincible
	bne.s	locret_20BFE2
	move.l	a0,-(sp)
	movea.l	a0,a2
	lea	player_object,a0
	cmpi.b	#4,obj.routine(a0)
	bcc.s	loc_20BFE0
	tst.w	obj.var_30(a0)
	bne.s	loc_20BFE0
	move.l	obj.y(a0),d3
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)
	jsr	HurtPlayer

loc_20BFE0:
	movea.l	(sp)+,a0

locret_20BFE2:
	rts

; ------------------------------------------------------------------------------

loc_20BFE4:
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20BFF6
	lea	player_object,a1
	jsr	SolidObject

locret_20BFF6:
	rts

; ------------------------------------------------------------------------------

SpikesSprites:
	include	"sprites/r8/spikes.asm"
	even

; ------------------------------------------------------------------------------
