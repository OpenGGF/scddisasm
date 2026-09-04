; ------------------------------------------------------------------------------

DestroyInGoodFuture:
	tst.b	good_future
	beq.s	DestroyFutureReturn
	cmpi.b	#1,time_zone
	bne.s	DestroyFutureDelete
	tst.b	obj.subtype(a0)
	beq.s	DestroyFutureReturn

DestroyFutureDelete:
	move.w	obj.x(a0),d5
	move.w	obj.y(a0),d6
	jsr	DeleteObject
	move.w	d5,obj.x(a0)
	move.w	d6,obj.y(a0)
	move.b	#$18,obj.id(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	DestroyFutureFinish
	move.w	#$9E,d0
	jsr	PlayFmSound

DestroyFutureFinish:
	addq.l	#4,sp

DestroyFutureReturn:
	rts

; ------------------------------------------------------------------------------

CheckAnimalPrescence:
	tst.b	obj.subtype(a0)
	bmi.s	AnimalPresenceReturn
	cmpi.b	#2,time_zone
	bge.s	AnimalPresenceGoodFuture
	tst.b	projector_destroyed
	bne.s	AnimalPresenceReturn
	addq.l	#4,sp
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

AnimalPresenceGoodFuture:
	tst.b	good_future
	bne.s	AnimalPresenceReturn
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

AnimalPresenceReturn:
	rts

; ------------------------------------------------------------------------------
