; ------------------------------------------------------------------------------

GetPlayerObject:
	lea	(player_object).w,a6
	tst.b	(use_player_2).l
	beq.s	locret_202994
	lea	(player_object_2).w,a6

locret_202994:
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
	lea	(unk_2029F2).l,a0
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
	bra.w	loc_202A1E

; ------------------------------------------------------------------------------

unk_2029F2:
	dc.w	4, 0, $1E97, 0, $710, $60

unk_2029FE:
	dc.w	$50, $3B0
	dc.w	$EA0, $46C
	dc.w	$1750, $BD
	dc.w	$A00, $62C
	dc.w	$BB0, $4C
	dc.w	$1570, $16C
	dc.w	$1B0, $72C
	dc.w	$1400, $2AC

; ------------------------------------------------------------------------------

loc_202A1E:
	tst.b	(spawn_mode).l
	beq.s	loc_202A3E
	jsr	LoadCheckpoint
	moveq	#0,d0
	moveq	#0,d1
	move.w	8(a6),d1
	move.w	$C(a6),d0
	bpl.s	loc_202A3C
	moveq	#0,d0

loc_202A3C:
	bra.s	loc_202A7A

; ------------------------------------------------------------------------------

loc_202A3E:
	lea	(StagePlayerSpawn).l,a1
	tst.w	(stage_demo).l
	bpl.s	loc_202A60
	move.w	(s1_credits_index).l,d0
	subq.w	#1,d0
	lsl.w	#2,d0
	lea	(unk_2029FE).l,a1
	adda.w	d0,a1
	bra.s	loc_202A6A

; ------------------------------------------------------------------------------

loc_202A60:
	move.w	(stage_demo).l,d0
	lsl.w	#2,d0
	adda.w	d0,a1

loc_202A6A:
	moveq	#0,d1
	move.w	(a1)+,d1
	move.w	d1,8(a6)
	moveq	#0,d0
	move.w	(a1),d0
	move.w	d0,$C(a6)

loc_202A7A:
	subi.w	#$A0,d1
	bcc.s	loc_202A82
	moveq	#0,d1

loc_202A82:
	move.w	(right_bound).w,d2
	cmp.w	d2,d1
	bcs.s	loc_202A8C
	move.w	d2,d1

loc_202A8C:
	move.w	d1,(scroll_fg_x).w
	subi.w	#$60,d0
	bcc.s	loc_202A98
	moveq	#0,d0

loc_202A98:
	cmp.w	(bottom_bound).w,d0
	blt.s	loc_202AA2
	move.w	(bottom_bound).w,d0

loc_202AA2:
	move.w	d0,(scroll_fg_y).w
	bsr.w	sub_202ABE
	lea	(unk_202ABA).l,a1
	move.l	(a1),(loop_chunk_1).w
	rts

; ------------------------------------------------------------------------------

StagePlayerSpawn:
	dc.w	$30, $6A0

unk_202ABA:
	dc.b	$7F, $7F, $7F, $7F

; ------------------------------------------------------------------------------

sub_202ABE:
	swap	d0
	lsr.l	#2,d0
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
	beq.s	loc_202AF6
	rts

; ------------------------------------------------------------------------------

loc_202AF6:
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
	move.w	(scroll_fg_y).w,d0
	lsr.w	#2,d0
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
	bsr.w	sub_202BF2
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	moveq	#$F,d6

loc_202B9A:
	move.w	d0,(a1)+
	dbf	d6,loc_202B9A
	move.w	(scroll_bg2_x).w,d0
	neg.w	d0
	moveq	#$1B,d6

loc_202BA8:
	move.w	d0,(a1)+
	dbf	d6,loc_202BA8
	bsr.w	sub_202BF2
	move.w	(scroll_bg_x).w,d0
	neg.w	d0
	moveq	#$B,d6

