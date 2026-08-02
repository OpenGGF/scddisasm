; ------------------------------------------------------------------------------

TunnelPathObject:
	btst	#7,(time_zone).l
	beq.s	loc_208A44
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_208A44
	lea	(object_states).l,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	(time_zone).l,d1
	bclr	#7,d1
	move.b	(warp_direction).w,d2
	ext.w	d2
	neg.w	d2
	add.w	d2,d1
	bpl.s	loc_208A34
	moveq	#0,d1
	bra.s	loc_208A3C

; ------------------------------------------------------------------------------

loc_208A34:
	cmpi.w	#3,d1
	bcs.s	loc_208A3C
	moveq	#2,d1

loc_208A3C:
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)

loc_208A44:
	tst.b	obj.subtype(a0)
	bpl.s	loc_208A66
	beq.s	loc_208A66
	tst.b	(r5_conveyor_reverse).l
	bne.s	loc_208A5E
	btst	#0,obj.subtype(a0)
	beq.s	loc_208A66
	bra.s	loc_208A90

; ------------------------------------------------------------------------------

loc_208A5E:
	btst	#0,obj.subtype(a0)
	beq.s	loc_208A90

loc_208A66:
	lea	(player_object).w,a6
	cmpi.b	#$2B,obj.anim_id(a6)
	beq.s	locret_208A96
	cmpi.b	#6,obj.routine(a6)
	bcc.s	locret_208A96
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_208A98(pc,d0.w),d1
	jsr	off_208A98(pc,d1.w)
	cmpi.b	#4,obj.routine(a0)
	bcc.s	locret_208A96

loc_208A90:
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

locret_208A96:
	rts

; ------------------------------------------------------------------------------

off_208A98:
	dc.w	TunnelPathObject_0_Routine0-*
	dc.w	TunnelPathObject_0_Routine2-off_208A98
	dc.w	TunnelPathObject_0_Routine4-off_208A98
	dc.w	TunnelPathObject_0_Routine6-off_208A98

; ------------------------------------------------------------------------------

TunnelPathObject_0_Routine0:
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	addq.b	#2,obj.routine(a0)
	move.b	obj.subtype(a0),d0
	add.w	d0,d0
	andi.w	#$FE,d0
	lea	TunnelPaths(pc),a2
	adda.w	(a2,d0.w),a2
	move.w	(a2)+,obj.var_3a(a0)
	move.l	a2,obj.var_3c(a0)
	move.w	(a2)+,obj.var_36(a0)
	move.w	(a2)+,obj.var_38(a0)

TunnelPathObject_0_Routine2:
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	addi.w	#$10,d0
	cmpi.w	#$20,d0
	bcc.s	locret_208B66
	move.w	obj.y(a6),d1
	sub.w	obj.y(a0),d1
	addi.w	#$10,d1
	cmpi.w	#$20,d1
	bcc.w	locret_208B66
	tst.b	obj.var_2c(a6)
	bne.w	locret_208B66
	cmpi.b	#4,obj.routine(a6)
	bne.s	loc_208B18
	subq.b	#2,obj.routine(a6)
	move.w	#$78,obj.var_30(a6)

loc_208B18:
	addq.b	#2,obj.routine(a0)
	move.b	#$81,obj.var_2c(a6)
	move.b	#2,obj.anim_id(a6)
	move.w	#$A00,obj.ground_speed(a6)
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

locret_208B66:
	rts

; ------------------------------------------------------------------------------

TunnelPathObject_0_Routine4:
	bsr.w	sub_208BF4
	addq.b	#2,obj.routine(a0)
	move.w	#$91,d0
	jsr	PlayFmSound
	rts

; ------------------------------------------------------------------------------

TunnelPathObject_0_Routine6:
	subq.b	#1,obj.var_2e(a0)
	bpl.s	loc2_208BB8
	move.w	obj.var_36(a0),obj.x(a6)
	move.w	obj.var_38(a0),obj.y(a6)
	moveq	#0,d1
	move.b	obj.var_3a(a0),d1
	addq.b	#4,d1
	cmp.b	obj.var_3b(a0),d1
	bcs.s	loc_208BA0
	moveq	#0,d1
	bra.s	loc_208BDE

; ------------------------------------------------------------------------------

loc_208BA0:
	move.b	d1,obj.var_3a(a0)
	movea.l	obj.var_3c(a0),a2
	move.w	(a2,d1.w),obj.var_36(a0)
	move.w	2(a2,d1.w),obj.var_38(a0)
	bra.w	sub_208BF4

; ------------------------------------------------------------------------------

loc2_208BB8:
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
	rts

; ------------------------------------------------------------------------------

loc_208BDE:
	andi.w	#$7FF,obj.y(a6)
	clr.b	obj.routine(a0)
	clr.b	obj.var_2c(a6)
	move.w	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

