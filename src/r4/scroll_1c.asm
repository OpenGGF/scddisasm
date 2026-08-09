; ------------------------------------------------------------------------------

GetPlayerObject:
	lea	(player_object).w,a6
	tst.b	(use_player_2).l
	beq.s	locret_202B46
	lea	(player_object_2).w,a6

locret_202B46:
	rts

; ------------------------------------------------------------------------------

InitScroll:
	lea	(player_object).w,a6
	moveq	#0,d0
	move.b	d0,(unused_scroll_x_flag).w
	move.b	d0,(unused_scroll_y_flag).w
	move.b	d0,(unused_scroll_die).w
	move.b	d0,(unused_scroll_timer).w
	move.b	d0,(event_routine).w
	lea	(unk_202BA4).l,a0
	move.w	(a0)+,d0
	move.w	d0,(unused_scroll_routine).w
	move.l	(a0)+,d0
	move.l	d0,(left_bound).w
	move.l	d0,(target_left_bound).w
	move.l	(a0)+,d0
	move.l	d0,(top_bound).w
	move.l	d0,(target_top_bound).w
	move.w	(left_bound).w,d0
	addi.w	#$240,d0
	move.w	d0,(unused_scroll_x_keep).w
	move.w	#$1010,(scroll_cross_x).w
	move.w	(a0)+,d0
	move.w	d0,(scroll_focus_y).w
	move.w	#$A0,(scroll_focus_x).w
	bra.w	loc_202BD0

; ------------------------------------------------------------------------------

unk_202BA4:
	dc.b	0
	dc.b	4
	dc.b	0
	dc.b	0
	dc.b	$1C
	dc.b	$97
	dc.b	0
	dc.b	0
	dc.b	5
	dc.b	$10
	dc.b	0
	dc.b	$60

unk_202BB0:
	dc.b	0
	dc.b	$50
	dc.b	3
	dc.b	$B0
	dc.b	$E
	dc.b	$A0
	dc.b	4
	dc.b	$6C
	dc.b	$17
	dc.b	$50
	dc.b	0
	dc.b	$BD
	dc.b	$A
	dc.b	0
	dc.b	6
	dc.b	$2C
	dc.b	$B
	dc.b	$B0
	dc.b	0
	dc.b	$4C
	dc.b	$15
	dc.b	$70
	dc.b	1
	dc.b	$6C
	dc.b	1
	dc.b	$B0
	dc.b	7
	dc.b	$2C
	dc.b	$14
	dc.b	0
	dc.b	2
	dc.b	$AC

; ------------------------------------------------------------------------------

loc_202BD0:
	tst.b	(spawn_mode).l
	beq.s	loc_202BEC
	jsr	LoadCheckpoint
	moveq	#0,d0
	moveq	#0,d1
	move.w	8(a6),d1
	move.w	$C(a6),d0
	bra.s	loc_202C28

; ------------------------------------------------------------------------------

loc_202BEC:
	lea	(StagePlayerSpawn).l,a1
	tst.w	(stage_demo).l
	bpl.s	loc_202C0E
	move.w	(s1_credits_index).l,d0
	subq.w	#1,d0
	lsl.w	#2,d0
	lea	(unk_202BB0).l,a1
	adda.w	d0,a1
	bra.s	loc_202C18

; ------------------------------------------------------------------------------

loc_202C0E:
	move.w	(stage_demo).l,d0
	lsl.w	#2,d0
	adda.w	d0,a1

loc_202C18:
	moveq	#0,d1
	move.w	(a1)+,d1
	move.w	d1,8(a6)
	moveq	#0,d0
	move.w	(a1),d0
	move.w	d0,$C(a6)

loc_202C28:
	subi.w	#$A0,d1
	bcc.s	loc_202C30
	moveq	#0,d1

loc_202C30:
	move.w	(right_bound).w,d2
	cmp.w	d2,d1
	bcs.s	loc_202C3A
	move.w	d2,d1

loc_202C3A:
	move.w	d1,(scroll_fg_x).w
	subi.w	#$60,d0
	bcc.s	loc_202C46
	moveq	#0,d0

loc_202C46:
	cmp.w	(bottom_bound).w,d0
	blt.s	loc_202C50
	move.w	(bottom_bound).w,d0

