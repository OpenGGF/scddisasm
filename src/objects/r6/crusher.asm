; ------------------------------------------------------------------------------

CrusherObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	CrusherRoutineTable(pc,d0.w),d0
	jsr	CrusherRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Crusher routine pointers.
CrusherRoutineTable:
	dc.w	CrusherObject_0_Routine0-*
	dc.w	CrusherObject_0_Routine2-CrusherRoutineTable
	dc.w	CrusherObject_0_Routine4-CrusherRoutineTable
	dc.w	CrusherObject_0_Routine6-CrusherRoutineTable
	dc.w	CrusherObject_0_Routine8-CrusherRoutineTable

; ------------------------------------------------------------------------------

CrusherSolidCollision:
	lea	player_object,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

CrusherObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$44E8,obj.sprite_tile(a0)
	move.l	#CrusherSprites,obj.sprite_data(a0)
	move.b	#$50,obj.height(a0)
	move.b	#$30,obj.width_2(a0)
	move.w	obj.y(a0),obj.var_32(a0)

CrusherObject_0_Routine2:
	lea	player_object,a1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	bcc.s	CrusherCheckHorizontalRange
	neg.w	d0

CrusherCheckHorizontalRange:
	cmpi.w	#$C0,d0
	bcc.s	CrusherApproachCollision
	move.w	obj.x(a0),d0
	sub.w	obj.x(a1),d0
	bcs.s	CrusherApproachCollision
	cmpi.w	#$88,d0
	bcc.s	CrusherApproachCollision
	clr.b	obj.var_3c(a0)
	clr.w	obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)

CrusherApproachCollision:
	bra.w	CrusherSolidCollision

; ------------------------------------------------------------------------------

CrusherObject_0_Routine4:
	clr.b	obj.var_3c(a0)
	jsr	CrusherUpdateMotion(pc)
	cmpi.b	#2,obj.var_3b(a0)
	bne.s	CrusherExtendingCollision
	addq.b	#2,obj.routine(a0)

CrusherExtendingCollision:
	bra.w	CrusherSolidCollision

; ------------------------------------------------------------------------------

CrusherObject_0_Routine6:
	lea	player_object,a1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	bcc.s	CrusherCheckRetreatHorizontalRange
	neg.w	d0

CrusherCheckRetreatHorizontalRange:
	cmpi.w	#$C0,d0
	bcc.s	CrusherRetreatCollision
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcs.s	CrusherRetreatCollision
	cmpi.w	#$88,d0
	bcs.s	CrusherRetreatCollision
	clr.w	obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)

CrusherRetreatCollision:
	bra.w	CrusherSolidCollision

; ------------------------------------------------------------------------------

CrusherObject_0_Routine8:
	move.b	#1,obj.var_3c(a0)
	jsr	CrusherUpdateMotion(pc)
	cmpi.b	#2,obj.var_3b(a0)
	bne.s	CrusherRetractingCollision
	move.b	#2,obj.routine(a0)

CrusherRetractingCollision:
	bra.w	CrusherSolidCollision

; ------------------------------------------------------------------------------

CrusherUpdateMotion:
	lea	CrusherExtendingMotionRecords,a2
	tst.b	obj.var_3c(a0)
	beq.s	CrusherLoadMotionStep
	lea	CrusherRetractingMotionRecords,a2

CrusherLoadMotionStep:
	tst.b	obj.var_3a(a0)
	bne.s	CrusherApplyMotion
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	asl.w	#2,d0
	lea	(a2,d0.w),a2
	move.b	(a2)+,obj.var_3a(a0)
	move.b	(a2)+,d0
	ext.w	d0
	move.w	d0,obj.var_3e(a0)
	move.w	(a2)+,obj.var_30(a0)
	rts

; ------------------------------------------------------------------------------

CrusherApplyMotion:
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	move.w	obj.var_3e(a0),d0
	add.w	d0,obj.y_speed(a0)
	subq.b	#1,obj.var_3a(a0)
	bne.s	CrusherMotionReturn
	addq.b	#1,obj.var_3b(a0)

CrusherMotionReturn:
	rts

; ------------------------------------------------------------------------------

; Extend records: duration, initial velocity, and acceleration.
CrusherExtendingMotionRecords:
	dc.b	$40
	dc.b	8
	dc.w	0
	dc.b	$40
	dc.b	$F8
	dc.w	$200

; Retract records: duration, initial velocity, and acceleration.
CrusherRetractingMotionRecords:
	dc.b	$40
	dc.b	$F8
	dc.w	0
	dc.b	$40
	dc.b	8
	dc.w	-$200

CrusherSprites:
	include	"sprites/r6/crusher.asm"
	even

; ------------------------------------------------------------------------------
