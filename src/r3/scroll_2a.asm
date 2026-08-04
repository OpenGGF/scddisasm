; ------------------------------------------------------------------------------

GetPlayerObject:
	lea	(player_object).w,a6
	tst.b	(use_player_2).l
	beq.s	locret_20281A
	lea	(player_object_2).w,a6

locret_20281A:
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
	lea	(unk_202878).l,a0
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
	bra.w	loc_2028A4

; ------------------------------------------------------------------------------

unk_202878:
	dc.b	0
	dc.b	4
	dc.b	0
	dc.b	0
	dc.b	$26
	dc.b	$97
	dc.b	0
	dc.b	0
	dc.b	5
	dc.b	$10
	dc.b	0
	dc.b	$60

unk_202884:
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

loc_2028A4:
	tst.b	(spawn_mode).l
	beq.s	loc_2028C4
	jsr	LoadCheckpoint
	moveq	#0,d0
	moveq	#0,d1
	move.w	8(a6),d1
	move.w	$C(a6),d0
	bpl.s	loc_2028C2
	moveq	#0,d0

loc_2028C2:
	bra.s	loc_202900

; ------------------------------------------------------------------------------

loc_2028C4:
	lea	(StagePlayerSpawn).l,a1
	tst.w	(stage_demo).l
	bpl.s	loc_2028E6
	move.w	(s1_credits_index).l,d0
	subq.w	#1,d0
	lsl.w	#2,d0
	lea	(unk_202884).l,a1
	adda.w	d0,a1
	bra.s	loc_2028F0

; ------------------------------------------------------------------------------

loc_2028E6:
	move.w	(stage_demo).l,d0
	lsl.w	#2,d0
	adda.w	d0,a1

loc_2028F0:
	moveq	#0,d1
	move.w	(a1)+,d1
	move.w	d1,8(a6)
	moveq	#0,d0
	move.w	(a1),d0
	move.w	d0,$C(a6)

loc_202900:
	subi.w	#$A0,d1
	bcc.s	loc_202908
	moveq	#0,d1

loc_202908:
	move.w	(right_bound).w,d2
	cmp.w	d2,d1
	bcs.s	loc_202912
	move.w	d2,d1

loc_202912:
	move.w	d1,(scroll_fg_x).w
	subi.w	#$60,d0
	bcc.s	loc_20291E
	moveq	#0,d0

loc_20291E:
	cmp.w	(bottom_bound).w,d0
	blt.s	loc_202928
	move.w	(bottom_bound).w,d0

loc_202928:
	move.w	d0,(scroll_fg_y).w
	bsr.w	sub_202944
	lea	(unk_202940).l,a1
	move.l	(a1),(loop_chunk_1).w
	rts

; ------------------------------------------------------------------------------

StagePlayerSpawn:
	dc.b	0, $20, 1, $AC

unk_202940:
	dc.b	$7F
	dc.b	$7F
	dc.b	$7F
	dc.b	$7F

; ------------------------------------------------------------------------------

sub_202944:
	move.w	#$218,d0
	move.w	#$520,d2
	sub.w	(scroll_fg_y).w,d2
	bcs.s	loc_20295A
	lsr.w	#1,d2
	sub.w	d2,d0
	bpl.s	loc_20295A
	moveq	#0,d0

loc_20295A:
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
	moveq	#$D,d2

loc_202990:
	clr.l	(a2)+
	dbf	d2,loc_202990
	rts

; ------------------------------------------------------------------------------

UpdateScroll:
	lea	(player_object).w,a6
	tst.b	(scroll_lock).w
	beq.s	loc_2029A4
	rts

; ------------------------------------------------------------------------------

loc_2029A4:
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
	asl.l	#4,d4
	moveq	#6,d6
	bsr.w	ScrollBg3X
	move.w	(scroll_x_move).w,d4
	ext.l	d4
	asl.l	#3,d4
	move.l	d4,d3
	add.l	d3,d3
	add.l	d3,d4
	moveq	#4,d6
	bsr.w	ScrollBg2X
	lea	(bg_scroll_lines+$38).w,a1
	move.w	(scroll_x_move).w,d4
	ext.l	d4
	asl.l	#2,d4
	move.l	d4,d3
	add.l	d3,d3
	add.l	d3,d4
	moveq	#2,d6
	bsr.w	ScrollBgX
	move.w	#$218,d0
	move.w	#$520,d1
	sub.w	(scroll_fg_y).w,d1
	bcs.s	loc_202A1C
	lsr.w	#1,d1
	sub.w	d1,d0
	bpl.s	loc_202A1C
	moveq	#0,d0

