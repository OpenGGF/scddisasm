; ------------------------------------------------------------------------------

BreakPoleObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_206A3E(pc,d0.w),d0
	jsr	off_206A3E(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_206A3E:
	dc.w	BreakPoleObject_0_Routine0-*
	dc.w	BreakPoleObject_0_Routine2-off_206A3E
	dc.w	BreakPoleObject_0_Routine4-off_206A3E
	dc.w	BreakPoleObject_0_Routine6-off_206A3E

; ------------------------------------------------------------------------------

BreakPoleObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$42F8,obj.sprite_tile(a0)
	move.l	#BreakPoleSprites,obj.sprite_data(a0)
	addq.b	#2,obj.routine(a0)

BreakPoleObject_0_Routine2:
	bsr.w	sub_206B16
	beq.s	locret_206AB2
	bset	#0,obj.var_2c(a1)
	move.w	obj.x(a0),obj.x(a1)
	moveq	#0,d1
	move.w	#$18,d0
	tst.w	obj.x_speed(a1)
	bpl.s	loc_206A80
	moveq	#1,d1
	neg.w	d0

loc_206A80:
	andi.b	#$FE,obj.flags(a1)
	or.b	d1,obj.flags(a1)
	or.b	d1,obj.sprite_flags(a0)
	add.w	d0,obj.x(a1)
	move.b	#$11,obj.anim_id(a1)
	move.w	#$B4,obj.var_2a(a0)
	tst.b	obj.subtype(a0)
	beq.s	loc_206AAA
	move.w	#$3C,obj.var_2a(a0)

loc_206AAA:
	move.l	a1,obj.var_2c(a0)
	addq.b	#2,obj.routine(a0)

locret_206AB2:
	rts

; ------------------------------------------------------------------------------

BreakPoleObject_0_Routine4:
	movea.l	obj.var_2c(a0),a1
	subq.w	#1,obj.var_2a(a0)
	beq.s	loc_206B04
	move.w	p1_joy_hold,d0
	move.w	d0,d1
	andi.b	#$70,d0
	bne.s	loc_206B04
	move.w	obj.y(a0),d0
	lsr.w	#8,d1
	btst	#0,d1
	beq.s	loc_206AEA
	subq.w	#1,obj.y(a1)
	subi.w	#$18,d0
	cmp.w	obj.y(a1),d0
	bcs.s	BreakPoleObject_0_Routine6
	move.w	d0,obj.y(a1)
	bra.s	BreakPoleObject_0_Routine6

; ------------------------------------------------------------------------------

loc_206AEA:
	btst	#1,d1
	beq.s	BreakPoleObject_0_Routine6
	addq.w	#1,obj.y(a1)
	addi.w	#$18,d0
	cmp.w	obj.y(a1),d0
	bcc.s	BreakPoleObject_0_Routine6
	move.w	d0,obj.y(a1)
	bra.s	BreakPoleObject_0_Routine6

; ------------------------------------------------------------------------------

loc_206B04:
	bclr	#0,obj.var_2c(a1)
	move.b	#1,obj.sprite_frame(a0)
	addq.b	#2,obj.routine(a0)

BreakPoleObject_0_Routine6:
	rts

; ------------------------------------------------------------------------------

sub_206B16:
	lea	player_object,a1
	tst.b	debug_mode
	bne.s	loc_206B4C
	move.w	obj.x(a0),d0
	sub.w	obj.x(a1),d0
	addq.w	#4,d0
	bmi.s	loc_206B4C
	cmpi.w	#8,d0
	bcc.s	loc_206B4C
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	addi.w	#$18,d0
	bmi.s	loc_206B4C
	cmpi.w	#$30,d0
	bcc.s	loc_206B4C
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_206B4C:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

BreakPoleSprites:
	include	"sprites/r4/break_pole.asm"
	even

; ------------------------------------------------------------------------------