loc_202C50:
	move.w	d0,(scroll_fg_y).w
	bsr.w	sub_202C6C
	lea	(unk_202C68).l,a1
	move.l	(a1),(loop_chunk_1).w
	rts

; ------------------------------------------------------------------------------

StagePlayerSpawn:
	dc.b	0, $50, 0, $40

unk_202C68:
	dc.b	$7F
	dc.b	$7F
	dc.b	$7F
	dc.b	$7F

; ------------------------------------------------------------------------------

sub_202C6C:
	move.w	(scroll_fg_y).w,d0
	lsr.w	#1,d0
	move.w	d0,(scroll_bg_y).w
	move.w	#0,(scroll_bg_y+2).w
	move.w	d0,(scroll_bg2_y).w
	move.w	d0,(scroll_bg3_y).w
	lsr.w	#4,d1
	move.w	d1,(scroll_bg3_x).w
	lsr.w	#1,d1
	move.w	d1,d2
	add.w	d2,d2
	add.w	d1,d2
	move.w	d2,(scroll_bg2_x).w
	lsr.w	#1,d1
	move.w	d1,d2
	add.w	d2,d2
	add.w	d1,d2
	move.w	d2,(scroll_bg_x).w
	lea	(bg_scroll_lines).w,a2
	moveq	#$E,d2

loc_202CA8:
	clr.l	(a2)+
	dbf	d2,loc_202CA8
	rts

; ------------------------------------------------------------------------------

UpdateScroll:
	lea	(player_object).w,a6
	tst.b	(scroll_lock).w
	beq.s	loc_202CBC
	rts

; ------------------------------------------------------------------------------

loc_202CBC:
	clr.w	(scroll_flags_fg).w
	clr.w	(scroll_flags_bg).w
	clr.w	(scroll_flags_bg2).w
	clr.w	(scroll_flags_bg3).w
	bsr.w	ScrollFgX
	bsr.w	ScrollFgY
	bsr.w	StageEvents
	move.w	(scroll_fg_y).w,(scroll_y).w
	move.w	(scroll_bg_y).w,(scroll_y+2).w
	lea	(bg_scroll_lines).w,a1
	move.w	(scroll_x_move).w,d4
	ext.l	d4
	asl.l	#2,d4
	move.l	d4,d3
	add.l	d3,d3
	add.l	d3,d4
	moveq	#2,d6
	move.w	(scroll_y_move).w,d5
	ext.l	d5
	asl.l	#7,d5
	bsr.w	ScrollBgXY
	move.w	(scroll_bg_y).w,(scroll_y+2).w
	move.w	(scroll_bg_y).w,(scroll_bg2_y).w
	move.w	(scroll_bg_y).w,(scroll_bg3_y).w
	move.b	(scroll_flags_bg3).w,d0
	or.b	(scroll_flags_bg2).w,d0
	or.b	d0,(scroll_flags_bg).w
	clr.b	(scroll_flags_bg3).w
	clr.b	(scroll_flags_bg2).w
	lea	(bg_scroll_lines).w,a2
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	move.w	#$BF,d6

loc_202D38:
	move.w	d0,(a1)+
	dbf	d6,loc_202D38
	lea	(scroll_lines).w,a1
	lea	(bg_scroll_lines).w,a2
	move.w	(scroll_fg_x).w,d0
	neg.w	d0
	move.w	d0,d5
	swap	d0
	move.w	(scroll_bg_y).w,d0
	move.w	d0,d2
	andi.w	#$7F8,d0
	lsr.w	#2,d0
	lea	(a2,d0.w),a2
	bra.w	*+4

; ------------------------------------------------------------------------------

loc_202D64:
	lea	(unk_202DE2).l,a3
	lea	(WobbleTable).l,a4
	move.b	(bg_water_deform).w,d3
	move.b	d3,d4
	addi.w	#$80,(bg_water_deform).w
	add.w	(scroll_bg_y).w,d3
	andi.w	#$FF,d3
	add.w	(scroll_fg_y).w,d4
	andi.w	#$FF,d4
	move.w	#$E7,d6
	andi.w	#7,d2
	move.w	(a2)+,d0
	move.w	(scroll_fg_y).w,d1

