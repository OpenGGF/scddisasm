; ------------------------------------------------------------------------------

DoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	DoorRoutineTable(pc,d0.w),d0
	jsr	DoorRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Door routine pointers.
DoorRoutineTable:
	dc.w	DoorObject_0_Routine0-*
	dc.w	DoorObject_0_Routine2-DoorRoutineTable
	dc.w	DoorObject_0_Routine4-DoorRoutineTable
	dc.w	DoorObject_0_Routine6-DoorRoutineTable

; ------------------------------------------------------------------------------

DoorSolidCollision:
	lea	player_object,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

DoorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#DoorSprites,obj.sprite_data(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.w	#$3A0,obj.sprite_tile(a0)
	move.b	#$20,obj.height(a0)
	move.b	#8,obj.width_2(a0)
	cmpi.b	#2,act
	bne.s	DoorStoreSubtype
	move.w	#$330,obj.sprite_tile(a0)
	move.b	#$20,obj.height(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#1,obj.sprite_frame(a0)

DoorStoreSubtype:
	move.b	obj.subtype(a0),d0
	andi.b	#$F,d0
	move.b	d0,obj.var_30(a0)
	move.b	#$FF,obj.var_3c(a0)

DoorObject_0_Routine2:
	moveq	#0,d0
	move.b	obj.var_30(a0),d0
	lea	switch_flags,a1
	btst	#7,(a1,d0.w)
	beq.s	DoorReadSwitchState
	clr.b	obj.var_3c(a0)


DoorReadSwitchState:
	lea	player_object,a1
	move.w	obj.x(a1),obj.var_38(a0)
	move.w	obj.y(a1),obj.var_3e(a0)
	bsr.w	DoorUpdatePosition
	bsr.w	DoorSolidCollision
	cmpi.b	#$40,obj.var_3a(a0)
	bne.s	DoorOpeningUpdateReturn
	addq.b	#2,obj.routine(a0)

DoorOpeningUpdateReturn:
	rts

; ------------------------------------------------------------------------------

DoorObject_0_Routine4:
	lea	player_object,a1
	move.w	obj.x(a0),d0
	sub.w	obj.var_38(a0),d0
	bcc.s	DoorPlayerRightOfCenter
	move.b	obj.width(a1),d0
	ext.w	d0
	add.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcc.s	DoorPlayerClearReturn
	neg.w	d0
	cmp.b	obj.width_2(a0),d0
	bcs.s	DoorPlayerClearReturn
	bra.s	DoorStartClosing

; ------------------------------------------------------------------------------

DoorPlayerRightOfCenter:
	move.b	obj.width(a1),d0
	neg.b	d0
	ext.w	d0
	add.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcs.s	DoorPlayerClearReturn
	cmp.b	obj.width_2(a0),d0
	bcs.s	DoorPlayerClearReturn

DoorStartClosing:
	addq.b	#2,obj.routine(a0)

DoorPlayerClearReturn:
	rts

; ------------------------------------------------------------------------------

DoorObject_0_Routine6:
	st	obj.var_3c(a0)
	bsr.w	DoorUpdatePosition
	tst.b	obj.var_3a(a0)
	bne.s	DoorClosingCollision
	move.b	#2,obj.routine(a0)

DoorClosingCollision:
	bra.w	DoorSolidCollision

; ------------------------------------------------------------------------------

DoorUpdatePosition:
	bsr.w	DoorAdvanceAnimation
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

DoorAdvanceAnimation:
	tst.b	obj.var_3c(a0)
	beq.s	DoorOpenAnimation
	subq.b	#4,obj.var_3a(a0)
	bcc.s	DoorAnimationReturn
	clr.b	obj.var_3a(a0)
	bra.s	DoorAnimationReturn

; ------------------------------------------------------------------------------

DoorOpenAnimation:
	addq.b	#4,obj.var_3a(a0)
	move.b	obj.var_3a(a0),d0
	cmpi.b	#$40,d0
	bcs.s	DoorAnimationReturn
	move.b	#$40,obj.var_3a(a0)

DoorAnimationReturn:
	rts

; ------------------------------------------------------------------------------

DoorSprites:
	include	"sprites/r6/door.asm"
	even

; ------------------------------------------------------------------------------
