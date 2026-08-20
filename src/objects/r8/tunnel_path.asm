; ------------------------------------------------------------------------------

loc_208154:
	lea	player_object,a6
	cmpi.b	#6,obj.routine(a6)
	bcs.s	loc_208162
	rts

; ------------------------------------------------------------------------------

loc_208162:
	move.w	p1_joy_hold,player_joy_hold
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20817C(pc,d0.w),d0
	jsr	off_20817C(pc,d0.w)
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20817C:
	dc.w	TunnelPathObject_0_Routine0-*
	dc.w	TunnelPathObject_0_Routine2-off_20817C
	dc.w	TunnelPathObject_0_Routine4-off_20817C
	dc.w	TunnelPathObject_0_Routine6-off_20817C

; ------------------------------------------------------------------------------

TunnelPathObject_0_Routine0:
	move.b	#4,obj.sprite_flags(a0)
	move.w	#4,obj.var_3a(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_38(a0)
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

TunnelPathObject_0_Routine4:
	btst	#0,player_joy_tap
	beq.s	loc_2081B2
	subi.w	#$10,obj.var_38(a0)
	bra.s	loc_2081E0

; ------------------------------------------------------------------------------

loc_2081B2:
	btst	#1,player_joy_tap
	beq.s	loc_2081C2
	addi.w	#$10,obj.var_38(a0)
	bra.s	loc_2081E0

; ------------------------------------------------------------------------------

loc_2081C2:
	btst	#2,player_joy_tap
	beq.s	loc_2081D2
	subi.w	#$10,obj.var_36(a0)
	bra.s	loc_2081E0

; ------------------------------------------------------------------------------

loc_2081D2:
	btst	#3,player_joy_tap
	beq.s	locret_2081F0
	addi.w	#$10,obj.var_36(a0)

loc_2081E0:
	addq.b	#2,obj.routine(a0)
	move.w	#$1000,obj.ground_speed(a6)
	jmp	loc_2083E8

; ------------------------------------------------------------------------------

locret_2081F0:
	rts

; ------------------------------------------------------------------------------

TunnelPathObject:
	btst	#7,time_zone
	beq.s	loc_20823C
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_20823C
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
	bpl.s	loc_20822C
	moveq	#0,d1
	bra.s	loc_208234

; ------------------------------------------------------------------------------

loc_20822C:
	cmpi.w	#3,d1
	bcs.s	loc_208234
	moveq	#2,d1

loc_208234:
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)

loc_20823C:
	lea	player_object,a6
	cmpi.b	#$2B,obj.anim_id(a6)
	beq.s	locret_208276
	cmpi.b	#6,obj.routine(a6)
	bcc.s	locret_208276
	cmpi.b	#$80,obj.subtype(a0)
	beq.w	loc_208154
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_208278(pc,d0.w),d1
	jsr	off_208278(pc,d1.w)
	cmpi.b	#4,obj.routine(a0)
	bcc.s	locret_208276
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

locret_208276:
	rts

; ------------------------------------------------------------------------------

off_208278:
	dc.w	TunnelPathObject_1_Routine0-*
	dc.w	TunnelPathObject_0_Routine2-off_208278
	dc.w	TunnelPathObject_1_Routine4-off_208278
	dc.w	TunnelPathObject_0_Routine6-off_208278

; ------------------------------------------------------------------------------

TunnelPathObject_1_Routine0:
	move.l	#PowerupSprites,obj.sprite_data(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.w	#$541,obj.sprite_tile(a0)
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

; ------------------------------------------------------------------------------

TunnelPathObject_0_Routine2:
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	addi.w	#$10,d0
	cmpi.w	#$20,d0
	bcc.w	locret_20835A
	move.w	obj.y(a6),d1
	sub.w	obj.y(a0),d1
	addi.w	#$10,d1
	cmpi.w	#$20,d1
	bcc.w	locret_20835A
	tst.b	obj.var_2c(a6)
	bne.w	locret_20835A
	cmpi.b	#4,obj.routine(a6)
	bne.s	loc_208308
	subq.b	#2,obj.routine(a6)
	move.w	#$78,obj.var_30(a6)