loc_202D9A:
	cmp.w	(water_y).w,d1
	bge.s	loc_202DBA
	move.l	d0,(a1)+
	addq.w	#1,d1
	addq.b	#1,d3
	addq.b	#1,d4
	addq.b	#1,d2
	cmpi.b	#8,d2
	bne.s	loc_202DB4
	moveq	#0,d2
	move.w	(a2)+,d0

loc_202DB4:
	dbf	d6,loc_202D9A
	rts

; ------------------------------------------------------------------------------

loc_202DBA:
	move.w	#0,d1
	add.w	d5,d1
	move.w	d1,(a1)+
	move.b	(a4,d3.w),d1
	ext.w	d1
	add.w	d0,d1
	move.w	d1,(a1)+
	addq.b	#1,d3
	addq.b	#1,d4
	addq.b	#1,d2
	cmpi.b	#8,d2
	bne.s	loc_202DDC
	moveq	#0,d2
	move.w	(a2)+,d0

loc_202DDC:
	dbf	d6,loc_202DBA
	rts

; ------------------------------------------------------------------------------

unk_202DE2:
	dc.b	1
	dc.b	1
	dc.b	2
	dc.b	2
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	2
	dc.b	2
	dc.b	1
	dc.b	1
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	$FF
	dc.b	$FF
	dc.b	$FE
	dc.b	$FE
	dc.b	$FD
	dc.b	$FD
	dc.b	$FD
	dc.b	$FD
	dc.b	$FE
	dc.b	$FE
	dc.b	$FF
	dc.b	$FF
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	1
	dc.b	2
	dc.b	2
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	2
	dc.b	2
	dc.b	1
	dc.b	1
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0

; ------------------------------------------------------------------------------

ScrollFgX:
	move.w	(scroll_fg_x).w,d4
	bsr.s	CheckScrollFgX
	move.w	(scroll_fg_x).w,d0
	andi.w	#$10,d0
	move.b	(scroll_cross_x).w,d1
	eor.b	d1,d0
	bne.s	locret_202F14
	eori.b	#$10,(scroll_cross_x).w
	move.w	(scroll_fg_x).w,d0
	sub.w	d4,d0
	bpl.s	loc_202F0E
	bset	#2,(scroll_flags_fg).w
	rts

; ------------------------------------------------------------------------------

loc_202F0E:
	bset	#3,(scroll_flags_fg).w

locret_202F14:
	rts

; ------------------------------------------------------------------------------

CheckScrollFgX:
	move.w	8(a6),d0
	sub.w	(scroll_fg_x).w,d0
	sub.w	(scroll_focus_x).w,d0
	beq.s	loc_202F28
	bcs.s	loc_202F58
	bra.s	loc_202F2E

; ------------------------------------------------------------------------------

loc_202F28:
	clr.w	(scroll_x_move).w
	rts

; ------------------------------------------------------------------------------

loc_202F2E:
	cmpi.w	#$10,d0
	blt.s	loc_202F38
	move.w	#$10,d0

loc_202F38:
	add.w	(scroll_fg_x).w,d0
	cmp.w	(right_bound).w,d0
	blt.s	loc_202F46
	move.w	(right_bound).w,d0

loc_202F46:
	move.w	d0,d1
	sub.w	(scroll_fg_x).w,d1
	asl.w	#8,d1
	move.w	d0,(scroll_fg_x).w
	move.w	d1,(scroll_x_move).w
	rts

; ------------------------------------------------------------------------------

loc_202F58:
	cmpi.w	#$FFF0,d0
	bge.s	loc_202F62
	move.w	#$FFF0,d0

loc_202F62:
	add.w	(scroll_fg_x).w,d0
	cmp.w	(left_bound).w,d0
	bgt.s	loc_202F46
	move.w	(left_bound).w,d0
	bra.s	loc_202F46

; ------------------------------------------------------------------------------

ScrollFgXSlow:
	tst.w	d0
	bpl.s	loc_202F7C
	move.w	#$FFFE,d0
	bra.s	loc_202F58

; ------------------------------------------------------------------------------

loc_202F7C:
	move.w	#2,d0
	bra.s	loc_202F2E

; ------------------------------------------------------------------------------

