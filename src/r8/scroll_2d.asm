; ------------------------------------------------------------------------------

GetPlayerObject:
	lea	(player_object).w,a6
	tst.b	(use_player_2).l
	beq.s	locret_202ADC
	lea	(player_object_2).w,a6

locret_202ADC:
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
	lea	(unk_202B3A).l,a0
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
	bra.w	loc_202B66

; ------------------------------------------------------------------------------

unk_202B3A:
	dc.b	0
	dc.b	4
	dc.b	0
	dc.b	0
	dc.b	$1E
	dc.b	$97
	dc.b	0
	dc.b	0
	dc.b	7
	dc.b	$10
	dc.b	0
	dc.b	$60

unk_202B46:
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

loc_202B66:
	tst.b	(spawn_mode).l
	beq.s	loc_202B86
	jsr	LoadCheckpoint
	moveq	#0,d0
	moveq	#0,d1
	move.w	8(a6),d1
	move.w	$C(a6),d0
	bpl.s	loc_202B84
	moveq	#0,d0

loc_202B84:
	bra.s	loc_202BC2

; ------------------------------------------------------------------------------

loc_202B86:
	lea	(StagePlayerSpawn).l,a1
	tst.w	(stage_demo).l
	bpl.s	loc_202BA8
	move.w	(s1_credits_index).l,d0
	subq.w	#1,d0
	lsl.w	#2,d0
	lea	(unk_202B46).l,a1
	adda.w	d0,a1
	bra.s	loc_202BB2

; ------------------------------------------------------------------------------

loc_202BA8:
	move.w	(stage_demo).l,d0
	lsl.w	#2,d0
	adda.w	d0,a1

loc_202BB2:
	moveq	#0,d1
	move.w	(a1)+,d1
	move.w	d1,8(a6)
	moveq	#0,d0
	move.w	(a1),d0
	move.w	d0,$C(a6)

loc_202BC2:
	subi.w	#$A0,d1
	bcc.s	loc_202BCA
	moveq	#0,d1

loc_202BCA:
	move.w	(right_bound).w,d2
	cmp.w	d2,d1
	bcs.s	loc_202BD4
	move.w	d2,d1

loc_202BD4:
	move.w	d1,(scroll_fg_x).w
	subi.w	#$60,d0
	bcc.s	loc_202BE0
	moveq	#0,d0

loc_202BE0:
	cmp.w	(bottom_bound).w,d0
	blt.s	loc_202BEA
	move.w	(bottom_bound).w,d0

loc_202BEA:
	move.w	d0,(scroll_fg_y).w
	bsr.w	sub_202C06
	lea	(unk_202C02).l,a1
	move.l	(a1),(loop_chunk_1).w
	rts

; ------------------------------------------------------------------------------

StagePlayerSpawn:
	dc.b	0, $2E, 4, $8C

unk_202C02:
	dc.b	$7F
	dc.b	$7F
	dc.b	$7F
	dc.b	$7F

; ------------------------------------------------------------------------------

sub_202C06:
	swap	d0
	lsr.l	#3,d0
	move.l	d0,(scroll_bg_y).w
	swap	d0
	move.w	d0,(scroll_bg2_y).w
	move.w	d0,(scroll_bg3_y).w
	lsr.l	#1,d1
	move.w	d1,(scroll_bg2_x).w
	lsr.l	#1,d1
	move.w	d1,(scroll_bg3_x).w
	lsr.l	#2,d1
	move.l	d1,d2
	add.l	d2,d2
	add.l	d2,d1
	move.w	d1,(scroll_bg_x).w
	rts

; ------------------------------------------------------------------------------

UpdateScroll:
	lea	(player_object).w,a6
	tst.b	(scroll_lock).w
	beq.s	loc_202C3E
	rts

; ------------------------------------------------------------------------------

