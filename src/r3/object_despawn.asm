; ------------------------------------------------------------------------------

DespawnObjectR3:
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_20D002
	lea	(object_states).l,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	(time_zone).l,d1
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)

loc_20D002:
	jmp	DeleteObject

; ------------------------------------------------------------------------------