loc_208308:
	addq.b	#2,obj.routine(a0)
	move.b	#$81,obj.var_2c(a6)
	andi.b	#$7F,obj.sprite_tile(a6)
	move.b	#2,obj.anim_id(a6)
	bsr.w	sub_208478
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

locret_20835A:
	rts

; ------------------------------------------------------------------------------

TunnelPathObject_1_Routine4:
	bsr.w	loc_2083E8
	addq.b	#2,obj.routine(a0)
	move.w	#$91,d0
	jsr	PlayFmSound
	rts

; ------------------------------------------------------------------------------

TunnelPathObject_0_Routine6:
	subq.b	#1,obj.var_2e(a0)
	bpl.s	loc_2083AC
	move.w	obj.var_36(a0),obj.x(a6)
	move.w	obj.var_38(a0),obj.y(a6)
	moveq	#0,d1
	move.b	obj.var_3a(a0),d1
	addq.b	#4,d1
	cmp.b	obj.var_3b(a0),d1
	bcs.s	loc_208394
	moveq	#0,d1
	bra.s	loc_2083D2

; ------------------------------------------------------------------------------

loc_208394:
	move.b	d1,obj.var_3a(a0)
	movea.l	obj.var_3c(a0),a2
	move.w	(a2,d1.w),obj.var_36(a0)
	move.w	2(a2,d1.w),obj.var_38(a0)
	bra.w	loc_2083E8

; ------------------------------------------------------------------------------

loc_2083AC:
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

loc_2083D2:
	andi.w	#$7FF,obj.y(a6)
	clr.b	obj.routine(a0)
	clr.b	obj.var_2c(a6)
	move.w	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_2083E8:
	moveq	#0,d0
	move.w	obj.ground_speed(a6),d2
	move.w	obj.ground_speed(a6),d3
	move.w	obj.var_36(a0),d0
	sub.w	obj.x(a6),d0
	bge.s	loc_208400
	neg.w	d0
	neg.w	d2

loc_208400:
	moveq	#0,d1
	move.w	obj.var_38(a0),d1
	sub.w	obj.y(a6),d1
	bge.s	loc_208410
	neg.w	d1
	neg.w	d3

loc_208410:
	cmp.w	d0,d1
	bcs.s	loc_208446
	moveq	#0,d1
	move.w	obj.var_38(a0),d1
	sub.w	obj.y(a6),d1
	swap	d1
	divs.w	d3,d1
	moveq	#0,d0
	move.w	obj.var_36(a0),d0
	sub.w	obj.x(a6),d0
	beq.s	loc_208432
	swap	d0
	divs.w	d1,d0

loc_208432:
	move.w	d0,obj.x_speed(a6)
	move.w	d3,obj.y_speed(a6)
	tst.w	d1
	bpl.s	loc_208440
	neg.w	d1

loc_208440:
	move.w	d1,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

loc_208446:
	moveq	#0,d0
	move.w	obj.var_36(a0),d0
	sub.w	obj.x(a6),d0
	swap	d0
	divs.w	d2,d0
	moveq	#0,d1
	move.w	obj.var_38(a0),d1
	sub.w	obj.y(a6),d1
	beq.s	loc_208464
	swap	d1
	divs.w	d0,d1

loc_208464:
	move.w	d1,obj.y_speed(a6)
	move.w	d2,obj.x_speed(a6)
	tst.w	d0
	bpl.s	loc_208472
	neg.w	d0

loc_208472:
	move.w	d0,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

sub_208478:
	move.w	#$1000,obj.ground_speed(a6)
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	bmi.s	locret_20849A
	andi.w	#$F,d0
	add.w	d0,d0
	move.w	word_20849C(pc,d0.w),d0
	cmp.w	obj.ground_speed(a6),d0
	ble.s	locret_20849A
	move.w	d0,obj.ground_speed(a6)

locret_20849A:
	rts

; ------------------------------------------------------------------------------

word_20849C:
	dc.w	$1000
	dc.w	$C00
	dc.w	$C00
	dc.w	$800