loc_202BBA:
	move.w	d0,(a1)+
	dbf	d6,loc_202BBA
	move.w	(scroll_bg2_x).w,d0
	neg.w	d0
	moveq	#$B,d6

loc_202BC8:
	move.w	d0,(a1)+
	dbf	d6,loc_202BC8
	lea	(scroll_lines).w,a1
	lea	(bg_scroll_lines).w,a2
	move.w	(scroll_bg_y).w,d0
	move.w	d0,d2
	andi.w	#$3F8,d0
	lsr.w	#2,d0
	moveq	#$1C,d1
	lea	(a2,d0.w),a2
	bra.w	loc_202C36

; ------------------------------------------------------------------------------

byte_202BEC:
	dc.b	3
	dc.b	4
	dc.b	2
	dc.b	0
	dc.b	0
	dc.b	0

; ------------------------------------------------------------------------------

sub_202BF2:
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
	move.w	(scroll_bg3_x).w,d3
	moveq	#4,d6
	adda.w	#$1C,a1

loc_202C16:
	move.w	d3,d0
	neg.w	d0
	moveq	#0,d5
	move.b	byte_202BEC(pc,d6.w),d5

loc_202C20:
	move.w	d0,-(a1)
	dbf	d5,loc_202C20
	swap	d3
	add.l	d2,d3
	swap	d3
	dbf	d6,loc_202C16
	adda.w	#$1C,a1
	rts

; ------------------------------------------------------------------------------

loc_202C36:
	andi.w	#7,d2
	add.w	d2,d2
	move.w	(a2)+,d0
	jmp	loc_202C44(pc,d2.w)

; ------------------------------------------------------------------------------

loc_202C42:
	move.w	(a2)+,d0

loc_202C44:
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	dbf	d1,loc_202C42
	rts

; ------------------------------------------------------------------------------

	neg.w	d0
	jmp	loc_202C62(pc,d2.w)

; ------------------------------------------------------------------------------

	neg.w	d0

loc_202C62:
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	dbf	d1,loc_202C42
	rts

; ------------------------------------------------------------------------------

ScrollFgX:
	move.w	(scroll_fg_x).w,d4
	bsr.s	CheckScrollFgX
	move.w	(scroll_fg_x).w,d0
	andi.w	#$10,d0
	move.b	(scroll_cross_x).w,d1
	eor.b	d1,d0
	bne.s	locret_202CAA
	eori.b	#$10,(scroll_cross_x).w
	move.w	(scroll_fg_x).w,d0
	sub.w	d4,d0
	bpl.s	loc_202CA4
	bset	#2,(scroll_flags_fg).w
	rts

; ------------------------------------------------------------------------------

loc_202CA4:
	bset	#3,(scroll_flags_fg).w

locret_202CAA:
	rts

; ------------------------------------------------------------------------------

CheckScrollFgX:
	move.w	8(a6),d0
	sub.w	(scroll_fg_x).w,d0
	sub.w	(scroll_focus_x).w,d0
	beq.s	loc_202CBE
	bcs.s	loc_202CEE
	bra.s	loc_202CC4

; ------------------------------------------------------------------------------

loc_202CBE:
	clr.w	(scroll_x_move).w
	rts

; ------------------------------------------------------------------------------

loc_202CC4:
	cmpi.w	#$10,d0
	blt.s	loc_202CCE
	move.w	#$10,d0

loc_202CCE:
	add.w	(scroll_fg_x).w,d0
	cmp.w	(right_bound).w,d0
	blt.s	loc_202CDC
	move.w	(right_bound).w,d0

loc_202CDC:
	move.w	d0,d1
	sub.w	(scroll_fg_x).w,d1
	asl.w	#8,d1
	move.w	d0,(scroll_fg_x).w
	move.w	d1,(scroll_x_move).w
	rts

; ------------------------------------------------------------------------------

loc_202CEE:
	cmpi.w	#$FFF0,d0
	bge.s	loc_202CF8
	move.w	#$FFF0,d0