sub_208BF4:
	moveq	#0,d0
	move.w	obj.ground_speed(a6),d2
	move.w	obj.ground_speed(a6),d3
	move.w	obj.var_36(a0),d0
	sub.w	obj.x(a6),d0
	bge.s	loc_208C0C
	neg.w	d0
	neg.w	d2

loc_208C0C:
	moveq	#0,d1
	move.w	obj.var_38(a0),d1
	sub.w	obj.y(a6),d1
	bge.s	loc_208C1C
	neg.w	d1
	neg.w	d3

loc_208C1C:
	cmp.w	d0,d1
	bcs.s	loc_208C52
	moveq	#0,d1
	move.w	obj.var_38(a0),d1
	sub.w	obj.y(a6),d1
	swap	d1
	divs.w	d3,d1
	moveq	#0,d0
	move.w	obj.var_36(a0),d0
	sub.w	obj.x(a6),d0
	beq.s	loc_208C3E
	swap	d0
	divs.w	d1,d0

loc_208C3E:
	move.w	d0,obj.x_speed(a6)
	move.w	d3,obj.y_speed(a6)
	tst.w	d1
	bpl.s	loc_208C4C
	neg.w	d1

loc_208C4C:
	move.w	d1,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

loc_208C52:
	moveq	#0,d0
	move.w	obj.var_36(a0),d0
	sub.w	obj.x(a6),d0
	swap	d0
	divs.w	d2,d0
	moveq	#0,d1
	move.w	obj.var_38(a0),d1
	sub.w	obj.y(a6),d1
	beq.s	loc2_208C70
	swap	d1
	divs.w	d0,d1

loc2_208C70:
	move.w	d1,obj.y_speed(a6)
	move.w	d2,obj.x_speed(a6)
	tst.w	d0
	bpl.s	loc_208C7E
	neg.w	d0

loc_208C7E:
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
	dc.w	@TunnelPath_E-TunnelPaths
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
	dc.w	@TunnelPath_26-TunnelPaths
	dc.w	@TunnelPath_28-TunnelPaths
	dc.w	@TunnelPath_2A-TunnelPaths

@TunnelPath_0:
	dc.w	$28
	dc.w	$2650, $D0
	dc.w	$2650, $F0
	dc.w	$26A0, $110
	dc.w	$2620, $130
	dc.w	$26A0, $150
	dc.w	$2620, $170
	dc.w	$26A0, $190
	dc.w	$2620, $1B0
	dc.w	$26B0, $1E8
	dc.w	$26B0, $208

@TunnelPath_2:
	dc.w	$24
	dc.w	$2850, $1F0
	dc.w	$2850, $210
	dc.w	$28B0, $230
	dc.w	$2830, $250
	dc.w	$28B0, $270
	dc.w	$2830, $290
	dc.w	$28B0, $2B0
	dc.w	$2830, $2D0
	dc.w	$28B0, $2F0

@TunnelPath_4:
	dc.w	$1C
	dc.w	$B80, $2A0
	dc.w	$B80, $2D8
	dc.w	$BA0, $2F0
	dc.w	$B20, $310
	dc.w	$BA0, $330
	dc.w	$B20, $350
	dc.w	$BA0, $370

@TunnelPath_6:
	dc.w	$3C
	dc.w	$2670, $108
	dc.w	$2670, $120
	dc.w	$26C0, $140
	dc.w	$2640, $160
	dc.w	$26C0, $180
	dc.w	$2640, $1A0
	dc.w	$26C0, $1C0
	dc.w	$2640, $1E0
	dc.w	$26C0, $200
	dc.w	$2640, $220
	dc.w	$26C0, $240
	dc.w	$2640, $260
	dc.w	$26C0, $280
	dc.w	$2640, $2A0
	dc.w	$26C0, $2F0

@TunnelPath_8:
	dc.w	$30
	dc.w	$2830, $128
	dc.w	$28C0, $170
	dc.w	$2840, $190
	dc.w	$28C0, $1B0
	dc.w	$2840, $1D0
	dc.w	$28C0, $1F0
	dc.w	$2840, $210
	dc.w	$28C0, $230
	dc.w	$2840, $250
	dc.w	$28C0, $270
	dc.w	$2840, $290
	dc.w	$28C0, $2F0

@TunnelPath_A:
	dc.w	$24
	dc.w	$1950, $1E8
	dc.w	$1950, $210
	dc.w	$19B0, $230
	dc.w	$1930, $250
	dc.w	$19B0, $270
	dc.w	$1930, $290
	dc.w	$19B0, $2B0
	dc.w	$1930, $2D0
	dc.w	$19B0, $2F0

@TunnelPath_C:
	dc.w	$24
	dc.w	$1970, $1E8
	dc.w	$1970, $210
	dc.w	$19C0, $230
	dc.w	$1940, $250
	dc.w	$19C0, $270
	dc.w	$1940, $290
	dc.w	$19C0, $2B0
	dc.w	$1940, $2D0
	dc.w	$19C0, $2F0

@TunnelPath_E:
	dc.w	8
	dc.w	$590, $C8
	dc.w	$590, $178

