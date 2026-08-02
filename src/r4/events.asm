; ------------------------------------------------------------------------------

StageEvents:
	bsr.w	R4Events
	moveq	#4,d1
	move.w	(target_bottom_bound).w,d0
	sub.w	(bottom_bound).w,d0
	beq.s	locret_2039BC
	bcc.s	loc_2039BE
	neg.w	d1
	move.w	(scroll_fg_y).w,d0
	cmp.w	(target_bottom_bound).w,d0
	bls.s	loc_2039B2
	move.w	d0,(bottom_bound).w
	andi.w	#$FFFE,(bottom_bound).w

loc_2039B2:
	add.w	d1,(bottom_bound).w
	move.b	#1,(bottom_bound_shift).w

locret_2039BC:
	rts

; ------------------------------------------------------------------------------

loc_2039BE:
	move.w	(scroll_fg_y).w,d0
	addq.w	#8,d0
	cmp.w	(bottom_bound).w,d0
	bcs.s	loc_2039D6
	btst	#1,(player_object+obj.flags).w
	beq.s	loc_2039D6
	add.w	d1,d1
	add.w	d1,d1

loc_2039D6:
	add.w	d1,(bottom_bound).w
	move.b	#1,(bottom_bound_shift).w
	rts

; ------------------------------------------------------------------------------

R4Events:
	moveq	#0,d0
	move.b	(act).l,d0
	add.w	d0,d0
	move.w	R4EventIndex(pc,d0.w),d0
	jmp	R4EventIndex(pc,d0.w)

; ------------------------------------------------------------------------------

R4EventIndex:
	dc.w	R41Events-*
	dc.w	R42Events-R4EventIndex
	dc.w	R43Events-R4EventIndex

; ------------------------------------------------------------------------------

R41Events:
	move.w	#$510,(target_bottom_bound).w
	rts

; ------------------------------------------------------------------------------

R42Events:
	cmpi.b	#$2B,(player_object+obj.anim_id).w
	beq.s	loc_20372E
	cmpi.b	#6,(player_object+obj.routine).w
	bcc.s	loc_20372E
	move.w	#$800,(bottom_bound).w
	move.w	#$800,(target_bottom_bound).w
	cmpi.w	#$200,(scroll_fg_x).w
	bcs.s	locret_20373A

loc_20372E:
	move.w	#$710,(bottom_bound).w
	move.w	#$710,(target_bottom_bound).w

locret_20373A:
	rts

; ------------------------------------------------------------------------------

R43Events:
	move.w	#$AF8,d0
	move.w	#$4C0,d1
	bsr.w	CheckBossStart
	bne.s	locret_203750
	tst.b	(boss_flags).w
	bne.s	loc_203752

locret_203750:
	rts

; ------------------------------------------------------------------------------

loc_203752:
	move.w	#$4F0,(bottom_bound).w
	move.w	#$4F0,(target_bottom_bound).w
	rts

; ------------------------------------------------------------------------------

CheckBossStart:
	cmp.w	(player_object+obj.x).w,d0
	ble.s	SetBossBounds
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

SetBossBounds:
	move.w	d1,(target_bottom_bound).w
	sub.w	(bottom_bound).w,d1
	bpl.s	loc_2037E0
	neg.w	d1

loc_2037E0:
	cmpi.w	#4,d1
	bge.s	loc_2037EC
	move.w	(target_bottom_bound).w,(bottom_bound).w

loc_2037EC:
	move.w	(player_object+obj.x).w,d0
	subi.w	#$A0,d0
	cmp.w	(left_bound).w,d0
	blt.s	loc_20380C
	cmp.w	(right_bound).w,d0
	ble.s	loc_203804
	move.w	(right_bound).w,d0

loc_203804:
	move.w	d0,(left_bound).w
	move.w	d0,(target_left_bound).w

loc_20380C:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------