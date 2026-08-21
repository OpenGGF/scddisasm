; ------------------------------------------------------------------------------

PlayerCheckBored:
	lea	bored_timer,a1
	cmpi.b	#5,obj.anim_id(a0)
	beq.s	loc_203D2E
	move.w	#0,(a1)
	rts

; ------------------------------------------------------------------------------

loc_203D2E:
	tst.w	(a1)
	bne.s	loc_203D38
	move.b	#1,1(a1)

loc_203D38:
	cmpi.w	#$2A30,(a1)
	bcs.s	locret_203D82
	move.w	#0,(a1)
	move.b	#$2B,obj.anim_id(a0)
	ori.b	#$80,obj.sprite_tile(a0)
	move.b	#0,obj.sprite_layer(a0)
	move.b	#1,lives
	move.w	#$FB00,obj.y_speed(a0)
	move.w	#$100,obj.x_speed(a0)
	btst	#0,obj.flags(a0)
	beq.s	loc_203D74
	neg.w	obj.x_speed(a0)

loc_203D74:
	move.w	#0,obj.ground_speed(a0)
	move.w	#$79,d0
	bra.w	SubCpuCommand

; ------------------------------------------------------------------------------

locret_203D82:
	rts

; ------------------------------------------------------------------------------

PlayerObject:
	tst.b	time_attack
	bne.s	loc_203DA0
	cmpa.w	#player_object_2,a0
	beq.s	loc_203DA0
	tst.b	debug_mode
	beq.s	loc_203DA0
	jmp	DebugModeLegacy

; ------------------------------------------------------------------------------

loc_203DA0:
	move.b	obj.var_2a(a0),d0
	beq.s	loc_203DCA
	addq.b	#1,d0
	btst	#2,obj.flags(a0)
	beq.s	loc_203DBC
	cmpi.b	#$2D,d0
	bcs.s	loc_203DC6
	move.b	#$2D,d0
	bra.s	loc_203DC6

; ------------------------------------------------------------------------------

loc_203DBC:
	cmpi.b	#$1E,d0
	bcs.s	loc_203DC6
	move.b	#$1E,d0

loc_203DC6:
	move.b	d0,obj.var_2a(a0)

loc_203DCA:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_203DD8(pc,d0.w),d1
	jmp	off_203DD8(pc,d1.w)

; ------------------------------------------------------------------------------

off_203DD8:
	dc.w	PlayerInit-*
	dc.w	PlayerMain-off_203DD8
	dc.w	PlayerHurt-off_203DD8
	dc.w	PlayerDead-off_203DD8
	dc.w	PlayerRestart-off_203DD8

; ------------------------------------------------------------------------------

PlayerMakeWarpStars:
	tst.b	warp_object_1+obj.id
	bne.s	locret_203E20
	move.b	#1,warping
	move.b	#3,warp_object_1+obj.id
	move.b	#5,warp_object_1+obj.anim_id
	move.b	#3,warp_object_2+obj.id
	move.b	#6,warp_object_2+obj.anim_id
	move.b	#3,warp_object_3+obj.id
	move.b	#7,warp_object_3+obj.anim_id
	move.b	#3,warp_object_4+obj.id
	move.b	#8,warp_object_4+obj.anim_id

locret_203E20:
	rts

; ------------------------------------------------------------------------------

PlayerUnknown:
	rts

; ------------------------------------------------------------------------------

PlayerInit:
	addq.b	#2,obj.routine(a0)
	move.b	#$13,obj.height(a0)
	move.b	#9,obj.width(a0)
	tst.b	shrunk_player
	beq.s	loc_203E48
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)

loc_203E48:
	move.l	#PlayerSprites,obj.sprite_data(a0)
	move.w	#$780,obj.sprite_tile(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.w	#$600,player_max_speed
	move.w	#$C,player_acceleration
	move.w	#$80,player_deceleration
	rts

; ------------------------------------------------------------------------------

PlayerMakeSplash:
	tst.b	zone
	bne.s	locret_203EE2
	move.b	stage_frames+1,d0
	andi.b	#3,d0
	bne.s	locret_203EE2
	move.b	obj.height(a0),d2
	ext.w	d2
	add.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	bsr.w	PlayerGetChunk
	cmpi.b	#$2F,d1
	bne.s	locret_203EE4
	cmpi.w	#$15C0,obj.x(a0)
	bcc.s	locret_203EE2
	tst.b	obj.var_2c(a0)
	beq.s	locret_203EE2
	jsr	SpawnObject
	bne.s	locret_203EE2
	move.b	#$E,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	moveq	#1,d0
	tst.w	obj.x_speed(a0)
	bmi.s	loc_203EDA
	moveq	#0,d0

loc_203EDA:
	move.b	d0,1(a1)
	move.b	d0,$22(a1)

locret_203EE2:
	rts

; ------------------------------------------------------------------------------

locret_203EE4:
	rts

; ------------------------------------------------------------------------------

PlayerUnknown2:
	move.b	obj.height(a0),d2
	ext.w	d2
	add.w	$C(a0),d2
	cmpi.b	#$10,d1
	bne.s	loc_203F04
	cmpi.w	#$210,d2
	bcc.s	locret_203EE2
	cmpi.w	#$208,d2
	bcs.s	locret_203EE2
	bra.s	loc_203F16

; ------------------------------------------------------------------------------

loc_203F04:
	cmpi.b	#$21,d1
	bne.s	locret_203EE2
	cmpi.w	#$2A0,d2
	bcc.s	locret_203EE2
	cmpi.w	#$298,d2
	bcs.s	locret_203EE2

loc_203F16:
	tst.w	obj.ground_speed(a0)
	beq.s	locret_203EE2
	jsr	SpawnObject
	bne.s	locret_203EE2
	move.b	#$B,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	andi.w	#$FFF8,d2
	move.w	d2,obj.y(a1)
	move.b	#1,obj.subtype(a1)
	move.w	obj.ground_speed(a0),d0
	bpl.s	loc_203F46
	neg.w	d0

loc_203F46:
	cmpi.w	#$600,d0
	bcc.s	loc_203F52
	move.b	#2,obj.subtype(a1)

loc_203F52:
	move.w	#$A1,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

PlayerGetChunk:
	move.w	d2,d0
	lsr.w	#1,d0
	andi.w	#$380,d0
	move.w	d3,d1
	lsr.w	#8,d1
	andi.w	#$7F,d1
	add.w	d1,d0
	move.l	#StageChunks,d1
	lea	stage_map,a1
	move.b	(a1,d0.w),d1
	andi.b	#$7F,d1
	rts

; ------------------------------------------------------------------------------

PlayerCheckPole:
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.s	locret_204000
	cmpi.b	#4,obj.routine(a0)
	bcc.s	locret_204000
	btst	#3,obj.var_2c(a0)
	bne.s	locret_204000
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	cmpi.w	#$103,d0
	bne.s	locret_204000
	bset	#3,obj.var_2c(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#-$200,d0
	tst.w	obj.y_speed(a0)
	bmi.s	loc_203FCC
	neg.w	d0

loc_203FCC:
	move.w	d0,obj.y_speed(a0)
	move.b	#$40,obj.var_2b(a0)
	move.w	obj.x(a0),d0
	andi.w	#$FFF0,d0
	addq.w	#8,d0
	move.w	d0,obj.x(a0)
	move.w	d0,obj.var_3e(a0)
	move.b	#2,obj.anim_id(a0)
	bset	#2,obj.flags(a0)
	move.b	#$E,obj.height(a0)
	move.b	#7,obj.width(a0)

locret_204000:
	rts

; ------------------------------------------------------------------------------

PlayerCheckHangBar:
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.w	locret_20409E
	cmpi.b	#2,spawn_mode
	beq.w	locret_20409E
	btst	#0,obj.var_2c(a0)
	bne.s	locret_20409E
	btst	#2,obj.var_2c(a0)
	bne.s	locret_20409E
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	subi.w	#$18,d2
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	cmpi.w	#$159,d0
	bne.s	locret_20409E
	move.w	warp_timer,d0
	beq.s	loc_204060
	clr.w	warp_timer
	clr.b	warping
	cmpi.w	#$5A,d0
	bcs.s	loc_204060
	clr.b	warp_direction

loc_204060:
	bclr	#2,obj.flags(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.y_speed(a0)
	move.w	#0,obj.ground_speed(a0)
	move.b	#$2C,obj.anim_id(a0)
	bset	#2,obj.var_2c(a0)
	move.b	#7,obj.var_1f(a0)
	move.w	obj.y(a0),d0
	subi.w	#$18,d0
	andi.w	#$FFF0,d0
	addi.w	#$18,d0
	move.w	d0,obj.y(a0)

locret_20409E:
	rts

; ------------------------------------------------------------------------------

PlayerCheckBeam:
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.w	locret_2040FE
	cmpi.b	#4,obj.routine(a0)
	bcc.s	locret_2040FE
	tst.b	warping
	bne.s	locret_2040FE
	tst.b	invincible
	bne.s	locret_2040FE
	tst.w	obj.var_30(a0)
	bne.s	locret_2040FE
	moveq	#0,d0
	move.b	r6_beam_mode,d0
	beq.s	locret_2040FE
	subq.b	#1,d0
	add.w	d0,d0
	move.w	BeamBlocks(pc,d0.w),d0
	lea	BeamBlocks(pc,d0.w),a3
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0

loc_2040F2:
	move.w	(a3)+,d1
	bmi.s	locret_2040FE
	cmp.w	d1,d0
	bne.s	loc_2040F2
	bra.w	HurtPlayer

; ------------------------------------------------------------------------------

locret_2040FE:
	rts

; ------------------------------------------------------------------------------

BeamBlocks:
	dc.w	BeamBlocks1-*
	dc.w	BeamBlocks2-BeamBlocks
	dc.w	BeamBlocks3-BeamBlocks

BeamBlocks1:
	dc.w	$1AA
	dc.w	$FFFF

BeamBlocks2:
	dc.w	$1C1
	dc.w	$FFFF

BeamBlocks3:
	dc.w	$1BC
	dc.w	$1DB
	dc.w	$1D4
	dc.w	$1D1
	dc.w	$1A3
	dc.w	$199
	dc.w	$198
	dc.w	$1A2
	dc.w	$FFFF

; ------------------------------------------------------------------------------

PlayerCheckSparks:
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.w	locret_2041DA
	tst.b	warping
	bne.w	locret_2041DA
	tst.b	invincible
	bne.w	locret_2041DA
	cmpi.w	#$980,obj.x(a0)
	bcs.s	loc_204150
	cmpi.w	#$A20,obj.x(a0)
	bcs.w	locret_2041DA

