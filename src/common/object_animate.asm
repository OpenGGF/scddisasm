; ------------------------------------------------------------------------------

AnimateObject:
	moveq	#0,d0
	move.b	obj.anim_id(a0),d0
	cmp.b	obj.prev_anim_id(a0),d0
	beq.s	loc_2058AE
	move.b	d0,obj.prev_anim_id(a0)
	move.b	#0,obj.anim_index(a0)
	move.b	#0,obj.anim_timer(a0)

loc_2058AE:
	subq.b	#1,obj.anim_timer(a0)
	bpl.s	locret_2058EE
	add.w	d0,d0
	adda.w	(a1,d0.w),a1
	move.b	(a1),obj.anim_timer(a0)
	moveq	#0,d1
	move.b	obj.anim_index(a0),d1
	move.b	1(a1,d1.w),d0
	bmi.s	loc_2058F0

loc_2058CA:
	move.b	d0,d1
	andi.b	#$1F,d0
	move.b	d0,obj.sprite_frame(a0)
	move.b	obj.flags(a0),d0
	rol.b	#3,d1
	eor.b	d0,d1
	andi.b	#3,d1
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d1,obj.sprite_flags(a0)
	addq.b	#1,obj.anim_index(a0)

locret_2058EE:
	rts

; ------------------------------------------------------------------------------

loc_2058F0:
	addq.b	#1,d0
	bne.s	loc_205900
	move.b	#0,obj.anim_index(a0)
	move.b	obj.sprite_flags(a1),d0
	bra.s	loc_2058CA

; ------------------------------------------------------------------------------

loc_205900:
	addq.b	#1,d0
	bne.s	loc_205914
	move.b	2(a1,d1.w),d0
	sub.b	d0,obj.anim_index(a0)
	sub.b	d0,d1
	move.b	1(a1,d1.w),d0
	bra.s	loc_2058CA

; ------------------------------------------------------------------------------

loc_205914:
	addq.b	#1,d0
	bne.s	loc_20591E
	move.b	2(a1,d1.w),obj.anim_id(a0)

loc_20591E:
	addq.b	#1,d0
	bne.s	loc_205926
	addq.b	#2,obj.routine(a0)

loc_205926:
	addq.b	#1,d0
	bne.s	loc_205934
	move.b	#0,obj.anim_index(a0)
	clr.b	obj.routine_2(a0)

loc_205934:
	addq.b	#1,d0
	bne.s	locret_20593C
	addq.b	#2,obj.routine_2(a0)

locret_20593C:
	rts

; ------------------------------------------------------------------------------