loc_202CF8:
	add.w	(scroll_fg_x).w,d0
	cmp.w	(left_bound).w,d0
	bgt.s	loc_202CDC
	move.w	(left_bound).w,d0
	bra.s	loc_202CDC

; ------------------------------------------------------------------------------

ScrollFgXSlow:
	tst.w	d0
	bpl.s	loc_202D12
	move.w	#$FFFE,d0
	bra.s	loc_202CEE

; ------------------------------------------------------------------------------

loc_202D12:
	move.w	#2,d0
	bra.s	loc_202CC4

; ------------------------------------------------------------------------------

ScrollFgY:
	moveq	#0,d1
	move.w	$C(a6),d0
	sub.w	(scroll_fg_y).w,d0
	btst	#2,$22(a6)
	beq.s	loc_202D2C
	subq.w	#5,d0

loc_202D2C:
	btst	#1,$22(a6)
	beq.s	loc_202D4C
	addi.w	#$20,d0
	sub.w	(scroll_focus_y).w,d0
	bcs.s	loc_202D98
	subi.w	#$40,d0
	bcc.s	loc_202D98
	tst.b	(bottom_bound_shift).w
	bne.s	loc_202DAA
	bra.s	loc_202D58

; ------------------------------------------------------------------------------

loc_202D4C:
	sub.w	(scroll_focus_y).w,d0
	bne.s	loc_202D5E
	tst.b	(bottom_bound_shift).w
	bne.s	loc_202DAA

loc_202D58:
	clr.w	(scroll_y_move).w
	rts

; ------------------------------------------------------------------------------

loc_202D5E:
	cmpi.w	#$60,(scroll_focus_y).w
	bne.s	loc_202D86
	move.w	$14(a6),d1
	bpl.s	loc_202D6E
	neg.w	d1

loc_202D6E:
	cmpi.w	#$800,d1
	bcc.s	loc_202D98
	move.w	#$600,d1
	cmpi.w	#6,d0
	bgt.s	loc_202DF8
	cmpi.w	#$FFFA,d0
	blt.s	loc_202DC2
	bra.s	loc_202DB0

; ------------------------------------------------------------------------------

loc_202D86:
	move.w	#$200,d1
	cmpi.w	#2,d0
	bgt.s	loc_202DF8
	cmpi.w	#$FFFE,d0
	blt.s	loc_202DC2
	bra.s	loc_202DB0

; ------------------------------------------------------------------------------

loc_202D98:
	move.w	#$1000,d1
	cmpi.w	#$10,d0
	bgt.s	loc_202DF8
	cmpi.w	#$FFF0,d0
	blt.s	loc_202DC2
	bra.s	loc_202DB0

; ------------------------------------------------------------------------------

loc_202DAA:
	moveq	#0,d0
	move.b	d0,(bottom_bound_shift).w

loc_202DB0:
	moveq	#0,d1
	move.w	d0,d1
	add.w	(scroll_fg_y).w,d1
	tst.w	d0
	bpl.w	loc_202E02
	bra.w	loc_202DCE

; ------------------------------------------------------------------------------

loc_202DC2:
	neg.w	d1
	ext.l	d1
	asl.l	#8,d1
	add.l	(scroll_fg_y).w,d1
	swap	d1

loc_202DCE:
	cmp.w	(top_bound).w,d1
	bgt.s	loc_202E26
	cmpi.w	#$FF00,d1
	bgt.s	loc_202DF2
	andi.w	#$7FF,d1
	andi.w	#$7FF,$C(a6)
	andi.w	#$7FF,(scroll_fg_y).w
	andi.w	#$3FF,(scroll_bg_y).w
	bra.s	loc_202E26

; ------------------------------------------------------------------------------

loc_202DF2:
	move.w	(top_bound).w,d1
	bra.s	loc_202E26

; ------------------------------------------------------------------------------