TunnelPaths:
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_0-TunnelPaths
	dc.w	.TunnelPath_1C-TunnelPaths
	dc.w	.TunnelPath_1E-TunnelPaths
	dc.w	.TunnelPath_20-TunnelPaths
	dc.w	.TunnelPath_22-TunnelPaths
	dc.w	.TunnelPath_24-TunnelPaths
	dc.w	.TunnelPath_26-TunnelPaths
	dc.w	.TunnelPath_28-TunnelPaths
	dc.w	.TunnelPath_2A-TunnelPaths
	dc.w	.TunnelPath_2C-TunnelPaths
	dc.w	.TunnelPath_2E-TunnelPaths
	dc.w	.TunnelPath_30-TunnelPaths
	dc.w	.TunnelPath_32-TunnelPaths
	dc.w	.TunnelPath_34-TunnelPaths
	dc.w	.TunnelPath_36-TunnelPaths
	dc.w	.TunnelPath_38-TunnelPaths
	dc.w	.TunnelPath_3A-TunnelPaths
	dc.w	.TunnelPath_3C-TunnelPaths
	dc.w	.TunnelPath_3E-TunnelPaths
	dc.w	.TunnelPath_3E-TunnelPaths
	dc.w	.TunnelPath_3E-TunnelPaths
	dc.w	.TunnelPath_3E-TunnelPaths
	dc.w	.TunnelPath_3E-TunnelPaths
	dc.w	.TunnelPath_3E-TunnelPaths
	dc.w	.TunnelPath_3E-TunnelPaths
	dc.w	.TunnelPath_4C-TunnelPaths
	dc.w	.TunnelPath_4E-TunnelPaths
	dc.w	.TunnelPath_50-TunnelPaths
	dc.w	.TunnelPath_52-TunnelPaths
	dc.w	.TunnelPath_54-TunnelPaths
	dc.w	.TunnelPath_56-TunnelPaths
	dc.w	.TunnelPath_58-TunnelPaths
	dc.w	.TunnelPath_5A-TunnelPaths
	dc.w	.TunnelPath_5C-TunnelPaths
	dc.w	.TunnelPath_5E-TunnelPaths
	dc.w	.TunnelPath_60-TunnelPaths
	dc.w	.TunnelPath_62-TunnelPaths
	dc.w	.TunnelPath_62-TunnelPaths
	dc.w	.TunnelPath_62-TunnelPaths
	dc.w	.TunnelPath_62-TunnelPaths
	dc.w	.TunnelPath_62-TunnelPaths
	dc.w	.TunnelPath_6C-TunnelPaths
	dc.w	.TunnelPath_6E-TunnelPaths
	dc.w	.TunnelPath_70-TunnelPaths
	dc.w	.TunnelPath_72-TunnelPaths
	dc.w	.TunnelPath_74-TunnelPaths
	dc.w	.TunnelPath_76-TunnelPaths
	dc.w	.TunnelPath_78-TunnelPaths

.TunnelPath_0:
	dc.w	$14
	dc.w	$380, $6D0
	dc.w	$380, $780
	dc.w	$280, $780
	dc.w	$280, $380
	dc.w	$478, $380

.TunnelPath_1C:
	dc.w	$14
	dc.w	$460, $380
	dc.w	$280, $380
	dc.w	$280, $780
	dc.w	$380, $780
	dc.w	$380, $6B8

.TunnelPath_1E:
	dc.w	8
	dc.w	$480, $2D0
	dc.w	$480, $378

.TunnelPath_20:
	dc.w	8
	dc.w	$480, $360
	dc.w	$480, $2B8

.TunnelPath_22:
	dc.w	$18
	dc.w	$480, $3A0
	dc.w	$480, $480
	dc.w	$500, $480
	dc.w	$600, $380
	dc.w	$680, $380
	dc.w	$680, $2B8

.TunnelPath_24:
	dc.w	$18
	dc.w	$680, $2D0
	dc.w	$680, $380
	dc.w	$600, $380
	dc.w	$500, $480
	dc.w	$480, $480
	dc.w	$480, $388

