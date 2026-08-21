; ------------------------------------------------------------------------------

StageEvents:
	moveq	#0,d0
	move.b	zone,d0
	add.w	d0,d0
	move.w	StageEventsIndex(pc,d0.w),d0
	jsr	StageEventsIndex(pc,d0.w)
	cmpi.b	#$2B,player_object+obj.anim_id
	bne.s	loc_2034CA
	move.w	scroll_fg_y,bottom_bound
	move.w	scroll_fg_y,target_bottom_bound

loc_2034CA:
	moveq	#4,d1
	move.w	target_bottom_bound,d0
	sub.w	bottom_bound,d0
	beq.s	locret_2034F8
	bcc.s	loc_2034FA
	neg.w	d1
	move.w	scroll_fg_y,d0
	cmp.w	target_bottom_bound,d0
	bls.s	loc_2034EE
	move.w	d0,bottom_bound
	andi.w	#$FFFE,bottom_bound

loc_2034EE:
	add.w	d1,bottom_bound
	move.b	#1,bottom_bound_shift

locret_2034F8:
	rts

; ------------------------------------------------------------------------------

loc_2034FA:
	move.w	scroll_fg_y,d0
	addq.w	#8,d0
	cmp.w	bottom_bound,d0
	bcs.s	loc_203512
	btst	#1,player_object+obj.flags
	beq.s	loc_203512
	add.w	d1,d1
	add.w	d1,d1

loc_203512:
	add.w	d1,bottom_bound
	move.b	#1,bottom_bound_shift
	rts

; ------------------------------------------------------------------------------

StageEventsIndex:
	dc.w	R1Events-*
	dc.w	R3Events-StageEventsIndex
	dc.w	R4Events-StageEventsIndex
	dc.w	R5Events-StageEventsIndex
	dc.w	R6Events-StageEventsIndex
	dc.w	R7Events-StageEventsIndex
	dc.w	R8Events-StageEventsIndex

; ------------------------------------------------------------------------------

R1Events:
	moveq	#0,d0
	move.b	act,d0
	add.w	d0,d0
	move.w	R1EventIndex(pc,d0.w),d0
	jmp	R1EventIndex(pc,d0.w)

; ------------------------------------------------------------------------------

R1EventIndex:
	dc.w	R11Events-*
	dc.w	R12Events-R1EventIndex
	dc.w	R13Events-R1EventIndex

; ------------------------------------------------------------------------------

R11Events:
	cmpi.b	#1,time_zone
	bne.s	R12Events
	cmpi.w	#$1C16,player_object+obj.x
	bcs.s	loc_203564
	cmpi.w	#$21C6,player_object+obj.x
	bcc.s	loc_203564
	move.w	#$88,scroll_focus_y

loc_203564:
	move.w	#$710,target_bottom_bound
	cmpi.w	#$840,scroll_fg_x
	bcs.s	locret_2035A2
	tst.b	update_hud_time
	beq.s	loc_20358E
	cmpi.w	#$820,left_bound
	bcc.s	loc_20358E
	move.w	#$820,left_bound
	move.w	#$820,target_left_bound

loc_20358E:
	move.w	#$410,target_bottom_bound
	cmpi.w	#$E00,scroll_fg_x
	bcs.s	locret_2035A2
	move.w	#$310,target_bottom_bound

locret_2035A2:
	rts

; ------------------------------------------------------------------------------

R12Events:
	move.w	#$310,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R13Events:
	tst.b	boss_flags
	bne.s	locret_2035C4
	move.w	#$310,target_bottom_bound
	move.w	#$D70,d0
	move.w	#$310,d1
	bsr.w	CheckBossStart

locret_2035C4:
	rts

; ------------------------------------------------------------------------------

R3Events:
	moveq	#0,d0
	move.b	act,d0
	add.w	d0,d0
	move.w	R3EventIndex(pc,d0.w),d0
	jmp	R3EventIndex(pc,d0.w)

; ------------------------------------------------------------------------------

R3EventIndex:
	dc.w	R312Events-*
	dc.w	R312Events-R3EventIndex
	dc.w	R33Events-R3EventIndex

; ------------------------------------------------------------------------------

R312Events:
	move.w	#$510,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R33Events:
	tst.b	boss_flags
	bne.w	loc_2035F6
	move.w	#$510,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

loc_2035F6:
	move.w	#$60,d1
	bra.w	SetBossBounds

; ------------------------------------------------------------------------------

R6Events:
	btst	#4,boss_flags
	bne.s	loc_20360E
	move.w	#$710,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

loc_20360E:
	move.w	#$BA0,d0
	move.w	#$1D0,d1
	bsr.w	CheckBossStart
	bne.w	locret_20365A
	lea	player_object,a1
	cmpi.w	#$298,$C(a1)
	ble.s	loc_20363E
	cmpi.w	#$498,$C(a1)
	ble.s	loc_203638
	move.w	#$5D0,d0
	bra.s	loc_203642

; ------------------------------------------------------------------------------

loc_203638:
	move.w	#$3D0,d0
	bra.s	loc_203642

; ------------------------------------------------------------------------------

loc_20363E:
	move.w	#$1D0,d0

