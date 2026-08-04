; ------------------------------------------------------------------------------

GetPlayerObject:
	lea	(player_object).w,a6
	tst.b	(use_player_2).l
	beq.s	locret_202808
	lea	(player_object_2).w,a6

locret_202808:
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
	lea	(unk_202866).l,a0
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
	bra.w	loc_202892

; ------------------------------------------------------------------------------

unk_202866:
	dc.b	0
	dc.b	4
	dc.b	0
	dc.b	0
	dc.b	4
	dc.b	$97
	dc.b	0
	dc.b	$30
	dc.b	5
	dc.b	$10
	dc.b	0
	dc.b	$60

unk_202872:
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

loc_202892:
	tst.b	(spawn_mode).l
	beq.s	loc_2028B2
	jsr	LoadCheckpoint
	moveq	#0,d0
	moveq	#0,d1
	move.w	8(a6),d1
	move.w	$C(a6),d0
	bpl.s	loc_2028B0
	moveq	#0,d0

loc_2028B0:
	bra.s	loc_2028EE

; ------------------------------------------------------------------------------

loc_2028B2:
	lea	(StagePlayerSpawn).l,a1
	tst.w	(stage_demo).l
	bpl.s	loc_2028D4
	move.w	(s1_credits_index).l,d0
	subq.w	#1,d0
	lsl.w	#2,d0
	lea	(unk_202872).l,a1
	adda.w	d0,a1
	bra.s	loc_2028DE

; ------------------------------------------------------------------------------

loc_2028D4:
	move.w	(stage_demo).l,d0
	lsl.w	#2,d0
	adda.w	d0,a1

loc_2028DE:
	moveq	#0,d1
	move.w	(a1)+,d1
	move.w	d1,8(a6)
	moveq	#0,d0
	move.w	(a1),d0
	move.w	d0,$C(a6)

loc_2028EE:
	subi.w	#$A0,d1
	bcc.s	loc_2028F6
	moveq	#0,d1

loc_2028F6:
	move.w	(right_bound).w,d2
	cmp.w	d2,d1
	bcs.s	loc_202900
	move.w	d2,d1

loc_202900:
	move.w	d1,(scroll_fg_x).w
	subi.w	#$60,d0
	bcc.s	loc_20290C
	moveq	#0,d0

loc_20290C:
	cmp.w	(bottom_bound).w,d0
	blt.s	loc_202916
	move.w	(bottom_bound).w,d0

loc_202916:
	move.w	d0,(scroll_fg_y).w
	bsr.w	sub_202932
	lea	(unk_20292E).l,a1
	move.l	(a1),(loop_chunk_1).w
	rts

; ------------------------------------------------------------------------------

StagePlayerSpawn:
	dc.b	0, $50, 1, $C

unk_20292E:
	dc.b	$7F
	dc.b	$7F
	dc.b	$7F
	dc.b	$7F

; ------------------------------------------------------------------------------

sub_202932:
	move.w	#$218,d0
	move.w	#$520,d2
	sub.w	(scroll_fg_y).w,d2
	bcs.s	loc_202948
	lsr.w	#1,d2
	sub.w	d2,d0
	bpl.s	loc_202948
	moveq	#0,d0

loc_202948:
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
	moveq	#$B,d2

loc_20297E:
	clr.l	(a2)+
	dbf	d2,loc_20297E
	rts

; ------------------------------------------------------------------------------

UpdateScroll:
	lea	(player_object).w,a6
	tst.b	(scroll_lock).w
	beq.s	loc_202992
	rts

; ------------------------------------------------------------------------------

loc_202992:
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
	lea	(bg_scroll_lines+$130).w,a1
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
	bcs.s	loc_202A0A
	lsr.w	#1,d1
	sub.w	d1,d0
	bpl.s	loc_202A0A
	moveq	#0,d0

loc_202A0A:
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
	addi.l	#$2000,(a2)+
	addi.l	#$3000,(a2)+
	addi.l	#$4000,(a2)+
	addi.l	#$6000,(a2)+
	addi.l	#$8000,(a2)+
	addi.l	#$C000,(a2)+
	moveq	#$3F,d6
	moveq	#0,d1