loc_202A1C:
	bsr.w	ScrollBgY
	move.w	(scroll_bg_y).w,(scroll_y+2).w
	move.w	(scroll_bg_y).w,(scroll_bg2_y).w
	move.w	(scroll_bg_y).w,(scroll_bg3_y).w
	move.b	(scroll_flags_bg3).w,d0
	or.b	(scroll_flags_bg2).w,d0
	or.b	d0,(scroll_flags_bg).w
	clr.b	(scroll_flags_bg3).w
	clr.b	(scroll_flags_bg2).w
	lea	(bg_scroll_lines).w,a2
	addi.l	#$C000,(a2)+
	addi.l	#$8000,(a2)+
	addi.l	#$6000,(a2)+
	addi.l	#$4000,(a2)+
	addi.l	#$3000,(a2)+
	addi.l	#$2000,(a2)+
	addi.l	#$1000,(a2)+
	addi.l	#$1000,(a2)+
	addi.l	#$2000,(a2)+
	addi.l	#$3000,(a2)+
	addi.l	#$4000,(a2)+
	addi.l	#$6000,(a2)+
	addi.l	#$8000,(a2)+
	addi.l	#$C000,(a2)+
	moveq	#$3F,d6
	moveq	#0,d1

loc_202AA2:
	move.w	d1,d2
	mulu.w	#$100,d2
	addi.l	#$8000,d2
	add.l	d2,(a2)+
	addq.b	#1,d1
	dbf	d6,loc_202AA2
	move.w	(scroll_fg_x).w,d0
	neg.w	d0
	swap	d0
	move.w	(scroll_bg_x).w,d0
	move.w	(scroll_fg_x).w,d2
	sub.w	d0,d2
	ext.l	d2
	asl.l	#6,d2
	divs.w	#$1C,d2
	ext.l	d2
	moveq	#$A,d1
	asl.l	d1,d2
	move.w	(scroll_bg_x).w,d3
	moveq	#6,d6
	lea	(bg_scroll_lines+$146).w,a1

loc_202AE0:
	move.w	d3,d0
	neg.w	d0
	move.w	d0,-(a1)
	swap	d3
	add.l	d2,d3
	swap	d3
	dbf	d6,loc_202AE0
	lea	(bg_scroll_lines+$146).w,a1
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	moveq	#2,d6

loc_202AFC:
	move.w	d0,(a1)+
	dbf	d6,loc_202AFC
	move.w	(scroll_bg3_x).w,d0
	neg.w	d0
	moveq	#3,d6

loc_202B0A:
	move.w	d0,(a1)+
	dbf	d6,loc_202B0A
	lea	(bg_scroll_lines).w,a2
	moveq	#$D,d6

loc_202B16:
	move.l	(a2)+,d1
	swap	d1
	add.w	(scroll_bg_x).w,d1
	neg.w	d1
	moveq	#0,d5
	lea	(unk_202BF4).l,a3
	move.b	(a3,d6.w),d5

loc_202B2C:
	move.w	d1,(a1)+
	dbf	d5,loc_202B2C
	dbf	d6,loc_202B16
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	moveq	#7,d6

loc_202B3E:
	move.w	d0,(a1)+
	dbf	d6,loc_202B3E
	move.w	(scroll_bg3_x).w,d0
	neg.w	d0
	moveq	#3,d6

loc_202B4C:
	move.w	d0,(a1)+
	dbf	d6,loc_202B4C
	move.w	(scroll_bg2_x).w,d0
	neg.w	d0
	moveq	#5,d6

loc_202B5A:
	move.w	d0,(a1)+
	dbf	d6,loc_202B5A
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	moveq	#2,d6

loc_202B68:
	move.w	d0,(a1)+
	dbf	d6,loc_202B68
	move.w	(scroll_bg_x).w,d0
	move.w	(scroll_fg_x).w,d2
	sub.w	d0,d2
	ext.l	d2
	asl.l	#6,d2
	divs.w	#$2C,d2
	ext.l	d2
	moveq	#$A,d1
	asl.l	d1,d2
	moveq	#$A,d6
	move.w	(scroll_bg_x).w,d3

loc_202B8C:
	move.w	d3,d0
	neg.w	d0
	move.w	d0,(a1)+
	swap	d3
	add.l	d2,d3
	swap	d3
	dbf	d6,loc_202B8C
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	moveq	#7,d6

