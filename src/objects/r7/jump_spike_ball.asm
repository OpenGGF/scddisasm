; ------------------------------------------------------------------------------

JumpSpikeBallObject:
	tst.b	obj.subtype_2(a0)
	bne.w	loc_20E5C4
	tst.b	obj.routine(a0)
	bne.s	loc_20E586
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.w	#$38E,obj.sprite_tile(a0)
	move.l	#SpikeLaunchSprites,obj.sprite_data(a0)
	move.b	obj.subtype(a0),obj.sprite_frame(a0)
	move.w	#$96,obj.var_2a(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)

loc_20E586:
	subq.w	#1,obj.var_2a(a0)
	bne.s	loc_20E5B8
	move.w	#$96,obj.var_2a(a0)
	jsr	SpawnObject
	bne.s	loc_20E5B8
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

loc_20E5B8:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_20E5C4:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E5D8(pc,d0.w),d0
	jsr	off_20E5D8(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20E5D8:
	dc.w	JumpSpikeBallObject_0_Routine0-*
	dc.w	JumpSpikeBallObject_0_Routine2-off_20E5D8
	dc.w	JumpSpikeBallObject_0_Routine4-off_20E5D8
	dc.w	JumpSpikeBallObject_0_Routine6-off_20E5D8

; ------------------------------------------------------------------------------

JumpSpikeBallObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$B5,obj.collide_type(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$386,obj.sprite_tile(a0)
	move.l	#JumpSpikeBallSprites,obj.sprite_data(a0)
	move.w	#$20,obj.var_2e(a0)
	move.l	#$8000,d0
	btst	#0,obj.subtype(a0)
	seq	obj.var_3f(a0)
	bne.s	loc_20E630
	neg.l	d0

loc_20E630:
	move.l	d0,obj.var_30(a0)
	lea	obj.x(a0),a1
	move.w	obj.x(a0),d0
	cmpi.b	#2,obj.subtype(a0)
	bge.s	loc_20E64C
	lea	obj.y(a0),a1
	move.w	obj.y(a0),d0

loc_20E64C:
	move.w	a1,obj.var_2a(a0)
	move.w	d0,obj.var_2c(a0)

JumpSpikeBallObject_0_Routine2:
	move.l	obj.var_30(a0),d0
	movea.w	obj.var_2a(a0),a1
	add.l	d0,(a1)
	subq.w	#1,obj.var_2e(a0)
	bne.s	locret_20E66E
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2e(a0)

locret_20E66E:
	rts

; ------------------------------------------------------------------------------

JumpSpikeBallObject_0_Routine4:
	subq.w	#1,obj.var_2e(a0)
	bne.s	locret_20E69A
	addq.b	#2,obj.routine(a0)
	move.l	#$60000,d0
	move.l	#-$4000,d1
	btst	#0,obj.subtype(a0)
	bne.s	loc_20E692
	neg.l	d0
	neg.l	d1

loc_20E692:
	move.l	d0,obj.var_30(a0)
	move.l	d1,obj.var_34(a0)

locret_20E69A:
	rts

; ------------------------------------------------------------------------------

JumpSpikeBallObject_0_Routine6:
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.var_30(a0)
	move.l	obj.var_30(a0),d0
	movea.w	obj.var_2a(a0),a1
	add.l	d0,(a1)
	move.w	(a1),d0
	sub.w	obj.var_2c(a0),d0
	smi	d0
	cmp.b	obj.var_3f(a0),d0
	beq.s	locret_20E6C2
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20E6C2:
	rts

; ------------------------------------------------------------------------------

SpikeLaunchSprites:
	include	"sprites/r7/spike_launch.asm"
	even

JumpSpikeBallSprites:
	include	"sprites/r7/jump_spike_ball.asm"
	even

; ------------------------------------------------------------------------------