loc_204150:
	btst	#7,boss_flags
	bne.w	locret_2041DA
	tst.w	obj.var_30(a0)
	bne.s	locret_2041DA
	cmpi.b	#2,act
	bne.s	loc_204184
	cmpi.w	#$A10,obj.x(a0)
	bcs.s	loc_20419C
	tst.b	boss_music
	beq.s	locret_2041DA
	tst.b	good_future
	bne.s	loc_204196
	bra.s	loc_20419C

; ------------------------------------------------------------------------------

loc_204184:
	cmpi.b	#2,time_zone
	bne.s	loc_20419C
	tst.b	good_future
	beq.s	loc_20419C

loc_204196:
	tst.b	stage_anim_frames+2
	beq.s	locret_2041DA

loc_20419C:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	moveq	#2,d6
	lea	word_2041DC,a1
	cmpi.b	#2,time_zone
	bne.s	loc_2041D0
	tst.b	good_future
	bne.s	loc_2041D0
	lea	word_2041E2,a1

loc_2041D0:
	cmp.w	(a1)+,d0
	beq.w	HurtPlayer
	dbf	d6,loc_2041D0

locret_2041DA:
	rts

; ------------------------------------------------------------------------------

word_2041DC:
	dc.w	$243
	dc.w	$244
	dc.w	$245

word_2041E2:
	dc.w	$287
	dc.w	$288
	dc.w	$289

; ------------------------------------------------------------------------------

PlayerCheckBounce:
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.w	locret_2042B8
	tst.b	boss_flags
	bne.w	locret_2042B8
	cmpi.b	#2,time_zone
	bcc.s	loc_20421C
	move.b	#$3C,d0
	tst.b	time_zone
	beq.s	loc_204214
	addi.b	#$1E,d0

loc_204214:
	cmp.b	palette_cycle_steps+3,d0
	beq.w	locret_2042B8

loc_20421C:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	addq.w	#2,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d3
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	cmpi.w	#$21F,d0
	beq.s	loc_204274
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	addq.w	#2,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d3
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	cmpi.w	#$21F,d0
	bne.s	locret_2042B8

loc_204274:
	move.w	#-$1600,obj.y_speed(a0)
	bset	#1,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	clr.b	obj.var_3c(a0)
	bset	#2,obj.flags(a0)
	bne.s	locret_2042B8
	move.b	#$E,obj.height(a0)
	move.b	#7,obj.width(a0)
	addq.w	#5,obj.y(a0)
	move.b	#2,obj.anim_id(a0)
	move.w	#$DA,d0
	jsr	PlayFmSound

locret_2042B8:
	rts

; ------------------------------------------------------------------------------

PlayerExtendedCamera:
	rts

; ------------------------------------------------------------------------------

	move.w	scroll_focus_x,d1
	move.w	obj.ground_speed(a0),d0
	bpl.s	loc_2042C8
	neg.w	d0

loc_2042C8:
	btst	#1,obj.var_2c(a0)
	bne.s	loc_2042F8
	cmpi.w	#$600,d0
	bcs.s	loc_2042F8
	tst.w	obj.ground_speed(a0)
	bpl.s	loc_2042EA
	addq.w	#2,d1
	cmpi.w	#$E0,d1
	bcs.s	loc_204306
	move.w	#$E0,d1
	bra.s	loc_204306

; ------------------------------------------------------------------------------

loc_2042EA:
	subq.w	#2,d1
	cmpi.w	#$60,d1
	bcc.s	loc_204306
	move.w	#$60,d1
	bra.s	loc_204306

; ------------------------------------------------------------------------------

loc_2042F8:
	cmpi.w	#$A0,d1
	beq.s	loc_204306
	bcc.s	loc_204304
	addq.w	#2,d1
	bra.s	loc_204306

; ------------------------------------------------------------------------------

loc_204304:
	subq.w	#2,d1

loc_204306:
	move.w	d1,scroll_focus_x
	rts

; ------------------------------------------------------------------------------

PlayerMain:
	bsr.s	PlayerExtendedCamera
	bsr.w	PlayerMakeSplash
	tst.w	debug_cheat
	beq.s	loc_20432C
	btst	#4,p1_joy_tap
	beq.s	loc_20432C
	move.b	#1,debug_mode
	rts

; ------------------------------------------------------------------------------

loc_20432C:
	tst.b	control_locked
	bne.s	loc_204338
	move.w	p1_joy_hold,player_joy_hold

loc_204338:
	btst	#0,obj.var_2c(a0)
	beq.s	loc_204346
	bsr.w	PlayerCheckWarp
	bra.s	loc_20436C

; ------------------------------------------------------------------------------

loc_204346:
	moveq	#0,d0
	move.b	obj.flags(a0),d0
	andi.w	#6,d0
	move.w	PlayerStates(pc,d0.w),d1
	jsr	PlayerStates(pc,d1.w)
	bsr.w	PlayerCheckBounce
	bsr.w	PlayerCheckSparks
	bsr.w	PlayerCheckBeam
	bsr.w	PlayerCheckHangBar
	bsr.w	PlayerCheckPole

loc_20436C:
	bsr.s	PlayerUpdatePowerups
	bsr.w	PlayerBufferPosition
	move.b	collide_angle_1,obj.var_36(a0)
	move.b	collide_angle_2,obj.var_37(a0)
	bsr.w	PlayerAnimate
	tst.b	obj.var_2c(a0)
	bmi.s	loc_204396
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.s	loc_204396
	jsr	PlayerObjectCollide

loc_204396:
	bsr.w	PlayerCheckChunk
	rts

; ------------------------------------------------------------------------------

PlayerStates:
	dc.w	PlayerGroundState-*
	dc.w	PlayerFallState-PlayerStates
	dc.w	PlayerRollState-PlayerStates
	dc.w	PlayerJumpState-PlayerStates
	dc.b	$81
	dc.b	$82
	dc.b	$83
	dc.b	$84
	dc.b	$85
	dc.b	$86

; ------------------------------------------------------------------------------

PlayerUpdatePowerups:
	cmpi.w	#$D2,warp_timer
	bcc.s	loc_2043CE
	move.w	obj.var_30(a0),d0
	beq.s	loc_2043C0
	subq.w	#1,obj.var_30(a0)
	lsr.w	#3,d0
	bcc.s	loc_2043CE

loc_2043C0:
	btst	#6,obj.var_2c(a0)
	bne.s	loc_2043CE
	jsr	DrawObject

loc_2043CE:
	tst.b	invincible
	beq.s	loc_204412
	tst.w	obj.var_32(a0)
	beq.s	loc_204412
	subq.w	#1,obj.var_32(a0)
	bne.s	loc_204412
	tst.b	speed_shoes
	bne.s	loc_20440A
	tst.b	boss_music
	bne.s	loc_20440A
	tst.b	time_zone
	bne.s	loc_204404
	move.w	#$E,d0
	jsr	SubCpuCommand

loc_204404:
	jsr	PlayStageMusic

loc_20440A:
	move.b	#0,invincible

loc_204412:
	tst.b	speed_shoes
	beq.s	locret_204468
	tst.w	obj.var_34(a0)
	beq.s	locret_204468
	subq.w	#1,obj.var_34(a0)
	bne.s	locret_204468
	move.w	#$600,player_max_speed
	move.w	#$C,player_acceleration
	move.w	#$80,player_deceleration
	tst.b	invincible
	bne.s	loc_204460
	tst.b	boss_music
	bne.s	loc_204460
	tst.b	time_zone
	bne.s	loc_20445A
	move.w	#$E,d0
	jsr	SubCpuCommand

loc_20445A:
	jsr	PlayStageMusic

loc_204460:
	move.b	#0,speed_shoes

locret_204468:
	rts

; ------------------------------------------------------------------------------

PlayerBufferPosition:
	move.w	player_pos_index,d0
	lea	player_positions,a1
	lea	(a1,d0.w),a1
	move.w	obj.x(a0),(a1)+
	move.w	obj.y(a0),(a1)+
	addq.b	#4,player_pos_index+1
	rts

; ------------------------------------------------------------------------------

PlayerCheckWater:
	rts

; ------------------------------------------------------------------------------

SetPlayerWarpRespawn:
	move.b	spawn_mode,warp_spawn_mode
	move.w	obj.x(a0),warp_x
	move.w	obj.y(a0),warp_y
	move.w	obj.ground_speed(a0),warp_ground_speed
	move.w	obj.x_speed(a0),warp_x_speed
	move.w	obj.y_speed(a0),warp_y_speed
	move.b	obj.flags(a0),warp_player_flags
	bclr	#3,warp_player_flags
	move.b	water_routine,warp_water_routine
	move.w	bottom_bound,warp_bottom_bound
	move.w	scroll_fg_x,warp_scroll_fg_x
	move.w	scroll_fg_y,warp_scroll_fg_y
	move.w	scroll_bg_x,warp_scroll_bg_x
	move.w	scroll_bg_y,warp_scroll_bg_y
	move.w	scroll_bg2_x,warp_scroll_bg2_x
	move.w	scroll_bg2_y,warp_scroll_bg2_y
	move.w	scroll_bg3_x,warp_scroll_bg3_x
	move.w	scroll_bg3_y,warp_scroll_bg3_y
	move.w	static_water_y,warp_water_y
	move.b	water_routine,warp_water_routine
	move.b	water_full,warp_water_full
	move.w	rings,warp_rings
	move.b	lives_flags,warp_lives_flags
	move.l	time,d0
	cmpi.l	#$50000,d0
	bcs.s	loc_204558
	move.l	#$50000,d0

loc_204558:
	move.l	d0,warp_time
	rts

; ------------------------------------------------------------------------------

PlayerCheckWarp:
	tst.b	obj.var_2a(a0)
	bne.w	locret_20461E
	tst.b	warp_direction
	beq.w	locret_20461E
	move.w	#$600,d2
	moveq	#0,d0
	move.w	obj.ground_speed(a0),d0
	bpl.s	loc_20457E
	neg.w	d0

loc_20457E:
	tst.w	warp_timer
	bne.s	loc_20458A
	move.w	#1,warp_timer

loc_20458A:
	move.w	warp_timer,d1
	cmpi.w	#$E6,d1
	bcs.s	loc_2045A0
	move.b	#1,restart_stage
	bra.w	FadeOutMusic

; ------------------------------------------------------------------------------