loc_202BA4:
	move.w	d0,(a1)+
	dbf	d6,loc_202BA4
	lea	(scroll_lines).w,a1
	lea	(bg_scroll_lines+$138).w,a2
	move.w	(scroll_bg_y).w,d0
	move.w	d0,d2
	move.w	d0,d4
	andi.w	#$3F8,d0
	lsr.w	#2,d0
	move.w	d0,d3
	lsr.w	#1,d3
	moveq	#$57,d1
	moveq	#$1D,d5
	sub.w	d3,d1
	bcs.s	loc_202BF0
	cmpi.w	#$1B,d1
	bcs.s	loc_202BD4
	moveq	#$1C,d1

loc_202BD4:
	sub.w	d1,d5
	lea	(a2,d0.w),a2
	lea	(unk_202C02).l,a3
	lea	(byte_21D7A6).l,a4
	addi.w	#$40,(bg_water_deform).w
	bsr.w	sub_202C56

loc_202BF0:
	bra.w	loc_202C08

; ------------------------------------------------------------------------------

unk_202BF4:
	dc.b	1
	dc.b	3
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	3
	dc.b	1
	dc.b	3
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	3
	dc.b	3
	dc.b	5

unk_202C02:
	dc.b	0
	dc.b	$38
	dc.b	2
	dc.b	$50
	dc.b	$7F
	dc.b	$FF

; ------------------------------------------------------------------------------

loc_202C08:
	move.w	d5,d1
	lsl.w	#3,d1
	subq.w	#1,d1
	lea	(bg_scroll_lines+$38).w,a2
	move.b	(bg_water_deform).w,d5
	sub.w	(scroll_bg_y).w,d4

loc_202C1A:
	move.l	(a2)+,d2
	swap	d2
	add.w	(scroll_bg_x).w,d2
	neg.w	d2
	move.w	d2,d0
	move.w	#$5C0,d3
	sub.w	(scroll_fg_y).w,d3
	cmp.w	d3,d4
	bcs.s	loc_202C4A
	andi.w	#$FF,d5
	move.b	(a4,d5.w),d3
	ext.w	d3
	add.w	d3,d3
	add.w	(scroll_fg_x).w,d3
	neg.w	d3
	swap	d0
	move.w	d3,d0
	swap	d0

loc_202C4A:
	move.l	d0,(a1)+
	addq.w	#1,d4
	addq.w	#1,d5
	dbf	d1,loc_202C1A
	rts

; ------------------------------------------------------------------------------

sub_202C56:
	cmp.w	(a3),d4
	bcc.s	loc_202C8C

loc_202C5A:
	andi.w	#7,d2
	addq.w	#8,d4
	sub.w	d2,d4
	add.w	d2,d2
	move.w	(a2)+,d0
	jmp	loc_202C76(pc,d2.w)

; ------------------------------------------------------------------------------

loc_202C6A:
	tst.w	d1
	bmi.s	locret_202C8A
	cmp.w	(a3),d4
	bcc.s	loc_202CA6

loc_202C72:
	move.w	(a2)+,d0
	addq.w	#8,d4

loc_202C76:
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	dbf	d1,loc_202C6A

locret_202C8A:
	rts

; ------------------------------------------------------------------------------

loc_202C8C:
	move.w	(a3)+,d3
	addi.w	#$18,d3
	sub.w	d4,d3
	bgt.s	loc_202CB0
	cmp.w	(a3),d4
	bcs.s	loc_202C5A
	move.w	(a3)+,d3
	addi.w	#$18,d3
	sub.w	d4,d3
	ble.s	loc_202C5A
	bra.s	loc_202CB0

; ------------------------------------------------------------------------------

loc_202CA6:
	move.w	(a3)+,d3
	addi.w	#$18,d3
	sub.w	d4,d3
	ble.s	loc_202C72

loc_202CB0:
	subq.w	#1,d3
	move.w	d3,d6
	moveq	#0,d2
	move.b	(bg_water_deform).w,d2

loc_202CBA:
	andi.w	#$FF,d2
	move.b	(a4,d2.w),d0
	ext.w	d0
	add.w	(scroll_bg_x).w,d0
	neg.w	d0
	move.l	d0,(a1)+
	addq.w	#1,d4
	addq.w	#1,d2
	dbf	d3,loc_202CBA
	lsr.w	#3,d6

loc_202CD6:
	move.w	(a2)+,d0
	subq.w	#1,d1
	dbf	d6,loc_202CD6
	bra.s	loc_202C6A

; ------------------------------------------------------------------------------

