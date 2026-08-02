; ------------------------------------------------------------------------------

SpikeChainObject:
	move.b	obj.subtype(a0),d0
	bpl.s	loc_20F2D4
	bra.w	loc_20F4C8

; ------------------------------------------------------------------------------

loc_20F2D4:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F2EE(pc,d0.w),d0
	jsr	off_20F2EE(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20F2EE:
	dc.w	SpikeChainObject_0_Routine0-*
	dc.w	SpikeChainObject_0_Routine2-off_20F2EE

; ------------------------------------------------------------------------------

SpikeChainObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.l	#Spr_20F4C0,obj.sprite_data(a0)
	move.w	#$3F8,obj.sprite_tile(a0)
	move.w	#$100,obj.var_2c(a0)
	move.b	obj.subtype(a0),d0
	beq.s	loc_20F32C
	neg.w	obj.var_2c(a0)

loc_20F32C:
	jsr	SpawnObjectAfter
	bne.w	loc_20F400
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_2e(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	jsr	SpawnObjectAfter
	bne.w	loc_20F400
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_30(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	jsr	SpawnObjectAfter
	bne.w	loc_20F400
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_32(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	jsr	SpawnObjectAfter
	bne.w	loc_20F400
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_34(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	if STAGE_TIME<>0
		jsr	SpawnObjectAfter
		bne.w	loc_20F400
		move.w	a0,obj.var_3e(a1)
		move.w	a1,obj.var_36(a0)
		move.b	obj.id(a0),obj.id(a1)
		move.b	#$FF,obj.subtype(a1)
		move.b	#8,obj.width_2(a1)
		move.b	#8,obj.height(a1)
	endif
	if STAGE_TIME=2
		jsr	SpawnObjectAfter
		bne.w	loc_20F400
		move.w	a0,obj.var_3e(a1)
		move.w	a1,obj.var_38(a0)
		move.b	obj.id(a0),obj.id(a1)
		move.b	#$FF,obj.subtype(a1)
		move.b	#8,obj.width_2(a1)
		move.b	#8,obj.height(a1)
	endif
	bra.s	SpikeChainObject_0_Routine2

; ------------------------------------------------------------------------------

loc_20F400:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

SpikeChainObject_0_Routine2:
	move.w	obj.var_2c(a0),d0
	add.w	d0,obj.var_2a(a0)
	move.w	obj.var_2a(a0),d0
	lsr.w	#8,d0
	jsr	SineCosine
	swap	d0
	swap	d1
	clr.w	d0
	clr.w	d1
	asr.l	#2,d0
	asr.l	#2,d1
	move.l	d0,d4
	move.l	d1,d5
	asr.l	#1,d0
	asr.l	#1,d1
	move.l	d0,d2
	move.l	d1,d3
	asr.l	#1,d0
	asr.l	#1,d1
	movea.w	obj.var_2e(a0),a1
	move.l	obj.y(a0),obj.var_2e(a1)
	move.l	obj.x(a0),obj.var_2a(a1)
	add.l	d0,obj.var_2e(a1)
	add.l	d1,obj.var_2a(a1)
	movea.w	obj.var_30(a0),a1
	move.l	obj.y(a0),obj.var_2e(a1)
	move.l	obj.x(a0),obj.var_2a(a1)
	add.l	d2,obj.var_2e(a1)
	add.l	d3,obj.var_2a(a1)
	movea.w	obj.var_32(a0),a1
	move.l	obj.y(a0),obj.var_2e(a1)
	move.l	obj.x(a0),obj.var_2a(a1)
	add.l	d0,obj.var_2e(a1)
	add.l	d1,obj.var_2a(a1)
	add.l	d2,obj.var_2e(a1)
	add.l	d3,obj.var_2a(a1)
	movea.w	obj.var_34(a0),a1
	move.l	obj.y(a0),obj.var_2e(a1)
	move.l	obj.x(a0),obj.var_2a(a1)
	add.l	d4,obj.var_2e(a1)
	add.l	d5,obj.var_2a(a1)
	if STAGE_TIME<>0
		movea.w	obj.var_36(a0),a1
		move.l	obj.y(a0),obj.var_2e(a1)
		move.l	obj.x(a0),obj.var_2a(a1)
		add.l	d0,obj.var_2e(a1)
		add.l	d1,obj.var_2a(a1)
		add.l	d4,obj.var_2e(a1)
		add.l	d5,obj.var_2a(a1)
	endif
	if STAGE_TIME=2
		movea.w	obj.var_38(a0),a1
		move.l	obj.y(a0),obj.var_2e(a1)
		move.l	obj.x(a0),obj.var_2a(a1)
		add.l	d2,obj.var_2e(a1)
		add.l	d3,obj.var_2a(a1)
		add.l	d4,obj.var_2e(a1)
		add.l	d5,obj.var_2a(a1)
	endif
	rts

; ------------------------------------------------------------------------------

Spr_20F4C0:
	dc.w	@Spr_20F4C0_0-*

@Spr_20F4C0_0:
	dc.b	1
	dc.b	$F8, 5, 0, 0, $F8

; ------------------------------------------------------------------------------

loc_20F4C8:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F4EE(pc,d0.w),d0
	jsr	off_20F4EE(pc,d0.w)
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$2D,0(a1)
	beq.s	loc_20F4E8
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20F4E8:
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20F4EE:
	dc.w	SpikeChainObject_1_Routine0-*
	dc.w	SpikeChainObject_1_Routine2-off_20F4EE

; ------------------------------------------------------------------------------

SpikeChainObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.l	#Spr_20F524,obj.sprite_data(a0)
	move.w	#$3F8,obj.sprite_tile(a0)
	move.b	#$B9,obj.collide_type(a0)

SpikeChainObject_1_Routine2:
	move.w	obj.var_2a(a0),obj.x(a0)
	move.w	obj.var_2e(a0),obj.y(a0)
	rts

; ------------------------------------------------------------------------------

Spr_20F524:
	dc.w	@Spr_20F524_0-*

@Spr_20F524_0:
	dc.b	1
	dc.b	$F8, 5, 0, 4, $F8

; ------------------------------------------------------------------------------