.TunnelPath_26:
	dc.w	$1C
	dc.w	$4A0, $380
	dc.w	$500, $380
	dc.w	$600, $480
	dc.w	$680, $480
	dc.w	$680, $680
	dc.w	$780, $680
	dc.w	$780, $5B8

.TunnelPath_28:
	dc.w	$1C
	dc.w	$780, $5D0
	dc.w	$780, $680
	dc.w	$680, $680
	dc.w	$680, $480
	dc.w	$600, $480
	dc.w	$500, $380
	dc.w	$488, $380

.TunnelPath_2A:
	dc.w	$C
	dc.w	$E80, $D0
	dc.w	$E80, $180
	dc.w	$1078, $180

.TunnelPath_2C:
	dc.w	$C
	dc.w	$1060, $180
	dc.w	$E80, $180
	dc.w	$E80, $B8

.TunnelPath_2E:
	dc.w	8
	dc.w	$1080, $D0
	dc.w	$1080, $178

.TunnelPath_30:
	dc.w	8
	dc.w	$1080, $160
	dc.w	$1080, $B8

.TunnelPath_32:
	dc.w	$10
	dc.w	$1080, $1A0
	dc.w	$1080, $380
	dc.w	$F80, $380
	dc.w	$F80, $2B8

.TunnelPath_34:
	dc.w	$10
	dc.w	$F80, $2D0
	dc.w	$F80, $380
	dc.w	$1080, $380
	dc.w	$1080, $188

.TunnelPath_36:
	dc.w	$14
	dc.w	$10A0, $180
	dc.w	$1180, $180
	dc.w	$1180, $480
	dc.w	$1380, $480
	dc.w	$1380, $3B8

.TunnelPath_38:
	dc.w	$14
	dc.w	$1380, $3D0
	dc.w	$1380, $480
	dc.w	$1180, $480
	dc.w	$1180, $180
	dc.w	$1088, $180

.TunnelPath_3A:
	dc.w	$10
	dc.w	$1880, $2D0
	dc.w	$1880, $480
	dc.w	$1980, $480
	dc.w	$1980, $3B8

.TunnelPath_3C:
	dc.w	$10
	dc.w	$1980, $3D0
	dc.w	$1980, $480
	dc.w	$1880, $480
	dc.w	$1880, $2B8

.TunnelPath_3E:
	dc.w	$14
	dc.w	$380, $5D0
	dc.w	$380, $680
	dc.w	$280, $680
	dc.w	$280, $380
	dc.w	$478, $380

.TunnelPath_4C:
	dc.w	$14
	dc.w	$460, $380
	dc.w	$280, $380
	dc.w	$280, $680
	dc.w	$380, $680
	dc.w	$380, $5B8

.TunnelPath_4E:
	dc.w	$18
	dc.w	$480, $360
	dc.w	$480, $280
	dc.w	$500, $280
	dc.w	$600, $180
	dc.w	$680, $180
	dc.w	$680, $B8

.TunnelPath_50:
	dc.w	$18
	dc.w	$680, $D0
	dc.w	$680, $180
	dc.w	$600, $180
	dc.w	$500, $280
	dc.w	$480, $280
	dc.w	$480, $378

.TunnelPath_52:
	dc.w	$28
	dc.w	$480, $3A0
	dc.w	$480, $480
	dc.w	$500, $480
	dc.w	$600, $380
	dc.w	$680, $380
	dc.w	$680, $280
	dc.w	$600, $280
	dc.w	$500, $180
	dc.w	$480, $180
	dc.w	$480, $B8

.TunnelPath_54:
	dc.w	$28
	dc.w	$480, $D0
	dc.w	$480, $180
	dc.w	$500, $180
	dc.w	$600, $280
	dc.w	$680, $280
	dc.w	$680, $380
	dc.w	$600, $380
	dc.w	$500, $480
	dc.w	$480, $480
	dc.w	$480, $388

