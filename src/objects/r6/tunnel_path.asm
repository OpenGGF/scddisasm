; ------------------------------------------------------------------------------

TunnelPathObject:
	btst	#7,time_zone
	beq.s	loc_20906A
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_20906A
	lea	object_states,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	bclr	#7,d1
	move.b	warp_direction,d2
	ext.w	d2
	neg.w	d2
	add.w	d2,d1
	bpl.s	loc_20905A
	moveq	#0,d1
	bra.s	loc_209062

; ------------------------------------------------------------------------------

loc_20905A:
	cmpi.w	#3,d1
	bcs.s	loc_209062
	moveq	#2,d1

loc_209062:
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)

loc_20906A:
	lea	player_object,a6
	cmpi.b	#$2B,obj.anim_id(a6)
	beq.s	locret_20909A
	cmpi.b	#6,obj.routine(a6)
	bcc.s	locret_20909A
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20909C(pc,d0.w),d1
	jsr	off_20909C(pc,d1.w)
	cmpi.b	#4,obj.routine(a0)
	bcc.s	locret_20909A
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

locret_20909A:
	rts

; ------------------------------------------------------------------------------

off_20909C:
	dc.w	TunnelPathObject_0_Routine0-*
	dc.w	TunnelPathObject_0_Routine2-off_20909C
	dc.w	TunnelPathObject_0_Routine4-off_20909C
	dc.w	TunnelPathObject_0_Routine6-off_20909C

; ------------------------------------------------------------------------------

TunnelPathObject_0_Routine0:
	move.l	#PowerupSprites,obj.sprite_data(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.w	#$541,obj.sprite_tile(a0)
	addq.b	#2,obj.routine(a0)
	move.b	obj.subtype(a0),d0
	andi.b	#$7F,d0
	add.w	d0,d0
	andi.w	#$FE,d0
	lea	TunnelPaths(pc),a2
	adda.w	(a2,d0.w),a2
	move.w	(a2)+,obj.var_3a(a0)
	move.l	a2,obj.var_3c(a0)
	move.w	(a2)+,obj.var_36(a0)
	move.w	(a2)+,obj.var_38(a0)

TunnelPathObject_0_Routine2:
	cmpi.b	#6,obj.routine(a6)
	bcc.w	locret_2091B2
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	addi.w	#$20,d0
	cmpi.w	#$40,d0
	bcc.w	locret_2091B2
	move.w	obj.y(a6),d1
	sub.w	obj.y(a0),d1
	addi.w	#$30,d1
	cmpi.w	#$60,d1
	bcc.w	locret_2091B2
	tst.b	obj.var_2c(a6)
	bne.w	locret_2091B2
	cmpi.b	#4,obj.routine(a6)
	bne.s	loc2_20913A
	subq.b	#2,obj.routine(a6)
	move.w	#$78,obj.var_30(a6)

loc2_20913A:
	addq.b	#2,obj.routine(a0)
	move.b	#$81,obj.var_2c(a6)
	tst.b	obj.subtype_2(a0)
	beq.s	loc_209150
	bset	#6,obj.var_2c(a6)

loc_209150:
	move.b	#2,obj.anim_id(a6)
	move.w	#$800,obj.ground_speed(a6)
	bclr	#6,obj.sprite_flags(a6)
	tst.b	obj.subtype(a0)
	bpl.s	loc_20916E
	bset	#6,obj.sprite_flags(a6)

loc_20916E:
	cmpi.b	#4,obj.routine(a6)
	bne.s	loc_20917A
	subq.b	#2,obj.routine(a6)

loc_20917A:
	move.w	#0,obj.x_speed(a6)
	move.w	#0,obj.y_speed(a6)
	bclr	#5,obj.flags(a0)
	bclr	#5,obj.flags(a6)
	bset	#1,obj.flags(a6)
	move.w	obj.x(a0),obj.x(a6)
	move.w	obj.y(a0),obj.y(a6)
	clr.b	obj.var_32(a0)
	move.w	#$91,d0
	jsr	PlayFmSound

locret_2091B2:
	rts

; ------------------------------------------------------------------------------

