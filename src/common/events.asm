; ------------------------------------------------------------------------------

; Dispatch zone-specific stage events, then ease the active bottom bound.
StageEvents:
	moveq	#0,d0
	move.b	zone,d0
	add.w	d0,d0
	move.w	StageEventsIndex(pc,d0.w),d0
	jsr	StageEventsIndex(pc,d0.w)
	cmpi.b	#$2B,player_object+obj.anim_id
	bne.s	StageEventsUpdateBottomBound
	move.w	scroll_fg_y,bottom_bound
	move.w	scroll_fg_y,target_bottom_bound

StageEventsUpdateBottomBound:
	moveq	#4,d1
	move.w	target_bottom_bound,d0
	sub.w	bottom_bound,d0
	beq.s	StageEventsReturn
	bcc.s	StageEventsAdvanceBottomBound
	neg.w	d1
	move.w	scroll_fg_y,d0
	cmp.w	target_bottom_bound,d0
	bls.s	StageEventsClampBottomBound
	move.w	d0,bottom_bound
	andi.w	#$FFFE,bottom_bound

StageEventsClampBottomBound:
	add.w	d1,bottom_bound
	move.b	#1,bottom_bound_shift

StageEventsReturn:
	rts

; ------------------------------------------------------------------------------

StageEventsAdvanceBottomBound:
	move.w	scroll_fg_y,d0
	addq.w	#8,d0
	cmp.w	bottom_bound,d0
	bcs.s	StageEventsStoreBottomBound
	btst	#1,player_object+obj.flags
	beq.s	StageEventsStoreBottomBound
	add.w	d1,d1
	add.w	d1,d1

StageEventsStoreBottomBound:
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
	bcs.s	R11EventsCheckPlayerWindow
	cmpi.w	#$21C6,player_object+obj.x
	bcc.s	R11EventsCheckPlayerWindow
	move.w	#$88,scroll_focus_y

R11EventsCheckPlayerWindow:
	move.w	#$710,target_bottom_bound
	cmpi.w	#$840,scroll_fg_x
	bcs.s	R11EventsReturn
	tst.b	update_hud_time
	beq.s	R11EventsLateBounds
	cmpi.w	#$820,left_bound
	bcc.s	R11EventsLateBounds
	move.w	#$820,left_bound
	move.w	#$820,target_left_bound

R11EventsLateBounds:
	move.w	#$410,target_bottom_bound
	cmpi.w	#$E00,scroll_fg_x
	bcs.s	R11EventsReturn
	move.w	#$310,target_bottom_bound

R11EventsReturn:
	rts

; ------------------------------------------------------------------------------

R12Events:
	move.w	#$310,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R13Events:
	tst.b	boss_flags
	bne.s	R13EventsReturn
	move.w	#$310,target_bottom_bound
	move.w	#$D70,d0
	move.w	#$310,d1
	bsr.w	CheckBossStart

R13EventsReturn:
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
	bne.w	R33EventsSetBossBounds
	move.w	#$510,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R33EventsSetBossBounds:
	move.w	#$60,d1
	bra.w	SetBossBounds

; ------------------------------------------------------------------------------

R6Events:
	btst	#4,boss_flags
	bne.s	R6EventsBossBounds
	move.w	#$710,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R6EventsBossBounds:
	move.w	#$BA0,d0
	move.w	#$1D0,d1
	bsr.w	CheckBossStart
	bne.w	R6EventsReturn
	lea	player_object,a1
	cmpi.w	#$298,$C(a1)
	ble.s	R6EventsSelectEarlyBound
	cmpi.w	#$498,$C(a1)
	ble.s	R6EventsSelectMiddleBound
	move.w	#$5D0,d0
	bra.s	R6EventsApplyBound

; ------------------------------------------------------------------------------

R6EventsSelectMiddleBound:
	move.w	#$3D0,d0
	bra.s	R6EventsApplyBound

; ------------------------------------------------------------------------------

R6EventsSelectEarlyBound:
	move.w	#$1D0,d0

R6EventsApplyBound:
	move.w	d0,d1
	move.w	d0,target_bottom_bound
	sub.w	bottom_bound,d0
	bge.s	R6EventsBoundDelta
	neg.w	d0

R6EventsBoundDelta:
	cmpi.w	#2,d0
	bgt.s	R6EventsReturn
	move.w	d1,bottom_bound

R6EventsReturn:
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
	bne.s	R53EventsReturn
	tst.b	boss_flags
	bne.s	R53EventsSetBossBounds
	if def(R4_VARIANT)
		if (REGION<>USA)&(DEMO<>0)&(R4_VARIANT=8)
			move.w	#$310,target_bottom_bound
		else
	move.w	#$320,target_bottom_bound
		endif
	else
	move.w	#$320,target_bottom_bound
	endif

R53EventsReturn:
	rts

; ------------------------------------------------------------------------------

R53EventsSetBossBounds:
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
	bne.s	R83EventsSetBossBounds
	move.w	#$310,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R83EventsSetBossBounds:
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
	beq.s	R42EventsWideBounds
	cmpi.b	#6,player_object+obj.routine
	bcc.s	R42EventsWideBounds
	move.w	#$800,bottom_bound
	move.w	#$800,target_bottom_bound
	cmpi.w	#$200,scroll_fg_x
	bcs.s	R42EventsReturn

R42EventsWideBounds:
	move.w	#$710,bottom_bound
	move.w	#$710,target_bottom_bound

R42EventsReturn:
	rts

; ------------------------------------------------------------------------------

R43Events:
	move.w	#$AF8,d0
	move.w	#$4C0,d1
	bsr.w	CheckBossStart
	bne.s	R43EventsReturn
	tst.b	boss_flags
	bne.s	R43EventsSetBossBounds

R43EventsReturn:
	rts

; ------------------------------------------------------------------------------

R43EventsSetBossBounds:
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
	bge.s	R73EventsCheckProgress
	move.w	#$210,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R73EventsCheckProgress:
	cmpi.w	#$DC0,8(a1)
	blt.s	R73EventsRampBound
	move.w	#$210,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

R73EventsRampBound:
	move.w	#$120,d0
	move.w	d0,d1
	move.w	d0,target_bottom_bound
	sub.w	bottom_bound,d1
	bpl.s	R73EventsBoundDelta
	neg.w	d1


R73EventsBoundDelta:
	cmpi.w	#4,d1
	bge.s	R73EventsReturn
	move.w	d0,bottom_bound

R73EventsReturn:
	rts

; ------------------------------------------------------------------------------

CheckBossStart:
	cmp.w	player_object+obj.x,d0
	ble.s	SetBossBounds
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

SetBossBounds:
	; Move vertical limits and left bound toward the boss trigger position.
	move.w	d1,target_bottom_bound
	sub.w	bottom_bound,d1
	bpl.s	SetBossBoundsApplyDelta
	neg.w	d1

SetBossBoundsApplyDelta:
	cmpi.w	#4,d1
	bge.s	SetBossBoundsCheckPosition
	move.w	target_bottom_bound,bottom_bound

SetBossBoundsCheckPosition:
	move.w	player_object+obj.x,d0
	subi.w	#$A0,d0
	cmp.w	left_bound,d0
	blt.s	SetBossBoundsTriggered
	cmp.w	right_bound,d0
	ble.s	SetBossBoundsStoreLeft
	move.w	right_bound,d0

SetBossBoundsStoreLeft:
	move.w	d0,left_bound
	move.w	d0,target_left_bound

SetBossBoundsTriggered:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------
