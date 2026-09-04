; ------------------------------------------------------------------------------

BouncePlatformObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	BouncePlatformRoutineTable(pc,d0.w),d0
	jsr	BouncePlatformRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Bounce Platform object routine pointers.
BouncePlatformRoutineTable:
	dc.w	BouncePlatformObject_0_Routine0-*
	dc.w	BouncePlatformObject_0_Routine2-BouncePlatformRoutineTable
	dc.w	BouncePlatformObject_0_Routine4-BouncePlatformRoutineTable
	dc.w	BouncePlatformObject_0_Routine6-BouncePlatformRoutineTable

; ------------------------------------------------------------------------------

BouncePlatformPlayerCollision:
	jmp	BouncePlatformHandlePlayer

; ------------------------------------------------------------------------------

BouncePlatformObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$43E8,obj.sprite_tile(a0)
	move.l	#BouncePlatformSprites,obj.sprite_data(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$20,obj.width_2(a0)

BouncePlatformObject_0_Routine2:
	jsr	BouncePlatformCheckBounceWindow(pc)
	bne.s	BouncePlatformContinueRoutine
	move.w	#-$600,obj.y_speed(a0)
	move.w	#$10,obj.var_3e(a0)
	addq.b	#2,obj.routine(a0)

BouncePlatformContinueRoutine:
	bra.w	BouncePlatformPlayerCollision

; ------------------------------------------------------------------------------

BouncePlatformObject_0_Routine4:
	jsr	BouncePlatformIntegrateVerticalMotion(pc)
	jsr	CheckBlockUp
	tst.w	d1
	bpl.s	BouncePlatformAfterUpwardCheck
	clr.w	obj.y_speed(a0)

BouncePlatformAfterUpwardCheck:
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	BouncePlatformUpdatePlayerCollision
	jsr	BouncePlatformCheckBounceWindow(pc)
	bne.s	BouncePlatformReverseBounce
	move.w	#$FA00,obj.y_speed(a0)
	move.w	#$10,obj.var_3e(a0)
	btst	#7,obj.sprite_flags(a0)
	beq.s	BouncePlatformUpdatePlayerCollision
	move.w	#$B4,d0
	jsr	PlayFmSound
	bra.s	BouncePlatformUpdatePlayerCollision

; ------------------------------------------------------------------------------

BouncePlatformReverseBounce:
	move.w	#-$180,obj.y_speed(a0)
	move.w	#$10,obj.var_3e(a0)
	addq.b	#2,obj.routine(a0)

BouncePlatformUpdatePlayerCollision:
	bra.w	BouncePlatformPlayerCollision

; ------------------------------------------------------------------------------

BouncePlatformObject_0_Routine6:
	jsr	BouncePlatformIntegrateVerticalMotion(pc)
	tst.w	obj.y_speed(a0)
	bmi.s	BouncePlatformMotionReturn
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	BouncePlatformMotionReturn
	clr.w	obj.y_speed(a0)
	clr.w	obj.var_3e(a0)
	subq.b	#4,obj.routine(a0)

BouncePlatformMotionReturn:
	bra.w	BouncePlatformPlayerCollision

; ------------------------------------------------------------------------------

; Integrate vertical velocity and clamp the downward limit.
BouncePlatformIntegrateVerticalMotion:
	move.w	obj.y_speed(a0),d0
	add.w	obj.var_3e(a0),d0
	bmi.s	BouncePlatformClampDownwardSpeed
	cmpi.w	#$600,d0
	bcs.s	BouncePlatformClampDownwardSpeed
	move.w	#$600,d0

BouncePlatformClampDownwardSpeed:
	move.w	d0,obj.y_speed(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

; Test whether the current zone palette-cycle step enables a bounce.
BouncePlatformCheckBounceWindow:
	cmpi.b	#2,time_zone
	bcc.s	BouncePlatformNoBounce
	move.b	#$3C,d0
	tst.b	time_zone
	beq.s	BouncePlatformCheckCycleStep
	addi.b	#$1E,d0


BouncePlatformCheckCycleStep:
	cmp.b	palette_cycle_steps+3,d0
	beq.s	BouncePlatformBounceReady

BouncePlatformNoBounce:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

BouncePlatformBounceReady:
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

BouncePlatformSprites:
	include	"sprites/r6/bounce_platform.asm"
	even

; ------------------------------------------------------------------------------

; Resolve the player collision using a temporary height extension while moving.
BouncePlatformHandlePlayer:
	lea	player_object,a1
	move.w	obj.y_speed(a1),d0
	bpl.s	BouncePlatformPlayerVelocityCheck
	neg.w	d0
	cmpi.w	#$600,d0
	bgt.w	BouncePlatformPlayerCollisionReturn

BouncePlatformPlayerVelocityCheck:
	tst.w	obj.y_speed(a0)
	beq.s	BouncePlatformClearCollisionExtension
	move.b	#4,obj.var_2e(a0)
	bra.s	BouncePlatformApplyPlayerCollision

; ------------------------------------------------------------------------------

BouncePlatformClearCollisionExtension:
	move.b	#0,obj.var_2e(a0)


BouncePlatformApplyPlayerCollision:
	move.b	obj.var_2e(a0),d0
	add.b	d0,obj.height(a0)
	lea	player_object,a1
	bsr.s	BouncePlatformSolidCollision
	move.b	obj.var_2e(a0),d0
	sub.b	d0,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

BouncePlatformSolidCollision:
	move.w	obj.y_speed(a1),obj.var_30(a0)
	btst	#3,obj.flags(a1)
	beq.s	BouncePlatformAfterVelocityAdjust
	btst	#1,obj.flags(a1)
	bne.s	BouncePlatformAfterVelocityAdjust
	clr.w	obj.y_speed(a1)

BouncePlatformAfterVelocityAdjust:
	jsr	SolidObject
	bne.s	BouncePlatformPlacePlayer
	move.w	obj.var_30(a0),obj.y_speed(a1)

BouncePlatformPlayerCollisionReturn:
	rts

; ------------------------------------------------------------------------------

BouncePlatformPlacePlayer:
	cmpi.b	#6,obj.routine(a1)
	bcc.s	BouncePlatformStopPlayer
	move.l	obj.y(a0),obj.y(a1)
	move.b	obj.height(a1),d0
	ext.w	d0
	addi.w	#$10,d0
	sub.w	d0,obj.y(a1)
	tst.w	obj.y_speed(a0)
	bge.s	BouncePlatformStopPlayer
	move.w	obj.y_speed(a0),obj.y_speed(a1)
	rts

; ------------------------------------------------------------------------------

BouncePlatformStopPlayer:
	clr.w	obj.y_speed(a1)
	rts

; ------------------------------------------------------------------------------
