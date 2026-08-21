; ------------------------------------------------------------------------------

TimeIconObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_208E70(pc,d0.w),d0
	jsr	off_208E70(pc,d0.w)
	tst.b	warp_direction
	beq.s	locret_208E6E
	cmpi.w	#90,warp_timer
	bcs.s	loc_208E68
	btst	#0,stage_frames+1
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
	tst.b	warp_direction
	bmi.s	locret_208EA4
	move.b	#$13,obj.sprite_frame(a0)

locret_208EA4:
	rts

; ------------------------------------------------------------------------------

TimePostIconObject:
	tst.b	time_attack
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
	cmpi.b	#6,zone
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
	cmpi.b	#6,zone
	bne.s	loc_208F94
	tst.b	obj.subtype_2(a0)
	beq.s	loc_208F8C
	tst.b	stage_layer
	beq.s	locret_208FC8
	bra.s	loc_208F94

; ------------------------------------------------------------------------------

loc_208F8C:
	tst.b	stage_layer
	bne.s	locret_208FC8

loc_208F94:
	move.b	#60,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)
	bsr.w	sub_208FF2
	bset	#0,2(a2,d0.w)
	move.w	#$77,d0
	move.b	#$FF,warp_direction
	cmpi.b	#8,obj.subtype(a0)
	beq.s	loc_208FC2
	move.b	#1,warp_direction
	subq.w	#1,d0

loc_208FC2:
	jsr	SubCpuCommand

locret_208FC8:
	rts

; ------------------------------------------------------------------------------

TimePostSpin:
	subq.b	#1,obj.var_2a(a0)
	beq.s	loc_208FDA
	lea	MonitorTimeAnims,a1
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
	lea	object_states,a2
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	bclr	#7,d1
	beq.s	loc_20902A
	move.b	warp_direction,d2
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
	cmpi.b	#6,zone
	bne.s	loc_209050
	tst.b	stage_layer
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
	tst.b	time_attack
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
	cmpi.b	#6,zone
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
	lea	player_object,a1
	bsr.w	sub_20902E

MonitorAnimate:
	tst.w	time_stop
	bne.s	MonitorDraw
	lea	MonitorTimeAnims,a1
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
	addq.b	#1,lives
	addq.b	#1,update_hud_lives
	move.w	#$7A,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

loc_209276:
	cmpi.b	#1,d0
	bne.s	loc_2092C2
	addi.w	#$A,rings
	ori.b	#1,update_hud_rings
	cmpi.w	#$64,rings
	bcs.s	loc_2092B8
	bset	#1,lives_flags
	beq.w	loc_209260
	cmpi.w	#$C8,rings
	bcs.s	loc_2092B8
	bset	#2,lives_flags
	beq.w	loc_209260

loc_2092B8:
	move.w	#$95,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

loc_2092C2:
	cmpi.b	#2,d0
	bne.s	loc_2092E0

loc_2092C8:
	move.b	#1,shield
	move.b	#3,shield_object+obj.id
	move.w	#$97,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

loc_2092E0:
	cmpi.b	#3,d0
	bne.s	loc_209342

loc_2092E6:
	move.b	#1,invincible
	if (STAGE_ZONE=4)|((REGION=USA)&(STAGE_ZONE=2))
		move.w	#$528,player_object+obj.var_32
	else
	move.w	#$4B0,player_object+obj.var_32
	endif
	move.b	#3,invincible_object_1+obj.id
	move.b	#1,invincible_object_1+obj.anim_id
	move.b	#3,invincible_object_2+obj.id
	move.b	#2,invincible_object_2+obj.anim_id
	move.b	#3,invincible_object_3+obj.id
	move.b	#3,invincible_object_3+obj.anim_id
	move.b	#3,invincible_object_4+obj.id
	move.b	#4,invincible_object_4+obj.anim_id
	tst.b	time_zone
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
	move.b	#1,speed_shoes
	if (STAGE_ZONE=4)|((REGION=USA)&(STAGE_ZONE=2))
		move.w	#$528,player_object+obj.var_34
	else
	move.w	#$4B0,player_object+obj.var_34
	endif
	move.w	#$C00,player_max_speed
	move.w	#$18,player_acceleration
	move.w	#$80,player_deceleration
	tst.b	time_zone
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
	move.w	#300,time_stop
	rts

; ------------------------------------------------------------------------------

loc_209394:
	cmpi.b	#6,d0
	bne.s	loc_2093AE
	move.w	#$9D,d0
	jsr	PlayFmSound
	move.b	#1,combine_ring
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
	include	"anims/monitor_time.asm"
	even

MonitorTimeSprites:
	include	"sprites/monitor_time.asm"
	even

; ------------------------------------------------------------------------------