loc_202C3E:
	clr.w	(scroll_flags_fg).w
	clr.w	(scroll_flags_bg).w
	clr.w	(scroll_flags_bg2).w
	clr.w	(scroll_flags_bg3).w
	bsr.w	ScrollFgX
	bsr.w	ScrollFgY
	bsr.w	StageEvents
	move.w	(scroll_fg_y).w,(scroll_y).w
	move.w	(scroll_bg_y).w,(scroll_y+2).w
	move.w	(scroll_x_move).w,d4
	ext.l	d4
	asl.l	#6,d4
	moveq	#6,d6
	bsr.w	ScrollBg3X
	move.w	(scroll_x_move).w,d4
	ext.l	d4
	asl.l	#7,d4
	moveq	#4,d6
	bsr.w	ScrollBg2X
	lea	(bg_scroll_lines).w,a1
	move.w	(scroll_x_move).w,d4
	ext.l	d4
	asl.l	#4,d4
	move.l	d4,d3
	add.l	d3,d3
	add.l	d3,d4
	moveq	#2,d6
	bsr.w	ScrollBgX
	move.l	(scroll_fg_y).w,d0
	lsr.l	#3,d0
	swap	d0
	bsr.w	ScrollBgY
	move.w	(scroll_bg_y).w,(scroll_y+2).w
	move.w	(scroll_bg_y).w,(scroll_bg2_y).w
	move.w	(scroll_bg_y).w,(scroll_bg3_y).w
	move.b	(scroll_flags_bg3).w,d0
	or.b	(scroll_flags_bg2).w,d0
	or.b	d0,(scroll_flags_bg).w
	clr.b	(scroll_flags_bg3).w
	clr.b	(scroll_flags_bg2).w
	lea	(bg_scroll_lines).w,a1
	move.w	(scroll_fg_x).w,d0
	neg.w	d0
	swap	d0
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	moveq	#5,d6

loc_202CE0:
	move.w	d0,(a1)+
	dbf	d6,loc_202CE0
	bsr.w	sub_202D38
	move.w	(scroll_bg2_x).w,d0
	neg.w	d0
	moveq	#$11,d6

loc_202CF2:
	move.w	d0,(a1)+
	dbf	d6,loc_202CF2
	bsr.w	sub_202D5E
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	moveq	#9,d6

loc_202D04:
	move.w	d0,(a1)+
	dbf	d6,loc_202D04
	lea	(scroll_lines).w,a1
	lea	(bg_scroll_lines).w,a2
	move.w	(scroll_bg_y).w,d0
	move.w	d0,d2
	andi.w	#$3F8,d0
	lsr.w	#2,d0
	moveq	#$1C,d1
	lea	(a2,d0.w),a2
	bra.w	loc_202DA8

; ------------------------------------------------------------------------------

byte_202D28:
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	0

byte_202D30:
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	9
	dc.b	1
	dc.b	0

; ------------------------------------------------------------------------------

sub_202D38:
	bsr.w	sub_202D8C
	move.w	(scroll_bg3_x).w,d3
	moveq	#6,d6

loc_202D42:
	move.w	d3,d0
	neg.w	d0
	moveq	#0,d5
	move.b	byte_202D28(pc,d6.w),d5

loc_202D4C:
	move.w	d0,(a1)+
	dbf	d5,loc_202D4C
	swap	d3
	add.l	d2,d3
	swap	d3
	dbf	d6,loc_202D42
	rts

; ------------------------------------------------------------------------------

sub_202D5E:
	bsr.w	sub_202D8C
	move.w	(scroll_bg3_x).w,d3
	adda.w	#$24,a1
	moveq	#6,d6

loc_202D6C:
	move.w	d3,d0
	neg.w	d0
	moveq	#0,d5
	move.b	byte_202D30(pc,d6.w),d5

loc_202D76:
	move.w	d0,-(a1)
	dbf	d5,loc_202D76
	swap	d3
	add.l	d2,d3
	swap	d3
	dbf	d6,loc_202D6C
	adda.w	#$24,a1
	rts

; ------------------------------------------------------------------------------

sub_202D8C:
	move.w	(scroll_bg3_x).w,d0
	move.w	(scroll_bg2_x).w,d2
	sub.w	d0,d2
	ext.l	d2
	moveq	#7,d1
	asl.l	d1,d2
	divu.w	#5,d2
	ext.l	d2
	moveq	#9,d1
	asl.l	d1,d2
	rts

; ------------------------------------------------------------------------------

loc_202DA8:
	andi.w	#7,d2
	add.w	d2,d2
	move.w	(a2)+,d0
	jmp	loc_202DB6(pc,d2.w)

; ------------------------------------------------------------------------------

loc_202DB4:
	move.w	(a2)+,d0

loc_202DB6:
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	dbf	d1,loc_202DB4
	rts

; ------------------------------------------------------------------------------

	neg.w	d0
	jmp	loc_202DD4(pc,d2.w)

; ------------------------------------------------------------------------------

	neg.w	d0

loc_202DD4:
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	dbf	d1,loc_202DB4
	rts

; ------------------------------------------------------------------------------