loc_2045A0:
	cmpi.w	#$D2,d1
	bcs.s	loc_2045F4
	cmpi.b	#2,spawn_mode
	beq.s	locret_2045F2
	move.b	#1,scroll_lock
	move.b	time_zone,d0
	bne.s	loc_2045CA
	move.w	#$82,d0
	jsr	SubCpuCommand
	moveq	#0,d0

loc_2045CA:
	add.b	warp_direction,d0
	bpl.s	loc_2045D4
	moveq	#0,d0
	bra.s	loc_2045DC

; ------------------------------------------------------------------------------

loc_2045D4:
	cmpi.b	#3,d0
	bcs.s	loc_2045DC
	moveq	#2,d0

loc_2045DC:
	bset	#7,d0
	move.b	d0,time_zone
	bsr.w	SetPlayerWarpRespawn
	move.b	#2,spawn_mode

locret_2045F2:
	rts

; ------------------------------------------------------------------------------

loc_2045F4:
	cmpi.w	#$5A,d1
	bcc.s	loc_20460C
	cmp.w	d2,d0
	bcc.w	PlayerMakeWarpStars
	clr.w	warp_timer
	clr.b	warping
	rts

; ------------------------------------------------------------------------------

loc_20460C:
	cmp.w	d2,d0
	bcc.s	locret_20461E
	clr.w	warp_timer
	clr.b	warp_direction
	clr.b	warping

locret_20461E:
	rts

; ------------------------------------------------------------------------------

PlayerGroundState:
	tst.b	sneeze_flag
	beq.s	loc_204632
	cmpi.b	#5,obj.anim_id(a0)
	bne.s	locret_20468C
	clr.b	sneeze_flag

loc_204632:
	bsr.w	PlayerCheckBored
	cmpi.b	#$2B,obj.anim_id(a0)
	bne.s	loc_204662
	tst.b	shrunk_player
	beq.s	loc_204650
	cmpi.b	#$79,obj.sprite_frame(a0)
	bne.s	locret_20468C
	bra.s	loc_204658

; ------------------------------------------------------------------------------

loc_204650:
	cmpi.b	#$17,obj.sprite_frame(a0)
	bcs.s	locret_20468C

loc_204658:
	bsr.w	PlayerCheckBounds
	jmp	MoveObjectFall

; ------------------------------------------------------------------------------

loc_204662:
	bsr.w	PlayerCheckBooster3d
	bsr.w	PlayerCheckWarp
	bsr.w	PlayerCheckJump
	bsr.w	PlayerSlopeResist
	bsr.w	PlayerMoveGround
	bsr.w	PlayerCheckRoll
	bsr.w	PlayerCheckBounds
	jsr	MoveObject
	bsr.w	PlayerGroundCollide
	bsr.w	PlayerCheckFall

locret_20468C:
	rts

; ------------------------------------------------------------------------------

PlayerFallState:
	tst.w	obj.y_speed(a0)
	bmi.s	loc_2046A2
	cmpi.b	#$2C,obj.anim_id(a0)
	beq.s	loc_2046A2
	move.b	#0,obj.anim_id(a0)

loc_2046A2:
	btst	#2,obj.var_2c(a0)
	beq.s	loc_2046B0
	bsr.w	PlayerHangBar
	bra.s	loc_2046DC

; ------------------------------------------------------------------------------

loc_2046B0:
	bsr.w	PlayerCheckBooster3d
	bsr.w	PlayerCheckWarp
	bsr.w	PlayerJumpHeight
	bsr.w	PlayerMoveAir
	bsr.w	PlayerCheckBounds
	jsr	MoveObjectFall
	btst	#6,obj.flags(a0)
	beq.s	loc_2046D8
	subi.w	#$28,obj.y_speed(a0)

loc_2046D8:
	bsr.w	PlayerResetAngle

loc_2046DC:
	bsr.w	PlayerBlockCollideAir
	rts

; ------------------------------------------------------------------------------

PlayerRollState:
	bsr.w	PlayerCheckBooster3d
	bsr.w	PlayerCheckWarp
	bsr.w	PlayerCheckJump
	bsr.w	PlayerSlopeResistRoll
	bsr.w	PlayerMoveRoll
	bsr.w	PlayerCheckBounds
	tst.b	obj.var_2a(a0)
	bne.s	loc_204706
	jsr	MoveObject

loc_204706:
	bsr.w	PlayerGroundCollide
	bsr.w	PlayerCheckFall
	rts

; ------------------------------------------------------------------------------

PlayerJumpState:
	btst	#3,obj.var_2c(a0)
	beq.s	loc_204722
	bsr.w	PlayerPole
	bsr.w	PlayerCheckWarp
	bra.s	loc_204760

; ------------------------------------------------------------------------------

loc_204722:
	btst	#2,obj.var_2c(a0)
	beq.s	loc_204734
	bsr.w	PlayerHangBar
	bsr.w	PlayerCheckWarp
	bra.s	loc_204760

; ------------------------------------------------------------------------------

loc_204734:
	bsr.w	PlayerCheckBooster3d
	bsr.w	PlayerCheckWarp
	bsr.w	PlayerJumpHeight
	bsr.w	PlayerMoveAir
	bsr.w	PlayerCheckBounds
	jsr	MoveObjectFall
	btst	#6,obj.flags(a0)
	beq.s	loc_20475C
	subi.w	#$28,obj.y_speed(a0)

loc_20475C:
	bsr.w	PlayerResetAngle

loc_204760:
	bsr.w	PlayerBlockCollideAir
	rts

; ------------------------------------------------------------------------------

PlayerPole:
	btst	#4,obj.var_2c(a0)
	beq.s	loc_20479A
	move.b	obj.var_2b(a0),d0
	andi.b	#$7F,d0
	bne.s	loc_2047AA
	move.w	#-$C00,obj.x_speed(a0)
	tst.b	obj.var_2b(a0)
	bmi.s	loc_204788
	neg.w	obj.x_speed(a0)

loc_204788:
	andi.b	#$7F,obj.sprite_tile(a0)
	andi.b	#$E7,obj.var_2c(a0)
	clr.w	obj.var_3e(a0)
	rts

; ------------------------------------------------------------------------------

loc_20479A:
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.s	loc_2047AA
	bset	#4,obj.var_2c(a0)

loc_2047AA:
	addq.b	#8,obj.var_2b(a0)
	ori.w	#$8000,obj.sprite_tile(a0)
	move.b	obj.var_2b(a0),d0
	bpl.s	loc_2047C0
	andi.w	#$7FFF,obj.sprite_tile(a0)

loc_2047C0:
	jsr	SineCosine
	muls.w	#$17,d1
	asr.l	#8,d1
	move.w	obj.var_3e(a0),obj.x(a0)
	add.w	d1,obj.x(a0)
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	lsl.l	#8,d0
	add.l	d0,obj.y(a0)
	move.w	obj.var_3e(a0),d3
	move.w	obj.y(a0),d2
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	cmpi.w	#$103,d0
	beq.s	locret_204800
	neg.w	obj.y_speed(a0)

locret_204800:
	rts

; ------------------------------------------------------------------------------

PlayerHangBar:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	subi.w	#$18,d2
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	cmpi.w	#$159,d0
	bne.s	loc_20482A
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.s	loc_204844

loc_20482A:
	bclr	#2,obj.var_2c(a0)
	addi.w	#$10,obj.y(a0)
	move.b	#$13,obj.height(a0)
	move.b	#9,obj.width(a0)
	rts

; ------------------------------------------------------------------------------

loc_204844:
	moveq	#2,d0
	btst	#2,player_joy_hold
	beq.s	loc_20485E
	neg.w	d0
	bset	#0,obj.flags(a0)
	bset	#0,obj.sprite_flags(a0)
	bra.s	loc_204872

; ------------------------------------------------------------------------------

loc_20485E:
	btst	#3,player_joy_hold
	beq.s	locret_204894
	bclr	#0,obj.flags(a0)
	bclr	#0,obj.sprite_flags(a0)

loc_204872:
	add.w	d0,obj.x(a0)
	subq.b	#1,obj.var_1f(a0)
	bpl.s	locret_204894
	move.b	#7,obj.var_1f(a0)
	addq.b	#1,obj.anim_index(a0)
	cmpi.b	#4,obj.anim_index(a0)
	bcs.s	locret_204894
	move.b	#0,obj.anim_index(a0)

locret_204894:
	rts

; ------------------------------------------------------------------------------

PlayerCheckBooster3d:
	cmpi.b	#1,time_zone
	bne.s	locret_204902
	tst.w	zone
	bne.s	locret_204902
	move.w	obj.y(a0),d0
	lsr.w	#1,d0
	andi.w	#$380,d0
	move.b	obj.x(a0),d1
	andi.w	#$7F,d1
	add.w	d1,d0
	lea	stage_map,a1
	move.b	(a1,d0.w),d1
	lea	byte_204904,a2

loc_2048CA:
	move.b	(a2)+,d0
	bmi.s	loc_2048DA
	cmp.b	d0,d1
	bne.s	loc_2048CA
	bset	#1,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

loc_2048DA:
	bclr	#1,obj.var_2c(a0)
	beq.s	locret_204902
	tst.w	obj.y_speed(a0)
	bpl.s	locret_204902
	cmpi.w	#$F800,obj.y_speed(a0)
	bcc.s	locret_204902
	move.w	#$600,obj.x_speed(a0)
	btst	#0,obj.flags(a0)
	beq.s	locret_204902
	neg.w	obj.x_speed(a0)

locret_204902:
	rts

; ------------------------------------------------------------------------------

byte_204904:
	dc.b	6
	dc.b	7
	dc.b	8
	dc.b	$44
	dc.b	$45
	dc.b	$46
	dc.b	$49
	dc.b	-1

; ------------------------------------------------------------------------------

PlayerMoveGround:
	move.w	player_max_speed,d6
	move.w	player_acceleration,d5
	move.w	player_deceleration,d4
	tst.b	water_slide_flag
	bne.w	loc_204C1E
	tst.w	obj.var_3e(a0)
	bne.w	loc_204BCE
	btst	#2,player_joy_hold
	beq.s	loc_204934
	bsr.w	PlayerMoveGroundLeft

loc_204934:
	btst	#3,player_joy_hold
	beq.s	loc_204940
	bsr.w	PlayerMoveGroundRight

loc_204940:
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	bne.w	loc_204BCE
	tst.w	obj.ground_speed(a0)
	beq.s	loc_204960
	tst.b	obj.var_2a(a0)
	beq.w	loc_204BCE
	bra.s	loc_20496C

; ------------------------------------------------------------------------------

loc_204960:
	bclr	#5,obj.flags(a0)
	move.b	#5,obj.anim_id(a0)

