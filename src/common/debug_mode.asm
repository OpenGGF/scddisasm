; ------------------------------------------------------------------------------

DebugModeLegacy:
	move.b	p1_joy_hold,d0
	andi.b	#$F,d0
	bne.s	DebugModeIncreaseSpeed
	move.l	#$4000,debug_speed
	bra.s	DebugModeMove

; ------------------------------------------------------------------------------

DebugModeIncreaseSpeed:
	addi.l	#$2000,debug_speed
	cmpi.l	#$80000,debug_speed
	bls.s	DebugModeMove
	move.l	#$80000,debug_speed

DebugModeMove:
	move.l	debug_speed,d0
	btst	#0,p1_joy_hold
	beq.s	DebugModeMoveDown
	sub.l	d0,obj.y(a0)

DebugModeMoveDown:
	btst	#1,p1_joy_hold
	beq.s	DebugModeMoveLeft
	add.l	d0,obj.y(a0)

DebugModeMoveLeft:
	btst	#2,p1_joy_hold
	beq.s	DebugModeMoveRight
	sub.l	d0,obj.x(a0)

DebugModeMoveRight:
	btst	#3,p1_joy_hold
	beq.s	DebugModeReadBlock
	add.l	d0,obj.x(a0)

DebugModeReadBlock:
	move.w	obj.y(a0),d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.w	obj.x(a0),d3
	jsr	GetBlock
	move.w	(a1),debug_block
	lea	DebugObjects,a2
	btst	#6,p1_joy_tap
	beq.s	DebugModeSelectObjectPrevious
	moveq	#0,d1
	move.b	debug_object,d1
	addq.b	#1,d1
	cmp.b	(a2),d1
	bcs.s	DebugModeSelectObjectNext
	move.b	#0,d1

DebugModeSelectObjectNext:
	move.b	d1,debug_object

DebugModeSelectObjectPrevious:
	btst	#7,p1_joy_tap
	beq.s	DebugModeLoadObject
	moveq	#0,d1
	move.b	debug_object,d1
	subq.b	#1,d1
	cmpi.b	#$FF,d1
	bne.s	DebugModeSelectObjectWrap
	add.b	(a2),d1

DebugModeSelectObjectWrap:
	move.b	d1,debug_object

DebugModeLoadObject:
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
	beq.s	DebugModeSpawnObject
	bsr.w	SpawnObject
	bne.s	DebugModeSpawnObject
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

DebugModeSpawnObject:
	btst	#4,p1_joy_tap
	beq.s	DebugModeResetPlayer
	move.b	#0,debug_mode
	move.l	#PlayerSprites,obj.sprite_data(a0)
	move.w	#$780,obj.sprite_tile(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.b	#4,obj.sprite_flags(a0)

DebugModeResetPlayer:
	jmp	DrawObject

; ------------------------------------------------------------------------------

	if STANDALONE=0
debug_speed:
	dc.l	$4000
	endif

; ------------------------------------------------------------------------------
