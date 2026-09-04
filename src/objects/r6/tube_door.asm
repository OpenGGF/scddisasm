; ------------------------------------------------------------------------------

TubeDoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	TubeDoorRoutineTable(pc,d0.w),d0
	jsr	TubeDoorRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Tube Door object routine pointers.
TubeDoorRoutineTable:
	dc.w	TubeDoorObject_0_Routine0-*
	dc.w	TubeDoorObject_0_Routine2-TubeDoorRoutineTable
	dc.w	TubeDoorObject_0_Routine4-TubeDoorRoutineTable
	dc.w	TubeDoorObject_0_Routine6-TubeDoorRoutineTable
	dc.w	TubeDoorObject_0_Routine8-TubeDoorRoutineTable

; ------------------------------------------------------------------------------

TubeDoorClosedCollision:
	tst.b	obj.sprite_frame(a0)
	beq.s	TubeDoorSolidCollision
	rts

; ------------------------------------------------------------------------------

TubeDoorSolidCollision:
	lea	player_object,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

TubeDoorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$4410,obj.sprite_tile(a0)
	move.l	#TubeDoorSprites,obj.sprite_data(a0)
	move.b	#4,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	tst.b	obj.subtype(a0)
	beq.s	TubeDoorObject_0_Routine2
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)

TubeDoorObject_0_Routine2:
	lea	player_object,a1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	bcc.s	TubeDoorSelectVerticalDistance
	neg.w	d0


TubeDoorSelectVerticalDistance:
	cmpi.w	#$40,d0
	bcc.s	TubeDoorClosedUpdate
	move.w	obj.x(a0),d1
	move.w	obj.x(a1),d0
	tst.b	obj.subtype(a0)
	bne.s	TubeDoorSelectHorizontalOrder
	move.w	obj.x(a0),d0
	move.w	obj.x(a1),d1

TubeDoorSelectHorizontalOrder:
	sub.w	d1,d0
	bcs.s	TubeDoorClosedUpdate
	cmpi.w	#$40,d0
	bcc.s	TubeDoorClosedUpdate
	clr.w	obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)
	btst	#7,obj.sprite_flags(a0)
	beq.s	TubeDoorClosedUpdate
	move.w	#$A4,d0
	jsr	PlayFmSound

TubeDoorClosedUpdate:
	bra.w	TubeDoorClosedCollision

; ------------------------------------------------------------------------------

TubeDoorObject_0_Routine4:
	clr.b	obj.var_3c(a0)
	jsr	TubeDoorAnimateDoor(pc)
	cmpi.b	#3,obj.sprite_frame(a0)
	bne.s	TubeDoorOpenTransitionCheck
	addq.b	#2,obj.routine(a0)

TubeDoorOpenTransitionCheck:
	bra.w	TubeDoorClosedCollision

; ------------------------------------------------------------------------------

TubeDoorObject_0_Routine6:
	lea	player_object,a1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	bcc.s	TubeDoorSelectActiveVerticalDistance
	neg.w	d0


TubeDoorSelectActiveVerticalDistance:
	cmpi.w	#$40,d0
	bcc.s	TubeDoorOpenCollisionReturn
	move.w	obj.x(a1),d1
	move.w	obj.x(a0),d0
	tst.b	obj.subtype(a0)
	bne.s	TubeDoorSelectActiveHorizontalOrder
	move.w	obj.x(a1),d0
	move.w	obj.x(a0),d1

TubeDoorSelectActiveHorizontalOrder:
	sub.w	d1,d0
	bcs.s	TubeDoorOpenCollisionReturn
	cmpi.w	#$40,d0
	bcs.s	TubeDoorOpenCollisionReturn
	clr.w	obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)
	move.w	#$A4,d0
	jsr	PlayFmSound

TubeDoorOpenCollisionReturn:
	bra.w	TubeDoorClosedCollision

; ------------------------------------------------------------------------------

TubeDoorObject_0_Routine8:
	move.b	#1,obj.var_3c(a0)
	jsr	TubeDoorAnimateDoor(pc)
	tst.b	obj.sprite_frame(a0)
	bne.s	TubeDoorCloseTransitionCheck
	move.b	#2,obj.routine(a0)

TubeDoorCloseTransitionCheck:
	bra.w	TubeDoorClosedCollision

; ------------------------------------------------------------------------------

TubeDoorAnimateDoor:
	addi.b	#$40,obj.var_3a(a0)
	bcs.s	TubeDoorAdvanceFrame
	rts

; ------------------------------------------------------------------------------

TubeDoorAdvanceFrame:
	tst.b	obj.var_3c(a0)
	bne.s	TubeDoorReverseFrame
	addq.b	#1,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

TubeDoorReverseFrame:
	subq.b	#1,obj.sprite_frame(a0)
	bcc.s	TubeDoorAnimationReturn
	clr.b	obj.sprite_frame(a0)

TubeDoorAnimationReturn:
	rts

; ------------------------------------------------------------------------------

TubeDoorSprites:
	include	"sprites/r6/tube_door.asm"
	even

; ------------------------------------------------------------------------------