loc_202A84:
	move.w	d1,d2
	mulu.w	#$100,d2
	addi.l	#$8000,d2
	add.l	d2,(a2)+
	addq.b	#1,d1
	dbf	d6,loc_202A84
	move.w	(scroll_fg_x).w,d0
	neg.w	d0
	swap	d0
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	moveq	#2,d6

loc_202AA8:
	move.w	d0,(a1)+
	dbf	d6,loc_202AA8
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	moveq	#2,d6

loc_202AB6:
	move.w	d0,(a1)+
	dbf	d6,loc_202AB6
	move.w	(scroll_bg3_x).w,d0
	neg.w	d0
	moveq	#5,d6

loc_202AC4:
	move.w	d0,(a1)+
	dbf	d6,loc_202AC4
	lea	(bg_scroll_lines).w,a2
	moveq	#$B,d6

loc_202AD0:
	move.l	(a2)+,d1
	swap	d1
	add.w	(scroll_bg_x).w,d1
	neg.w	d1
	moveq	#0,d5
	lea	(unk_202BB0).l,a3
	move.b	(a3,d6.w),d5

loc_202AE6:
	move.w	d1,(a1)+
	dbf	d5,loc_202AE6
	dbf	d6,loc_202AD0
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	moveq	#5,d6

loc_202AF8:
	move.w	d0,(a1)+
	dbf	d6,loc_202AF8
	move.w	(scroll_bg3_x).w,d0
	neg.w	d0
	moveq	#5,d6

loc_202B06:
	move.w	d0,(a1)+
	dbf	d6,loc_202B06
	move.w	(scroll_bg2_x).w,d0
	neg.w	d0
	moveq	#$D,d6

loc_202B14:
	move.w	d0,(a1)+
	dbf	d6,loc_202B14
	move.w	(scroll_bg_x).w,d0
	move.w	(scroll_fg_x).w,d2
	sub.w	d0,d2
	ext.l	d2
	asl.l	#6,d2
	divs.w	#$18,d2
	ext.l	d2
	moveq	#$A,d1
	asl.l	d1,d2
	moveq	#2,d6
	move.w	(scroll_bg_x).w,d3

loc_202B38:
	move.w	d3,d0
	neg.w	d0
	lea	(unk_202BBC).l,a3
	moveq	#0,d5
	move.b	(a3,d6.w),d5

loc_202B48:
	move.w	d0,(a1)+
	dbf	d5,loc_202B48
	swap	d3
	add.l	d2,d3
	swap	d3
	dbf	d6,loc_202B38
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	moveq	#7,d6

loc_202B60:
	move.w	d0,(a1)+
	dbf	d6,loc_202B60
	lea	(scroll_lines).w,a1
	lea	(bg_scroll_lines+$130).w,a2
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
	bcs.s	loc_202BAC
	cmpi.w	#$1B,d1
	bcs.s	loc_202B90
	moveq	#$1C,d1

loc_202B90:
	sub.w	d1,d5
	lea	(a2,d0.w),a2
	lea	(word_202BC0).l,a3
	lea	(byte_21D7A6).l,a4
	addi.w	#$40,(bg_water_deform).w
	bsr.w	sub_202C14

loc_202BAC:
	bra.w	loc_202BC6

; ------------------------------------------------------------------------------

unk_202BB0:
	dc.b	1
	dc.b	3
	dc.b	3
	dc.b	1
	dc.b	1
	dc.b	3
	dc.b	1
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3

unk_202BBC:
	dc.b	5
	dc.b	1
	dc.b	0
	dc.b	0

word_202BC0:
	dc.w	$18
	dc.w	$7FFF
	dc.w	$7FFF

; ------------------------------------------------------------------------------

loc_202BC6:
	move.w	d5,d1
	lsl.w	#3,d1
	subq.w	#1,d1
	lea	(bg_scroll_lines+$30).w,a2
	move.b	(bg_water_deform).w,d5
	sub.w	(scroll_bg_y).w,d4

