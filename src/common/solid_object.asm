; ------------------------------------------------------------------------------

GetOffObject:
	btst	#3,obj.flags(a0)
	beq.s	GetOffObjectReturn
	btst	#3,obj.flags(a1)
	beq.s	GetOffObjectReturn
	moveq	#0,d0
	move.b	obj.var_3d(a1),d0
	lsl.w	#6,d0
	addi.l	#object_pool&$FFFFFF,d0
	cmpa.w	d0,a0
	bne.s	GetOffObjectReturn
	if def(R8_VARIANT)
		if (R8_VARIANT<>5)|(DEMO=0)|(REGION=USA)
	tst.b	obj.var_2a(a1)
	beq.s	GetOffObjectClearAttachment
			move.w	#$AB,d0
			jsr	PlayFmSound
		endif
	else
	tst.b	obj.var_2a(a1)
	beq.s	GetOffObjectClearAttachment
	move.w	#$AB,d0
	jsr	PlayFmSound
	endif

GetOffObjectClearAttachment:
	clr.b	obj.var_38(a1)
	bset	#1,obj.flags(a1)
	bclr	#3,obj.flags(a1)
	bclr	#3,obj.flags(a0)
	btst	#6,obj.var_2c(a1)
	bne.s	GetOffObjectClearParentLink
	cmpi.b	#$17,obj.anim_id(a1)
	beq.s	GetOffObjectClearParentLink
	bclr	#0,obj.var_2c(a1)

GetOffObjectClearParentLink:
	clr.b	obj.var_3d(a1)
	cmpi.b	#$2B,obj.anim_id(a1)
	bne.s	GetOffObjectReturn
	bclr	#1,obj.flags(a1)

GetOffObjectReturn:
	rts

; ------------------------------------------------------------------------------

StandOnObject:
	cmpi.b	#4,obj.routine(a1)
	bne.s	StandOnObjectAttach
	subq.b	#2,obj.routine(a1)
	move.w	#120,obj.var_30(a1)

StandOnObjectAttach:
	clr.b	obj.routine_2(a0)
	clr.b	obj.var_3c(a1)
	bset	#3,obj.flags(a0)
	bne.s	StandOnObjectSetParent
	if def(R8_VARIANT)
		if (R8_VARIANT<>5)|(DEMO=0)|(REGION=USA)
	cmpi.b	#$2B,obj.anim_id(a1)
	bne.s	StandOnObjectResizePlayer
	bclr	#3,obj.flags(a0)
	bra.w	GetOffObject
		endif
	else
	cmpi.b	#$2B,obj.anim_id(a1)
	bne.s	StandOnObjectResizePlayer
	bclr	#3,obj.flags(a0)
	bra.w	GetOffObject
	endif

; ------------------------------------------------------------------------------

StandOnObjectResizePlayer:
	bclr	#4,obj.flags(a1)
	bclr	#2,obj.flags(a1)
	beq.s	StandOnObjectSetParent
	if def(R8_VARIANT)
		if (R8_VARIANT=5)&(DEMO<>0)&(REGION<>USA)
			tst.b	$FF1587
		else
			tst.b	shrunk_player
		endif
	else
		tst.b	shrunk_player
	endif
	beq.s	StandOnObjectResizeNormal
	move.b	#$A,obj.height(a1)
	move.b	#5,obj.width(a1)
	subq.w	#2,obj.y(a1)
	bra.s	StandOnObjectResetAnimation

; ------------------------------------------------------------------------------

StandOnObjectResizeNormal:
	move.b	#$13,obj.height(a1)
	move.b	#9,obj.width(a1)
	subq.w	#5,obj.y(a1)

StandOnObjectResetAnimation:
	move.b	#0,obj.anim_id(a1)

StandOnObjectSetParent:
	bset	#3,obj.flags(a1)
	beq.s	StandOnObjectStoreParent
	moveq	#0,d0
	move.b	obj.var_3d(a1),d0
	lsl.w	#6,d0
	addi.l	#object_pool&$FFFFFF,d0
	cmpa.w	d0,a0
	beq.s	StandOnObjectReturn
	movea.l	d0,a2
	bclr	#3,obj.flags(a2)

StandOnObjectStoreParent:
	move.w	a0,d0
	subi.w	#object_pool,d0
	lsr.w	#6,d0
	andi.w	#$7F,d0
	move.b	d0,obj.var_3d(a1)
	move.b	#0,obj.angle(a1)
	move.w	#0,obj.y_speed(a1)
	cmpi.b	#$A,obj.id(a0)
	bne.s	StandOnObjectCopyGroundSpeed
	cmpi.b	#2,obj.routine(a0)
	beq.s	StandOnObjectClearPushFlag

