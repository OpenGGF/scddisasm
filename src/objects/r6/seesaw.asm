; ------------------------------------------------------------------------------

SeesawObject:
	tst.b	obj.subtype(a0)
	bne.w	SeesawChildObject
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	SeesawRoutineTable(pc,d0.w),d0
	jsr	SeesawRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Seesaw parent routine pointers.
SeesawRoutineTable:
	dc.w	SeesawObject_0_Routine0-*
	dc.w	SeesawObject_0_Routine2-SeesawRoutineTable
	dc.w	SeesawObject_0_Routine4-SeesawRoutineTable

; ------------------------------------------------------------------------------

SeesawObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$18,obj.width(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	move.w	#$3B8,obj.sprite_tile(a0)
	move.l	#SeesawSprites,obj.sprite_data(a0)
	jsr	SpawnObject
	bne.w	SeesawDelete
	bsr.w	SeesawInitializeChild
	move.w	a1,obj.var_2a(a0)
	subi.w	#$28,obj.x(a1)
	subi.w	#$18,obj.y(a1)
	jsr	SpawnObject
	bne.w	SeesawDelete
	bsr.w	SeesawInitializeChild
	move.w	a1,obj.var_2c(a0)
	addi.w	#$28,obj.x(a1)
	addi.w	#$18,obj.y(a1)
	bset	#0,obj.sprite_flags(a1)
	bset	#0,obj.flags(a1)
	rts

; ------------------------------------------------------------------------------

; Copy the parent sprite state into a Seesaw child object.
SeesawInitializeChild:
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#$10,obj.width(a1)
	move.b	#$10,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.b	#9,obj.sprite_frame(a1)
	move.w	a0,obj.var_2a(a1)
	move.w	#$78,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

SeesawObject_0_Routine2:
	lea	SeesawAnimateTilt(pc),a1
	tst.w	obj.y_speed(a0)
	beq.s	SeesawUpdateChildCollisions
	lea	SeesawApplyTiltMotion(pc),a1

SeesawUpdateChildCollisions:
	jsr	(a1)
	move.w	a0,-(sp)
	movea.w	obj.var_2c(a0),a0
	lea	player_object,a1
	jsr	TopSolidObject
	jsr	DrawObject
	movea.w	(sp)+,a0
	move.w	a0,-(sp)
	movea.w	obj.var_2a(a0),a0
	lea	player_object,a1
	jsr	TopSolidObject
	sne	obj.var_3f(a0)
	jsr	DrawObject
	movea.w	(sp)+,a0
	movea.w	obj.var_2a(a0),a1
	tst.b	obj.var_3f(a1)
	bne.s	SeesawStartReset
	lea	SeesawAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

SeesawStartReset:
	move.b	#4,obj.routine(a0)
	move.w	#3,obj.var_2e(a0)
	move.b	#8,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

SeesawAnimateTilt:
	tst.w	obj.var_2e(a0)
	bmi.s	SeesawTiltReturn
	subq.w	#1,obj.var_2e(a0)
	bmi.s	SeesawSetTiltVelocity
	cmpi.w	#$3C,obj.var_2e(a0)
	beq.s	SeesawAdvanceAnimation
	bra.s	SeesawTiltReturn

; ------------------------------------------------------------------------------

SeesawSetTiltVelocity:
	move.w	#$100,obj.y_speed(a0)

SeesawAdvanceAnimation:
	addq.b	#1,obj.anim_id(a0)

SeesawTiltReturn:
	rts

; ------------------------------------------------------------------------------

SeesawApplyTiltMotion:
	movea.w	obj.var_2a(a0),a1
	movea.w	obj.var_2c(a0),a2
	moveq	#0,d0
	move.b	obj.y_speed(a0),d0
	add.w	d0,obj.y(a0)
	add.w	d0,obj.y(a1)
	add.w	d0,obj.y(a2)
	moveq	#0,d0
	move.b	obj.width_2(a2),d0
	move.w	obj.x(a2),d3
	cmp.w	obj.x(a0),d3
	blt.s	SeesawSelectChildWidthSign
	neg.w	d0

SeesawSelectChildWidthSign:
	add.w	d0,d3
	move.w	a0,-(sp)
	movea.w	a2,a0
	jsr	CheckBlockDown2
	movea.w	(sp)+,a0
	tst.w	d1
	bmi.s	SeesawCorrectGroundPenetration
	rts

; ------------------------------------------------------------------------------

SeesawCorrectGroundPenetration:
	movea.w	obj.var_2a(a0),a1
	movea.w	obj.var_2c(a0),a2
	add.w	d1,obj.y(a0)
	add.w	d1,obj.y(a1)
	add.w	d1,obj.y(a2)
	move.w	#0,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

SeesawObject_0_Routine4:
	movea.w	obj.var_2c(a0),a1
	subi.w	#$18,obj.y(a1)
	subi.w	#$C,obj.y(a0)
	subq.w	#1,obj.var_2e(a0)
	bpl.s	SeesawDrawChildren
	bsr.s	SeesawReset

SeesawDrawChildren:
	move.w	a0,-(sp)
	movea.w	obj.var_2c(a0),a0
	jsr	DrawObject
	movea.w	(sp),a0
	movea.w	obj.var_2a(a0),a0
	jsr	DrawObject
	movea.w	(sp)+,a0
	rts

; ------------------------------------------------------------------------------

SeesawReset:
	move.b	#2,obj.routine(a0)
	move.w	#0,obj.y_speed(a0)
	move.w	#$78,obj.var_2e(a0)
	move.w	obj.var_2a(a0),obj.var_2c(a0)
	move.w	a1,obj.var_2a(a0)
	moveq	#0,d0
	cmpi.b	#2,obj.anim_id(a0)
	bgt.s	SeesawSelectResetAnimation
	moveq	#3,d0

SeesawSelectResetAnimation:
	move.b	d0,obj.anim_id(a0)
	move.b	#$FF,obj.prev_anim_id(a0)
	rts

; ------------------------------------------------------------------------------

SeesawChildObject:
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$2C,obj.id(a1)
	bne.s	SeesawDelete
	rts

; ------------------------------------------------------------------------------

SeesawDelete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

SeesawAnims:
	include	"anims/r6/seesaw.asm"
	even

SeesawSprites:
	include	"sprites/r6/seesaw.asm"
	even

; ------------------------------------------------------------------------------