loc_202BD8:
	move.l	(a2)+,d2
	swap	d2
	add.w	(scroll_bg_x).w,d2
	neg.w	d2
	move.w	d2,d0
	move.w	#$5C0,d3
	sub.w	(scroll_fg_y).w,d3
	cmp.w	d3,d4
	bcs.s	loc_202C08
	andi.w	#$FF,d5
	move.b	(a4,d5.w),d3
	ext.w	d3
	add.w	d3,d3
	add.w	(scroll_fg_x).w,d3
	neg.w	d3
	swap	d0
	move.w	d3,d0
	swap	d0

loc_202C08:
	move.l	d0,(a1)+
	addq.w	#1,d4
	addq.w	#1,d5
	dbf	d1,loc_202BD8
	rts

; ------------------------------------------------------------------------------

sub_202C14:
	cmp.w	(a3),d4
	bcc.s	loc_202C4A

loc_202C18:
	andi.w	#7,d2
	addq.w	#8,d4
	sub.w	d2,d4
	add.w	d2,d2
	move.w	(a2)+,d0
	jmp	loc_202C34(pc,d2.w)

; ------------------------------------------------------------------------------

loc_202C28:
	tst.w	d1
	bmi.s	locret_202C48
	cmp.w	(a3),d4
	bcc.s	loc_202C64

loc_202C30:
	move.w	(a2)+,d0
	addq.w	#8,d4

loc_202C34:
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	dbf	d1,loc_202C28

locret_202C48:
	rts

; ------------------------------------------------------------------------------

loc_202C4A:
	move.w	(a3)+,d3
	addi.w	#$18,d3
	sub.w	d4,d3
	bgt.s	loc_202C6E
	cmp.w	(a3),d4
	bcs.s	loc_202C18
	move.w	(a3)+,d3
	addi.w	#$18,d3
	sub.w	d4,d3
	ble.s	loc_202C18
	bra.s	loc_202C6E

; ------------------------------------------------------------------------------

loc_202C64:
	move.w	(a3)+,d3
	addi.w	#$18,d3
	sub.w	d4,d3
	ble.s	loc_202C30

loc_202C6E:
	subq.w	#1,d3
	move.w	d3,d6
	moveq	#0,d2
	move.b	(bg_water_deform).w,d2

loc_202C78:
	andi.w	#$FF,d2
	move.b	(a4,d2.w),d0
	ext.w	d0
	add.w	(scroll_bg_x).w,d0
	neg.w	d0
	move.l	d0,(a1)+
	addq.w	#1,d4
	addq.w	#1,d2
	dbf	d3,loc_202C78
	lsr.w	#3,d6

loc_202C94:
	move.w	(a2)+,d0
	subq.w	#1,d1
	dbf	d6,loc_202C94
	bra.s	loc_202C28

; ------------------------------------------------------------------------------

ScrollFgX:
	move.w	(scroll_fg_x).w,d4
	bsr.s	CheckScrollFgX
	move.w	(scroll_fg_x).w,d0
	andi.w	#$10,d0
	move.b	(scroll_cross_x).w,d1
	eor.b	d1,d0
	bne.s	locret_202CD0
	eori.b	#$10,(scroll_cross_x).w
	move.w	(scroll_fg_x).w,d0
	sub.w	d4,d0
	bpl.s	loc_202CCA
	bset	#2,(scroll_flags_fg).w
	rts

; ------------------------------------------------------------------------------

loc_202CCA:
	bset	#3,(scroll_flags_fg).w

locret_202CD0:
	rts

; ------------------------------------------------------------------------------

CheckScrollFgX:
	move.w	8(a6),d0
	sub.w	(scroll_fg_x).w,d0
	sub.w	(scroll_focus_x).w,d0
	beq.s	loc_202CE4
	bcs.s	loc_202D14
	bra.s	loc_202CEA

; ------------------------------------------------------------------------------

loc_202CE4:
	clr.w	(scroll_x_move).w
	rts

; ------------------------------------------------------------------------------

loc_202CEA:
	cmpi.w	#$10,d0
	blt.s	loc_202CF4
	move.w	#$10,d0