loc_20496C:
	btst	#3,obj.flags(a0)
	beq.s	loc_2049BC
	moveq	#0,d0
	move.b	obj.var_3d(a0),d0
	lsl.w	#6,d0
	lea	object_pool,a1
	lea	(a1,d0.w),a1
	tst.b	obj.flags(a1)
	bmi.s	loc_2049FE
	cmpi.b	#$1E,obj.id(a1)
	bne.s	loc_20499C
	move.b	#0,obj.anim_id(a0)
	bra.w	loc_204BCE

; ------------------------------------------------------------------------------

loc_20499C:
	moveq	#0,d1
	move.b	obj.width_2(a1),d1
	move.w	d1,d2
	add.w	d2,d2
	subq.w	#4,d2
	add.w	obj.x(a0),d1
	sub.w	obj.x(a1),d1
	cmpi.w	#4,d1
	blt.s	loc_2049E2
	cmp.w	d2,d1
	bge.s	loc_2049D0
	bra.s	loc_2049FE

; ------------------------------------------------------------------------------

loc_2049BC:
	jsr	CheckBlockDown
	cmpi.w	#$C,d1
	blt.s	loc_2049FE
	cmpi.b	#3,obj.var_36(a0)
	bne.s	loc_2049DA

loc_2049D0:
	btst	#0,obj.flags(a0)
	bne.s	loc_2049EA
	bra.s	loc_2049F4

; ------------------------------------------------------------------------------

loc_2049DA:
	cmpi.b	#3,obj.var_37(a0)
	bne.s	loc_2049FE

loc_2049E2:
	btst	#0,obj.flags(a0)
	bne.s	loc_2049F4

loc_2049EA:
	move.b	#$32,obj.anim_id(a0)
	bra.w	loc_204BCE

; ------------------------------------------------------------------------------

loc_2049F4:
	move.b	#6,obj.anim_id(a0)
	bra.w	loc_204BCE

; ------------------------------------------------------------------------------

loc_2049FE:
	move.b	focus_mode,d0
	andi.b	#$F,d0
	beq.s	loc_204A12
	addq.b	#1,focus_mode
	andi.b	#$CF,focus_mode

loc_204A12:
	btst	#7,focus_mode
	bne.w	loc_204B16
	btst	#6,focus_mode
	bne.w	loc_204B36
	btst	#1,player_joy_hold
	bne.w	loc_204B36
	andi.b	#$F,focus_mode
	beq.s	loc_204A4A
	btst	#0,player_joy_tap
	beq.s	loc_204A5E
	bset	#7,focus_mode
	bra.w	loc_204BF2

; ------------------------------------------------------------------------------

loc_204A4A:
	btst	#0,player_joy_tap
	beq.w	loc_204A5E
	move.b	#1,focus_mode
	bra.w	loc_204BF2

; ------------------------------------------------------------------------------

loc_204A5E:
	btst	#0,player_joy_hold
	beq.s	loc_204ADA
	move.b	#7,obj.anim_id(a0)
	tst.b	obj.var_2a(a0)
	beq.s	loc_204ABC
	move.b	#0,obj.anim_id(a0)
	moveq	#$64,d0
	move.w	player_max_speed,d1
	move.w	d1,d2
	asl.w	#1,d1
	tst.b	speed_shoes
	beq.s	loc_204A8E
	asr.w	#1,d2
	sub.w	d2,d1

loc_204A8E:
	btst	#0,obj.flags(a0)
	beq.s	loc_204A9A
	neg.w	d0
	neg.w	d1

loc_204A9A:
	add.w	d0,obj.ground_speed(a0)
	move.w	obj.ground_speed(a0),d0
	btst	#0,obj.flags(a0)
	beq.s	loc_204AB0
	cmp.w	d0,d1
	ble.s	loc_204AB6
	bra.s	loc_204AB4

; ------------------------------------------------------------------------------

loc_204AB0:
	cmp.w	d1,d0
	ble.s	loc_204AB6

loc_204AB4:
	move.w	d1,d0

loc_204AB6:
	move.w	d0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_204ABC:
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.s	loc_204AD6
	move.b	#1,obj.var_2a(a0)
	move.w	#$9C,d0
	jsr	PlayFmSound

loc_204AD6:
	bra.w	loc_204BF2

; ------------------------------------------------------------------------------

loc_204ADA:
	cmpi.b	#$1E,obj.var_2a(a0)
	beq.s	loc_204AFA
	move.w	#$AB,d0
	jsr	PlayFmSound
	move.b	#0,obj.var_2a(a0)
	move.w	#0,obj.ground_speed(a0)
	bra.s	loc_204B36

; ------------------------------------------------------------------------------

loc_204AFA:
	move.b	#0,obj.var_2a(a0)
	move.w	#$91,d0
	jsr	PlayFmSound
	bra.w	loc_204BCE

; ------------------------------------------------------------------------------

	bsr.w	PlayerMoveGroundLeft
	bra.w	loc_204BCE

; ------------------------------------------------------------------------------

loc_204B16:
	btst	#0,player_joy_hold
	beq.s	loc_204B36
	move.b	#7,obj.anim_id(a0)
	cmpi.w	#$C8,scroll_focus_y
	beq.w	loc_204BF2
	addq.w	#2,scroll_focus_y
	bra.w	loc_204BF2

; ------------------------------------------------------------------------------

loc_204B36:
	btst	#6,focus_mode
	bne.w	loc_204BB2
	andi.b	#$F,focus_mode
	beq.s	loc_204B5A
	btst	#1,player_joy_tap
	beq.s	loc_204B6C
	bset	#6,focus_mode
	bra.w	loc_204BF2

; ------------------------------------------------------------------------------

loc_204B5A:
	btst	#1,player_joy_tap
	beq.s	loc_204B6C
	move.b	#1,focus_mode
	bra.w	loc_204BF2

; ------------------------------------------------------------------------------

loc_204B6C:
	btst	#1,player_joy_hold
	beq.s	loc_204BCE
	move.b	#8,obj.anim_id(a0)
	tst.b	obj.var_2a(a0)
	bne.s	loc_204BB0
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.s	loc_204BB0
	move.b	#1,obj.var_2a(a0)
	move.w	#$16,obj.ground_speed(a0)
	btst	#0,obj.flags(a0)
	beq.s	loc_204BA2
	neg.w	obj.ground_speed(a0)

loc_204BA2:
	move.w	#$9C,d0
	jsr	PlayFmSound
	bsr.w	PlayerStartRoll

loc_204BB0:
	bra.s	loc_204BF2

; ------------------------------------------------------------------------------

loc_204BB2:
	btst	#1,player_joy_hold
	beq.s	loc_204BCE
	move.b	#8,obj.anim_id(a0)
	cmpi.w	#8,scroll_focus_y
	beq.s	loc_204BF2
	subq.w	#2,scroll_focus_y
	bra.s	loc_204BF2

; ------------------------------------------------------------------------------

loc_204BCE:
	cmpi.w	#$60,scroll_focus_y
	bne.s	loc_204BE8
	move.b	focus_mode,d0
	andi.b	#$F,d0
	bne.s	loc_204BF2
	move.b	#0,focus_mode
	bra.s	loc_204BF2

; ------------------------------------------------------------------------------

loc_204BE8:
	bcc.s	loc_204BEE
	addq.w	#4,scroll_focus_y

loc_204BEE:
	subq.w	#2,scroll_focus_y

loc_204BF2:
	move.b	player_joy_hold,d0
	andi.b	#$C,d0
	bne.s	loc_204C1E
	move.w	obj.ground_speed(a0),d0
	beq.s	loc_204C1E
	bmi.s	loc_204C12
	sub.w	d5,d0
	bcc.s	loc_204C0C
	move.w	#0,d0

loc_204C0C:
	move.w	d0,obj.ground_speed(a0)
	bra.s	loc_204C1E

; ------------------------------------------------------------------------------

loc_204C12:
	add.w	d5,d0
	bcc.s	loc_204C1A
	move.w	#0,d0

loc_204C1A:
	move.w	d0,obj.ground_speed(a0)

loc_204C1E:
	move.b	obj.angle(a0),d0
	jsr	SineCosine
	muls.w	obj.ground_speed(a0),d1
	asr.l	#8,d1
	move.w	d1,obj.x_speed(a0)
	muls.w	obj.ground_speed(a0),d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a0)

loc_204C3C:
	move.b	obj.angle(a0),d0
	addi.b	#$40,d0
	bmi.s	locret_204CAC
	move.b	#$40,d1
	tst.w	obj.ground_speed(a0)
	beq.s	locret_204CAC
	bmi.s	PlayerCheckWall
	neg.w	d1

PlayerCheckWall:
	move.b	obj.angle(a0),d0
	add.b	d1,d0
	move.w	d0,-(sp)
	bsr.w	PlayerCheckBlockFront
	move.w	(sp)+,d0
	tst.w	d1
	bpl.s	locret_204CAC
	asl.w	#8,d1
	addi.b	#$20,d0
	andi.b	#$C0,d0
	beq.s	loc_204CA8
	cmpi.b	#$40,d0
	beq.s	loc_204C96
	cmpi.b	#$80,d0
	beq.s	loc_204C90
	add.w	d1,obj.x_speed(a0)
	bset	#5,obj.flags(a0)
	move.w	#0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_204C90:
	sub.w	d1,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_204C96:
	sub.w	d1,obj.x_speed(a0)
	bset	#5,obj.flags(a0)
	move.w	#0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_204CA8:
	add.w	d1,obj.y_speed(a0)

locret_204CAC:
	rts

; ------------------------------------------------------------------------------

PlayerMoveGroundLeft:
	tst.b	obj.var_2a(a0)
	bne.s	locret_204D22
	move.w	obj.ground_speed(a0),d0
	beq.s	loc_204CBC
	bpl.s	loc_204CEC

loc_204CBC:
	bset	#0,obj.flags(a0)
	bne.s	loc_204CD0
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)

loc_204CD0:
	move.w	d6,d1
	neg.w	d1
	cmp.w	d1,d0
	ble.s	loc_204CE0
	sub.w	d5,d0
	cmp.w	d1,d0
	bgt.s	loc_204CE0
	move.w	d1,d0

loc_204CE0:
	move.w	d0,obj.ground_speed(a0)
	move.b	#0,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_204CEC:
	sub.w	d4,d0
	bcc.s	loc_204CF4
	move.w	#$FF80,d0