StandOnObjectCopyGroundSpeed:
	move.w	obj.x_speed(a1),obj.ground_speed(a1)

StandOnObjectClearPushFlag:
	bclr	#1,obj.flags(a1)

StandOnObjectReturn:
	rts

; ------------------------------------------------------------------------------

BottomSolidObject:
	move.b	#2,obj.routine_2(a0)
	bra.s	SolidObject

; ------------------------------------------------------------------------------

TopSolidObject:
	move.b	#1,obj.routine_2(a0)

; ------------------------------------------------------------------------------

SolidObject:
	cmpi.b	#$17,obj.anim_id(a1)
	beq.w	SolidObjectRelease
	btst	#6,obj.var_2c(a1)
	bne.w	SolidObjectRelease
	cmpi.b	#6,obj.routine(a1)
	bcc.w	SolidObjectRelease
	if def(R8_VARIANT)
		if (R8_VARIANT=5)&(DEMO<>0)&(REGION<>USA)
			cmpi.b	#$2B,obj.anim_id(a1)
			beq.w	SolidObjectRelease
		endif
	endif
	tst.b	obj.id(a1)
	beq.w	SolidObjectRelease
	tst.b	obj.sprite_flags(a0)
	bpl.w	SolidObjectRelease
	tst.b	debug_mode
	bne.w	SolidObjectRelease
	move.b	obj.width_2(a0),d1
	ext.w	d1
	addi.w	#$A,d1
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	add.w	d1,d0
	bmi.w	SolidObjectRelease
	move.w	d1,d2
	add.w	d2,d2
	cmp.w	d2,d0
	bcc.w	SolidObjectRelease
	if def(R8_VARIANT)
		if (R8_VARIANT<>5)|(DEMO=0)|(REGION=USA)
	cmpi.b	#$2B,obj.anim_id(a1)
	bne.s	SolidObjectCheckVerticalMotion
	btst	#3,obj.flags(a0)
	bne.s	SolidObjectCheckVerticalOverlap
	bra.w	SolidObjectRelease
		endif
	else
	cmpi.b	#$2B,obj.anim_id(a1)
	bne.s	SolidObjectCheckVerticalMotion
	btst	#3,obj.flags(a0)
	bne.s	SolidObjectCheckVerticalOverlap
	bra.w	SolidObjectRelease
	endif

; ------------------------------------------------------------------------------

SolidObjectCheckVerticalMotion:
	cmpi.b	#1,obj.routine_2(a0)
	bne.s	SolidObjectCheckVerticalOverlap
	tst.w	obj.y_speed(a1)
	beq.s	SolidObjectCheckVerticalOverlap
	bmi.w	SolidObjectRelease

SolidObjectCheckVerticalOverlap:
	move.b	obj.height(a0),d2
	ext.w	d2
	move.b	obj.height(a1),d3
	ext.w	d3
	add.w	d2,d3
	addq.w	#2,d3
	move.w	obj.y(a1),d2
	sub.w	obj.y(a0),d2
	add.w	d3,d2
	bmi.w	SolidObjectRelease
	move.w	d3,d4
	add.w	d4,d4
	cmp.w	d4,d2
	bcc.w	SolidObjectRelease
	move.w	d0,d4
	cmp.w	d0,d1
	bcc.s	SolidObjectResolveHorizontalPenetration
	add.w	d1,d1
	sub.w	d1,d0
	move.w	d0,d4
	neg.w	d4

SolidObjectResolveHorizontalPenetration:
	move.w	d2,d5
	cmp.w	d2,d3
	bcc.s	SolidObjectResolveVerticalPenetration
	add.w	d3,d3
	sub.w	d3,d2
	move.w	d2,d5
	neg.w	d5

SolidObjectResolveVerticalPenetration:
	cmp.w	d4,d5
	bcs.w	SolidObjectVerticalContact
	cmpi.b	#1,obj.routine_2(a0)
	beq.w	SolidObjectRelease
	cmpi.b	#$A,obj.id(a0)
	bne.s	SolidObjectPushPlayer
	btst	#1,obj.flags(a1)
	bne.w	SolidObjectRelease

SolidObjectPushPlayer:
	cmpi.b	#4,d5
	bls.w	SolidObjectRelease
	bsr.w	PushObject
	move.l	d0,-(sp)
	bsr.w	GetOffObject
	clr.b	obj.routine_2(a0)
	move.l	(sp)+,d0
	sub.w	d0,obj.x(a1)
	tst.w	d0
	bmi.s	SolidObjectPushNegativeOffset
	tst.w	obj.x_speed(a1)
	beq.s	SolidObjectStopPushing
	bpl.s	SolidObjectPushIntoWall
	bra.s	SolidObjectStopPushing

