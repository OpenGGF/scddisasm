; ------------------------------------------------------------------------------

S1CheckObjectDespawn:
	move.w	obj.x(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.w	loc_20081E
	bra.w	DrawObject

; ------------------------------------------------------------------------------

loc_20081E:
	lea	(object_states).l,a2
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_200832
	bclr	#7,2(a2,d0.w)

loc_200832:
	bra.w	DeleteObject

; ------------------------------------------------------------------------------