loc_202DF8:
	ext.l	d1
	asl.l	#8,d1
	add.l	(scroll_fg_y).w,d1
	swap	d1

loc_202E02:
	cmp.w	(bottom_bound).w,d1
	blt.s	loc_202E26
	subi.w	#$800,d1
	bcs.s	loc_202E22
	andi.w	#$7FF,$C(a6)
	subi.w	#$800,(scroll_fg_y).w
	andi.w	#$3FF,(scroll_bg_y).w
	bra.s	loc_202E26

; ------------------------------------------------------------------------------

loc_202E22:
	move.w	(bottom_bound).w,d1

loc_202E26:
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
	bne.s	locret_202E68
	eori.b	#$10,(scroll_cross_y).w
	move.w	(scroll_fg_y).w,d0
	sub.w	d4,d0
	bpl.s	loc_202E62
	bset	#0,(scroll_flags_fg).w
	rts

; ------------------------------------------------------------------------------

loc_202E62:
	bset	#1,(scroll_flags_fg).w

locret_202E68:
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
	bne.s	loc_202E9E
	eori.b	#$10,(scroll_cross_bg_x).w
	sub.l	d2,d0
	bpl.s	loc_202E98
	bset	#2,(scroll_flags_bg).w
	bra.s	loc_202E9E

; ------------------------------------------------------------------------------

loc_202E98:
	bset	#3,(scroll_flags_bg).w

loc_202E9E:
	move.l	(scroll_bg_y).w,d3
	move.l	d3,d0
	add.l	d5,d0
	move.l	d0,(scroll_bg_y).w
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_y).w,d2
	eor.b	d2,d1
	bne.s	locret_202ED2
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.l	d3,d0
	bpl.s	loc_202ECC
	bset	#0,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_202ECC:
	bset	#1,(scroll_flags_bg).w

locret_202ED2:
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
	bne.s	locret_202F08
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.l	d3,d0
	bpl.s	loc_202F02
	bset	#4,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_202F02:
	bset	#5,(scroll_flags_bg).w

locret_202F08:
	rts

; ------------------------------------------------------------------------------

ScrollBgY:
	move.w	(scroll_bg_y).w,d3
	move.w	d0,(scroll_bg_y).w
	move.w	d0,d1
	andi.w	#$10,d1
	move.b	(scroll_cross_bg_y).w,d2
	eor.b	d2,d1
	bne.s	locret_202F38
	eori.b	#$10,(scroll_cross_bg_y).w
	sub.w	d3,d0
	bpl.s	loc_202F32
	bset	#0,(scroll_flags_bg).w
	rts

; ------------------------------------------------------------------------------

loc_202F32:
	bset	#1,(scroll_flags_bg).w

locret_202F38:
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
	bne.s	locret_202F6C
	eori.b	#$10,(scroll_cross_bg_x).w
	sub.l	d2,d0
	bpl.s	loc_202F66
	bset	d6,(scroll_flags_bg).w
	bra.s	locret_202F6C

; ------------------------------------------------------------------------------

loc_202F66:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg).w

locret_202F6C:
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
	bne.s	locret_202FA0
	eori.b	#$10,(scroll_cross_bg2_x).w
	sub.l	d2,d0
	bpl.s	loc_202F9A
	bset	d6,(scroll_flags_bg2).w
	bra.s	locret_202FA0

; ------------------------------------------------------------------------------

loc_202F9A:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg2).w

locret_202FA0:
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
	bne.s	locret_202FD4
	eori.b	#$10,(scroll_cross_bg3_x).w
	sub.l	d2,d0
	bpl.s	loc_202FCE
	bset	d6,(scroll_flags_bg3).w
	bra.s	locret_202FD4

; ------------------------------------------------------------------------------

loc_202FCE:
	addq.b	#1,d6
	bset	d6,(scroll_flags_bg3).w

locret_202FD4:
	rts

; ------------------------------------------------------------------------------