ScrollFgX:
	move.w	(scroll_fg_x).w,d4
	bsr.s	CheckScrollFgX
	move.w	(scroll_fg_x).w,d0
	andi.w	#$10,d0
	move.b	(scroll_cross_x).w,d1
	eor.b	d1,d0
	bne.s	locret_202D12
	eori.b	#$10,(scroll_cross_x).w
	move.w	(scroll_fg_x).w,d0
	sub.w	d4,d0
	bpl.s	loc_202D0C
	bset	#2,(scroll_flags_fg).w
	rts

; ------------------------------------------------------------------------------

loc_202D0C:
	bset	#3,(scroll_flags_fg).w

locret_202D12:
	rts

; ------------------------------------------------------------------------------

CheckScrollFgX:
	move.w	8(a6),d0
	sub.w	(scroll_fg_x).w,d0
	sub.w	(scroll_focus_x).w,d0
	beq.s	loc_202D26
	bcs.s	loc_202D56
	bra.s	loc_202D2C

; ------------------------------------------------------------------------------

loc_202D26:
	clr.w	(scroll_x_move).w
	rts

; ------------------------------------------------------------------------------

loc_202D2C:
	cmpi.w	#$10,d0
	blt.s	loc_202D36
	move.w	#$10,d0

loc_202D36:
	add.w	(scroll_fg_x).w,d0
	cmp.w	(right_bound).w,d0
	blt.s	loc_202D44
	move.w	(right_bound).w,d0

loc_202D44:
	move.w	d0,d1
	sub.w	(scroll_fg_x).w,d1
	asl.w	#8,d1
	move.w	d0,(scroll_fg_x).w
	move.w	d1,(scroll_x_move).w
	rts

; ------------------------------------------------------------------------------

loc_202D56:
	cmpi.w	#$FFF0,d0
	bge.s	loc_202D60
	move.w	#$FFF0,d0

loc_202D60:
	add.w	(scroll_fg_x).w,d0
	cmp.w	(left_bound).w,d0
	bgt.s	loc_202D44
	move.w	(left_bound).w,d0
	bra.s	loc_202D44

; ------------------------------------------------------------------------------

ScrollFgXSlow:
	tst.w	d0
	bpl.s	loc_202D7A
	move.w	#$FFFE,d0
	bra.s	loc_202D56

; ------------------------------------------------------------------------------

loc_202D7A:
	move.w	#2,d0
	bra.s	loc_202D2C

; ------------------------------------------------------------------------------

ScrollFgY:
	moveq	#0,d1
	move.w	$C(a6),d0
	sub.w	(scroll_fg_y).w,d0
	btst	#2,$22(a6)
	beq.s	loc_202D94
	subq.w	#5,d0

loc_202D94:
	btst	#1,$22(a6)
	beq.s	loc_202DB4
	addi.w	#$20,d0
	sub.w	(scroll_focus_y).w,d0
	bcs.s	loc_202E00
	subi.w	#$40,d0
	bcc.s	loc_202E00
	tst.b	(bottom_bound_shift).w
	bne.s	loc_202E12
	bra.s	loc_202DC0

; ------------------------------------------------------------------------------

loc_202DB4:
	sub.w	(scroll_focus_y).w,d0
	bne.s	loc_202DC6
	tst.b	(bottom_bound_shift).w
	bne.s	loc_202E12

loc_202DC0:
	clr.w	(scroll_y_move).w
	rts

; ------------------------------------------------------------------------------

loc_202DC6:
	cmpi.w	#$60,(scroll_focus_y).w
	bne.s	loc_202DEE
	move.w	$14(a6),d1
	bpl.s	loc_202DD6
	neg.w	d1

loc_202DD6:
	cmpi.w	#$800,d1
	bcc.s	loc_202E00
	move.w	#$600,d1
	cmpi.w	#6,d0
	bgt.s	loc_202E60
	cmpi.w	#$FFFA,d0
	blt.s	loc_202E2A
	bra.s	loc_202E18

; ------------------------------------------------------------------------------

loc_202DEE:
	move.w	#$200,d1
	cmpi.w	#2,d0
	bgt.s	loc_202E60
	cmpi.w	#$FFFE,d0
	blt.s	loc_202E2A
	bra.s	loc_202E18

; ------------------------------------------------------------------------------

loc_202E00:
	move.w	#$1000,d1
	cmpi.w	#$10,d0
	bgt.s	loc_202E60
	cmpi.w	#$FFF0,d0
	blt.s	loc_202E2A
	bra.s	loc_202E18

; ------------------------------------------------------------------------------

loc_202E12:
	moveq	#0,d0
	move.b	d0,(bottom_bound_shift).w

