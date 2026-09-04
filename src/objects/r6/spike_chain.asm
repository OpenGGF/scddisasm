; ------------------------------------------------------------------------------

SpikeChainObject:
	move.b	obj.subtype(a0),d0
	bpl.s	SpikeChainParentObject
	bra.w	SpikeChainChildObject

; ------------------------------------------------------------------------------

SpikeChainParentObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	SpikeChainParentRoutineTable(pc,d0.w),d0
	jsr	SpikeChainParentRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Spike Chain parent routine pointers.
SpikeChainParentRoutineTable:
	dc.w	SpikeChainObject_0_Routine0-*
	dc.w	SpikeChainObject_0_Routine2-SpikeChainParentRoutineTable

; ------------------------------------------------------------------------------

SpikeChainObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.l	#SpikeChainSprites1,obj.sprite_data(a0)
	move.w	#$3F8,obj.sprite_tile(a0)
	move.w	#$100,obj.var_2c(a0)
	move.b	obj.subtype(a0),d0
	beq.s	SpikeChainSpawnChildren
	neg.w	obj.var_2c(a0)

SpikeChainSpawnChildren:
	jsr	SpawnObjectAfter
	bne.w	SpikeChainDelete
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_2e(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	jsr	SpawnObjectAfter
	bne.w	SpikeChainDelete
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_30(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	jsr	SpawnObjectAfter
	bne.w	SpikeChainDelete
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_32(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	jsr	SpawnObjectAfter
	bne.w	SpikeChainDelete
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_34(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	if STAGE_TIME<>0
		jsr	SpawnObjectAfter
		bne.w	SpikeChainDelete
		move.w	a0,obj.var_3e(a1)
		move.w	a1,obj.var_36(a0)
		move.b	obj.id(a0),obj.id(a1)
		move.b	#$FF,obj.subtype(a1)
		move.b	#8,obj.width_2(a1)
		move.b	#8,obj.height(a1)
	endif
	if STAGE_TIME=2
		jsr	SpawnObjectAfter
		bne.w	SpikeChainDelete
		move.w	a0,obj.var_3e(a1)
		move.w	a1,obj.var_38(a0)
		move.b	obj.id(a0),obj.id(a1)
		move.b	#$FF,obj.subtype(a1)
		move.b	#8,obj.width_2(a1)
		move.b	#8,obj.height(a1)
	endif
	bra.s	SpikeChainObject_0_Routine2

; ------------------------------------------------------------------------------

SpikeChainDelete:
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

SpikeChainSprites1:
	include	"sprites/spike_chain_1.asm"
	even

; ------------------------------------------------------------------------------

SpikeChainChildObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	SpikeChainChildRoutineTable(pc,d0.w),d0
	jsr	SpikeChainChildRoutineTable(pc,d0.w)
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$2D,obj.id(a1)
	beq.s	SpikeChainDrawChild
	jmp	DeleteObject

; ------------------------------------------------------------------------------

SpikeChainDrawChild:
	jmp	DrawObject

; ------------------------------------------------------------------------------

; Spike Chain child routine pointers.
SpikeChainChildRoutineTable:
	dc.w	SpikeChainObject_1_Routine0-*
	dc.w	SpikeChainObject_1_Routine2-SpikeChainChildRoutineTable

; ------------------------------------------------------------------------------

SpikeChainObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.l	#SpikeChainSprites2,obj.sprite_data(a0)
	move.w	#$3F8,obj.sprite_tile(a0)
	move.b	#$B9,obj.collide_type(a0)

SpikeChainObject_1_Routine2:
	move.w	obj.var_2a(a0),obj.x(a0)
	move.w	obj.var_2e(a0),obj.y(a0)
	rts

; ------------------------------------------------------------------------------

SpikeChainSprites2:
	include	"sprites/spike_chain_2.asm"
	even

; ------------------------------------------------------------------------------
