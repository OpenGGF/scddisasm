; ------------------------------------------------------------------------------

DestroyInGoodFuture:
	tst.b	good_future
	beq.s	locret_20E3DC
	cmpi.b	#1,time_zone
	bne.s	loc_20E3AE
	tst.b	obj.subtype(a0)
	beq.s	locret_20E3DC

loc_20E3AE:
	move.w	obj.x(a0),d5
	move.w	obj.y(a0),d6
	jsr	DeleteObject
	move.w	d5,obj.x(a0)
	move.w	d6,obj.y(a0)
	move.b	#$18,obj.id(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20E3DA
	move.w	#$9E,d0
	jsr	PlayFmSound

loc_20E3DA:
	addq.l	#4,sp

locret_20E3DC:
	rts

; ------------------------------------------------------------------------------

CheckAnimalPrescence:
	tst.b	obj.subtype(a0)
	bmi.s	locret_20E40E
	cmpi.b	#2,time_zone
	bge.s	loc_20E3FE
	tst.b	projector_destroyed
	bne.s	locret_20E40E
	addq.l	#4,sp
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_20E3FE:
	tst.b	good_future
	bne.s	locret_20E40E
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20E40E:
	rts

; ------------------------------------------------------------------------------