TunnelPathObject_0_Routine4:
	move.b	#2,obj.anim_id(a6)
	bsr.w	sub_20928A
	addq.b	#2,obj.routine(a0)
	move.w	#$91,d0
	jsr	PlayFmSound
	rts

; ------------------------------------------------------------------------------

TunnelPathObject_0_Routine6:
	move.b	#2,obj.anim_id(a6)
	addq.l	#4,sp
	subq.b	#1,obj.var_2e(a0)
	bpl.s	loc_20921E
	move.w	obj.var_36(a0),d0
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a6)
	move.w	obj.var_38(a0),d0
	add.w	obj.y(a0),d0
	move.w	d0,obj.y(a6)
	moveq	#0,d1
	move.b	obj.var_3a(a0),d1
	addq.b	#6,d1
	cmp.b	obj.var_3b(a0),d1
	bcs.s	loc_209206
	moveq	#0,d1
	bra.s	loc_209274

; ------------------------------------------------------------------------------

loc_209206:
	move.b	d1,obj.var_3a(a0)

loc_20920A:
	movea.l	obj.var_3c(a0),a2
	move.w	(a2,d1.w),obj.var_36(a0)
	move.w	2(a2,d1.w),obj.var_38(a0)
	bra.w	sub_20928A

; ------------------------------------------------------------------------------

loc_20921E:
	move.l	obj.x(a6),d2
	move.l	obj.y(a6),d3
	move.w	obj.x_speed(a6),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d2
	move.w	obj.y_speed(a6),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d3
	move.l	d2,obj.x(a6)
	move.l	d3,obj.y(a6)
	moveq	#0,d1
	move.b	obj.var_3a(a0),d1
	movea.l	obj.var_3c(a0),a2
	move.w	4(a2,d1.w),d1
	bmi.s	loc_209254

locret_209252:
	rts

; ------------------------------------------------------------------------------

loc_209254:
	move.b	p1_joy_hold,d0
	andi.b	#$70,d0
	beq.s	locret_209252
	andi.w	#$7FFF,d1
	add.b	d1,d1
	move.b	d1,d0
	add.b	d0,d0
	add.b	d0,d1
	add.b	obj.var_3b(a0),d1
	move.b	d1,obj.var_3a(a0)
	bra.s	loc_20920A

; ------------------------------------------------------------------------------

loc_209274:
	andi.w	#$7FF,obj.y(a6)
	clr.b	obj.routine(a0)
	clr.b	obj.var_2c(a6)
	move.w	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

sub_20928A:
	moveq	#0,d0
	move.w	obj.ground_speed(a6),d2
	move.w	obj.ground_speed(a6),d3
	move.w	obj.var_36(a0),d0
	add.w	obj.x(a0),d0
	sub.w	obj.x(a6),d0
	bge.s	loc_2092A6
	neg.w	d0
	neg.w	d2

loc_2092A6:
	moveq	#0,d1
	move.w	obj.var_38(a0),d1
	add.w	obj.y(a0),d1
	sub.w	obj.y(a6),d1
	bge.s	loc_2092BA
	neg.w	d1
	neg.w	d3

loc_2092BA:
	cmp.w	d0,d1
	bcs.s	loc_2092F8
	moveq	#0,d1
	move.w	obj.var_38(a0),d1
	add.w	obj.y(a0),d1
	sub.w	obj.y(a6),d1
	swap	d1
	divs.w	d3,d1
	moveq	#0,d0
	move.w	obj.var_36(a0),d0
	add.w	obj.x(a0),d0
	sub.w	obj.x(a6),d0
	beq.s	loc_2092E4
	swap	d0
	divs.w	d1,d0

loc_2092E4:
	move.w	d0,obj.x_speed(a6)
	move.w	d3,obj.y_speed(a6)
	tst.w	d1
	bpl.s	loc_2092F2
	neg.w	d1

loc_2092F2:
	move.w	d1,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

loc_2092F8:
	moveq	#0,d0
	move.w	obj.var_36(a0),d0
	add.w	obj.x(a0),d0
	sub.w	obj.x(a6),d0
	swap	d0
	divs.w	d2,d0
	moveq	#0,d1
	move.w	obj.var_38(a0),d1
	add.w	obj.y(a0),d1
	sub.w	obj.y(a6),d1
	beq.s	loc_20931E
	swap	d1
	divs.w	d0,d1