loc_204CF4:
	move.w	d0,obj.ground_speed(a0)
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	bne.s	locret_204D22
	cmpi.w	#$400,d0
	blt.s	locret_204D22
	move.b	#$D,obj.anim_id(a0)
	bclr	#0,obj.flags(a0)
	move.w	#$90,d0
	jsr	PlayFmSound

locret_204D22:
	rts

; ------------------------------------------------------------------------------

PlayerMoveGroundRight:
	tst.b	obj.var_2a(a0)
	bne.s	locret_204D92
	move.w	obj.ground_speed(a0),d0
	bmi.s	loc_204D5C
	bclr	#0,obj.flags(a0)
	beq.s	loc_204D44
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)

loc_204D44:
	cmp.w	d6,d0
	bge.s	loc_204D50
	add.w	d5,d0
	cmp.w	d6,d0
	blt.s	loc_204D50
	move.w	d6,d0

loc_204D50:
	move.w	d0,obj.ground_speed(a0)
	move.b	#0,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_204D5C:
	add.w	d4,d0
	bcc.s	loc_204D64
	move.w	#$80,d0

loc_204D64:
	move.w	d0,obj.ground_speed(a0)
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	bne.s	locret_204D92
	cmpi.w	#$FC00,d0
	bgt.s	locret_204D92
	move.b	#$D,obj.anim_id(a0)
	bset	#0,obj.flags(a0)
	move.w	#$90,d0
	jsr	PlayFmSound

locret_204D92:
	rts

; ------------------------------------------------------------------------------

PlayerMoveRoll:
	move.w	player_max_speed,d6
	asl.w	#1,d6
	move.w	player_acceleration,d5
	asr.w	#1,d5
	move.w	player_deceleration,d4
	asr.w	#2,d4
	tst.b	water_slide_flag
	bne.w	loc_204ED0
	tst.w	obj.var_3e(a0)
	bne.s	loc_204DCC
	btst	#2,player_joy_hold
	beq.s	loc_204DC0
	bsr.w	PlayerMoveRollLeft

loc_204DC0:
	btst	#3,player_joy_hold
	beq.s	loc_204DCC
	bsr.w	PlayerMoveRollRight

loc_204DCC:
	tst.b	obj.var_2a(a0)
	beq.w	loc_204E76
	move.w	#$32,d0
	move.w	player_max_speed,d1
	move.w	d1,d2
	asl.w	#1,d1
	tst.b	speed_shoes
	beq.s	loc_204DEC
	asr.w	#1,d2
	sub.w	d2,d1

loc_204DEC:
	btst	#0,obj.flags(a0)
	beq.s	loc_204DF8
	neg.w	d0
	neg.w	d1

loc_204DF8:
	add.w	d0,obj.ground_speed(a0)
	move.w	obj.ground_speed(a0),d0
	btst	#0,obj.flags(a0)
	beq.s	loc_204E0E
	cmp.w	d0,d1
	ble.s	loc_204E14
	bra.s	loc_204E12

; ------------------------------------------------------------------------------

loc_204E0E:
	cmp.w	d1,d0
	ble.s	loc_204E14

loc_204E12:
	move.w	d1,d0

loc_204E14:
	move.w	d0,obj.ground_speed(a0)
	btst	#1,player_joy_hold
	beq.s	loc_204E48
	rts

; ------------------------------------------------------------------------------

loc_204E22:
	move.w	#$AB,d0
	jsr	PlayFmSound
	move.b	#0,obj.var_2a(a0)
	move.w	#0,obj.ground_speed(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.y_speed(a0)
	bra.w	loc_204E9E

; ------------------------------------------------------------------------------

loc_204E48:
	cmpi.b	#$2D,obj.var_2a(a0)
	bne.s	loc_204E22
	move.b	#0,obj.var_2a(a0)
	move.w	#$91,d0
	jsr	PlayFmSound
	btst	#0,obj.flags(a0)
	bne.s	loc_204E6E
	bsr.w	PlayerMoveRollRight
	bra.s	loc_204E76

; ------------------------------------------------------------------------------

loc_204E6E:
	bsr.w	PlayerMoveRollLeft
	bra.s	loc_204E76

; ------------------------------------------------------------------------------

	rts

; ------------------------------------------------------------------------------

loc_204E76:
	move.w	obj.ground_speed(a0),d0
	beq.s	loc_204E98
	bmi.s	loc_204E8C
	sub.w	d5,d0
	bcc.s	loc_204E86
	move.w	#0,d0

loc_204E86:
	move.w	d0,obj.ground_speed(a0)
	bra.s	loc_204E98

; ------------------------------------------------------------------------------

loc_204E8C:
	add.w	d5,d0
	bcc.s	loc_204E94
	move.w	#0,d0

loc_204E94:
	move.w	d0,obj.ground_speed(a0)

loc_204E98:
	tst.w	obj.ground_speed(a0)
	bne.s	loc_204ED0

loc_204E9E:
	bclr	#2,obj.flags(a0)
	tst.b	shrunk_player
	beq.s	loc_204EBA
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	bra.s	loc_204ECA

; ------------------------------------------------------------------------------

loc_204EBA:
	move.b	#$13,obj.height(a0)
	move.b	#9,obj.width(a0)
	subq.w	#5,obj.y(a0)

loc_204ECA:
	move.b	#5,obj.anim_id(a0)

loc_204ED0:
	move.b	obj.angle(a0),d0
	jsr	SineCosine
	muls.w	obj.ground_speed(a0),d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a0)
	muls.w	obj.ground_speed(a0),d1
	asr.l	#8,d1
	cmpi.w	#$1000,d1
	ble.s	loc_204EF4
	move.w	#$1000,d1

loc_204EF4:
	cmpi.w	#$F000,d1
	bge.s	loc_204EFE
	move.w	#$F000,d1

loc_204EFE:
	move.w	d1,obj.x_speed(a0)
	bra.w	loc_204C3C

; ------------------------------------------------------------------------------

PlayerMoveRollLeft:
	move.w	obj.ground_speed(a0),d0
	beq.s	loc_204F0E
	bpl.s	loc_204F1C

loc_204F0E:
	bset	#0,obj.flags(a0)
	move.b	#2,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_204F1C:
	sub.w	d4,d0
	bcc.s	loc_204F24
	move.w	#$FF80,d0

loc_204F24:
	move.w	d0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveRollRight:
	move.w	obj.ground_speed(a0),d0
	bmi.s	loc_204F3E
	bclr	#0,obj.flags(a0)
	move.b	#2,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_204F3E:
	add.w	d4,d0
	bcc.s	loc_204F46
	move.w	#$80,d0

loc_204F46:
	move.w	d0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveAir:
	move.w	player_max_speed,d6
	move.w	player_acceleration,d5
	asl.w	#1,d5
	move.w	obj.x_speed(a0),d0
	tst.w	zone
	bne.s	loc_204F7A
	cmpi.w	#$6C8,obj.x(a0)
	bcs.s	loc_204F72
	cmpi.w	#$840,obj.x(a0)
	bcs.s	loc_204FAA

loc_204F72:
	btst	#1,obj.var_2c(a0)
	bne.s	loc_204FAA

loc_204F7A:
	btst	#2,player_joy_hold
	beq.s	loc_204F94
	bset	#0,obj.flags(a0)
	sub.w	d5,d0
	move.w	d6,d1
	neg.w	d1
	cmp.w	d1,d0
	bgt.s	loc_204F94
	move.w	d1,d0

loc_204F94:
	btst	#3,player_joy_hold
	beq.s	loc_204FAA
	bclr	#0,obj.flags(a0)
	add.w	d5,d0
	cmp.w	d6,d0
	blt.s	loc_204FAA
	move.w	d6,d0

loc_204FAA:
	move.w	d0,obj.x_speed(a0)
	cmpi.w	#$60,scroll_focus_y
	beq.s	loc_204FC0
	bcc.s	loc_204FBC
	addq.w	#4,scroll_focus_y

loc_204FBC:
	subq.w	#2,scroll_focus_y

loc_204FC0:
	cmpi.w	#$FC00,obj.y_speed(a0)
	bcs.s	locret_204FEE
	move.w	obj.x_speed(a0),d0
	move.w	d0,d1
	asr.w	#5,d1
	beq.s	locret_204FEE
	bmi.s	loc_204FE2
	sub.w	d1,d0
	bcc.s	loc_204FDC
	move.w	#0,d0

loc_204FDC:
	move.w	d0,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_204FE2:
	sub.w	d1,d0
	bcs.s	loc_204FEA
	move.w	#0,d0

loc_204FEA:
	move.w	d0,obj.x_speed(a0)

locret_204FEE:
	rts

; ------------------------------------------------------------------------------

PlayerUnusedCheckSquish:
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	bne.s	locret_20501E
	bsr.w	PlayerCheckBlockUpWide
	tst.w	d1
	bpl.s	locret_20501E
	move.w	#0,obj.ground_speed(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.y_speed(a0)
	move.b	#$B,obj.anim_id(a0)

locret_20501E:
	rts

; ------------------------------------------------------------------------------

PlayerCheckBounds:
	move.l	obj.x(a0),d1
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d1
	swap	d1
	move.w	left_bound,d0
	addi.w	#$10,d0
	cmp.w	d1,d0
	bhi.s	loc_205074
	move.w	right_bound,d0
	addi.w	#$130,d0
	tst.b	boss_started
	bne.s	loc_20504E
	addi.w	#$38,d0

loc_20504E:
	cmp.w	d1,d0
	bls.s	loc_205074

loc_205052:
	move.w	bottom_bound,d0
	addi.w	#$E0,d0
	cmp.w	obj.y(a0),d0
	blt.s	loc_205062
	rts

; ------------------------------------------------------------------------------

loc_205062:
	cmpi.b	#$2B,obj.anim_id(a0)
	bne.w	KillPlayer
	move.b	#6,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_205074:
	move.w	d0,obj.x(a0)
	move.w	#0,obj.x+2(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.ground_speed(a0)
	bra.s	loc_205052

; ------------------------------------------------------------------------------

PlayerCheckRoll:
	tst.b	water_slide_flag
	bne.s	locret_2050B2
	move.w	obj.ground_speed(a0),d0
	bpl.s	loc_20509A
	neg.w	d0

loc_20509A:
	cmpi.w	#$80,d0
	bcs.s	locret_2050B2
	move.b	player_joy_hold,d0
	andi.b	#$C,d0
	bne.s	locret_2050B2
	btst	#1,player_joy_hold
	bne.s	PlayerStartRoll

locret_2050B2:
	rts

; ------------------------------------------------------------------------------

PlayerStartRoll:
	btst	#2,obj.flags(a0)
	beq.s	loc_2050BE
	rts