loc_202CF4:
	add.w	(scroll_fg_x).w,d0
	cmp.w	(right_bound).w,d0
	blt.s	loc_202D02
	move.w	(right_bound).w,d0

loc_202D02:
	move.w	d0,d1
	sub.w	(scroll_fg_x).w,d1
	asl.w	#8,d1
	move.w	d0,(scroll_fg_x).w
	move.w	d1,(scroll_x_move).w
	rts

; ------------------------------------------------------------------------------

loc_202D14:
	cmpi.w	#$FFF0,d0
	bge.s	loc_202D1E
	move.w	#$FFF0,d0

loc_202D1E:
	add.w	(scroll_fg_x).w,d0
	cmp.w	(left_bound).w,d0
	bgt.s	loc_202D02
	move.w	(left_bound).w,d0
	bra.s	loc_202D02

; ------------------------------------------------------------------------------

ScrollFgXSlow:
	tst.w	d0
	bpl.s	loc_202D38
	move.w	#$FFFE,d0
	bra.s	loc_202D14

; ------------------------------------------------------------------------------

loc_202D38:
	move.w	#2,d0
	bra.s	loc_202CEA

; ------------------------------------------------------------------------------

ScrollFgY:
	moveq	#0,d1
	move.w	$C(a6),d0
	sub.w	(scroll_fg_y).w,d0
	btst	#2,$22(a6)
	beq.s	loc_202D52
	subq.w	#5,d0

loc_202D52:
	btst	#1,$22(a6)
	beq.s	loc_202D72
	addi.w	#$20,d0
	sub.w	(scroll_focus_y).w,d0
	bcs.s	loc_202DBE
	subi.w	#$40,d0
	bcc.s	loc_202DBE
	tst.b	(bottom_bound_shift).w
	bne.s	loc_202DD0
	bra.s	loc_202D7E

; ------------------------------------------------------------------------------

loc_202D72:
	sub.w	(scroll_focus_y).w,d0
	bne.s	loc_202D84
	tst.b	(bottom_bound_shift).w
	bne.s	loc_202DD0

loc_202D7E:
	clr.w	(scroll_y_move).w
	rts

; ------------------------------------------------------------------------------

loc_202D84:
	cmpi.w	#$60,(scroll_focus_y).w
	bne.s	loc_202DAC
	move.w	$14(a6),d1
	bpl.s	loc_202D94
	neg.w	d1

loc_202D94:
	cmpi.w	#$800,d1
	bcc.s	loc_202DBE
	move.w	#$600,d1
	cmpi.w	#6,d0
	bgt.s	loc_202E1E
	cmpi.w	#$FFFA,d0
	blt.s	loc_202DE8
	bra.s	loc_202DD6

; ------------------------------------------------------------------------------

loc_202DAC:
	move.w	#$200,d1
	cmpi.w	#2,d0
	bgt.s	loc_202E1E
	cmpi.w	#$FFFE,d0
	blt.s	loc_202DE8
	bra.s	loc_202DD6

; ------------------------------------------------------------------------------

loc_202DBE:
	move.w	#$1000,d1
	cmpi.w	#$10,d0
	bgt.s	loc_202E1E
	cmpi.w	#$FFF0,d0
	blt.s	loc_202DE8
	bra.s	loc_202DD6

; ------------------------------------------------------------------------------

loc_202DD0:
	moveq	#0,d0
	move.b	d0,(bottom_bound_shift).w

loc_202DD6:
	moveq	#0,d1
	move.w	d0,d1
	add.w	(scroll_fg_y).w,d1
	tst.w	d0
	bpl.w	loc_202E28
	bra.w	loc_202DF4

; ------------------------------------------------------------------------------

loc_202DE8:
	neg.w	d1
	ext.l	d1
	asl.l	#8,d1
	add.l	(scroll_fg_y).w,d1
	swap	d1