loc_20931E:
	move.w	d1,obj.y_speed(a6)
	move.w	d2,obj.x_speed(a6)
	tst.w	d0
	bpl.s	loc_20932C
	neg.w	d0

loc_20932C:
	move.w	d0,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

TunnelPaths:
	dc.w	@TunnelPath_0-*
	dc.w	@TunnelPath_2-TunnelPaths
	dc.w	@TunnelPath_4-TunnelPaths
	dc.w	@TunnelPath_6-TunnelPaths
	dc.w	@TunnelPath_8-TunnelPaths
	dc.w	@TunnelPath_A-TunnelPaths
	dc.w	@TunnelPath_C-TunnelPaths
	dc.w	@TunnelPath_E-TunnelPaths
	dc.w	@TunnelPath_10-TunnelPaths
	dc.w	@TunnelPath_12-TunnelPaths
	dc.w	@TunnelPath_14-TunnelPaths
	dc.w	@TunnelPath_16-TunnelPaths
	dc.w	@TunnelPath_18-TunnelPaths
	dc.w	@TunnelPath_1A-TunnelPaths
	dc.w	@TunnelPath_1C-TunnelPaths
	dc.w	@TunnelPath_1E-TunnelPaths
	dc.w	@TunnelPath_20-TunnelPaths
	dc.w	@TunnelPath_22-TunnelPaths
	dc.w	@TunnelPath_24-TunnelPaths

@TunnelPath_0:
	dc.w	$4E
	dc.w	0, 0, 0
	dc.w	8, $20, 0
	dc.w	0, $48, 0
	dc.w	-$18, $60, 0
	dc.w	-$48, $70, 0
	dc.w	-$78, $60, 0
	dc.w	-$90, $48, 0
	dc.w	-$98, $20, 0
	dc.w	-$90, 0, 0
	dc.w	-$78, -$20, -$7FFF
	dc.w	-$48, -$30, 0
	dc.w	-$18, -$20, -$8000
	dc.w	0, 0, -$8000
	dc.w	$50, -$20, 0
	dc.w	-$78, -$68, 0

@TunnelPath_2:
	dc.w	$18
	dc.w	0, 0, 0
	dc.w	$30, -$10, 0
	dc.w	$60, 0, -$8000
	dc.w	$78, $20, -$8000
	dc.w	$C8, 0, 0

@TunnelPath_4:
	dc.w	$96
	dc.w	0, 0, 0
	dc.w	8, $20, 0
	dc.w	0, $40, 0
	dc.w	-$18, $60, 0
	dc.w	-$48, $70, 0
	dc.w	-$78, $80, 0
	dc.w	-$90, $A0, 0
	dc.w	-$98, $C0, 0
	dc.w	-$90, $E0, -$7FFE
	dc.w	-$78, $100, -$7FFE
	dc.w	-$48, $110, 0
	dc.w	-$18, $100, 0
	dc.w	0, $E0, 0
	dc.w	8, $C0, 0
	dc.w	0, $A0, 0
	dc.w	-$18, $80, 0
	dc.w	-$48, $70, 0
	dc.w	-$78, $60, 0
	dc.w	-$90, $40, 0
	dc.w	-$98, $20, 0
	dc.w	-$90, 0, -$7FFF
	dc.w	-$78, -$20, -$7FFF
	dc.w	-$48, -$30, 0
	dc.w	-$18, -$20, -$8000
	dc.w	0, 0, -$8000
	dc.w	$40, -$20, 0
	dc.w	-$D8, -$20, 0
	dc.w	-$B8, $F0, 0

@TunnelPath_6:
	dc.w	$1E
	dc.w	0, 0, -$7FFF
	dc.w	$18, -$20, -$7FFF
	dc.w	$48, -$30, 0
	dc.w	$78, -$20, -$8000
	dc.w	$90, 0, -$8000
	dc.w	$D0, -$20, 0
	dc.w	-$48, -$20, 0

