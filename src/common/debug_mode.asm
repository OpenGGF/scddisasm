; ------------------------------------------------------------------------------

DebugModeLegacy:
	move.b	p1_joy_hold,d0
	andi.b	#$F,d0
	bne.s	loc_206DBE
	move.l	#$4000,debug_speed
	bra.s	loc_206DDE

; ------------------------------------------------------------------------------

loc_206DBE:
	addi.l	#$2000,debug_speed
	cmpi.l	#$80000,debug_speed
	bls.s	loc_206DDE
	move.l	#$80000,debug_speed

loc_206DDE:
	move.l	debug_speed,d0
	btst	#0,p1_joy_hold
	beq.s	loc_206DF0
	sub.l	d0,obj.y(a0)

loc_206DF0:
	btst	#1,p1_joy_hold
	beq.s	loc_206DFC
	add.l	d0,obj.y(a0)

loc_206DFC:
	btst	#2,p1_joy_hold
	beq.s	loc_206E08
	sub.l	d0,obj.x(a0)

loc_206E08:
	btst	#3,p1_joy_hold
	beq.s	loc_206E14
	add.l	d0,obj.x(a0)

loc_206E14:
	move.w	obj.y(a0),d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.w	obj.x(a0),d3
	jsr	GetBlock
	move.w	(a1),debug_block
	lea	DebugObjects,a2
	btst	#6,p1_joy_tap
	beq.s	loc_206E56
	moveq	#0,d1
	move.b	debug_object,d1
	addq.b	#1,d1
	cmp.b	(a2),d1
	bcs.s	loc_206E50
	move.b	#0,d1

loc_206E50:
	move.b	d1,debug_object

loc_206E56:
	btst	#7,p1_joy_tap
	beq.s	loc_206E76
	moveq	#0,d1
	move.b	debug_object,d1
	subq.b	#1,d1
	cmpi.b	#$FF,d1
	bne.s	loc_206E70
	add.b	(a2),d1

loc_206E70:
	move.b	d1,debug_object

loc_206E76:
	moveq	#0,d1
	move.b	debug_object,d1
	mulu.w	#$C,d1
	move.l	4(a2,d1.w),obj.sprite_data(a0)
	move.w	8(a2,d1.w),obj.sprite_tile(a0)
	move.b	3(a2,d1.w),obj.sprite_layer(a0)
	move.b	$D(a2,d1.w),obj.sprite_frame(a0)
	move.b	$C(a2,d1.w),debug_subtype_2
	move.b	$B(a2,d1.w),d0
	ori.b	#4,d0
	move.b	d0,obj.sprite_flags(a0)
	move.b	#0,obj.anim_id(a0)
	btst	#5,p1_joy_tap
	beq.s	loc_206F02
	bsr.w	SpawnObject
	bne.s	loc_206F02
	moveq	#0,d1
	move.b	debug_object,d1
	mulu.w	#$C,d1
	move.b	2(a2,d1.w),obj.id(a1)
	move.b	$A(a2,d1.w),obj.subtype(a1)
	move.b	$C(a2,d1.w),obj.subtype_2(a1)
	move.b	$D(a2,d1.w),obj.sprite_frame(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.sprite_flags(a0),d0
	andi.b	#3,d0
	move.b	d0,obj.sprite_flags(a1)
	move.b	d0,obj.flags(a1)

loc_206F02:
	btst	#4,p1_joy_tap
	beq.s	loc_206F32
	move.b	#0,debug_mode
	move.l	#PlayerSprites,obj.sprite_data(a0)
	move.w	#$780,obj.sprite_tile(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.b	#4,obj.sprite_flags(a0)

loc_206F32:
	jmp	DrawObject

; ------------------------------------------------------------------------------

	if STANDALONE=0
debug_speed:
	dc.l	$4000
	endif

; ------------------------------------------------------------------------------
