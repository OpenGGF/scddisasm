; ------------------------------------------------------------------------------

TimeIconObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_208E70(pc,d0.w),d0
	jsr	off_208E70(pc,d0.w)
	tst.b	(warp_direction).w
	beq.s	locret_208E6E
	cmpi.w	#90,(warp_timer).w
	bcs.s	loc_208E68
	btst	#0,(stage_frames+1).l
	bne.s	locret_208E6E

loc_208E68:
	jmp	DrawObject

; ------------------------------------------------------------------------------

locret_208E6E:
	rts

; ------------------------------------------------------------------------------

off_208E70:
	dc.w	TimeIconInit-*
	dc.w	TimeIconMain-off_208E70

; ------------------------------------------------------------------------------

TimeIconInit:
	addq.b	#2,obj.routine(a0)
	move.l	#MonitorTimeSprites,obj.sprite_data(a0)
	move.w	#$85A8,obj.sprite_tile(a0)
	move.w	#$C4,obj.x(a0)
	move.w	#$152,obj.x+2(a0)

TimeIconMain:
	move.b	#$12,obj.sprite_frame(a0)
	tst.b	(warp_direction).w
	bmi.s	locret_208EA4
	move.b	#$13,obj.sprite_frame(a0)

locret_208EA4:
	rts

; ------------------------------------------------------------------------------

TimePostIconObject:
	tst.b	(time_attack).l
	beq.s	loc_208EB4
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_208EB4:
	cmpi.b	#$A,obj.subtype(a0)
	beq.w	TimeIconObject

TimePostObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_208ED8(pc,d0.w),d0
	jsr	off_208ED8(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_208ED8:
	dc.w	TimePostInit-*
	dc.w	TimePostMain-off_208ED8
	dc.w	TimePostSpin-off_208ED8
	dc.w	TimePostDone-off_208ED8

; ------------------------------------------------------------------------------

TimePostInit:
	addq.b	#2,obj.routine(a0)
	move.b	#$20,obj.height(a0)
	move.b	#$E,obj.width(a0)
	move.l	#MonitorTimeSprites,obj.sprite_data(a0)
	move.w	#$5A8,obj.sprite_tile(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	cmpi.b	#6,(zone).l
	bne.s	loc_208F26
	tst.b	obj.subtype_2(a0)
	bne.s	loc_208F26
	move.b	#0,obj.sprite_layer(a0)
	ori.b	#$80,obj.sprite_tile(a0)

loc_208F26:
	move.b	#$F,obj.width_2(a0)
	move.b	obj.subtype(a0),obj.anim_id(a0)
	bsr.w	sub_208FF2
	bclr	#7,2(a2,d0.w)
	move.b	#$A,obj.sprite_frame(a0)
	cmpi.b	#8,obj.subtype(a0)
	beq.s	loc_208F4E
	addq.b	#2,obj.sprite_frame(a0)

loc_208F4E:
	btst	#0,2(a2,d0.w)
	beq.s	loc_208F62
	addq.b	#1,obj.sprite_frame(a0)
	move.b	#6,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_208F62:
	move.b	#$DF,obj.collide_type(a0)

TimePostMain:
	tst.b	obj.collide_status(a0)
	beq.s	locret_208FC8
	clr.b	obj.collide_status(a0)
	cmpi.b	#6,(zone).l
	bne.s	loc_208F94
	tst.b	obj.subtype_2(a0)
	beq.s	loc_208F8C
	tst.b	(stage_layer).l
	beq.s	locret_208FC8
	bra.s	loc_208F94

; ------------------------------------------------------------------------------

loc_208F8C:
	tst.b	(stage_layer).l
	bne.s	locret_208FC8

loc_208F94:
	move.b	#60,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)
	bsr.w	sub_208FF2
	bset	#0,2(a2,d0.w)
	move.w	#$77,d0
	move.b	#$FF,(warp_direction).w
	cmpi.b	#8,obj.subtype(a0)
	beq.s	loc_208FC2
	move.b	#1,(warp_direction).w
	subq.w	#1,d0

loc_208FC2:
	jsr	SubCpuCommand

locret_208FC8:
	rts

; ------------------------------------------------------------------------------

TimePostSpin:
	subq.b	#1,obj.var_2a(a0)
	beq.s	loc_208FDA
	lea	(MonitorTimeAnims).l,a1
	bra.w	AnimateObject

; ------------------------------------------------------------------------------

loc_208FDA:
	addq.b	#2,obj.routine(a0)
	move.b	#$B,obj.sprite_frame(a0)
	cmpi.b	#8,obj.subtype(a0)
	beq.s	TimePostDone
	addq.b	#2,obj.sprite_frame(a0)

TimePostDone:
	rts

; ------------------------------------------------------------------------------

sub_208FF2:
	lea	(object_states).l,a2
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	(time_zone).l,d1
	bclr	#7,d1
	beq.s	loc_20902A
	move.b	(warp_direction).w,d2
	ext.w	d2
	neg.w	d2
	add.w	d2,d1
	bpl.s	loc_209022
	moveq	#0,d1
	bra.s	loc_20902A

; ------------------------------------------------------------------------------

loc_209022:
	cmpi.w	#3,d1
	bcs.s	loc_20902A
	moveq	#2,d1

loc_20902A:
	add.w	d1,d0
	rts

; ------------------------------------------------------------------------------

sub_20902E:
	cmpi.b	#6,(zone).l
	bne.s	loc_209050
	tst.b	(stage_layer).l
	beq.s	loc_209048
	tst.b	obj.subtype_2(a0)
	bne.s	loc_209050
	rts

; ------------------------------------------------------------------------------

loc_209048:
	tst.b	obj.subtype_2(a0)
	beq.s	loc_209050
	rts

; ------------------------------------------------------------------------------

loc_209050:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

MonitorTimeObject:
	tst.b	obj.subtype(a0)
	bne.s	loc_209072
	tst.b	(time_attack).l
	beq.s	loc_209072
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_209072:
	cmpi.b	#8,obj.subtype(a0)
	bcc.w	TimePostIconObject

; ------------------------------------------------------------------------------

MonitorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20908A(pc,d0.w),d1
	jmp	off_20908A(pc,d1.w)

; ------------------------------------------------------------------------------

off_20908A:
	dc.w	MonitorInit-*
	dc.w	MonitorMain-off_20908A
	dc.w	MonitorBreak-off_20908A
	dc.w	MonitorAnimate-off_20908A
	dc.w	MonitorDraw-off_20908A

; ------------------------------------------------------------------------------

MonitorInit:
	addq.b	#2,obj.routine(a0)
	move.b	#$E,obj.height(a0)
	move.b	#$E,obj.width(a0)
	move.l	#MonitorTimeSprites,obj.sprite_data(a0)
	move.w	#$5A8,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	cmpi.b	#6,(zone).l
	bne.s	loc_2090D4
	tst.b	obj.subtype_2(a0)
	bne.s	loc_2090D4
	ori.b	#$80,obj.sprite_tile(a0)
	move.b	#0,obj.sprite_layer(a0)

loc_2090D4:
	move.b	#4,obj.sprite_flags(a0)
	move.b	#$F,obj.width_2(a0)
	bsr.w	sub_208FF2
	bclr	#7,2(a2,d0.w)
	btst	#0,2(a2,d0.w)
	beq.s	loc_209100
	move.b	#8,obj.routine(a0)
	move.b	#$11,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

loc_209100:
	move.b	#$46,obj.collide_type(a0)
	move.b	obj.subtype(a0),obj.anim_id(a0)

MonitorMain:
	tst.b	obj.sprite_flags(a0)
	bpl.w	MonitorDraw
	move.b	obj.routine_2(a0),d0
	beq.s	loc_20913A
	bsr.w	MoveObjectFall
	jsr	CheckBlockDown
	tst.w	d1
	bpl.w	MonitorAnimate
	add.w	d1,obj.y(a0)
	clr.w	obj.y_speed(a0)
	clr.b	obj.routine_2(a0)
	bra.w	MonitorAnimate

; ------------------------------------------------------------------------------

loc_20913A:
	tst.b	obj.sprite_flags(a0)
	bpl.s	MonitorAnimate
	lea	(player_object).w,a1
	bsr.w	sub_20902E

MonitorAnimate:
	tst.w	(time_stop).l
	bne.s	MonitorDraw
	lea	(MonitorTimeAnims).l,a1
	bsr.w	AnimateObject

MonitorDraw:
	bsr.w	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

MonitorBreak:
	move.w	#$96,d0
	jsr	PlayFmSound
	addq.b	#4,obj.routine(a0)
	move.b	#0,obj.collide_type(a0)
	bsr.w	SpawnObject
	bne.s	loc_20919C
	move.b	#$1A,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.anim_id(a0),obj.anim_id(a1)
	move.b	obj.subtype_2(a0),obj.subtype_2(a1)

loc_20919C:
	bsr.w	SpawnObject
	bne.s	loc_2091C6
	move.b	#$18,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#1,obj.routine_2(a1)
	move.b	#1,obj.subtype(a1)
	move.b	obj.subtype_2(a0),obj.subtype_2(a1)

loc_2091C6:
	bsr.w	sub_208FF2
	bset	#0,2(a2,d0.w)
	move.b	#$11,obj.sprite_frame(a0)
	bra.w	DrawObject

; ------------------------------------------------------------------------------

MonitorItemObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_2091EC(pc,d0.w),d1
	jsr	off_2091EC(pc,d1.w)
	bra.w	DrawObject

; ------------------------------------------------------------------------------

off_2091EC:
	dc.w	MonitorItemInit-*
	dc.w	MonitorItemMain-off_2091EC
	dc.w	MonitorItemDelete-off_2091EC

; ------------------------------------------------------------------------------

MonitorItemInit:
	addq.b	#2,obj.routine(a0)
	move.w	#$85A8,obj.sprite_tile(a0)
	tst.b	obj.subtype_2(a0)
	beq.s	loc_209208
	andi.b	#$7F,obj.sprite_tile(a0)

loc_209208:
	move.b	#$24,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.w	#-$300,obj.y_speed(a0)
	moveq	#0,d0
	move.b	obj.anim_id(a0),d0
	move.b	d0,obj.sprite_frame(a0)
	movea.l	#MonitorTimeSprites,a1
	add.b	d0,d0
	adda.w	(a1,d0.w),a1
	addq.w	#1,a1
	move.l	a1,obj.sprite_data(a0)

MonitorItemMain:
	tst.w	obj.y_speed(a0)
	bpl.w	loc_209250
	bsr.w	MoveObject
	addi.w	#$18,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_209250:
	addq.b	#2,obj.routine(a0)
	move.w	#$1D,obj.anim_timer(a0)
	move.b	obj.anim_id(a0),d0
	bne.s	loc_209276

loc_209260:
	addq.b	#1,(lives).l
	addq.b	#1,(update_hud_lives).l
	move.w	#$7A,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

loc_209276:
	cmpi.b	#1,d0
	bne.s	loc_2092C2
	addi.w	#$A,(rings).l
	ori.b	#1,(update_hud_rings).l
	cmpi.w	#$64,(rings).l
	bcs.s	loc_2092B8
	bset	#1,(lives_flags).l
	beq.w	loc_209260
	cmpi.w	#$C8,(rings).l
	bcs.s	loc_2092B8
	bset	#2,(lives_flags).l
	beq.w	loc_209260

loc_2092B8:
	move.w	#$95,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

loc_2092C2:
	cmpi.b	#2,d0
	bne.s	loc_2092E0

loc_2092C8:
	move.b	#1,(shield).l
	move.b	#3,(shield_object+obj.id).w
	move.w	#$97,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

loc_2092E0:
	cmpi.b	#3,d0
	bne.s	loc_209342

loc_2092E6:
	move.b	#1,(invincible).l
	move.w	#$4B0,(player_object+obj.var_32).w
	move.b	#3,(invincible_object_1+obj.id).w
	move.b	#1,(invincible_object_1+obj.anim_id).w
	move.b	#3,(invincible_object_2+obj.id).w
	move.b	#2,(invincible_object_2+obj.anim_id).w
	move.b	#3,(invincible_object_3+obj.id).w
	move.b	#3,(invincible_object_3+obj.anim_id).w
	move.b	#3,(invincible_object_4+obj.id).w
	move.b	#4,(invincible_object_4+obj.anim_id).w
	tst.b	(time_zone).l
	bne.s	loc_209336
	move.w	#$82,d0
	jsr	SubCpuCommand

loc_209336:
	move.w	#$6D,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

	rts

; ------------------------------------------------------------------------------

loc_209342:
	cmpi.b	#4,d0
	bne.s	loc_209384

loc_209348:
	move.b	#1,(speed_shoes).l
	move.w	#$4B0,(player_object+obj.var_34).w
	move.w	#$C00,(player_max_speed).w
	move.w	#$18,(player_acceleration).w
	move.w	#$80,(player_deceleration).w
	tst.b	(time_zone).l
	bne.s	loc_20937A
	move.w	#$82,d0
	jsr	SubCpuCommand

loc_20937A:
	move.w	#$6C,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

loc_209384:
	cmpi.b	#5,d0
	bne.s	loc_209394
	move.w	#300,(time_stop).l
	rts

; ------------------------------------------------------------------------------

loc_209394:
	cmpi.b	#6,d0
	bne.s	loc_2093AE
	move.w	#$9D,d0
	jsr	PlayFmSound
	move.b	#1,(combine_ring).l
	rts

; ------------------------------------------------------------------------------

loc_2093AE:
	bsr.w	loc_2092C8
	bsr.w	loc_2092E6
	bra.s	loc_209348

; ------------------------------------------------------------------------------

MonitorItemDelete:
	subq.w	#1,obj.anim_timer(a0)
	bmi.w	DeleteObject
	rts

; ------------------------------------------------------------------------------

MonitorTimeAnims:
	dc.w	@MonitorTimeAnims_0-*
	dc.w	@MonitorTimeAnims_1-MonitorTimeAnims
	dc.w	@MonitorTimeAnims_2-MonitorTimeAnims
	dc.w	@MonitorTimeAnims_3-MonitorTimeAnims
	dc.w	@MonitorTimeAnims_4-MonitorTimeAnims
	dc.w	@MonitorTimeAnims_5-MonitorTimeAnims
	dc.w	@MonitorTimeAnims_6-MonitorTimeAnims
	dc.w	@MonitorTimeAnims_7-MonitorTimeAnims
	dc.w	@MonitorTimeAnims_8-MonitorTimeAnims
	dc.w	@MonitorTimeAnims_9-MonitorTimeAnims
@MonitorTimeAnims_0:
	dc.b	1
	dc.b	$10, 0, 0, 8, 0, 0, 9, 0
	dc.b	0
	dc.b	$FF
	dc.b	0
@MonitorTimeAnims_1:
	dc.b	1
	dc.b	$10, 1, 1, 8, 1, 1, 9, 1
	dc.b	1
	dc.b	$FF
	dc.b	0
@MonitorTimeAnims_2:
	dc.b	1
	dc.b	$10, 2, 2, 8, 2, 2, 9, 2
	dc.b	2
	dc.b	$FF
	dc.b	0
@MonitorTimeAnims_3:
	dc.b	1
	dc.b	$10, 3, 3, 8, 3, 3, 9, 3
	dc.b	3
	dc.b	$FF
	dc.b	0
@MonitorTimeAnims_4:
	dc.b	1
	dc.b	$10, 4, 4, 8, 4, 4, 9, 4
	dc.b	4
	dc.b	$FF
	dc.b	0
@MonitorTimeAnims_5:
	dc.b	1
	dc.b	$10, 5, 5, 8, 5, 5, 9, 5
	dc.b	5
	dc.b	$FF
	dc.b	0
@MonitorTimeAnims_6:
	dc.b	1
	dc.b	$10, 6, 6, 8, 6, 6, 9, 6
	dc.b	6
	dc.b	$FF
	dc.b	0
@MonitorTimeAnims_7:
	dc.b	1
	dc.b	$10, 7, 7, 8, 7, 7, 9, 7
	dc.b	7
	dc.b	$FF
	dc.b	0
@MonitorTimeAnims_8:
	dc.b	1
	dc.b	$A, $E, $F, $E, $B, $E, $F, $E
	dc.b	$FF
@MonitorTimeAnims_9:
	dc.b	1
	dc.b	$C, $E, $F, $E, $D, $E, $F, $E
	dc.b	$FF
MonitorTimeSprites:
	dc.w	@MonitorTimeSprites_0-*
	dc.w	@MonitorTimeSprites_1-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_2-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_3-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_4-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_5-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_6-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_7-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_8-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_9-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_A-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_B-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_C-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_D-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_E-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_F-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_10-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_11-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_12-MonitorTimeSprites
	dc.w	@MonitorTimeSprites_13-MonitorTimeSprites
@MonitorTimeSprites_0:
	dc.b	4
	dc.b	$F6, 5, 0, $12, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	dc.b	0
@MonitorTimeSprites_1:
	dc.b	4
	dc.b	$F6, 5, 0, $16, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	dc.b	0
@MonitorTimeSprites_2:
	dc.b	4
	dc.b	$F6, 5, 0, $1A, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	dc.b	0
@MonitorTimeSprites_3:
	dc.b	4
	dc.b	$F6, 5, 0, $1E, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	dc.b	0
@MonitorTimeSprites_4:
	dc.b	4
	dc.b	$F6, 5, 0, $22, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	dc.b	0
@MonitorTimeSprites_5:
	dc.b	4
	dc.b	$F6, 5, 0, $26, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	dc.b	0
@MonitorTimeSprites_6:
	dc.b	4
	dc.b	$F6, 5, 0, $2A, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	dc.b	0
@MonitorTimeSprites_7:
	dc.b	4
	dc.b	$F6, 5, 0, $2E, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	dc.b	0
@MonitorTimeSprites_8:
	dc.b	4
	dc.b	$F6, 5, 0, $48, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	dc.b	0
@MonitorTimeSprites_9:
	dc.b	4
	dc.b	$F6, 5, 8, $48, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	dc.b	0
@MonitorTimeSprites_A:
	dc.b	5
	dc.b	$D8, $D, 0, $32, $F0
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
@MonitorTimeSprites_B:
	dc.b	5
	dc.b	$D8, $D, 8, $32, $F0
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
@MonitorTimeSprites_C:
	dc.b	5
	dc.b	$D8, $D, 0, $3A, $F0
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
@MonitorTimeSprites_D:
	dc.b	5
	dc.b	$D8, $D, 8, $3A, $F0
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
@MonitorTimeSprites_E:
	dc.b	5
	dc.b	$D8, 5, 0, $42, $F8
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
@MonitorTimeSprites_F:
	dc.b	5
	dc.b	$D8, 1, 0, $46, $FC
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
@MonitorTimeSprites_10:
	dc.b	3
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
@MonitorTimeSprites_11:
	dc.b	1
	dc.b	0, $D, 0, $A, $F0
@MonitorTimeSprites_12:
	dc.b	1
	dc.b	$F8, $D, 0, $32, $F0
@MonitorTimeSprites_13:
	dc.b	1
	dc.b	$F8, $D, 0, $3A, $F0

; ------------------------------------------------------------------------------