loc_202E18:
	moveq	#0,d1
	move.w	d0,d1
	add.w	(scroll_fg_y).w,d1
	tst.w	d0
	bpl.w	loc_202E6A
	bra.w	loc_202E36

; ------------------------------------------------------------------------------

loc_202E2A:
	neg.w	d1
	ext.l	d1
	asl.l	#8,d1
	add.l	(scroll_fg_y).w,d1
	swap	d1

loc_202E36:
	cmp.w	(top_bound).w,d1
	bgt.s	loc_202E8E
	cmpi.w	#$FF00,d1
	bgt.s	loc_202E5A
	andi.w	#$7FF,d1
	andi.w	#$7FF,$C(a6)
	andi.w	#$7FF,(scroll_fg_y).w
	andi.w	#$3FF,(scroll_bg_y).w
	bra.s	loc_202E8E

; ------------------------------------------------------------------------------

loc_202E5A:
	move.w	(top_bound).w,d1
	bra.s	loc_202E8E

; ------------------------------------------------------------------------------

loc_202E60:
	ext.l	d1
	asl.l	#8,d1
	add.l	(scroll_fg_y).w,d1
	swap	d1

loc_202E6A:
	cmp.w	(bottom_bound).w,d1
	blt.s	loc_202E8E
	subi.w	#$800,d1
	bcs.s	loc_202E8A
	andi.w	#$7FF,$C(a6)
	subi.w	#$800,(scroll_fg_y).w
	andi.w	#$3FF,(scroll_bg_y).w
	bra.s	loc_202E8E

; ------------------------------------------------------------------------------

loc_202E8A:
	move.w	(bottom_bound).w,d1

loc_202E8E:
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
	bne.s	locret_202ED0
	eori.b	#$10,(scroll_cross_y).w
	move.w	(scroll_fg_y).w,d0
	sub.w	d4,d0
	bpl.s	loc_202ECA
	bset	#0,(scroll_flags_fg).w
	rts

; ------------------------------------------------------------------------------

loc_202ECA:
	bset	#1,(scroll_flags_fg).w

locret_202ED0:
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
	bne.s	loc_202F06
	eori.b	#$10,(scroll_cross_bg_x).w
	sub.l	d2,d0
	bpl.s	loc_202F00
	bset	#2,(scroll_flags_bg).w
	bra.s	loc_202F06

; ------------------------------------------------------------------------------

loc_202F00:
	bset	#3,(scroll_flags_bg).w

loc_202F06:
	move.l	(scroll_bg_y).w,d3
	move.l	d3,d0
	add.l	d5,d0
	move.l	d0,(scroll_bg_y).w
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_y).w,d2
	eor.b	d2,d1
	bne.s	locret_202F3A
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.l	d3,d0
	bpl.s	loc_202F34
	bset	#0,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_202F34:
	bset	#1,(scroll_flags_bg).w

locret_202F3A:
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
	bne.s	locret_202F70
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.l	d3,d0
	bpl.s	loc_202F6A
	bset	#4,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_202F6A:
	bset	#5,(scroll_flags_bg).w

locret_202F70:
	rts

; ------------------------------------------------------------------------------

ScrollBgY:
	move.w	(scroll_bg_y).w,d3
	move.w	d0,(scroll_bg_y).w
	move.w	d0,d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_y).w,d2
	eor.b	d2,d1
	bne.s	locret_202FA0
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.w	d3,d0
	bpl.s	loc_202F9A
	bset	#0,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_202F9A:
	bset	#1,(scroll_flags_bg).w

locret_202FA0:
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
	bne.s	locret_202FD4
	eori.b	#$10,(scroll_cross_bg_x).w
	sub.l	d2,d0
	bpl.s	loc_202FCE
	bset	d6,(scroll_flags_bg).w
	bra.s	locret_202FD4

; ------------------------------------------------------------------------------

loc_202FCE:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg).w

locret_202FD4:
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
	bne.s	locret_203008
	eori.b	#$10,(scroll_cross_bg2_x).w
	sub.l	d2,d0
	bpl.s	loc_203002
	bset	d6,(scroll_flags_bg2).w
	bra.s	locret_203008

; ------------------------------------------------------------------------------

loc_203002:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg2).w

locret_203008:
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
	bne.s	locret_20303C
	eori.b	#$10,(scroll_cross_bg3_x).w
	sub.l	d2,d0
	bpl.s	loc_203036
	bset	d6,(scroll_flags_bg3).w
	bra.s	locret_20303C

; ------------------------------------------------------------------------------

loc_203036:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg3).w

locret_20303C:
	rts

; ------------------------------------------------------------------------------