@TunnelPath_8:
	dc.w	$4E
	dc.w	0, 0, -$7FFE
	dc.w	$18, $20, -$7FFE
	dc.w	$48, $30, 0
	dc.w	$78, $20, 0
	dc.w	$90, 0, 0
	dc.w	$98, -$20, 0
	dc.w	$90, -$40, 0
	dc.w	$78, -$60, 0
	dc.w	$48, -$70, 0
	dc.w	$18, -$80, 0
	dc.w	0, -$A0, 0
	dc.w	-8, -$C0, 0
	dc.w	0, -$E0, -$7FFF
	dc.w	$D0, -$100, 0
	dc.w	-$48, -$100, 0
	dc.w	-$28, $10, 0

@TunnelPath_A:
	dc.w	$3C
	dc.w	0, 0, 0
	dc.w	0, $150, 0
	dc.w	-$68, $150, 0
	dc.w	-$68, $200, 0
	dc.w	-8, $200, 0
	dc.w	-$38, $200, 0
	dc.w	-$38, $328, 0
	dc.w	$218, $328, 0
	dc.w	$218, $370, 0
	dc.w	$3C0, $370, 0

@TunnelPath_C:
	dc.w	$C
	dc.w	0, 0, 0
	dc.w	$38, 0, 0

@TunnelPath_E:
	dc.w	$12
	dc.w	0, 0, 0
	dc.w	0, $2A8, 0
	dc.w	$50, $2A8, 0

@TunnelPath_10:
	dc.w	$18
	dc.w	0, 0, 0
	dc.w	8, 0, 0
	dc.w	8, -$100, 0
	dc.w	$38, -$100, 0

@TunnelPath_12:
	dc.w	$18
	dc.w	0, 0, 0
	dc.w	8, 0, 0
	dc.w	8, $100, 0
	dc.w	$38, $100, 0

@TunnelPath_14:
	dc.w	$18
	dc.w	0, 0, 0
	dc.w	8, 0, 0
	dc.w	8, -$100, 0
	dc.w	$38, -$100, 0

@TunnelPath_16:
	dc.w	$C
	dc.w	0, 0, 0
	dc.w	$60, 0, 0

@TunnelPath_18:
	dc.w	$18
	dc.w	0, 0, 0
	dc.w	$1B0, 0, 0
	dc.w	$1B0, $100, 0
	dc.w	$3E0, $100, 0

@TunnelPath_1A:
	dc.w	$1E
	dc.w	0, 0, 0
	dc.w	0, $2A8, 0
	dc.w	$3C0, $2A8, 0
	dc.w	$3C0, $1A8, 0
	dc.w	$190, $1A8, 0

@TunnelPath_1C:
	dc.w	$C
	dc.w	0, 0, 0
	dc.w	$160, 0, 0

@TunnelPath_1E:
	dc.w	$4E
	dc.w	0, 0, 0
	dc.w	0, $2B8, 0
	dc.w	-$78, $2B8, 0
	dc.w	-$78, $368, 0
	dc.w	-$18, $368, 0
	dc.w	-$48, $3B8, 0
	dc.w	-$A8, $3B8, 0
	dc.w	-$48, $3B8, 0
	dc.w	-$48, $3F8, 0
	dc.w	$18, $3F8, 0
	dc.w	$18, $458, 0
	dc.w	-$38, $458, 0
	dc.w	-$38, $4E0, 0

@TunnelPath_20:
	dc.w	$2A
	dc.w	0, 0, 0
	dc.w	0, $2A8, 0
	dc.w	-$78, $2A8, 0
	dc.w	-$78, $358, 0
	dc.w	-$18, $358, 0
	dc.w	-$48, $358, 0
	dc.w	-$48, $4D0, 0

@TunnelPath_22:
	dc.w	$30
	dc.w	0, 0, 0
	dc.w	0, $208, 0
	dc.w	-$78, $208, 0
	dc.w	-$78, $2B8, 0
	dc.w	-$18, $2B8, 0
	dc.w	-$38, $2B8, 0
	dc.w	-$38, $318, 0
	dc.w	$250, $318, 0

@TunnelPath_24:
	dc.w	$C
	dc.w	0, 0, 0
	dc.w	$128, 0, 0

; ------------------------------------------------------------------------------