@TunnelPath_12:
	dc.w	8
	dc.w	$590, $178
	dc.w	$590, $C8

@TunnelPath_14:
	dc.w	8
	dc.w	$1670, $128
	dc.w	$1670, $190

@TunnelPath_16:
	dc.w	8
	dc.w	$1670, $190
	dc.w	$1670, $128

@TunnelPath_18:
	dc.w	8
	dc.w	$1BB0, $208
	dc.w	$1BB0, $258

@TunnelPath_1A:
	dc.w	8
	dc.w	$1BB0, $258
	dc.w	$1BB0, $208

@TunnelPath_1C:
	dc.w	8
	dc.w	$1BD0, $208
	dc.w	$1BD0, $258

@TunnelPath_1E:
	dc.w	8
	dc.w	$1BD0, $258
	dc.w	$1BD0, $208

@TunnelPath_20:
	dc.w	$54
	dc.w	$1B00, $70
	dc.w	$1A70, $70
	dc.w	$1A60, $80
	dc.w	$1A50, $A0
	dc.w	$1A60, $C0
	dc.w	$1A70, $D0
	dc.w	$1A90, $D0
	dc.w	$1AA0, $E0
	dc.w	$1AB0, $100
	dc.w	$1AB0, $128
	dc.w	$1AC8, $158
	dc.w	$1AB0, $188
	dc.w	$1AC8, $1B8
	dc.w	$1AB0, $1E8
	dc.w	$1AC8, $218
	dc.w	$1AB0, $248
	dc.w	$1AC8, $278
	dc.w	$1AB0, $2A8
	dc.w	$1AC8, $2D8
	dc.w	$1AB0, $308
	dc.w	$1AB0, $358

@TunnelPath_22:
	dc.w	$54
	dc.w	$1AB0, $358
	dc.w	$1AB0, $308
	dc.w	$1AC8, $2D8
	dc.w	$1AB0, $2A8
	dc.w	$1AC8, $278
	dc.w	$1AB0, $248
	dc.w	$1AC8, $218
	dc.w	$1AB0, $1E8
	dc.w	$1AC8, $1B8
	dc.w	$1AB0, $188
	dc.w	$1AC8, $158
	dc.w	$1AB0, $128
	dc.w	$1AB0, $100
	dc.w	$1AA0, $E0
	dc.w	$1A90, $D0
	dc.w	$1A70, $D0
	dc.w	$1A60, $C0
	dc.w	$1A50, $A0
	dc.w	$1A60, $80
	dc.w	$1A70, $70
	dc.w	$1B00, $70

@TunnelPath_24:
	dc.w	$1C
	dc.w	$1390, $2A0
	dc.w	$1390, $2E0
	dc.w	$13A0, $2F0
	dc.w	$1320, $310
	dc.w	$13A0, $330
	dc.w	$1320, $350
	dc.w	$13A0, $370

@TunnelPath_26:
	dc.w	$50
	dc.w	$1AB0, $358
	dc.w	$1AB0, $2F8
	dc.w	$1AC8, $2C8
	dc.w	$1AB0, $298
	dc.w	$1AC8, $268
	dc.w	$1AB0, $238
	dc.w	$1AB0, $1F8
	dc.w	$1AC8, $1C8
	dc.w	$1AB0, $198
	dc.w	$1AC8, $168
	dc.w	$1AB0, $138
	dc.w	$1AB0, $100
	dc.w	$1AA0, $E0
	dc.w	$1A90, $D0
	dc.w	$1A70, $D0
	dc.w	$1A60, $C0
	dc.w	$1A50, $A0
	dc.w	$1A60, $80
	dc.w	$1A70, $70
	dc.w	$1B00, $70

@TunnelPath_28:
	dc.w	$50
	dc.w	$1B00, $70
	dc.w	$1A70, $70
	dc.w	$1A60, $80
	dc.w	$1A50, $A0
	dc.w	$1A60, $C0
	dc.w	$1A70, $D0
	dc.w	$1A90, $D0
	dc.w	$1AA0, $E0
	dc.w	$1AB0, $100
	dc.w	$1AB0, $138
	dc.w	$1AC8, $168
	dc.w	$1AB0, $198
	dc.w	$1AC8, $1C8
	dc.w	$1AB0, $1F8
	dc.w	$1AB0, $238
	dc.w	$1AC8, $268
	dc.w	$1AB0, $298
	dc.w	$1AC8, $2C8
	dc.w	$1AB0, $2F8
	dc.w	$1AB0, $358

@TunnelPath_2A:
	dc.w	$24
	dc.w	$1950, $1E8
	dc.w	$1950, $210
	dc.w	$19B0, $220
	dc.w	$1930, $240
	dc.w	$19B0, $260
	dc.w	$1930, $280
	dc.w	$19B0, $2A0
	dc.w	$1930, $2C0
	dc.w	$19B0, $2E0

; ------------------------------------------------------------------------------