ScrollFgY:
	moveq	#0,d1
	move.w	$C(a6),d0
	sub.w	(scroll_fg_y).w,d0
	btst	#2,$22(a6)
	beq.s	loc_202F96
	subq.w	#5,d0

loc_202F96:
	btst	#1,$22(a6)
	beq.s	loc_202FB6
	addi.w	#$20,d0
	sub.w	(scroll_focus_y).w,d0
	bcs.s	loc_203002
	subi.w	#$40,d0
	bcc.s	loc_203002
	tst.b	(bottom_bound_shift).w
	bne.s	loc_203014
	bra.s	loc_202FC2

; ------------------------------------------------------------------------------

loc_202FB6:
	sub.w	(scroll_focus_y).w,d0
	bne.s	loc_202FC8
	tst.b	(bottom_bound_shift).w
	bne.s	loc_203014

loc_202FC2:
	clr.w	(scroll_y_move).w
	rts

; ------------------------------------------------------------------------------

loc_202FC8:
	cmpi.w	#$60,(scroll_focus_y).w
	bne.s	loc_202FF0
	move.w	$14(a6),d1
	bpl.s	loc_202FD8
	neg.w	d1

loc_202FD8:
	cmpi.w	#$800,d1
	bcc.s	loc_203002
	move.w	#$600,d1
	cmpi.w	#6,d0
	bgt.s	loc_203062
	cmpi.w	#$FFFA,d0
	blt.s	loc_20302C
	bra.s	loc_20301A

; ------------------------------------------------------------------------------

loc_202FF0:
	move.w	#$200,d1
	cmpi.w	#2,d0
	bgt.s	loc_203062
	cmpi.w	#$FFFE,d0
	blt.s	loc_20302C
	bra.s	loc_20301A

; ------------------------------------------------------------------------------

loc_203002:
	move.w	#$1000,d1
	cmpi.w	#$10,d0
	bgt.s	loc_203062
	cmpi.w	#$FFF0,d0
	blt.s	loc_20302C
	bra.s	loc_20301A

; ------------------------------------------------------------------------------

loc_203014:
	moveq	#0,d0
	move.b	d0,(bottom_bound_shift).w

loc_20301A:
	moveq	#0,d1
	move.w	d0,d1
	add.w	(scroll_fg_y).w,d1
	tst.w	d0
	bpl.w	loc_20306C
	bra.w	loc_203038

; ------------------------------------------------------------------------------

loc_20302C:
	neg.w	d1
	ext.l	d1
	asl.l	#8,d1
	add.l	(scroll_fg_y).w,d1
	swap	d1

loc_203038:
	cmp.w	(top_bound).w,d1
	bgt.s	loc_203090
	cmpi.w	#$FF00,d1
	bgt.s	loc_20305C
	andi.w	#$7FF,d1
	andi.w	#$7FF,$C(a6)
	andi.w	#$7FF,(scroll_fg_y).w
	andi.w	#$3FF,(scroll_bg_y).w
	bra.s	loc_203090

; ------------------------------------------------------------------------------

loc_20305C:
	move.w	(top_bound).w,d1
	bra.s	loc_203090

; ------------------------------------------------------------------------------

loc_203062:
	ext.l	d1
	asl.l	#8,d1
	add.l	(scroll_fg_y).w,d1
	swap	d1

loc_20306C:
	cmp.w	(bottom_bound).w,d1
	blt.s	loc_203090
	subi.w	#$800,d1
	bcs.s	loc_20308C
	andi.w	#$7FF,$C(a6)
	subi.w	#$800,(scroll_fg_y).w
	andi.w	#$3FF,(scroll_bg_y).w
	bra.s	loc_203090

; ------------------------------------------------------------------------------

loc_20308C:
	move.w	(bottom_bound).w,d1

loc_203090:
	move.w	(scroll_fg_y).w,d4
	swap	d1
	move.l	d1,d3
	sub.l	(scroll_fg_y).w,d3
	ror.l	#8,d3
	move.w	d3,(scroll_y_move).w
	move.l	d1,(scroll_fg_y).w
	move.w	(scroll_fg_y).w,d0
	andi.w	#$10,d0
	move.b	(scroll_cross_y).w,d1
	eor.b	d1,d0
	bne.s	locret_2030D2
	eori.b	#$10,(scroll_cross_y).w
	move.w	(scroll_fg_y).w,d0
	sub.w	d4,d0
	bpl.s	loc_2030CC
	bset	#0,(scroll_flags_fg).w
	rts