; ------------------------------------------------------------------------------

SolidObjectPushNegativeOffset:
	tst.w	obj.x_speed(a1)
	beq.s	SolidObjectStopPushing
	bpl.s	SolidObjectStopPushing

SolidObjectPushIntoWall:
	bsr.w	CheckWallCrush
	btst	#1,obj.flags(a1)
	bne.s	SolidObjectStopHorizontalMotion
	bset	#5,obj.flags(a1)
	bset	#5,obj.flags(a0)
	move.w	#0,obj.ground_speed(a1)

SolidObjectStopHorizontalMotion:
	move.w	#0,obj.x_speed(a1)
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

SolidObjectStopPushing:
	if def(R8_VARIANT)
		if (R8_VARIANT<>5)|(DEMO=0)|(REGION=USA)
	bsr.w	StopObjPush
	bsr.w	CheckWallCrush
		else
	bsr.w	CheckWallCrush
		endif
	else
	bsr.w	StopObjPush
	bsr.w	CheckWallCrush
	endif
	bclr	#5,obj.flags(a1)
	bclr	#5,obj.flags(a0)
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

SolidObjectVerticalContact:
	cmpi.b	#$19,obj.id(a0)
	bne.s	SolidObjectCheckGroundContact
	btst	#2,obj.flags(a1)
	bne.w	SolidObjectRelease

SolidObjectCheckGroundContact:
	move.b	obj.height(a0),d0
	ext.w	d0
	move.b	obj.height(a1),d1
	ext.w	d1
	add.w	d0,d1
	tst.w	d2
	beq.s	SolidObjectCheckFallingPlayer
	bmi.w	SolidObjectCheckTopContact

SolidObjectCheckFallingPlayer:
	if def(R8_VARIANT)
		if (R8_VARIANT<>5)|(DEMO=0)|(REGION=USA)
	cmpi.b	#$2B,obj.anim_id(a1)
	beq.s	SolidObjectCarryPlayer
		endif
	else
	cmpi.b	#$2B,obj.anim_id(a1)
	beq.s	SolidObjectCarryPlayer
	endif
	tst.w	obj.y_speed(a1)
	beq.s	SolidObjectCarryPlayer
	bmi.w	SolidObjectRelease

SolidObjectCarryPlayer:
	move.w	obj.y(a0),obj.y(a1)
	sub.w	d1,obj.y(a1)
	moveq	#0,d1
	move.w	obj.x_speed(a0),d1
	ext.l	d1
	asl.l	#8,d1
	move.l	obj.x(a1),d0
	add.l	d1,d0
	move.l	d0,obj.x(a1)
	move.b	#$C0,d0
	tst.w	obj.x_speed(a0)
	beq.s	SolidObjectCarryPlayerVertical
	bpl.s	SolidObjectCarryPlayerCheckFront
	neg.b	d0

SolidObjectCarryPlayerCheckFront:
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	PlayerCheckBlockFront
	movem.l	(sp)+,a0-a1
	tst.w	d1
	bpl.s	SolidObjectCarryPlayerVertical
	tst.w	obj.x_speed(a0)
	bpl.s	SolidObjectCarryPlayerFrontCorrection
	neg.w	d1

SolidObjectCarryPlayerFrontCorrection:
	add.w	d1,obj.x(a1)

SolidObjectCarryPlayerVertical:
	moveq	#0,d1
	move.w	obj.y_speed(a0),d1
	ext.l	d1
	asl.l	#8,d1
	move.l	obj.y(a1),d0
	add.l	d1,d0
	move.l	d0,obj.y(a1)

	cmpi.b	#$A,obj.id(a0)
	beq.s	SolidObjectStandPlayer
	tst.w	obj.y_speed(a0)
	bmi.s	SolidObjectCheckUpwardContact
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	PlayerCheckBlockDownWide
	movem.l	(sp)+,a0-a1
	tst.w	d1
	bpl.s	SolidObjectCheckUpwardContact
	add.w	d1,obj.y(a1)
	bra.w	SolidObjectRelease

; ------------------------------------------------------------------------------

SolidObjectCheckUpwardContact:
	tst.w	obj.y_speed(a0)
	bpl.s	SolidObjectStandPlayer
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	PlayerCheckBlockUp
	movem.l	(sp)+,a0-a1
	tst.w	d1
	bpl.s	SolidObjectStandPlayer
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	KillPlayer
	movem.l	(sp)+,a0-a1
	bra.s	SolidObjectRelease

