; ------------------------------------------------------------------------------

DestroyInGoodFuture:
	; A0 is the object. The destruction path replaces it with explosion ID $18.
	; That path discards this helper's return address: the caller does not resume.
	; Requires a BSR/JSR call from an object routine, not a tail jump.
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
	; A0 is the animal. Suppression paths discard this helper's return address
	; before tail-calling despawn/delete; the calling object routine is skipped.
	; Requires a BSR/JSR call. Allowed animals return to the caller normally.
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