ScrollFgX:
	move.w	(scroll_fg_x).w,d4
	bsr.s	CheckScrollFgX
	move.w	(scroll_fg_x).w,d0
	andi.w	#$10,d0
	move.b	(scroll_cross_x).w,d1
	eor.b	d1,d0
	bne.s	locret_202E1C
	eori.b	#$10,(scroll_cross_x).w
	move.w	(scroll_fg_x).w,d0
	sub.w	d4,d0
	bpl.s	loc_202E16
	bset	#2,(scroll_flags_fg).w
	rts

; ------------------------------------------------------------------------------

loc_202E16:
	bset	#3,(scroll_flags_fg).w

locret_202E1C:
	rts

; ------------------------------------------------------------------------------

CheckScrollFgX:
	move.w	8(a6),d0
	sub.w	(scroll_fg_x).w,d0
	sub.w	(scroll_focus_x).w,d0
	beq.s	loc_202E30
	bcs.s	loc_202E60
	bra.s	loc_202E36

; ------------------------------------------------------------------------------

loc_202E30:
	clr.w	(scroll_x_move).w
	rts

; ------------------------------------------------------------------------------

loc_202E36:
	cmpi.w	#$10,d0
	blt.s	loc_202E40
	move.w	#$10,d0

loc_202E40:
	add.w	(scroll_fg_x).w,d0
	cmp.w	(right_bound).w,d0
	blt.s	loc_202E4E
	move.w	(right_bound).w,d0

loc_202E4E:
	move.w	d0,d1
	sub.w	(scroll_fg_x).w,d1
	asl.w	#8,d1
	move.w	d0,(scroll_fg_x).w
	move.w	d1,(scroll_x_move).w
	rts

; ------------------------------------------------------------------------------

loc_202E60:
	cmpi.w	#$FFF0,d0
	bge.s	loc_202E6A
	move.w	#$FFF0,d0

loc_202E6A:
	add.w	(scroll_fg_x).w,d0
	cmp.w	(left_bound).w,d0
	bgt.s	loc_202E4E
	move.w	(left_bound).w,d0
	bra.s	loc_202E4E

; ------------------------------------------------------------------------------

ScrollFgXSlow:
	tst.w	d0
	bpl.s	loc_202E84
	move.w	#$FFFE,d0
	bra.s	loc_202E60

; ------------------------------------------------------------------------------

loc_202E84:
	move.w	#2,d0
	bra.s	loc_202E36

; ------------------------------------------------------------------------------

ScrollFgY:
	moveq	#0,d1
	move.w	$C(a6),d0
	sub.w	(scroll_fg_y).w,d0
	btst	#2,$22(a6)
	beq.s	loc_202E9E
	subq.w	#5,d0

loc_202E9E:
	btst	#1,$22(a6)
	beq.s	loc_202EBE
	addi.w	#$20,d0
	sub.w	(scroll_focus_y).w,d0
	bcs.s	loc_202F0A
	subi.w	#$40,d0
	bcc.s	loc_202F0A
	tst.b	(bottom_bound_shift).w
	bne.s	loc_202F1C
	bra.s	loc_202ECA

; ------------------------------------------------------------------------------

loc_202EBE:
	sub.w	(scroll_focus_y).w,d0
	bne.s	loc_202ED0
	tst.b	(bottom_bound_shift).w
	bne.s	loc_202F1C

loc_202ECA:
	clr.w	(scroll_y_move).w
	rts

; ------------------------------------------------------------------------------

loc_202ED0:
	cmpi.w	#$60,(scroll_focus_y).w
	bne.s	loc_202EF8
	move.w	$14(a6),d1
	bpl.s	loc_202EE0
	neg.w	d1

loc_202EE0:
	cmpi.w	#$800,d1
	bcc.s	loc_202F0A
	move.w	#$600,d1
	cmpi.w	#6,d0
	bgt.s	loc_202F6A
	cmpi.w	#$FFFA,d0
	blt.s	loc_202F34
	bra.s	loc_202F22

; ------------------------------------------------------------------------------

loc_202EF8:
	move.w	#$200,d1
	cmpi.w	#2,d0
	bgt.s	loc_202F6A
	cmpi.w	#$FFFE,d0
	blt.s	loc_202F34
	bra.s	loc_202F22

; ------------------------------------------------------------------------------

loc_202F0A:
	move.w	#$1000,d1
	cmpi.w	#$10,d0
	bgt.s	loc_202F6A
	cmpi.w	#$FFF0,d0
	blt.s	loc_202F34
	bra.s	loc_202F22

; ------------------------------------------------------------------------------

loc_202F1C:
	moveq	#0,d0
	move.b	d0,(bottom_bound_shift).w