; ------------------------------------------------------------------------------

loc_2050BE:
	bset	#2,obj.flags(a0)
	tst.b	shrunk_player
	beq.s	loc_2050DA
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	bra.s	loc_2050EA

; ------------------------------------------------------------------------------

loc_2050DA:
	move.b	#$E,obj.height(a0)
	move.b	#7,obj.width(a0)
	addq.w	#5,obj.y(a0)

loc_2050EA:
	move.b	#2,obj.anim_id(a0)
	tst.w	obj.ground_speed(a0)
	bne.s	locret_2050FC
	move.w	#$200,obj.ground_speed(a0)

locret_2050FC:
	rts

; ------------------------------------------------------------------------------

PlayerCheckJump:
	tst.b	obj.var_2a(a0)
	beq.s	loc_205106
	rts

; ------------------------------------------------------------------------------

loc_205106:
	move.b	player_joy_hold,d0
	andi.b	#3,d0
	beq.s	loc_205118
	tst.w	obj.ground_speed(a0)
	beq.w	locret_2051DA

loc_205118:
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.w	locret_2051DA
	btst	#3,obj.flags(a0)
	beq.s	loc_205134
	jsr	PlayerCheckFlipper
	beq.s	loc_205164

loc_205134:
	moveq	#0,d0
	move.b	obj.angle(a0),d0
	addi.b	#-$80,d0
	bsr.w	PlayerCheckBlockAbove
	cmpi.w	#6,d1
	blt.w	locret_2051DA
	move.w	#$680,d2
	btst	#6,obj.flags(a0)
	beq.s	loc_20515A
	move.w	#$380,d2

loc_20515A:
	moveq	#0,d0
	move.b	obj.angle(a0),d0
	subi.b	#$40,d0

loc_205164:
	jsr	SineCosine
	muls.w	d2,d1
	asr.l	#8,d1
	add.w	d1,obj.x_speed(a0)
	muls.w	d2,d0
	asr.l	#8,d0
	add.w	d0,obj.y_speed(a0)
	bset	#1,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	addq.l	#4,sp
	move.b	#1,obj.var_3c(a0)
	clr.b	obj.var_38(a0)
	clr.b	focus_mode
	move.w	#$92,d0
	jsr	PlayFmSound
	btst	#2,obj.flags(a0)
	bne.s	loc_2051DC
	tst.b	shrunk_player
	beq.s	loc_2051BE
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	bra.s	loc_2051CE

; ------------------------------------------------------------------------------

loc_2051BE:
	move.b	#$E,obj.height(a0)
	move.b	#7,obj.width(a0)
	addq.w	#5,obj.y(a0)

loc_2051CE:
	bset	#2,obj.flags(a0)
	move.b	#2,obj.anim_id(a0)

locret_2051DA:
	rts

; ------------------------------------------------------------------------------

loc_2051DC:
	bset	#4,obj.flags(a0)
	rts

; ------------------------------------------------------------------------------

PlayerJumpHeight:
	tst.b	obj.var_3c(a0)
	beq.s	locret_205216
	move.w	#$FC00,d1
	btst	#6,obj.flags(a0)
	beq.s	loc_2051FA
	move.w	#$FE00,d1

loc_2051FA:
	cmp.w	obj.y_speed(a0),d1
	ble.s	locret_205214
	move.b	player_joy_hold,d0
	andi.b	#$70,d0
	bne.s	locret_205214
	move.b	#0,obj.var_2a(a0)
	move.w	d1,obj.y_speed(a0)

locret_205214:
	rts

; ------------------------------------------------------------------------------

locret_205216:
	rts

; ------------------------------------------------------------------------------

PlayerSlopeResist:
	tst.b	obj.var_2a(a0)
	bne.s	locret_205252
	move.b	obj.angle(a0),d0
	addi.b	#$60,d0
	cmpi.b	#$C0,d0
	bcc.s	locret_205252
	move.b	obj.angle(a0),d0
	jsr	SineCosine
	muls.w	#$20,d0
	asr.l	#8,d0
	tst.w	obj.ground_speed(a0)
	beq.s	locret_205252
	bmi.s	loc_20524E
	tst.w	d0
	beq.s	locret_20524C
	add.w	d0,obj.ground_speed(a0)

locret_20524C:
	rts

; ------------------------------------------------------------------------------

loc_20524E:
	add.w	d0,obj.ground_speed(a0)

locret_205252:
	rts

; ------------------------------------------------------------------------------

PlayerSlopeResistRoll:
	tst.b	obj.var_2a(a0)
	bne.s	locret_205294
	move.b	obj.angle(a0),d0
	addi.b	#$60,d0
	cmpi.b	#$C0,d0
	bcc.s	locret_205294
	move.b	obj.angle(a0),d0
	jsr	SineCosine
	muls.w	#$50,d0
	asr.l	#8,d0
	tst.w	obj.ground_speed(a0)
	bmi.s	loc_20528A
	tst.w	d0
	bpl.s	loc_205284
	asr.l	#2,d0

loc_205284:
	add.w	d0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_20528A:
	tst.w	d0
	bmi.s	loc_205290
	asr.l	#2,d0

loc_205290:
	add.w	d0,obj.ground_speed(a0)

locret_205294:
	rts

; ------------------------------------------------------------------------------

PlayerCheckFall:
	nop
	tst.b	obj.var_38(a0)
	bne.s	locret_2052D0
	tst.w	obj.var_3e(a0)
	bne.s	loc_2052D2
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	beq.s	locret_2052D0
	move.w	obj.ground_speed(a0),d0
	bpl.s	loc_2052BA
	neg.w	d0

loc_2052BA:
	cmpi.w	#$280,d0
	bcc.s	locret_2052D0
	clr.w	obj.ground_speed(a0)
	bset	#1,obj.flags(a0)
	move.w	#$1E,obj.var_3e(a0)

locret_2052D0:
	rts

; ------------------------------------------------------------------------------

loc_2052D2:
	subq.w	#1,obj.var_3e(a0)
	rts

; ------------------------------------------------------------------------------

PlayerResetAngle:
	btst	#1,obj.var_2c(a0)
	bne.s	locret_2052FA
	move.b	obj.angle(a0),d0
	beq.s	locret_2052FA
	bpl.s	loc_2052F0
	addq.b	#2,d0
	bcc.s	loc_2052EE
	moveq	#0,d0

loc_2052EE:
	bra.s	loc_2052F6

; ------------------------------------------------------------------------------

loc_2052F0:
	subq.b	#2,d0
	bcc.s	loc_2052F6
	moveq	#0,d0

loc_2052F6:
	move.b	d0,obj.angle(a0)

locret_2052FA:
	rts

; ------------------------------------------------------------------------------

PlayerBlockCollideAir:
	move.w	obj.x_speed(a0),d1
	move.w	obj.y_speed(a0),d2
	jsr	Atan2
	move.b	d0,debug_angle
	subi.b	#$20,d0
	move.b	d0,debug_angle_shift
	andi.b	#$C0,d0
	move.b	d0,debug_quadrant
	cmpi.b	#$40,d0
	beq.w	loc_2053E0
	cmpi.b	#$80,d0
	beq.w	loc_205442
	cmpi.b	#$C0,d0
	beq.w	loc_20549E
	bsr.w	PlayerCheckBlockLeft
	tst.w	d1
	bpl.s	loc_20534E
	sub.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)

loc_20534E:
	bsr.w	PlayerCheckBlockRight
	tst.w	d1
	bpl.s	loc_205360
	add.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)

loc_205360:
	bsr.w	PlayerCheckBlockDownWide
	move.b	d1,debug_floor_distance
	tst.w	d1
	bpl.s	locret_2053DE
	move.b	obj.y_speed(a0),d2
	addq.b	#8,d2
	neg.b	d2
	cmp.b	d2,d1
	bge.s	loc_20537E
	cmp.b	d2,d0
	blt.s	locret_2053DE

loc_20537E:
	add.w	d1,obj.y(a0)
	move.b	d3,obj.angle(a0)
	bsr.w	sub_205500
	move.b	#0,obj.anim_id(a0)
	move.b	d3,d0
	addi.b	#$20,d0
	andi.b	#$40,d0
	bne.s	loc_2053BC
	move.b	d3,d0
	addi.b	#$10,d0
	andi.b	#$20,d0
	beq.s	loc_2053AE
	asr	obj.y_speed(a0)
	bra.s	loc_2053D0

; ------------------------------------------------------------------------------

loc_2053AE:
	move.w	#0,obj.y_speed(a0)
	move.w	obj.x_speed(a0),obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_2053BC:
	move.w	#0,obj.x_speed(a0)
	cmpi.w	#$FC0,obj.y_speed(a0)
	ble.s	loc_2053D0
	move.w	#$FC0,obj.y_speed(a0)

loc_2053D0:
	move.w	obj.y_speed(a0),obj.ground_speed(a0)
	tst.b	d3
	bpl.s	locret_2053DE
	neg.w	obj.ground_speed(a0)

locret_2053DE:
	rts

; ------------------------------------------------------------------------------

loc_2053E0:
	bsr.w	PlayerCheckBlockLeft
	tst.w	d1
	bpl.s	loc_2053FA
	sub.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	obj.y_speed(a0),obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_2053FA:
	bsr.w	PlayerCheckBlockUpWide
	tst.w	d1
	bpl.s	loc_205414
	sub.w	d1,obj.y(a0)
	tst.w	obj.y_speed(a0)
	bpl.s	locret_205412
	move.w	#0,obj.y_speed(a0)

locret_205412:
	rts

; ------------------------------------------------------------------------------

loc_205414:
	tst.w	obj.y_speed(a0)
	bmi.s	locret_205440
	bsr.w	PlayerCheckBlockDownWide
	tst.w	d1
	bpl.s	locret_205440
	add.w	d1,obj.y(a0)
	move.b	d3,obj.angle(a0)
	bsr.w	sub_205500
	move.b	#0,obj.anim_id(a0)
	move.w	#0,obj.y_speed(a0)
	move.w	obj.x_speed(a0),obj.ground_speed(a0)

locret_205440:
	rts

; ------------------------------------------------------------------------------

loc_205442:
	bsr.w	PlayerCheckBlockLeft
	tst.w	d1
	bpl.s	loc_205454
	sub.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)

loc_205454:
	bsr.w	PlayerCheckBlockRight
	tst.w	d1
	bpl.s	loc_205466
	add.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)

