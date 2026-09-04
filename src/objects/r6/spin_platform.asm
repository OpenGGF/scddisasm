; ------------------------------------------------------------------------------

SpinPlatformObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	SpinPlatformRoutineTable(pc,d0.w),d0
	jsr	SpinPlatformRoutineTable(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

; Spin Platform object routine pointers.
SpinPlatformRoutineTable:
	dc.w	SpinPlatformObject_0_Routine0-*
	dc.w	SpinPlatformObject_0_Routine2-SpinPlatformRoutineTable

; ------------------------------------------------------------------------------

SpinPlatformSolidCollision:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

SpinPlatformObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.w	#$436A,obj.sprite_tile(a0)
	move.l	#SpinPlatformSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$10,obj.width_2(a0)
	addq.b	#2,obj.routine(a0)

SpinPlatformObject_0_Routine2:
	bsr.w	SpinPlatformMoveDispatch
	lea	SpinPlatformAnims(pc),a1
	jsr	AnimateObject
	lea	player_object,a1
	bsr.w	SpinPlatformSolidCollision
	beq.s	SpinPlatformSupportReturn
	bset	#0,obj.flags(a1)
	andi.b	#$FC,obj.sprite_flags(a1)
	ori.b	#1,obj.sprite_flags(a1)
	bset	#0,obj.var_2c(a1)
	bne.s	SpinPlatformPlayerAlreadySupported
	move.b	#$2D,obj.anim_id(a1)
	moveq	#0,d0
	move.b	d0,obj.var_2b(a1)
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcc.s	SpinPlatformStorePlayerOffset
	neg.w	d0
	move.b	#$80,obj.var_2b(a1)

SpinPlatformStorePlayerOffset:
	move.b	d0,obj.var_39(a1)

SpinPlatformPlayerAlreadySupported:
	cmpi.b	#6,obj.routine(a1)
	bcc.s	SpinPlatformSupportReturn
	bra.s	SpinPlatformRotatePlayer

; ------------------------------------------------------------------------------

SpinPlatformSupportReturn:
	rts

; ------------------------------------------------------------------------------

; Return nonzero when the player is within the platform's top-side height band.
SpinPlatformCheckPlayerHeight:
	moveq	#0,d0
	move.b	obj.height(a1),d0
	add.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bmi.s	SpinPlatformPlayerBelowSurface
	cmpi.w	#$10,d0
	bcs.s	SpinPlatformPlayerBelowSurface
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

SpinPlatformPlayerBelowSurface:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

SpinPlatformRotatePlayer:
	addq.b	#4,obj.var_2b(a1)
	move.b	obj.var_2b(a1),d0
	jsr	SineCosine
	moveq	#0,d0
	move.b	obj.var_39(a1),d0
	muls.w	d1,d0
	asr.l	#8,d0
	move.w	obj.x(a0),obj.x(a1)
	add.w	d0,obj.x(a1)
	moveq	#0,d0
	move.b	obj.var_2b(a1),d0
	move.b	d0,d1
	andi.b	#$F0,d0
	lsr.b	#4,d0
	move.b	SpinPlatformPlayerAnimationByAngle(pc,d0.w),obj.anim_index(a1)
	andi.b	#$3F,d1
	bne.s	SpinPlatformRotationContinue
	addq.b	#1,obj.var_39(a1)

SpinPlatformRotationContinue:
	move.w	p1_joy_hold,player_joy_hold
	cmpi.b	#1,0(a1)
	beq.s	SpinPlatformAdjustPlayerOffsetEntry
	move.w	p2_joy_hold,player_joy_hold

SpinPlatformAdjustPlayerOffsetEntry:
	bsr.w	SpinPlatformAdjustPlayerOffset
	bra.w	SpinPlatformLaunchPlayer

; ------------------------------------------------------------------------------

	rts

; ------------------------------------------------------------------------------

; Player animation frame selected from the platform rotation angle.
SpinPlatformPlayerAnimationByAngle:
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	1
	dc.b	2
	dc.b	2
	dc.b	2
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	4
	dc.b	4
	dc.b	5
	dc.b	5
	dc.b	5

; ------------------------------------------------------------------------------

SpinPlatformAdjustPlayerOffset:
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcc.s	SpinPlatformPlayerToRight
	btst	#2,player_joy_hold
	beq.s	SpinPlatformPlayerToLeft
	addq.b	#1,obj.var_39(a1)
	bra.s	SpinPlatformPlayerOffsetReturn

; ------------------------------------------------------------------------------

SpinPlatformPlayerToLeft:
	btst	#3,player_joy_hold
	beq.s	SpinPlatformPlayerOffsetReturn
	subq.b	#1,obj.var_39(a1)
	bcc.s	SpinPlatformPlayerOffsetReturn
	clr.b	obj.var_39(a1)
	bra.s	SpinPlatformPlayerOffsetReturn

; ------------------------------------------------------------------------------

SpinPlatformPlayerToRight:
	btst	#3,player_joy_hold
	beq.s	SpinPlatformPlayerToLeftFromRight
	addq.b	#1,obj.var_39(a1)
	bra.s	SpinPlatformPlayerOffsetReturn

; ------------------------------------------------------------------------------

SpinPlatformPlayerToLeftFromRight:
	btst	#2,player_joy_hold
	beq.s	SpinPlatformPlayerOffsetReturn
	subq.b	#1,obj.var_39(a1)
	bcc.s	SpinPlatformPlayerOffsetReturn
	clr.b	obj.var_39(a1)

SpinPlatformPlayerOffsetReturn:
	rts

; ------------------------------------------------------------------------------

SpinPlatformLaunchPlayer:
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.w	SpinPlatformLaunchReturn
	clr.b	obj.var_2c(a1)
	move.w	#$680,d2
	moveq	#0,d0
	move.b	obj.angle(a1),d0
	subi.b	#$40,d0
	jsr	SineCosine
	muls.w	d2,d1
	asr.l	#8,d1
	add.w	d1,obj.x_speed(a1)
	muls.w	d2,d0
	asr.l	#8,d0
	add.w	d0,obj.y_speed(a1)
	bset	#1,obj.flags(a1)
	bclr	#5,obj.flags(a1)
	move.b	#1,obj.var_3c(a1)
	clr.b	obj.var_38(a1)
	tst.b	shrunk_player
	beq.s	SpinPlatformSetNormalDimensions
	move.b	#$A,obj.height(a1)
	move.b	#5,obj.width(a1)
	bra.s	SpinPlatformSetPostLaunchDimensions

; ------------------------------------------------------------------------------

SpinPlatformSetNormalDimensions:
	move.b	#$13,obj.height(a1)
	move.b	#9,obj.width(a1)

SpinPlatformSetPostLaunchDimensions:
	btst	#2,obj.flags(a1)
	bne.s	SpinPlatformSetAirborneState
	tst.b	shrunk_player
	beq.s	SpinPlatformSetStandingDimensions
	move.b	#$A,obj.height(a1)
	move.b	#5,obj.width(a1)
	bra.s	SpinPlatformSetStandingState

; ------------------------------------------------------------------------------

SpinPlatformSetStandingDimensions:
	move.b	#$E,obj.height(a1)
	move.b	#7,obj.width(a1)
	addq.w	#5,obj.y(a1)

SpinPlatformSetStandingState:
	bset	#2,obj.flags(a1)
	move.b	#2,obj.anim_id(a1)

SpinPlatformLaunchReturn:
	rts

; ------------------------------------------------------------------------------

SpinPlatformSetAirborneState:
	bset	#4,obj.flags(a1)
	rts

; ------------------------------------------------------------------------------

SpinPlatformMoveDispatch:
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.w	d0,d0
	move.w	SpinPlatformMoveRoutineTable(pc,d0.w),d0
	jmp	SpinPlatformMoveRoutineTable(pc,d0.w)

; ------------------------------------------------------------------------------

; Sine-motion routines selected by the platform subtype.
SpinPlatformMoveRoutineTable:
	dc.w	SpinPlatformObject_1_Routine0-*
	dc.w	SpinPlatformObject_1_Routine2-SpinPlatformMoveRoutineTable
	dc.w	SpinPlatformObject_1_Routine4-SpinPlatformMoveRoutineTable
	dc.w	SpinPlatformObject_1_Routine6-SpinPlatformMoveRoutineTable

; ------------------------------------------------------------------------------

SpinPlatformObject_1_Routine4:
	bsr.w	SpinPlatformSineOffset
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

SpinPlatformObject_1_Routine6:
	bsr.w	SpinPlatformSineOffset
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

SpinPlatformObject_1_Routine0:
	move.l	obj.x(a0),-(sp)
	bsr.w	SpinPlatformSineOffset
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	move.l	obj.x(a0),d0
	sub.l	(sp)+,d0
	lsr.l	#8,d0
	move.w	d0,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

SpinPlatformObject_1_Routine2:
	move.l	obj.x(a0),-(sp)
	bsr.w	SpinPlatformSineOffset
	neg.w	d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	move.l	obj.x(a0),d0
	sub.l	(sp)+,d0
	lsr.l	#8,d0
	move.w	d0,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

SpinPlatformSineOffset:
	move.w	stage_frames,d0
	andi.w	#$FF,d0
	jsr	SineCosine
	add.w	d0,d0
	add.w	d0,d0
	asr.w	#4,d0
	addq.b	#1,obj.var_3a(a0)
	rts

; ------------------------------------------------------------------------------

SpinPlatformAnims:
	include	"anims/r6/spin_platform.asm"
	even

SpinPlatformSprites:
	include	"sprites/r6/spin_platform.asm"
	even

; ------------------------------------------------------------------------------
