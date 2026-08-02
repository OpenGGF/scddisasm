; ------------------------------------------------------------------------------

TestObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_205B66(pc,d0.w),d0
	jmp	off_205B66(pc,d0.w)

; ------------------------------------------------------------------------------

off_205B66:
	dc.w	TestObjectInit-off_205B66
	dc.w	TestObjectMain-off_205B66

; ------------------------------------------------------------------------------

TestObjectInit:
	btst	#7,obj.flags(a0)
	bne.w	DeleteObject
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.l	#PowerupSprites,obj.sprite_data(a0)
	move.w	#$541,obj.sprite_tile(a0)
	move.w	obj.x(a0),obj.var_30(a0)
	move.b	#6,obj.collide_type(a0)

TestObjectMain:
	move.w	obj.var_30(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.w	DeleteObject
	lea	(PowerupAnims).l,a1
	bsr.w	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------