; ------------------------------------------------------------------------------

loc_2030CC:
	bset	#1,(scroll_flags_fg).w

locret_2030D2:
	rts

; ------------------------------------------------------------------------------

ScrollBgXY:
	move.l	(scroll_bg_x).w,d2
	move.l	d2,d0
	add.l	d4,d0
	move.l	d0,(scroll_bg_x).w
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_x).w,d3
	eor.b	d3,d1
	bne.s	loc_203108
	eori.b	#$10,(scroll_cross_bg_x).w
	sub.l	d2,d0
	bpl.s	loc_203102
	bset	#2,(scroll_flags_bg).w
	bra.s	loc_203108

; ------------------------------------------------------------------------------

loc_203102:
	bset	#3,(scroll_flags_bg).w

loc_203108:
	move.l	(scroll_bg_y).w,d3
	move.l	d3,d0
	add.l	d5,d0
	move.l	d0,(scroll_bg_y).w
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_y).w,d2
	eor.b	d2,d1
	bne.s	locret_20313C
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.l	d3,d0
	bpl.s	loc_203136
	bset	#0,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_203136:
	bset	#1,(scroll_flags_bg).w

locret_20313C:
	rts

; ------------------------------------------------------------------------------

UnkScrollBgY:
	move.l	(scroll_bg_y).w,d3
	move.l	d3,d0
	add.l	d5,d0
	move.l	d0,(scroll_bg_y).w
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_y).w,d2
	eor.b	d2,d1
	bne.s	locret_203172
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.l	d3,d0
	bpl.s	loc_20316C
	bset	#4,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_20316C:
	bset	#5,(scroll_flags_bg).w

locret_203172:
	rts

; ------------------------------------------------------------------------------

ScrollBgY:
	move.w	(scroll_bg_y).w,d3
	move.w	d0,(scroll_bg_y).w
	move.w	d0,d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_y).w,d2
	eor.b	d2,d1
	bne.s	locret_2031A2
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.w	d3,d0
	bpl.s	loc_20319C
	bset	#0,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_20319C:
	bset	#1,(scroll_flags_bg).w

locret_2031A2:
	rts

; ------------------------------------------------------------------------------

ScrollBgX:
	move.l	(scroll_bg_x).w,d2
	move.l	d2,d0
	add.l	d4,d0
	move.l	d0,(scroll_bg_x).w
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_x).w,d3
	eor.b	d3,d1
	bne.s	locret_2031D6
	eori.b	#$10,(scroll_cross_bg_x).w
	sub.l	d2,d0
	bpl.s	loc_2031D0
	bset	d6,(scroll_flags_bg).w
	bra.s	locret_2031D6

; ------------------------------------------------------------------------------

loc_2031D0:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg).w

locret_2031D6:
	rts

; ------------------------------------------------------------------------------

ScrollBg2X:
	move.l	(scroll_bg2_x).w,d2
	move.l	d2,d0
	add.l	d4,d0
	move.l	d0,(scroll_bg2_x).w
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg2_x).w,d3
	eor.b	d3,d1
	bne.s	locret_20320A
	eori.b	#$10,(scroll_cross_bg2_x).w
	sub.l	d2,d0
	bpl.s	loc_203204
	bset	d6,(scroll_flags_bg2).w
	bra.s	locret_20320A

; ------------------------------------------------------------------------------

loc_203204:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg2).w

locret_20320A:
	rts

; ------------------------------------------------------------------------------

ScrollBg3X:
	move.l	(scroll_bg3_x).w,d2
	move.l	d2,d0
	add.l	d4,d0
	move.l	d0,(scroll_bg3_x).w
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg3_x).w,d3
	eor.b	d3,d1
	bne.s	locret_20323E
	eori.b	#$10,(scroll_cross_bg3_x).w
	sub.l	d2,d0
	bpl.s	loc_203238
	bset	d6,(scroll_flags_bg3).w
	bra.s	locret_20323E

; ------------------------------------------------------------------------------

loc_203238:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg3).w

locret_20323E:
	rts

; ------------------------------------------------------------------------------