loc_205466:
	bsr.w	PlayerCheckBlockUpWide
	tst.w	d1
	bpl.s	locret_20549C
	sub.w	d1,obj.y(a0)
	move.b	d3,d0
	addi.b	#$20,d0
	andi.b	#$40,d0
	bne.s	loc_205486
	move.w	#0,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_205486:
	move.b	d3,obj.angle(a0)
	bsr.w	PlayerSetGroundSteep
	move.w	obj.y_speed(a0),obj.ground_speed(a0)
	tst.b	d3
	bpl.s	locret_20549C
	neg.w	obj.ground_speed(a0)

locret_20549C:
	rts

; ------------------------------------------------------------------------------

loc_20549E:
	bsr.w	PlayerCheckBlockRight
	tst.w	d1
	bpl.s	loc_2054B8
	add.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	obj.y_speed(a0),obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_2054B8:
	bsr.w	PlayerCheckBlockUpWide
	tst.w	d1
	bpl.s	loc_2054D2
	sub.w	d1,obj.y(a0)
	tst.w	obj.y_speed(a0)
	bpl.s	locret_2054D0
	move.w	#0,obj.y_speed(a0)

locret_2054D0:
	rts

; ------------------------------------------------------------------------------

loc_2054D2:
	tst.w	obj.y_speed(a0)
	bmi.s	locret_2054FE
	bsr.w	PlayerCheckBlockDownWide
	tst.w	d1
	bpl.s	locret_2054FE
	add.w	d1,obj.y(a0)
	move.b	d3,obj.angle(a0)
	bsr.w	sub_205500
	move.b	#0,obj.anim_id(a0)
	move.w	#0,obj.y_speed(a0)
	move.w	obj.x_speed(a0),obj.ground_speed(a0)

locret_2054FE:
	rts

; ------------------------------------------------------------------------------

sub_205500:
	btst	#4,obj.flags(a0)
	beq.s	loc_20550A
	nop

loc_20550A:
	bclr	#5,obj.flags(a0)
	bclr	#1,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	btst	#2,obj.flags(a0)
	beq.s	loc_205556
	bclr	#2,obj.flags(a0)
	tst.b	shrunk_player
	beq.s	loc_205540
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	bra.s	loc_205550

; ------------------------------------------------------------------------------

loc_205540:
	move.b	#$13,obj.height(a0)
	move.b	#9,obj.width(a0)
	subq.w	#5,obj.y(a0)

loc_205550:
	move.b	#0,obj.anim_id(a0)

loc_205556:
	move.b	#0,obj.var_3c(a0)
	move.w	#0,score_chain
	rts

; ------------------------------------------------------------------------------

PlayerSetGroundSteep:
	bclr	#5,obj.flags(a0)
	bclr	#1,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	move.b	#0,obj.var_3c(a0)
	move.w	#0,score_chain
	rts

; ------------------------------------------------------------------------------

PlayerHurt:
	jsr	MoveObject
	addi.w	#$30,obj.y_speed(a0)
	btst	#6,obj.flags(a0)
	beq.s	loc_20559E
	subi.w	#$20,obj.y_speed(a0)

loc_20559E:
	bsr.w	sub_2055B4
	bsr.w	PlayerCheckBounds
	bsr.w	PlayerBufferPosition
	bsr.w	PlayerAnimate
	jmp	DrawObject

; ------------------------------------------------------------------------------

sub_2055B4:
	move.w	bottom_bound,d0
	addi.w	#$E0,d0
	cmp.w	obj.y(a0),d0
	bcs.w	KillPlayer
	bsr.w	PlayerBlockCollideAir
	btst	#1,obj.flags(a0)
	bne.s	locret_2055EE
	moveq	#0,d0
	move.w	d0,obj.y_speed(a0)
	move.w	d0,obj.x_speed(a0)
	move.w	d0,obj.ground_speed(a0)
	move.b	#0,obj.anim_id(a0)
	subq.b	#2,obj.routine(a0)
	move.w	#$78,obj.var_30(a0)

locret_2055EE:
	rts

; ------------------------------------------------------------------------------

PlayerDead:
	bsr.w	sub_205608
	jsr	MoveObjectFall
	bsr.w	PlayerBufferPosition
	bsr.w	PlayerAnimate
	jmp	DrawObject

; ------------------------------------------------------------------------------

sub_205608:
	move.w	bottom_bound,d0
	addi.w	#$100,d0
	cmp.w	obj.y(a0),d0
	bcc.w	locret_205676
	move.w	#$FFC8,obj.y_speed(a0)
	addq.b	#2,obj.routine(a0)
	clr.b	update_hud_time
	addq.b	#1,update_hud_lives
	subq.b	#1,lives
	bpl.s	loc_20563C
	clr.b	lives

loc_20563C:
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.s	loc_205656
	tst.b	time_attack
	beq.s	loc_205656
	move.b	#0,lives
	bra.s	loc_205670

; ------------------------------------------------------------------------------

loc_205656:
	jsr	SpawnObject
	move.b	#$3B,0(a1)
	move.w	#$1E0,obj.var_3a(a0)
	tst.b	lives
	beq.s	locret_205676

loc_205670:
	move.w	#$3C,obj.var_3a(a0)

locret_205676:
	rts

; ------------------------------------------------------------------------------

PlayerRestart:
	tst.w	obj.var_3a(a0)
	beq.w	locret_2056E6
	subq.w	#1,obj.var_3a(a0)
	bne.w	locret_2056E6
	move.w	#1,restart_stage
	bsr.w	ResetObjectStates
	clr.l	flower_counts
	tst.b	respawn_checkpoint
	bne.s	loc_2056B4
	cmpi.b	#1,time_zone
	bne.s	loc_2056B4
	bclr	#1,stage_start_flags

loc_2056B4:
	move.w	#$E,d0
	tst.b	lives
	beq.s	loc_2056E2
	cmpi.b	#1,time_zone
	bne.s	loc_2056DC
	tst.b	respawn_checkpoint
	beq.s	loc_2056E2
	move.b	#1,spawn_mode
	bra.s	loc_2056E2

; ------------------------------------------------------------------------------

loc_2056DC:
	clr.b	spawn_mode

loc_2056E2:
	bra.w	SubCpuCommand

; ------------------------------------------------------------------------------

locret_2056E6:
	rts

; ------------------------------------------------------------------------------

PlayerCheckChunk:
	rts

; ------------------------------------------------------------------------------

	cmpi.b	#5,zone
	beq.s	loc_205708
	cmpi.b	#2,zone
	beq.s	loc_205708
	tst.b	zone
	bne.w	locret_2057CC

loc_205708:
	move.w	obj.y(a0),d0
	lsr.w	#1,d0
	andi.w	#$380,d0
	move.b	obj.x(a0),d1
	andi.w	#$7F,d1
	add.w	d1,d0
	lea	stage_map,a1
	move.b	(a1,d0.w),d1
	cmp.b	roll_chunk_1,d1
	bne.s	loc_205746
	tst.b	zone
	bne.w	loc_2057CE
	move.w	obj.y(a0),d0
	andi.w	#$FF,d0
	cmpi.w	#$90,d0
	bcc.w	loc_2057CE
	bra.s	loc_20574E

; ------------------------------------------------------------------------------

loc_205746:
	cmp.b	roll_chunk_2,d1
	beq.w	loc_2057CE

loc_20574E:
	cmp.b	loop_chunk_1,d1
	beq.s	locret_20577E
	cmp.b	loop_chunk_2,d1
	beq.s	loc_205762
	bclr	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_205762:
	cmpi.b	#5,zone
	beq.w	loc_2057DE
	btst	#1,obj.flags(a0)
	beq.s	locret_20577E
	bclr	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

locret_20577E:
	rts

; ------------------------------------------------------------------------------

	move.w	obj.x(a0),d2
	cmpi.b	#$2C,d2
	bcc.s	loc_205792
	bclr	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_205792:
	cmpi.b	#$E0,d2
	bcs.s	loc_2057A0
	bset	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_2057A0:
	btst	#6,obj.sprite_flags(a0)
	bne.s	loc_2057BC
	move.b	obj.angle(a0),d1
	beq.s	locret_2057CC
	cmpi.b	#$80,d1
	bhi.s	locret_2057CC
	bset	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_2057BC:
	move.b	obj.angle(a0),d1
	cmpi.b	#$80,d1
	bls.s	locret_2057CC
	bclr	#6,obj.sprite_flags(a0)

locret_2057CC:
	rts

; ------------------------------------------------------------------------------

loc_2057CE:
	jmp	PlayerStartRoll

; ------------------------------------------------------------------------------

loc_2057DE:
	tst.w	obj.y_speed(a0)
	bmi.s	locret_205822
	move.w	obj.y(a0),d1
	andi.w	#$FF,d1
	move.w	obj.x(a0),d0
	andi.w	#$FF,d0
	cmpi.w	#$80,d0
	bcc.s	loc_205816
	cmpi.w	#$38,d1
	bcs.s	loc_20580E
	cmpi.w	#$80,d1
	bcs.s	locret_205822

loc_205806:
	bclr	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_20580E:
	bset	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_205816:
	cmpi.w	#$38,d1
	bcs.s	loc_205806
	cmpi.w	#$80,d1
	bcc.s	loc_20580E

locret_205822:
	rts

; ------------------------------------------------------------------------------

PlayerAnimate:
	lea	PlayerAnims,a1
	moveq	#0,d0
	move.b	obj.anim_id(a0),d0
	cmp.b	obj.prev_anim_id(a0),d0
	beq.s	loc_205846
	move.b	d0,obj.prev_anim_id(a0)
	move.b	#0,obj.anim_index(a0)
	move.b	#0,obj.anim_timer(a0)

loc_205846:
	bsr.w	sub_205AB6
	add.w	d0,d0
	adda.w	(a1,d0.w),a1
	move.b	(a1),d0
	bmi.s	loc_2058BE
	move.b	obj.flags(a0),d1
	andi.b	#1,d1
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d1,obj.sprite_flags(a0)
	subq.b	#1,obj.anim_timer(a0)
	bpl.s	locret_20588C
	move.b	d0,obj.anim_timer(a0)

; ------------------------------------------------------------------------------

sub_205870:
	moveq	#0,d1
	move.b	obj.anim_index(a0),d1
	move.b	1(a1,d1.w),d0
	beq.s	loc_205884
	bpl.s	loc_205884
	cmpi.b	#$FD,d0
	bge.s	loc_20588E

loc_205884:
	move.b	d0,obj.sprite_frame(a0)
	addq.b	#1,obj.anim_index(a0)

locret_20588C:
	rts

; ------------------------------------------------------------------------------