loc_203642:
	move.w	d0,d1
	move.w	d0,target_bottom_bound
	sub.w	bottom_bound,d0
	bge.s	loc2_203650
	neg.w	d0

loc2_203650:
	cmpi.w	#2,d0
	bgt.s	locret_20365A
	move.w	d1,bottom_bound

locret_20365A:
	rts

; ------------------------------------------------------------------------------

R5Events:
	moveq	#0,d0
	move.b	act,d0
	add.w	d0,d0
	move.w	R5EventIndex(pc,d0.w),d0
	jmp	R5EventIndex(pc,d0.w)

; ------------------------------------------------------------------------------

R5EventIndex:
	dc.w	R512Events-*
	dc.w	R512Events-R5EventIndex
	dc.w	R53Events-R5EventIndex

; ------------------------------------------------------------------------------

R512Events:
	move.w	#$310,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R53Events:
	move.w	#$E10,d0
	move.w	#$1F8,d1
	bsr.w	CheckBossStart
	bne.s	locret_203696
	tst.b	boss_flags
	bne.s	loc_203698
	move.w	#$320,target_bottom_bound

locret_203696:
	rts

; ------------------------------------------------------------------------------

loc_203698:
	move.w	#$1F8,bottom_bound
	move.w	#$1F8,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R8Events:
	moveq	#0,d0
	move.b	act,d0
	add.w	d0,d0
	move.w	R8EventIndex(pc,d0.w),d0
	jmp	R8EventIndex(pc,d0.w)

; ------------------------------------------------------------------------------

R8EventIndex:
	dc.w	R812Events-*
	dc.w	R812Events-R8EventIndex
	dc.w	R83Events-R8EventIndex

; ------------------------------------------------------------------------------

R812Events:
	move.w	#$710,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R83Events:
	tst.b	boss_flags
	bne.s	loc_2036D4
	move.w	#$310,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

loc_2036D4:
	move.w	#$10C,d0
	move.w	d0,top_bound
	move.w	d0,target_top_bound
	move.w	d0,bottom_bound
	move.w	d0,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R4Events:
	moveq	#0,d0
	move.b	act,d0
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
	move.w	#$510,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R42Events:
	cmpi.b	#$2B,player_object+obj.anim_id
	beq.s	loc_20372E
	cmpi.b	#6,player_object+obj.routine
	bcc.s	loc_20372E
	move.w	#$800,bottom_bound
	move.w	#$800,target_bottom_bound
	cmpi.w	#$200,scroll_fg_x
	bcs.s	locret_20373A

loc_20372E:
	move.w	#$710,bottom_bound
	move.w	#$710,target_bottom_bound

locret_20373A:
	rts

; ------------------------------------------------------------------------------

R43Events:
	move.w	#$AF8,d0
	move.w	#$4C0,d1
	bsr.w	CheckBossStart
	bne.s	locret_203750
	tst.b	boss_flags
	bne.s	loc_203752

locret_203750:
	rts

; ------------------------------------------------------------------------------

loc_203752:
	move.w	#$4F0,bottom_bound
	move.w	#$4F0,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R7Events:
	moveq	#0,d0
	move.b	act,d0
	add.w	d0,d0
	move.w	R7EventIndex(pc,d0.w),d0
	jmp	R7EventIndex(pc,d0.w)

; ------------------------------------------------------------------------------

R7EventIndex:
	dc.w	R71Events-*
	dc.w	R72Events-R7EventIndex
	dc.w	R73Events-R7EventIndex

; ------------------------------------------------------------------------------

R71Events:
	move.w	#$510,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R72Events:
	move.w	#$710,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R73Events:
	lea	player_object,a1
	cmpi.w	#$930,obj.x(a1)
	bge.s	loc_20379C
	move.w	#$210,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

loc_20379C:
	cmpi.w	#$DC0,8(a1)
	blt.s	loc_2037AC
	move.w	#$210,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

loc_2037AC:
	move.w	#$120,d0
	move.w	d0,d1
	move.w	d0,target_bottom_bound
	sub.w	bottom_bound,d1
	bpl.s	loc_2037BE
	neg.w	d1

loc_2037BE:
	cmpi.w	#4,d1
	bge.s	locret_2037C8
	move.w	d0,bottom_bound

locret_2037C8:
	rts

; ------------------------------------------------------------------------------

CheckBossStart:
	cmp.w	player_object+obj.x,d0
	ble.s	SetBossBounds
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

SetBossBounds:
	move.w	d1,target_bottom_bound
	sub.w	bottom_bound,d1
	bpl.s	loc_2037E0
	neg.w	d1

loc_2037E0:
	cmpi.w	#4,d1
	bge.s	loc_2037EC
	move.w	target_bottom_bound,bottom_bound

loc_2037EC:
	move.w	player_object+obj.x,d0
	subi.w	#$A0,d0
	cmp.w	left_bound,d0
	blt.s	loc_20380C
	cmp.w	right_bound,d0
	ble.s	loc_203804
	move.w	right_bound,d0

loc_203804:
	move.w	d0,left_bound
	move.w	d0,target_left_bound

loc_20380C:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------