; ------------------------------------------------------------------------------

SolidObjectStandPlayer:
	bsr.w	StandOnObject
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

SolidObjectCheckTopContact:
	cmpi.b	#1,obj.routine_2(a0)
	beq.s	SolidObjectRelease
	cmpi.b	#9,obj.id(a0)
	beq.s	SolidObjectRelease
	cmpi.b	#$A,obj.id(a0)
	bne.s	SolidObjectCheckTopPlayer
	cmpi.b	#2,obj.routine_2(a0)
	beq.s	SolidObjectDetachPlayer
	btst	#1,obj.sprite_flags(a0)
	bne.s	SolidObjectDetachPlayer
	bra.s	SolidObjectRelease

; ------------------------------------------------------------------------------

SolidObjectCheckTopPlayer:
	btst	#1,obj.flags(a1)
	bne.s	SolidObjectDetachPlayer
	tst.w	obj.y_speed(a0)
	beq.s	SolidObjectDetachPlayer
	bmi.s	SolidObjectDetachPlayer
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	KillPlayer
	movem.l	(sp)+,a0-a1

SolidObjectDetachPlayer:
	sub.w	d2,obj.y(a1)
	move.w	#0,obj.y_speed(a1)
	bsr.w	StopObjPush
	bsr.w	GetOffObject
	clr.b	obj.routine_2(a0)
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

SolidObjectRelease:
	bsr.w	StopObjPush
	bsr.w	GetOffObject
	clr.b	obj.routine_2(a0)
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

CheckWallCrush:
	; Stop a carried player when the solid object's horizontal motion crushes it.
	tst.w	obj.x_speed(a0)
	beq.s	CheckWallCrushReturn
	cmpi.b	#$A,obj.id(a0)
	beq.s	CheckWallCrushReturn
	move.b	#$C0,d0
	tst.w	obj.x_speed(a0)
	bpl.s	CheckWallCrushCheckFront
	neg.b	d0

CheckWallCrushCheckFront:
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	PlayerCheckBlockFront
	movem.l	(sp)+,a0-a1
	tst.w	d1
	bpl.s	CheckWallCrushReturn
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	KillPlayer
	movem.l	(sp)+,a0-a1

CheckWallCrushReturn:
	rts

; ------------------------------------------------------------------------------

PushObject:
	; Record the solid object's slot as the player's current push target.
	cmpi.b	#$A,obj.id(a0)
	bne.s	PushObjectCheckExisting
	move.b	#0,obj.collide_type(a1)
	rts

; ------------------------------------------------------------------------------

PushObjectCheckExisting:
	moveq	#0,d1
	move.b	obj.collide_type(a1),d1
	beq.s	PushObjectStoreTarget
	lsl.w	#6,d1
	addi.l	#object_pool&$FFFFFF,d1
	cmpa.w	d1,a0
	beq.s	PushObjectReturn
	movea.l	d1,a2
	tst.w	obj.x_speed(a0)
	bne.s	PushObjectCheckOverlap
	tst.w	obj.x_speed(a2)
	beq.s	PushObjectReturn

PushObjectCheckOverlap:
	move.w	obj.x(a1),d1
	cmp.w	obj.x(a0),d1
	bcc.s	PushObjectCheckLeftTarget
	cmp.w	obj.x(a2),d1
	bcs.s	PushObjectReturn
	bra.s	PushObjectKillPlayer

; ------------------------------------------------------------------------------

PushObjectCheckLeftTarget:
	cmp.w	obj.x(a2),d1
	bcc.s	PushObjectReturn

PushObjectKillPlayer:
	cmpi.b	#$15,obj.id(a0)
	beq.s	PushObjectReturn
	movem.l	d0/a0-a1,-(sp)
	movea.l	a1,a0
	jsr	KillPlayer
	movem.l	(sp)+,d0/a0-a1
	rts

; ------------------------------------------------------------------------------

PushObjectStoreTarget:
	move.w	a0,d1
	subi.w	#object_pool,d1
	lsr.w	#6,d1
	andi.w	#$7F,d1
	move.b	d1,obj.collide_type(a1)

PushObjectReturn:
	rts

; ------------------------------------------------------------------------------

StopObjPush:
	; Clear the player's push target when it still refers to this object.
	moveq	#0,d1
	move.b	obj.collide_type(a1),d1
	beq.s	StopObjPushReturn
	lsl.w	#6,d1
	addi.l	#object_pool&$FFFFFF,d1
	cmpa.w	d1,a0
	bne.s	StopObjPushReturn
	move.b	#0,obj.collide_type(a1)

StopObjPushReturn:
	rts

; ------------------------------------------------------------------------------