loc_202DF4:
	cmp.w	(top_bound).w,d1
	bgt.s	loc_202E4C
	cmpi.w	#$FF00,d1
	bgt.s	loc_202E18
	andi.w	#$7FF,d1
	andi.w	#$7FF,$C(a6)
	andi.w	#$7FF,(scroll_fg_y).w
	andi.w	#$3FF,(scroll_bg_y).w
	bra.s	loc_202E4C

; ------------------------------------------------------------------------------

loc_202E18:
	move.w	(top_bound).w,d1
	bra.s	loc_202E4C

; ------------------------------------------------------------------------------

loc_202E1E:
	ext.l	d1
	asl.l	#8,d1
	add.l	(scroll_fg_y).w,d1
	swap	d1

loc_202E28:
	cmp.w	(bottom_bound).w,d1
	blt.s	loc_202E4C
	subi.w	#$800,d1
	bcs.s	loc_202E48
	andi.w	#$7FF,$C(a6)
	subi.w	#$800,(scroll_fg_y).w
	andi.w	#$3FF,(scroll_bg_y).w
	bra.s	loc_202E4C

; ------------------------------------------------------------------------------

loc_202E48:
	move.w	(bottom_bound).w,d1

loc_202E4C:
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
	bne.s	locret_202E8E
	eori.b	#$10,(scroll_cross_y).w
	move.w	(scroll_fg_y).w,d0
	sub.w	d4,d0
	bpl.s	loc_202E88
	bset	#0,(scroll_flags_fg).w
	rts

; ------------------------------------------------------------------------------

loc_202E88:
	bset	#1,(scroll_flags_fg).w

locret_202E8E:
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
	bne.s	loc_202EC4
	eori.b	#$10,(scroll_cross_bg_x).w
	sub.l	d2,d0
	bpl.s	loc_202EBE
	bset	#2,(scroll_flags_bg).w
	bra.s	loc_202EC4

; ------------------------------------------------------------------------------

loc_202EBE:
	bset	#3,(scroll_flags_bg).w

loc_202EC4:
	move.l	(scroll_bg_y).w,d3
	move.l	d3,d0
	add.l	d5,d0
	move.l	d0,(scroll_bg_y).w
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_y).w,d2
	eor.b	d2,d1
	bne.s	locret_202EF8
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.l	d3,d0
	bpl.s	loc_202EF2
	bset	#0,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_202EF2:
	bset	#1,(scroll_flags_bg).w

locret_202EF8:
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
	bne.s	locret_202F2E
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.l	d3,d0
	bpl.s	loc_202F28
	bset	#4,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_202F28:
	bset	#5,(scroll_flags_bg).w

locret_202F2E:
	rts

; ------------------------------------------------------------------------------

ScrollBgY:
	move.w	(scroll_bg_y).w,d3
	move.w	d0,(scroll_bg_y).w
	move.w	d0,d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_y).w,d2
	eor.b	d2,d1
	bne.s	locret_202F5E
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.w	d3,d0
	bpl.s	loc_202F58
	bset	#0,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_202F58:
	bset	#1,(scroll_flags_bg).w

locret_202F5E:
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
	bne.s	locret_202F92
	eori.b	#$10,(scroll_cross_bg_x).w
	sub.l	d2,d0
	bpl.s	loc_202F8C
	bset	d6,(scroll_flags_bg).w
	bra.s	locret_202F92

; ------------------------------------------------------------------------------

loc_202F8C:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg).w

locret_202F92:
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
	bne.s	locret_202FC6
	eori.b	#$10,(scroll_cross_bg2_x).w
	sub.l	d2,d0
	bpl.s	loc_202FC0
	bset	d6,(scroll_flags_bg2).w
	bra.s	locret_202FC6

; ------------------------------------------------------------------------------

loc_202FC0:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg2).w

locret_202FC6:
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
	bne.s	locret_202FFA
	eori.b	#$10,(scroll_cross_bg3_x).w
	sub.l	d2,d0
	bpl.s	loc_202FF4
	bset	d6,(scroll_flags_bg3).w
	bra.s	locret_202FFA

; ------------------------------------------------------------------------------

loc_202FF4:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg3).w

locret_202FFA:
	rts

; ------------------------------------------------------------------------------