; ------------------------------------------------------------------------------

CircleSpikeBallObject:
	tst.w	obj.var_3e(a0)
	beq.s	loc_20EAA2
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$38,obj.id(a1)
	beq.s	loc_20EAA2
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20EAA2:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EAB0(pc,d0.w),d0
	jmp	off_20EAB0(pc,d0.w)

; ------------------------------------------------------------------------------

off_20EAB0:
	dc.w	CircleSpikeBallObject_0_Routine0-*
	dc.w	CircleSpikeBallObject_0_Routine2-off_20EAB0

; ------------------------------------------------------------------------------

CircleSpikeBallObject_0_Routine0:
	move.w	obj.x(a0),obj.var_34(a0)
	jsr	SpawnObject
	beq.s	loc_20EAC8
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20EAC8:
	move.b	obj.id(a0),obj.id(a1)
	move.b	#2,obj.routine(a1)
	move.w	a0,obj.var_3e(a1)
	lea	(a1),a3
	jsr	SpawnObject
	beq.s	loc_20EAE8
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20EAE8:
	move.b	obj.id(a0),obj.id(a1)
	move.b	#2,obj.routine(a1)
	move.w	a0,obj.var_3e(a1)
	lea	(a1),a2
	jsr	SpawnObject
	beq.s	loc_20EB08
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20EB08:
	move.b	obj.id(a0),obj.id(a1)
	move.b	#2,obj.routine(a1)
	move.w	a0,obj.var_3e(a1)
	move.w	#-$800,d0
	tst.b	obj.subtype(a0)
	bpl.s	loc_20EB24
	neg.w	d0

loc_20EB24:
	move.w	d0,d1
	move.w	d0,obj.var_2e(a1)
	add.w	d0,d0
	move.w	d0,obj.var_2e(a2)
	add.w	d1,d0
	move.w	d0,obj.var_2e(a3)
	move.w	#$100,obj.var_30(a0)
	tst.b	obj.subtype(a0)
	bpl.s	loc_20EB46
	neg.w	obj.var_30(a0)

loc_20EB46:
	move.b	obj.subtype(a0),d0
	bpl.s	loc_20EB4E
	neg.b	d0

loc_20EB4E:
	andi.w	#$7F,d0
	move.w	d0,obj.var_32(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#2,obj.sprite_layer(a1)
	move.b	#3,obj.sprite_layer(a2)
	move.b	#4,obj.sprite_layer(a3)
	lea	(a0),a6
	bsr.w	sub_20EB82
	lea	(a1),a6
	bsr.w	sub_20EB82
	lea	(a2),a6
	bsr.w	sub_20EB82
	lea	(a3),a6

; ------------------------------------------------------------------------------

sub_20EB82:
	ori.b	#4,obj.sprite_flags(a6)
	move.b	#$A9,obj.collide_type(a6)
	move.b	#$10,obj.width(a6)
	move.b	#$10,obj.width_2(a6)
	move.b	#$10,obj.height(a6)
	move.w	#$370,obj.sprite_tile(a6)
	move.l	#CircleSpikeBallSprites,obj.sprite_data(a6)
	move.b	#2,obj.routine(a6)
	move.w	obj.x(a0),obj.var_2a(a6)
	move.w	obj.y(a0),obj.var_2c(a6)
	move.w	obj.var_30(a0),obj.var_30(a6)
	move.w	obj.var_32(a0),obj.var_32(a6)
	rts

; ------------------------------------------------------------------------------

CircleSpikeBallObject_0_Routine2:
	move.w	obj.var_30(a0),d0
	add.w	d0,obj.var_2e(a0)
	move.w	obj.var_2e(a0),d0
	asr.w	#8,d0
	jsr	SineCosine
	move.w	obj.var_32(a0),d3
	asr.w	d3,d1
	asr.w	d3,d0
	add.w	obj.var_2a(a0),d1
	add.w	obj.var_2c(a0),d0
	move.w	d1,obj.x(a0)
	move.w	d0,obj.y(a0)
	jsr	DrawObject
	tst.w	obj.var_3e(a0)
	bne.s	locret_20EC0C
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

locret_20EC0C:
	rts

; ------------------------------------------------------------------------------

CircleSpikeBallSprites:
	include	"src/sprites/r4/circle_spike_ball.asm"
	even

; ------------------------------------------------------------------------------