.TunnelPath_56:
	dc.w	$44
	dc.w	$880, $2D0
	dc.w	$880, $380
	dc.w	$A00, $380
	dc.w	$C00, $180
	dc.w	$D00, $180
	dc.w	$E00, $280
	dc.w	$E80, $280
	dc.w	$E80, $380
	dc.w	$D00, $380
	dc.w	$B00, $180
	dc.w	$980, $180
	dc.w	$980, $280
	dc.w	$A00, $280
	dc.w	$B00, $380
	dc.w	$C00, $380
	dc.w	$E00, $180
	dc.w	$1078, $180

.TunnelPath_58:
	dc.w	$44
	dc.w	$1060, $180
	dc.w	$E00, $180
	dc.w	$C00, $380
	dc.w	$B00, $380
	dc.w	$A00, $280
	dc.w	$980, $280
	dc.w	$980, $180
	dc.w	$B00, $180
	dc.w	$D00, $380
	dc.w	$E80, $380
	dc.w	$E80, $280
	dc.w	$E00, $280
	dc.w	$D00, $180
	dc.w	$C00, $180
	dc.w	$A00, $380
	dc.w	$880, $380
	dc.w	$880, $2B8

.TunnelPath_5A:
	dc.w	$10
	dc.w	$1080, $1A0
	dc.w	$1080, $680
	dc.w	$F80, $680
	dc.w	$F80, $5B8

.TunnelPath_5C:
	dc.w	$10
	dc.w	$F80, $5D0
	dc.w	$F80, $680
	dc.w	$1080, $680
	dc.w	$1080, $188

.TunnelPath_5E:
	dc.w	$14
	dc.w	$10A0, $180
	dc.w	$1180, $180
	dc.w	$1180, $480
	dc.w	$1280, $480
	dc.w	$1280, $3B8

.TunnelPath_60:
	dc.w	$14
	dc.w	$1280, $3D0
	dc.w	$1280, $480
	dc.w	$1180, $480
	dc.w	$1180, $180
	dc.w	$1088, $180

.TunnelPath_62:
	dc.w	8
	dc.w	$480, $3A0
	dc.w	$480, $478

.TunnelPath_6C:
	dc.w	8
	dc.w	$480, $460
	dc.w	$480, $388

.TunnelPath_6E:
	dc.w	$14
	dc.w	$480, $4A0
	dc.w	$480, $580
	dc.w	$380, $580
	dc.w	$380, $480
	dc.w	$478, $480

.TunnelPath_70:
	dc.w	$14
	dc.w	$460, $480
	dc.w	$380, $480
	dc.w	$380, $580
	dc.w	$480, $580
	dc.w	$480, $488

.TunnelPath_72:
	dc.w	$14
	dc.w	$4A0, $480
	dc.w	$500, $480
	dc.w	$600, $380
	dc.w	$680, $380
	dc.w	$680, $2B8

.TunnelPath_74:
	dc.w	$14
	dc.w	$680, $2D0
	dc.w	$680, $380
	dc.w	$600, $380
	dc.w	$500, $480
	dc.w	$488, $480

.TunnelPath_76:
	dc.w	$40
	dc.w	$880, $2D0
	dc.w	$880, $380
	dc.w	$A00, $380
	dc.w	$B00, $280
	dc.w	$C00, $380
	dc.w	$D00, $280
	dc.w	$E00, $380
	dc.w	$E80, $380
	dc.w	$E80, $280
	dc.w	$E00, $280
	dc.w	$D00, $380
	dc.w	$C00, $280
	dc.w	$B00, $380
	dc.w	$A00, $280
	dc.w	$980, $280
	dc.w	$980, $1B8

.TunnelPath_78:
	dc.w	$40
	dc.w	$980, $1D0
	dc.w	$980, $280
	dc.w	$A00, $280
	dc.w	$B00, $380
	dc.w	$C00, $280
	dc.w	$D00, $380
	dc.w	$E00, $280
	dc.w	$E80, $280
	dc.w	$E80, $380
	dc.w	$E00, $380
	dc.w	$D00, $280
	dc.w	$C00, $380
	dc.w	$B00, $280
	dc.w	$A00, $380
	dc.w	$880, $380
	dc.w	$880, $2B8

; ------------------------------------------------------------------------------