loc_202F22:
	moveq	#0,d1
	move.w	d0,d1
	add.w	(scroll_fg_y).w,d1
	tst.w	d0
	bpl.w	loc_202F74
	bra.w	loc_202F40

; ------------------------------------------------------------------------------

loc_202F34:
	neg.w	d1
	ext.l	d1
	asl.l	#8,d1
	add.l	(scroll_fg_y).w,d1
	swap	d1

loc_202F40:
	cmp.w	(top_bound).w,d1
	bgt.s	loc_202F98
	cmpi.w	#$FF00,d1
	bgt.s	loc_202F64
	andi.w	#$7FF,d1
	andi.w	#$7FF,$C(a6)
	andi.w	#$7FF,(scroll_fg_y).w
	andi.w	#$3FF,(scroll_bg_y).w
	bra.s	loc_202F98

; ------------------------------------------------------------------------------

loc_202F64:
	move.w	(top_bound).w,d1
	bra.s	loc_202F98

; ------------------------------------------------------------------------------

loc_202F6A:
	ext.l	d1
	asl.l	#8,d1
	add.l	(scroll_fg_y).w,d1
	swap	d1

loc_202F74:
	cmp.w	(bottom_bound).w,d1
	blt.s	loc_202F98
	subi.w	#$800,d1
	bcs.s	loc_202F94
	andi.w	#$7FF,$C(a6)
	subi.w	#$800,(scroll_fg_y).w
	andi.w	#$3FF,(scroll_bg_y).w
	bra.s	loc_202F98

; ------------------------------------------------------------------------------

loc_202F94:
	move.w	(bottom_bound).w,d1

loc_202F98:
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
	bne.s	locret_202FDA
	eori.b	#$10,(scroll_cross_y).w
	move.w	(scroll_fg_y).w,d0
	sub.w	d4,d0
	bpl.s	loc_202FD4
	bset	#0,(scroll_flags_fg).w
	rts

; ------------------------------------------------------------------------------

loc_202FD4:
	bset	#1,(scroll_flags_fg).w

locret_202FDA:
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
	bne.s	loc_203010
	eori.b	#$10,(scroll_cross_bg_x).w
	sub.l	d2,d0
	bpl.s	loc_20300A
	bset	#2,(scroll_flags_bg).w
	bra.s	loc_203010

; ------------------------------------------------------------------------------

loc_20300A:
	bset	#3,(scroll_flags_bg).w

loc_203010:
	move.l	(scroll_bg_y).w,d3
	move.l	d3,d0
	add.l	d5,d0
	move.l	d0,(scroll_bg_y).w
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_y).w,d2
	eor.b	d2,d1
	bne.s	locret_203044
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.l	d3,d0
	bpl.s	loc_20303E
	bset	#0,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_20303E:
	bset	#1,(scroll_flags_bg).w

locret_203044:
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
	bne.s	locret_20307A
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.l	d3,d0
	bpl.s	loc_203074
	bset	#4,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_203074:
	bset	#5,(scroll_flags_bg).w

locret_20307A:
	rts

; ------------------------------------------------------------------------------

ScrollBgY:
	move.w	(scroll_bg_y).w,d3
	move.w	d0,(scroll_bg_y).w
	move.w	d0,d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_y).w,d2
	eor.b	d2,d1
	bne.s	locret_2030AA
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.w	d3,d0
	bpl.s	loc_2030A4
	bset	#0,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_2030A4:
	bset	#1,(scroll_flags_bg).w

locret_2030AA:
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
	bne.s	locret_2030DE
	eori.b	#$10,(scroll_cross_bg_x).w
	sub.l	d2,d0
	bpl.s	loc_2030D8
	bset	d6,(scroll_flags_bg).w
	bra.s	locret_2030DE

; ------------------------------------------------------------------------------

loc_2030D8:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg).w

locret_2030DE:
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
	bne.s	locret_203112
	eori.b	#$10,(scroll_cross_bg2_x).w
	sub.l	d2,d0
	bpl.s	loc_20310C
	bset	d6,(scroll_flags_bg2).w
	bra.s	locret_203112

; ------------------------------------------------------------------------------

loc_20310C:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg2).w

locret_203112:
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
	bne.s	locret_203146
	eori.b	#$10,(scroll_cross_bg3_x).w
	sub.l	d2,d0
	bpl.s	loc_203140
	bset	d6,(scroll_flags_bg3).w
	bra.s	locret_203146

; ------------------------------------------------------------------------------

loc_203140:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg3).w

locret_203146:
	rts

; ------------------------------------------------------------------------------