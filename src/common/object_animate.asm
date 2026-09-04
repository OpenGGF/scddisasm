; ------------------------------------------------------------------------------

; Animation streams contain frame bytes followed by negative control commands:
; $FF loops, $FE jumps, $FD changes animation, and $FC/$FB/$FA advance state.

AnimateObject:
	moveq	#0,d0
	move.b	obj.anim_id(a0),d0
	cmp.b	obj.prev_anim_id(a0),d0
	beq.s	AnimateObjectSelectFrame
	move.b	d0,obj.prev_anim_id(a0)
	move.b	#0,obj.anim_index(a0)
	move.b	#0,obj.anim_timer(a0)

AnimateObjectSelectFrame:
	subq.b	#1,obj.anim_timer(a0)
	bpl.s	AnimateObjectDone
	add.w	d0,d0
	adda.w	(a1,d0.w),a1
	move.b	(a1),obj.anim_timer(a0)
	moveq	#0,d1
	move.b	obj.anim_index(a0),d1
	move.b	1(a1,d1.w),d0
	bmi.s	AnimateObjectControl

AnimateObjectApplyFrame:
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

AnimateObjectDone:
	rts

; ------------------------------------------------------------------------------

AnimateObjectControl:
	addq.b	#1,d0
	bne.s	AnimateObjectControlJump
	move.b	#0,obj.anim_index(a0)
	move.b	obj.sprite_flags(a1),d0
	bra.s	AnimateObjectApplyFrame

; ------------------------------------------------------------------------------

AnimateObjectControlJump:
	addq.b	#1,d0
	bne.s	AnimateObjectControlChangeAnimation
	move.b	2(a1,d1.w),d0
	sub.b	d0,obj.anim_index(a0)
	sub.b	d0,d1
	move.b	1(a1,d1.w),d0
	bra.s	AnimateObjectApplyFrame

; ------------------------------------------------------------------------------

AnimateObjectControlChangeAnimation:
	addq.b	#1,d0
	bne.s	AnimateObjectControlAdvanceRoutine
	move.b	2(a1,d1.w),obj.anim_id(a0)

AnimateObjectControlAdvanceRoutine:
	addq.b	#1,d0
	bne.s	AnimateObjectControlResetRoutine
	addq.b	#2,obj.routine(a0)

AnimateObjectControlResetRoutine:
	addq.b	#1,d0
	bne.s	AnimateObjectControlAdvanceSubroutine
	move.b	#0,obj.anim_index(a0)
	clr.b	obj.routine_2(a0)

AnimateObjectControlAdvanceSubroutine:
	addq.b	#1,d0
	bne.s	AnimateObjectControlDone
	addq.b	#2,obj.routine_2(a0)

AnimateObjectControlDone:
	rts

; ------------------------------------------------------------------------------