loc_20588E:
	addq.b	#1,d0
	bne.s	loc_20589E
	move.b	#0,obj.anim_index(a0)
	move.b	1(a1),d0
	bra.s	loc_205884

; ------------------------------------------------------------------------------

loc_20589E:
	addq.b	#1,d0
	bne.s	loc_2058B2
	move.b	2(a1,d1.w),d0
	sub.b	d0,obj.anim_index(a0)
	sub.b	d0,d1
	move.b	1(a1,d1.w),d0
	bra.s	loc_205884

; ------------------------------------------------------------------------------

loc_2058B2:
	addq.b	#1,d0
	bne.s	locret_2058BC
	move.b	2(a1,d1.w),obj.anim_id(a0)

locret_2058BC:
	rts

; ------------------------------------------------------------------------------

loc_2058BE:
	subq.b	#1,obj.anim_timer(a0)
	bpl.s	locret_20588C
	addq.b	#1,d0
	bne.w	loc_205978
	tst.b	shrunk_player
	bne.w	loc_205A40
	moveq	#0,d1
	move.b	obj.angle(a0),d0
	move.b	obj.flags(a0),d2
	andi.b	#1,d2
	bne.s	loc_2058E6
	not.b	d0

loc_2058E6:
	btst	#1,obj.var_2c(a0)
	bne.s	loc_2058F4
	addi.b	#$10,d0
	bra.s	loc_2058F6

; ------------------------------------------------------------------------------

loc_2058F4:
	addq.b	#8,d0

loc_2058F6:
	bpl.s	loc_2058FA
	moveq	#3,d1

loc_2058FA:
	andi.b	#$FC,obj.sprite_flags(a0)
	eor.b	d1,d2
	or.b	d2,obj.sprite_flags(a0)
	btst	#5,obj.flags(a0)
	bne.w	loc_2059EC
	move.w	obj.ground_speed(a0),d2
	bpl.s	loc_205918
	neg.w	d2

loc_205918:
	btst	#1,obj.var_2c(a0)
	beq.s	loc_205930
	lsr.b	#4,d0
	lsl.b	#1,d0
	andi.b	#$E,d0
	lea	PlayerRun3dAnim,a1
	bra.s	loc_20595A

; ------------------------------------------------------------------------------

loc_205930:
	lsr.b	#4,d0
	andi.b	#6,d0
	lea	PlayerPeeloutAnim,a1
	cmpi.w	#$A00,d2
	bcc.s	loc_20595A
	lea	PlayerRunAnim,a1
	cmpi.w	#$600,d2
	bcc.s	loc_20595A
	lea	PlayerWalkAnim,a1
	move.b	d0,d1
	lsr.b	#1,d1
	add.b	d1,d0

loc_20595A:
	add.b	d0,d0
	move.b	d0,d3
	neg.w	d2
	addi.w	#$800,d2
	bpl.s	loc_205968
	moveq	#0,d2

loc_205968:
	lsr.w	#8,d2
	move.b	d2,obj.anim_timer(a0)
	bsr.w	sub_205870
	add.b	d3,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

loc_205978:
	addq.b	#1,d0
	bne.s	loc_2059E8
	move.w	obj.ground_speed(a0),d2
	bpl.s	loc_205984
	neg.w	d2

loc_205984:
	lea	PlayerRollShrunkAnim,a1
	tst.b	shrunk_player
	bne.s	loc_2059C2
	lea	PlayerRollFastAnim,a1
	btst	#1,obj.var_2c(a0)
	beq.s	loc_2059B6
	move.b	obj.angle(a0),d0
	addi.b	#$10,d0
	andi.b	#$C0,d0
	beq.s	loc_2059C2
	lea	PlayerRoll3dAnim,a1
	bra.s	loc_2059C2

; ------------------------------------------------------------------------------

loc_2059B6:
	cmpi.w	#$600,d2
	bcc.s	loc_2059C2
	lea	PlayerRollAnim,a1

loc_2059C2:
	neg.w	d2
	addi.w	#$400,d2
	bpl.s	loc_2059CC
	moveq	#0,d2

loc_2059CC:
	lsr.w	#8,d2
	move.b	d2,obj.anim_timer(a0)
	move.b	obj.flags(a0),d1
	andi.b	#1,d1
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d1,obj.sprite_flags(a0)
	bra.w	sub_205870

; ------------------------------------------------------------------------------

loc_2059E8:
	addq.b	#1,d0
	bne.s	loc_205A2C

loc_2059EC:
	move.w	obj.ground_speed(a0),d2
	bmi.s	loc_2059F4
	neg.w	d2

loc_2059F4:
	addi.w	#$800,d2
	bpl.s	loc_2059FC
	moveq	#0,d2

loc_2059FC:
	lsr.w	#6,d2
	move.b	d2,obj.anim_timer(a0)
	lea	PlayerPushShrunkAnim,a1
	tst.b	shrunk_player
	bne.s	loc_205A16
	lea	PlayerPushAnim,a1

loc_205A16:
	move.b	obj.flags(a0),d1
	andi.b	#1,d1
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d1,obj.sprite_flags(a0)
	bra.w	sub_205870

; ------------------------------------------------------------------------------

loc_205A2C:
	moveq	#0,d1
	move.b	obj.anim_index(a0),d1
	move.b	1(a1,d1.w),obj.sprite_frame(a0)
	move.b	#0,obj.anim_timer(a0)
	rts

; ------------------------------------------------------------------------------

loc_205A40:
	moveq	#0,d1
	move.b	obj.angle(a0),d0
	move.b	obj.flags(a0),d2
	andi.b	#1,d2
	bne.s	loc_205A52
	not.b	d0

loc_205A52:
	addi.b	#$10,d0
	bpl.s	loc_205A5A
	moveq	#0,d1

loc_205A5A:
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d2,obj.sprite_flags(a0)
	addi.b	#$30,d0
	cmpi.b	#$60,d0
	bcs.s	loc_205A88
	bset	#2,obj.flags(a0)
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	move.b	#$FF,d0
	bra.w	loc_205978

; ------------------------------------------------------------------------------

loc_205A88:
	move.w	obj.ground_speed(a0),d2
	bpl.s	loc_205A90
	neg.w	d2

loc_205A90:
	lea	PlayerRunShrunkAnim,a1
	cmpi.w	#$600,d2
	bcc.s	loc_205AA2
	lea	PlayerWalkShrunkAnim,a1

loc_205AA2:
	neg.w	d2
	addi.w	#$800,d2
	bpl.s	loc_205AAC
	moveq	#0,d2

loc_205AAC:
	lsr.w	#8,d2
	move.b	d2,obj.anim_timer(a0)
	bra.w	sub_205870

; ------------------------------------------------------------------------------

sub_205AB6:
	tst.b	shrunk_player
	beq.s	locret_205AC2
	move.b	byte_205AC4(pc,d0.w),d0

locret_205AC2:
	rts

; ------------------------------------------------------------------------------

byte_205AC4:
	dc.b	$21
	dc.b	$18
	dc.b	$23
	dc.b	$23
	dc.b	$27
	dc.b	$1F
	dc.b	$26
	dc.b	$28
	dc.b	$20
	dc.b	9
	dc.b	$A
	dc.b	$B
	dc.b	$C
	dc.b	$24
	dc.b	$E
	dc.b	$F
	dc.b	$28
	dc.b	$11
	dc.b	$12
	dc.b	$13
	dc.b	$14
	dc.b	$15
	dc.b	$16
	dc.b	$17
	dc.b	$18
	dc.b	$19
	dc.b	$25
	dc.b	$25
	dc.b	$1C
	dc.b	$1D
	dc.b	$1E
	dc.b	$1F
	dc.b	$20
	dc.b	$21
	dc.b	$22
	dc.b	$23
	dc.b	$24
	dc.b	$25
	dc.b	$26
	dc.b	$27
	dc.b	$28
	dc.b	$29
	dc.b	$2A
	dc.b	$30
	dc.b	$2C
	dc.b	$2D
	dc.b	$2E
	dc.b	$2F
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	$39
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

PlayerAnims:
	include	"anims/r6/player.asm"
	even

; ------------------------------------------------------------------------------

LoadPlayerGfx:
	tst.b	(a0)
	beq.w	locret_205DBC
	lea	player_sprite_frame,a2
	moveq	#0,d0
	move.b	obj.sprite_frame(a0),d0
	cmp.b	(a2),d0
	beq.s	locret_205DBC
	move.b	d0,(a2)
	lea	PlayerGfxScript,a2
	add.w	d0,d0
	adda.w	(a2,d0.w),a2
	moveq	#0,d1
	move.w	(a2)+,d1
	subq.b	#1,d1
	bmi.s	locret_205DBC
	lea	player_gfx,a3
	move.b	#1,update_player_gfx

loc_205D8E:
	moveq	#0,d2
	move.b	(a2)+,d2
	move.w	d2,d0
	lsr.b	#4,d0
	lsl.w	#8,d2
	move.b	(a2)+,d2
	andi.w	#$FFF,d2
	lsl.l	#5,d2
	lea	PlayerGfx,a1
	adda.l	d2,a1

loc_205DA8:
	movem.l	(a1)+,d2-d6/a4-a6
	movem.l	d2-d6/a4-a6,(a3)
	lea	$20(a3),a3
	dbf	d0,loc_205DA8
	dbf	d1,loc_205D8E

locret_205DBC:
	rts

; ------------------------------------------------------------------------------

PlayerCheckFlipper:
	moveq	#0,d0
	move.b	obj.var_3d(a0),d0
	lsl.w	#6,d0
	addi.l	#object_pool&$FFFFFF,d0
	movea.l	d0,a1
	cmpi.b	#$1E,obj.id(a1)
	bne.s	locret_205E28
	move.b	#1,obj.anim_id(a1)
	move.w	obj.x(a1),d1
	move.w	obj.y(a1),d2
	addi.w	#$18,d2
	sub.w	obj.x(a0),d1
	sub.w	obj.y(a0),d2
	jsr	Atan2
	moveq	#0,d2
	move.b	obj.width_2(a1),d2
	move.w	obj.x(a0),d3
	sub.w	obj.x(a1),d3
	add.w	d2,d3
	btst	#0,obj.flags(a1)
	bne.s	loc_205E16
	move.w	#$40,d1
	sub.w	d3,d1
	move.w	d1,d3

loc_205E16:
	move.w	#-$A00,d2
	move.w	d2,d1
	ext.l	d1
	muls.w	d3,d1
	divs.w	#$40,d1
	add.w	d1,d2
	moveq	#0,d1

locret_205E28:
	rts

; ------------------------------------------------------------------------------
