; ------------------------------------------------------------------------------

PlayerCheckBored:
	lea	bored_timer,a1
	cmpi.b	#5,obj.anim_id(a0)
	beq.s	PlayerCheckBoredActive
	move.w	#0,(a1)
	rts

; ------------------------------------------------------------------------------

PlayerCheckBoredActive:
	tst.w	(a1)
	bne.s	PlayerCheckBoredStartTimer
	move.b	#1,1(a1)

PlayerCheckBoredStartTimer:
	cmpi.w	#$2A30,(a1)
	bcs.s	PlayerCheckBoredReturn
	move.w	#0,(a1)
	move.b	#$2B,obj.anim_id(a0)
	ori.b	#$80,obj.sprite_tile(a0)
	move.b	#0,obj.sprite_layer(a0)
	move.b	#1,lives
	move.w	#$FB00,obj.y_speed(a0)
	move.w	#$100,obj.x_speed(a0)
	btst	#0,obj.flags(a0)
	beq.s	PlayerCheckBoredLaunch
	neg.w	obj.x_speed(a0)

PlayerCheckBoredLaunch:
	move.w	#0,obj.ground_speed(a0)
	move.w	#$79,d0
	bra.w	SubCpuCommand

; ------------------------------------------------------------------------------

PlayerCheckBoredReturn:
	rts

; ------------------------------------------------------------------------------

PlayerObject:
	tst.b	time_attack
	bne.s	PlayerObjectCheckDebug
	cmpa.w	#player_object_2,a0
	beq.s	PlayerObjectCheckDebug
	tst.b	debug_mode
	beq.s	PlayerObjectCheckDebug
	jmp	DebugModeLegacy

; ------------------------------------------------------------------------------

PlayerObjectCheckDebug:
	move.b	obj.var_2a(a0),d0
	beq.s	PlayerObjectDispatch
	addq.b	#1,d0
	btst	#2,obj.flags(a0)
	beq.s	PlayerObjectAirborneTimerCap
	cmpi.b	#$2D,d0
	bcs.s	PlayerObjectStoreTimer
	move.b	#$2D,d0
	bra.s	PlayerObjectStoreTimer

; ------------------------------------------------------------------------------

PlayerObjectAirborneTimerCap:
	cmpi.b	#$1E,d0
	bcs.s	PlayerObjectStoreTimer
	move.b	#$1E,d0

PlayerObjectStoreTimer:
	move.b	d0,obj.var_2a(a0)

PlayerObjectDispatch:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	PlayerObjectRoutineDispatchTable(pc,d0.w),d1
	jmp	PlayerObjectRoutineDispatchTable(pc,d1.w)

; ------------------------------------------------------------------------------

PlayerObjectRoutineDispatchTable:
	dc.w	PlayerInit-*
	dc.w	PlayerMain-PlayerObjectRoutineDispatchTable
	dc.w	PlayerHurt-PlayerObjectRoutineDispatchTable
	dc.w	PlayerDead-PlayerObjectRoutineDispatchTable
	dc.w	PlayerRestart-PlayerObjectRoutineDispatchTable

; ------------------------------------------------------------------------------

PlayerMakeWarpStars:
	tst.b	warp_object_1+obj.id
	bne.s	PlayerMakeWarpStarsReturn
	move.b	#1,warping
	move.b	#3,warp_object_1+obj.id
	move.b	#5,warp_object_1+obj.anim_id
	move.b	#3,warp_object_2+obj.id
	move.b	#6,warp_object_2+obj.anim_id
	move.b	#3,warp_object_3+obj.id
	move.b	#7,warp_object_3+obj.anim_id
	move.b	#3,warp_object_4+obj.id
	move.b	#8,warp_object_4+obj.anim_id

PlayerMakeWarpStarsReturn:
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
	beq.s	PlayerInitShrunkDimensions
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)

PlayerInitShrunkDimensions:
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
	bne.s	PlayerMakeSplashReturn
	move.b	stage_frames+1,d0
	andi.b	#3,d0
	bne.s	PlayerMakeSplashReturn
	move.b	obj.height(a0),d2
	ext.w	d2
	add.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	bsr.w	PlayerGetChunk
	cmpi.b	#$2F,d1
	bne.s	PlayerMakeSplashWrongChunkReturn
	cmpi.w	#$15C0,obj.x(a0)
	bcc.s	PlayerMakeSplashReturn
	tst.b	obj.var_2c(a0)
	beq.s	PlayerMakeSplashReturn
	jsr	SpawnObject
	bne.s	PlayerMakeSplashReturn
	move.b	#$E,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	moveq	#1,d0
	tst.w	obj.x_speed(a0)
	bmi.s	PlayerMakeSplashSetDirection
	moveq	#0,d0

PlayerMakeSplashSetDirection:
	move.b	d0,1(a1)
	move.b	d0,$22(a1)

PlayerMakeSplashReturn:
	rts

; ------------------------------------------------------------------------------

PlayerMakeSplashWrongChunkReturn:
	rts

; ------------------------------------------------------------------------------

PlayerUnknown2:
	move.b	obj.height(a0),d2
	ext.w	d2
	add.w	$C(a0),d2
	cmpi.b	#$10,d1
	bne.s	PlayerUnknown2CheckAlternateChunk
	cmpi.w	#$210,d2
	bcc.s	PlayerMakeSplashReturn
	cmpi.w	#$208,d2
	bcs.s	PlayerMakeSplashReturn
	bra.s	PlayerUnknown2SpawnSplash

; ------------------------------------------------------------------------------

PlayerUnknown2CheckAlternateChunk:
	cmpi.b	#$21,d1
	bne.s	PlayerMakeSplashReturn
	cmpi.w	#$2A0,d2
	bcc.s	PlayerMakeSplashReturn
	cmpi.w	#$298,d2
	bcs.s	PlayerMakeSplashReturn

PlayerUnknown2SpawnSplash:
	tst.w	obj.ground_speed(a0)
	beq.s	PlayerMakeSplashReturn
	jsr	SpawnObject
	bne.s	PlayerMakeSplashReturn
	move.b	#$B,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	andi.w	#$FFF8,d2
	move.w	d2,obj.y(a1)
	move.b	#1,obj.subtype(a1)
	move.w	obj.ground_speed(a0),d0
	bpl.s	PlayerUnknown2SpeedCheck
	neg.w	d0

PlayerUnknown2SpeedCheck:
	cmpi.w	#$600,d0
	bcc.s	PlayerUnknown2PlaySound
	move.b	#2,obj.subtype(a1)

PlayerUnknown2PlaySound:
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
	beq.s	PlayerCheckPoleReturn
	cmpi.b	#4,obj.routine(a0)
	bcc.s	PlayerCheckPoleReturn
	btst	#3,obj.var_2c(a0)
	bne.s	PlayerCheckPoleReturn
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	cmpi.w	#$103,d0
	bne.s	PlayerCheckPoleReturn
	bset	#3,obj.var_2c(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#-$200,d0
	tst.w	obj.y_speed(a0)
	bmi.s	PlayerCheckPoleSetVerticalSpeed
	neg.w	d0

PlayerCheckPoleSetVerticalSpeed:
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

PlayerCheckPoleReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckHangBar:
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.w	PlayerCheckHangBarReturn
	cmpi.b	#2,spawn_mode
	beq.w	PlayerCheckHangBarReturn
	btst	#0,obj.var_2c(a0)
	bne.s	PlayerCheckHangBarReturn
	btst	#2,obj.var_2c(a0)
	bne.s	PlayerCheckHangBarReturn
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	subi.w	#$18,d2
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	cmpi.w	#$159,d0
	bne.s	PlayerCheckHangBarReturn
	move.w	warp_timer,d0
	beq.s	PlayerCheckHangBarAttach
	clr.w	warp_timer
	clr.b	warping
	cmpi.w	#$5A,d0
	bcs.s	PlayerCheckHangBarAttach
	clr.b	warp_direction

PlayerCheckHangBarAttach:
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

PlayerCheckHangBarReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckBeam:
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.w	PlayerCheckBeamReturn
	cmpi.b	#4,obj.routine(a0)
	bcc.s	PlayerCheckBeamReturn
	tst.b	warping
	bne.s	PlayerCheckBeamReturn
	tst.b	invincible
	bne.s	PlayerCheckBeamReturn
	tst.w	obj.var_30(a0)
	bne.s	PlayerCheckBeamReturn
	moveq	#0,d0
	move.b	r6_beam_mode,d0
	beq.s	PlayerCheckBeamReturn
	subq.b	#1,d0
	add.w	d0,d0
	move.w	BeamBlocks(pc,d0.w),d0
	lea	BeamBlocks(pc,d0.w),a3
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0


PlayerCheckBeamFindBlock:
	move.w	(a3)+,d1
	bmi.s	PlayerCheckBeamReturn
	cmp.w	d1,d0
	bne.s	PlayerCheckBeamFindBlock
	bra.w	HurtPlayer

; ------------------------------------------------------------------------------

PlayerCheckBeamReturn:
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
	beq.w	PlayerCheckSparksReturn
	tst.b	warping
	bne.w	PlayerCheckSparksReturn
	tst.b	invincible
	bne.w	PlayerCheckSparksReturn
	cmpi.w	#$980,obj.x(a0)
	bcs.s	PlayerCheckSparksCheckBoss
	cmpi.w	#$A20,obj.x(a0)
	bcs.w	PlayerCheckSparksReturn

PlayerCheckSparksCheckBoss:
	btst	#7,boss_flags
	bne.w	PlayerCheckSparksReturn
	tst.w	obj.var_30(a0)
	bne.s	PlayerCheckSparksReturn
	cmpi.b	#2,act
	bne.s	PlayerCheckSparksCheckTimeZone
	cmpi.w	#$A10,obj.x(a0)
	bcs.s	PlayerCheckSparksCheckBlock
	tst.b	boss_music
	beq.s	PlayerCheckSparksReturn
	tst.b	good_future
	bne.s	PlayerCheckSparksCheckAnimation
	bra.s	PlayerCheckSparksCheckBlock

; ------------------------------------------------------------------------------

PlayerCheckSparksCheckTimeZone:
	cmpi.b	#2,time_zone
	bne.s	PlayerCheckSparksCheckBlock
	tst.b	good_future
	beq.s	PlayerCheckSparksCheckBlock

PlayerCheckSparksCheckAnimation:
	tst.b	stage_anim_frames+2
	beq.s	PlayerCheckSparksReturn

PlayerCheckSparksCheckBlock:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	moveq	#2,d6
	lea	PlayerCheckSparksBlocksNormal,a1
	cmpi.b	#2,time_zone
	bne.s	PlayerCheckSparksSelectAlternate
	tst.b	good_future
	bne.s	PlayerCheckSparksSelectAlternate
	lea	PlayerCheckSparksBlocksAlternate,a1

PlayerCheckSparksSelectAlternate:
	cmp.w	(a1)+,d0
	beq.w	HurtPlayer
	dbf	d6,PlayerCheckSparksSelectAlternate

PlayerCheckSparksReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckSparksBlocksNormal:
	dc.w	$243
	dc.w	$244
	dc.w	$245

PlayerCheckSparksBlocksAlternate:
	dc.w	$287
	dc.w	$288
	dc.w	$289

; ------------------------------------------------------------------------------

PlayerCheckBounce:
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.w	PlayerCheckBounceReturn
	tst.b	boss_flags
	bne.w	PlayerCheckBounceReturn
	cmpi.b	#2,time_zone
	bcc.s	PlayerCheckBounceCheckBlocks
	move.b	#$3C,d0
	tst.b	time_zone
	beq.s	PlayerCheckBounceCheckPalette
	addi.b	#$1E,d0

PlayerCheckBounceCheckPalette:
	cmp.b	palette_cycle_steps+3,d0
	beq.w	PlayerCheckBounceReturn

PlayerCheckBounceCheckBlocks:
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
	beq.s	PlayerCheckBounceApply
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
	bne.s	PlayerCheckBounceReturn

PlayerCheckBounceApply:
	move.w	#-$1600,obj.y_speed(a0)
	bset	#1,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	clr.b	obj.var_3c(a0)
	bset	#2,obj.flags(a0)
	bne.s	PlayerCheckBounceReturn
	move.b	#$E,obj.height(a0)
	move.b	#7,obj.width(a0)
	addq.w	#5,obj.y(a0)
	move.b	#2,obj.anim_id(a0)
	move.w	#$DA,d0
	jsr	PlayFmSound

PlayerCheckBounceReturn:
	rts

; ------------------------------------------------------------------------------

PlayerExtendedCamera:
	rts

; ------------------------------------------------------------------------------

	move.w	scroll_focus_x,d1
	move.w	obj.ground_speed(a0),d0
	bpl.s	PlayerExtendedCameraCheckSpeed
	neg.w	d0

PlayerExtendedCameraCheckSpeed:
	btst	#1,obj.var_2c(a0)
	bne.s	PlayerExtendedCameraCenter
	cmpi.w	#$600,d0
	bcs.s	PlayerExtendedCameraCenter
	tst.w	obj.ground_speed(a0)
	bpl.s	PlayerExtendedCameraMoveLeft
	addq.w	#2,d1
	cmpi.w	#$E0,d1
	bcs.s	PlayerExtendedCameraCommitFocus
	move.w	#$E0,d1
	bra.s	PlayerExtendedCameraCommitFocus

; ------------------------------------------------------------------------------

PlayerExtendedCameraMoveLeft:
	subq.w	#2,d1
	cmpi.w	#$60,d1
	bcc.s	PlayerExtendedCameraCommitFocus
	move.w	#$60,d1
	bra.s	PlayerExtendedCameraCommitFocus

; ------------------------------------------------------------------------------

PlayerExtendedCameraCenter:
	cmpi.w	#$A0,d1
	beq.s	PlayerExtendedCameraCommitFocus
	bcc.s	PlayerExtendedCameraMoveLeftToCenter
	addq.w	#2,d1
	bra.s	PlayerExtendedCameraCommitFocus

; ------------------------------------------------------------------------------

PlayerExtendedCameraMoveLeftToCenter:
	subq.w	#2,d1

PlayerExtendedCameraCommitFocus:
	move.w	d1,scroll_focus_x
	rts

; ------------------------------------------------------------------------------

PlayerMain:
	bsr.s	PlayerExtendedCamera
	bsr.w	PlayerMakeSplash
	tst.w	debug_cheat
	beq.s	PlayerMainInput
	btst	#4,p1_joy_tap
	beq.s	PlayerMainInput
	move.b	#1,debug_mode
	rts

; ------------------------------------------------------------------------------

PlayerMainInput:
	tst.b	control_locked
	bne.s	PlayerMainDispatch
	move.w	p1_joy_hold,player_joy_hold

PlayerMainDispatch:
	btst	#0,obj.var_2c(a0)
	beq.s	PlayerMainUpdateState
	bsr.w	PlayerCheckWarp
	bra.s	PlayerMainUpdateObjects

; ------------------------------------------------------------------------------

PlayerMainUpdateState:
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

PlayerMainUpdateObjects:
	bsr.s	PlayerUpdatePowerups
	bsr.w	PlayerBufferPosition
	move.b	collide_angle_1,obj.var_36(a0)
	move.b	collide_angle_2,obj.var_37(a0)
	bsr.w	PlayerAnimate
	tst.b	obj.var_2c(a0)
	bmi.s	PlayerMainCheckChunk
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.s	PlayerMainCheckChunk
	jsr	PlayerObjectCollide

PlayerMainCheckChunk:
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
	bcc.s	PlayerUpdatePowerupsCheckInvincibility
	move.w	obj.var_30(a0),d0
	beq.s	PlayerUpdatePowerupsDrawTimer
	subq.w	#1,obj.var_30(a0)
	lsr.w	#3,d0
	bcc.s	PlayerUpdatePowerupsCheckInvincibility

PlayerUpdatePowerupsDrawTimer:
	btst	#6,obj.var_2c(a0)
	bne.s	PlayerUpdatePowerupsCheckInvincibility
	jsr	DrawObject

PlayerUpdatePowerupsCheckInvincibility:
	tst.b	invincible
	beq.s	PlayerUpdatePowerupsCheckSpeedShoes
	tst.w	obj.var_32(a0)
	beq.s	PlayerUpdatePowerupsCheckSpeedShoes
	subq.w	#1,obj.var_32(a0)
	bne.s	PlayerUpdatePowerupsCheckSpeedShoes
	tst.b	speed_shoes
	bne.s	PlayerUpdatePowerupsEndInvincibility
	tst.b	boss_music
	bne.s	PlayerUpdatePowerupsEndInvincibility
	tst.b	time_zone
	bne.s	PlayerUpdatePowerupsRestoreMusic
	move.w	#$E,d0
	jsr	SubCpuCommand

PlayerUpdatePowerupsRestoreMusic:
	jsr	PlayStageMusic

PlayerUpdatePowerupsEndInvincibility:
	move.b	#0,invincible

PlayerUpdatePowerupsCheckSpeedShoes:
	tst.b	speed_shoes
	beq.s	PlayerUpdatePowerupsReturn
	tst.w	obj.var_34(a0)
	beq.s	PlayerUpdatePowerupsReturn
	subq.w	#1,obj.var_34(a0)
	bne.s	PlayerUpdatePowerupsReturn
	move.w	#$600,player_max_speed
	move.w	#$C,player_acceleration
	move.w	#$80,player_deceleration
	tst.b	invincible
	bne.s	PlayerUpdatePowerupsEndSpeedShoes
	tst.b	boss_music
	bne.s	PlayerUpdatePowerupsEndSpeedShoes
	tst.b	time_zone
	bne.s	PlayerUpdatePowerupsRestoreSpeedMusic
	move.w	#$E,d0
	jsr	SubCpuCommand

PlayerUpdatePowerupsRestoreSpeedMusic:
	jsr	PlayStageMusic

PlayerUpdatePowerupsEndSpeedShoes:
	move.b	#0,speed_shoes

PlayerUpdatePowerupsReturn:
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
	bcs.s	SetPlayerWarpRespawnClampTime
	move.l	#$50000,d0

SetPlayerWarpRespawnClampTime:
	move.l	d0,warp_time
	rts

; ------------------------------------------------------------------------------

PlayerCheckWarp:
	tst.b	obj.var_2a(a0)
	bne.w	PlayerCheckWarpReturn
	tst.b	warp_direction
	beq.w	PlayerCheckWarpReturn
	move.w	#$600,d2
	moveq	#0,d0
	move.w	obj.ground_speed(a0),d0
	bpl.s	PlayerCheckWarpGetSpeed
	neg.w	d0

PlayerCheckWarpGetSpeed:
	tst.w	warp_timer
	bne.s	PlayerCheckWarpStartTimer
	move.w	#1,warp_timer

PlayerCheckWarpStartTimer:
	move.w	warp_timer,d1
	cmpi.w	#$E6,d1
	bcs.s	PlayerCheckWarpTransition
	move.b	#1,restart_stage
	bra.w	FadeOutMusic

; ------------------------------------------------------------------------------

PlayerCheckWarpTransition:
	cmpi.w	#$D2,d1
	bcs.s	PlayerCheckWarpDecelerate
	cmpi.b	#2,spawn_mode
	beq.s	PlayerCheckWarpTransitionReturn
	move.b	#1,scroll_lock
	move.b	time_zone,d0
	bne.s	PlayerCheckWarpSetDirection
	move.w	#$82,d0
	jsr	SubCpuCommand
	moveq	#0,d0

PlayerCheckWarpSetDirection:
	add.b	warp_direction,d0
	bpl.s	PlayerCheckWarpClampZone
	moveq	#0,d0
	bra.s	PlayerCheckWarpStoreZone

; ------------------------------------------------------------------------------

PlayerCheckWarpClampZone:
	cmpi.b	#3,d0
	bcs.s	PlayerCheckWarpStoreZone
	moveq	#2,d0

PlayerCheckWarpStoreZone:
	bset	#7,d0
	move.b	d0,time_zone
	bsr.w	SetPlayerWarpRespawn
	move.b	#2,spawn_mode

PlayerCheckWarpTransitionReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckWarpDecelerate:
	cmpi.w	#$5A,d1
	bcc.s	PlayerCheckWarpFinish
	cmp.w	d2,d0
	bcc.w	PlayerMakeWarpStars
	clr.w	warp_timer
	clr.b	warping
	rts

; ------------------------------------------------------------------------------

PlayerCheckWarpFinish:
	cmp.w	d2,d0
	bcc.s	PlayerCheckWarpReturn
	clr.w	warp_timer
	clr.b	warp_direction
	clr.b	warping

PlayerCheckWarpReturn:
	rts

; ------------------------------------------------------------------------------

PlayerGroundState:
	tst.b	sneeze_flag
	beq.s	PlayerGroundStateCheckBored
	cmpi.b	#5,obj.anim_id(a0)
	bne.s	PlayerGroundStateReturn
	clr.b	sneeze_flag

PlayerGroundStateCheckBored:
	bsr.w	PlayerCheckBored
	cmpi.b	#$2B,obj.anim_id(a0)
	bne.s	PlayerGroundStateUpdate
	tst.b	shrunk_player
	beq.s	PlayerGroundStateCheckNormalFrame
	cmpi.b	#$79,obj.sprite_frame(a0)
	bne.s	PlayerGroundStateReturn
	bra.s	PlayerGroundStateFall

; ------------------------------------------------------------------------------

PlayerGroundStateCheckNormalFrame:
	cmpi.b	#$17,obj.sprite_frame(a0)
	bcs.s	PlayerGroundStateReturn

PlayerGroundStateFall:
	bsr.w	PlayerCheckBounds
	jmp	MoveObjectFall

; ------------------------------------------------------------------------------

PlayerGroundStateUpdate:
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

PlayerGroundStateReturn:
	rts

; ------------------------------------------------------------------------------

PlayerFallState:
	tst.w	obj.y_speed(a0)
	bmi.s	PlayerFallStateCheckHangBar
	cmpi.b	#$2C,obj.anim_id(a0)
	beq.s	PlayerFallStateCheckHangBar
	move.b	#0,obj.anim_id(a0)

PlayerFallStateCheckHangBar:
	btst	#2,obj.var_2c(a0)
	beq.s	PlayerFallStateMove
	bsr.w	PlayerHangBar
	bra.s	PlayerFallStateCollideAir

; ------------------------------------------------------------------------------

PlayerFallStateMove:
	bsr.w	PlayerCheckBooster3d
	bsr.w	PlayerCheckWarp
	bsr.w	PlayerJumpHeight
	bsr.w	PlayerMoveAir
	bsr.w	PlayerCheckBounds
	jsr	MoveObjectFall
	btst	#6,obj.flags(a0)
	beq.s	PlayerFallStateResetAngle
	subi.w	#$28,obj.y_speed(a0)

PlayerFallStateResetAngle:
	bsr.w	PlayerResetAngle

PlayerFallStateCollideAir:
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
	bne.s	PlayerRollStateCollide
	jsr	MoveObject

PlayerRollStateCollide:
	bsr.w	PlayerGroundCollide
	bsr.w	PlayerCheckFall
	rts

; ------------------------------------------------------------------------------

PlayerJumpState:
	btst	#3,obj.var_2c(a0)
	beq.s	PlayerJumpStateCheckHangBar
	bsr.w	PlayerPole
	bsr.w	PlayerCheckWarp
	bra.s	PlayerJumpStateCollideAir

; ------------------------------------------------------------------------------

PlayerJumpStateCheckHangBar:
	btst	#2,obj.var_2c(a0)
	beq.s	PlayerJumpStateMove
	bsr.w	PlayerHangBar
	bsr.w	PlayerCheckWarp
	bra.s	PlayerJumpStateCollideAir

; ------------------------------------------------------------------------------

PlayerJumpStateMove:
	bsr.w	PlayerCheckBooster3d
	bsr.w	PlayerCheckWarp
	bsr.w	PlayerJumpHeight
	bsr.w	PlayerMoveAir
	bsr.w	PlayerCheckBounds
	jsr	MoveObjectFall
	btst	#6,obj.flags(a0)
	beq.s	PlayerJumpStateResetAngle
	subi.w	#$28,obj.y_speed(a0)

PlayerJumpStateResetAngle:
	bsr.w	PlayerResetAngle

PlayerJumpStateCollideAir:
	bsr.w	PlayerBlockCollideAir
	rts

; ------------------------------------------------------------------------------

PlayerPole:
	btst	#4,obj.var_2c(a0)
	beq.s	PlayerPoleCheckRelease
	move.b	obj.var_2b(a0),d0
	andi.b	#$7F,d0
	bne.s	PlayerPoleMove
	move.w	#-$C00,obj.x_speed(a0)
	tst.b	obj.var_2b(a0)
	bmi.s	PlayerPoleRelease
	neg.w	obj.x_speed(a0)

PlayerPoleRelease:
	andi.b	#$7F,obj.sprite_tile(a0)
	andi.b	#$E7,obj.var_2c(a0)
	clr.w	obj.var_3e(a0)
	rts

; ------------------------------------------------------------------------------

PlayerPoleCheckRelease:
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.s	PlayerPoleMove
	bset	#4,obj.var_2c(a0)

PlayerPoleMove:
	addq.b	#8,obj.var_2b(a0)
	ori.w	#$8000,obj.sprite_tile(a0)
	move.b	obj.var_2b(a0),d0
	bpl.s	PlayerPoleUpdatePosition
	andi.w	#$7FFF,obj.sprite_tile(a0)

PlayerPoleUpdatePosition:
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
	beq.s	PlayerPoleReturn
	neg.w	obj.y_speed(a0)

PlayerPoleReturn:
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
	bne.s	PlayerHangBarRelease
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.s	PlayerHangBarMove

PlayerHangBarRelease:
	bclr	#2,obj.var_2c(a0)
	addi.w	#$10,obj.y(a0)
	move.b	#$13,obj.height(a0)
	move.b	#9,obj.width(a0)
	rts

; ------------------------------------------------------------------------------

PlayerHangBarMove:
	moveq	#2,d0
	btst	#2,player_joy_hold
	beq.s	PlayerHangBarCheckRight
	neg.w	d0
	bset	#0,obj.flags(a0)
	bset	#0,obj.sprite_flags(a0)
	bra.s	PlayerHangBarUpdateAnimation

; ------------------------------------------------------------------------------

PlayerHangBarCheckRight:
	btst	#3,player_joy_hold
	beq.s	PlayerHangBarReturn
	bclr	#0,obj.flags(a0)
	bclr	#0,obj.sprite_flags(a0)

PlayerHangBarUpdateAnimation:
	add.w	d0,obj.x(a0)
	subq.b	#1,obj.var_1f(a0)
	bpl.s	PlayerHangBarReturn
	move.b	#7,obj.var_1f(a0)
	addq.b	#1,obj.anim_index(a0)
	cmpi.b	#4,obj.anim_index(a0)
	bcs.s	PlayerHangBarReturn
	move.b	#0,obj.anim_index(a0)

PlayerHangBarReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckBooster3d:
	cmpi.b	#1,time_zone
	bne.s	PlayerCheckBooster3dReturn
	tst.w	zone
	bne.s	PlayerCheckBooster3dReturn
	move.w	obj.y(a0),d0
	lsr.w	#1,d0
	andi.w	#$380,d0
	move.b	obj.x(a0),d1
	andi.w	#$7F,d1
	add.w	d1,d0
	lea	stage_map,a1
	move.b	(a1,d0.w),d1
	lea	PlayerCheckBooster3dSurfaceTypeTable,a2

PlayerCheckBooster3dScanTypes:
	move.b	(a2)+,d0
	bmi.s	PlayerCheckBooster3dClearBoost
	cmp.b	d0,d1
	bne.s	PlayerCheckBooster3dScanTypes
	bset	#1,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckBooster3dClearBoost:
	bclr	#1,obj.var_2c(a0)
	beq.s	PlayerCheckBooster3dReturn
	tst.w	obj.y_speed(a0)
	bpl.s	PlayerCheckBooster3dReturn
	cmpi.w	#$F800,obj.y_speed(a0)
	bcc.s	PlayerCheckBooster3dReturn
	move.w	#$600,obj.x_speed(a0)
	btst	#0,obj.flags(a0)
	beq.s	PlayerCheckBooster3dReturn
	neg.w	obj.x_speed(a0)

PlayerCheckBooster3dReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckBooster3dSurfaceTypeTable:
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
	bne.w	PlayerMoveGroundUpdateVelocity
	tst.w	obj.var_3e(a0)
	bne.w	PlayerMoveGroundFocusCenter
	btst	#2,player_joy_hold
	beq.s	PlayerMoveGroundAfterLeft
	bsr.w	PlayerMoveGroundLeft

PlayerMoveGroundAfterLeft:
	btst	#3,player_joy_hold
	beq.s	PlayerMoveGroundAfterRight
	bsr.w	PlayerMoveGroundRight

PlayerMoveGroundAfterRight:
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	bne.w	PlayerMoveGroundFocusCenter
	tst.w	obj.ground_speed(a0)
	beq.s	PlayerMoveGroundStopped
	tst.b	obj.var_2a(a0)
	beq.w	PlayerMoveGroundFocusCenter
	bra.s	PlayerMoveGroundCheckAttachment

; ------------------------------------------------------------------------------

PlayerMoveGroundStopped:
	bclr	#5,obj.flags(a0)
	move.b	#5,obj.anim_id(a0)

PlayerMoveGroundCheckAttachment:
	btst	#3,obj.flags(a0)
	beq.s	PlayerMoveGroundCheckGround
	moveq	#0,d0
	move.b	obj.var_3d(a0),d0
	lsl.w	#6,d0
	lea	object_pool,a1
	lea	(a1,d0.w),a1
	tst.b	obj.flags(a1)
	bmi.s	PlayerMoveGroundFocusMode
	cmpi.b	#$1E,obj.id(a1)
	bne.s	PlayerMoveGroundAttachmentOverlap
	move.b	#0,obj.anim_id(a0)
	bra.w	PlayerMoveGroundFocusCenter

; ------------------------------------------------------------------------------

PlayerMoveGroundAttachmentOverlap:
	moveq	#0,d1
	move.b	obj.width_2(a1),d1
	move.w	d1,d2
	add.w	d2,d2
	subq.w	#4,d2
	add.w	obj.x(a0),d1
	sub.w	obj.x(a1),d1
	cmpi.w	#4,d1
	blt.s	PlayerMoveGroundLoopDirection
	cmp.w	d2,d1
	bge.s	PlayerMoveGroundCheckLoopDirectionAlt
	bra.s	PlayerMoveGroundFocusMode

; ------------------------------------------------------------------------------

PlayerMoveGroundCheckGround:
	jsr	CheckBlockDown
	cmpi.w	#$C,d1
	blt.s	PlayerMoveGroundFocusMode
	cmpi.b	#3,obj.var_36(a0)
	bne.s	PlayerMoveGroundCheckLoopDirection

PlayerMoveGroundCheckLoopDirectionAlt:
	btst	#0,obj.flags(a0)
	bne.s	PlayerMoveGroundSetLoopAnim
	bra.s	PlayerMoveGroundSetWalkAnim

; ------------------------------------------------------------------------------

PlayerMoveGroundCheckLoopDirection:
	cmpi.b	#3,obj.var_37(a0)
	bne.s	PlayerMoveGroundFocusMode

PlayerMoveGroundLoopDirection:
	btst	#0,obj.flags(a0)
	bne.s	PlayerMoveGroundSetWalkAnim

PlayerMoveGroundSetLoopAnim:
	move.b	#$32,obj.anim_id(a0)
	bra.w	PlayerMoveGroundFocusCenter

; ------------------------------------------------------------------------------

PlayerMoveGroundSetWalkAnim:
	move.b	#6,obj.anim_id(a0)
	bra.w	PlayerMoveGroundFocusCenter

; ------------------------------------------------------------------------------

PlayerMoveGroundFocusMode:
	move.b	focus_mode,d0
	andi.b	#$F,d0
	beq.s	PlayerMoveGroundFocusDispatch
	addq.b	#1,focus_mode
	andi.b	#$CF,focus_mode

PlayerMoveGroundFocusDispatch:
	btst	#7,focus_mode
	bne.w	PlayerMoveGroundFocusUp
	btst	#6,focus_mode
	bne.w	PlayerMoveGroundFocusDown
	btst	#1,player_joy_hold
	bne.w	PlayerMoveGroundFocusDown
	andi.b	#$F,focus_mode
	beq.s	PlayerMoveGroundFocusNeutral
	btst	#0,player_joy_tap
	beq.s	PlayerMoveGroundHorizontalInput
	bset	#7,focus_mode
	bra.w	PlayerMoveGroundBrakeApply

; ------------------------------------------------------------------------------

PlayerMoveGroundFocusNeutral:
	btst	#0,player_joy_tap
	beq.w	PlayerMoveGroundHorizontalInput
	move.b	#1,focus_mode
	bra.w	PlayerMoveGroundBrakeApply

; ------------------------------------------------------------------------------

PlayerMoveGroundHorizontalInput:
	btst	#0,player_joy_hold
	beq.s	PlayerMoveGroundRelease
	move.b	#7,obj.anim_id(a0)
	tst.b	obj.var_2a(a0)
	beq.s	PlayerMoveGroundSetRolling
	move.b	#0,obj.anim_id(a0)
	moveq	#$64,d0
	move.w	player_max_speed,d1
	move.w	d1,d2
	asl.w	#1,d1
	tst.b	speed_shoes
	beq.s	PlayerMoveGroundSpeedShoes
	asr.w	#1,d2
	sub.w	d2,d1

PlayerMoveGroundSpeedShoes:
	btst	#0,obj.flags(a0)
	beq.s	PlayerMoveGroundApplyDirection
	neg.w	d0
	neg.w	d1

PlayerMoveGroundApplyDirection:
	add.w	d0,obj.ground_speed(a0)
	move.w	obj.ground_speed(a0),d0
	btst	#0,obj.flags(a0)
	beq.s	PlayerMoveGroundCapForward
	cmp.w	d0,d1
	ble.s	PlayerMoveGroundStoreCap
	bra.s	PlayerMoveGroundCapStoreValue

; ------------------------------------------------------------------------------

PlayerMoveGroundCapForward:
	cmp.w	d1,d0
	ble.s	PlayerMoveGroundStoreCap

PlayerMoveGroundCapStoreValue:
	move.w	d1,d0

PlayerMoveGroundStoreCap:
	move.w	d0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveGroundSetRolling:
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.s	PlayerMoveGroundBrake
	move.b	#1,obj.var_2a(a0)
	move.w	#$9C,d0
	jsr	PlayFmSound

PlayerMoveGroundBrake:
	bra.w	PlayerMoveGroundBrakeApply

; ------------------------------------------------------------------------------

PlayerMoveGroundRelease:
	cmpi.b	#$1E,obj.var_2a(a0)
	beq.s	PlayerMoveGroundReleaseComplete
	move.w	#$AB,d0
	jsr	PlayFmSound
	move.b	#0,obj.var_2a(a0)
	move.w	#0,obj.ground_speed(a0)
	bra.s	PlayerMoveGroundFocusDown

; ------------------------------------------------------------------------------

PlayerMoveGroundReleaseComplete:
	move.b	#0,obj.var_2a(a0)
	move.w	#$91,d0
	jsr	PlayFmSound
	bra.w	PlayerMoveGroundFocusCenter

; ------------------------------------------------------------------------------

	bsr.w	PlayerMoveGroundLeft
	bra.w	PlayerMoveGroundFocusCenter

; ------------------------------------------------------------------------------

PlayerMoveGroundFocusUp:
	btst	#0,player_joy_hold
	beq.s	PlayerMoveGroundFocusDown
	move.b	#7,obj.anim_id(a0)
	cmpi.w	#$C8,scroll_focus_y
	beq.w	PlayerMoveGroundBrakeApply
	addq.w	#2,scroll_focus_y
	bra.w	PlayerMoveGroundBrakeApply

; ------------------------------------------------------------------------------

PlayerMoveGroundFocusDown:
	btst	#6,focus_mode
	bne.w	PlayerMoveGroundFocusDownActive
	andi.b	#$F,focus_mode
	beq.s	PlayerMoveGroundFocusDownNeutral
	btst	#1,player_joy_tap
	beq.s	PlayerMoveGroundFocusDownInput
	bset	#6,focus_mode
	bra.w	PlayerMoveGroundBrakeApply

; ------------------------------------------------------------------------------

PlayerMoveGroundFocusDownNeutral:
	btst	#1,player_joy_tap
	beq.s	PlayerMoveGroundFocusDownInput
	move.b	#1,focus_mode
	bra.w	PlayerMoveGroundBrakeApply

; ------------------------------------------------------------------------------

PlayerMoveGroundFocusDownInput:
	btst	#1,player_joy_hold
	beq.s	PlayerMoveGroundFocusCenter
	move.b	#8,obj.anim_id(a0)
	tst.b	obj.var_2a(a0)
	bne.s	PlayerMoveGroundFocusDownReturn
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.s	PlayerMoveGroundFocusDownReturn
	move.b	#1,obj.var_2a(a0)
	move.w	#$16,obj.ground_speed(a0)
	btst	#0,obj.flags(a0)
	beq.s	PlayerMoveGroundSetRollSpeed
	neg.w	obj.ground_speed(a0)

PlayerMoveGroundSetRollSpeed:
	move.w	#$9C,d0
	jsr	PlayFmSound
	bsr.w	PlayerStartRoll

PlayerMoveGroundFocusDownReturn:
	bra.s	PlayerMoveGroundBrakeApply

; ------------------------------------------------------------------------------

PlayerMoveGroundFocusDownActive:
	btst	#1,player_joy_hold
	beq.s	PlayerMoveGroundFocusCenter
	move.b	#8,obj.anim_id(a0)
	cmpi.w	#8,scroll_focus_y
	beq.s	PlayerMoveGroundBrakeApply
	subq.w	#2,scroll_focus_y
	bra.s	PlayerMoveGroundBrakeApply

; ------------------------------------------------------------------------------

PlayerMoveGroundFocusCenter:
	cmpi.w	#$60,scroll_focus_y
	bne.s	PlayerMoveGroundFocusCenterAdjust
	move.b	focus_mode,d0
	andi.b	#$F,d0
	bne.s	PlayerMoveGroundBrakeApply
	move.b	#0,focus_mode
	bra.s	PlayerMoveGroundBrakeApply

; ------------------------------------------------------------------------------

PlayerMoveGroundFocusCenterAdjust:
	bcc.s	PlayerMoveGroundFocusCenterStore
	addq.w	#4,scroll_focus_y

PlayerMoveGroundFocusCenterStore:
	subq.w	#2,scroll_focus_y

PlayerMoveGroundBrakeApply:
	move.b	player_joy_hold,d0
	andi.b	#$C,d0
	bne.s	PlayerMoveGroundUpdateVelocity
	move.w	obj.ground_speed(a0),d0
	beq.s	PlayerMoveGroundUpdateVelocity
	bmi.s	PlayerMoveGroundBrakeReverse
	sub.w	d5,d0
	bcc.s	PlayerMoveGroundBrakeForwardStore
	move.w	#0,d0

PlayerMoveGroundBrakeForwardStore:
	move.w	d0,obj.ground_speed(a0)
	bra.s	PlayerMoveGroundUpdateVelocity

; ------------------------------------------------------------------------------

PlayerMoveGroundBrakeReverse:
	add.w	d5,d0
	bcc.s	PlayerMoveGroundBrakeReverseStore
	move.w	#0,d0

PlayerMoveGroundBrakeReverseStore:
	move.w	d0,obj.ground_speed(a0)

PlayerMoveGroundUpdateVelocity:
	move.b	obj.angle(a0),d0
	jsr	SineCosine
	muls.w	obj.ground_speed(a0),d1
	asr.l	#8,d1
	move.w	d1,obj.x_speed(a0)
	muls.w	obj.ground_speed(a0),d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a0)

PlayerCheckWallAngle:
	move.b	obj.angle(a0),d0
	addi.b	#$40,d0
	bmi.s	PlayerCheckWallReturn
	move.b	#$40,d1
	tst.w	obj.ground_speed(a0)
	beq.s	PlayerCheckWallReturn
	bmi.s	PlayerCheckWall
	neg.w	d1

PlayerCheckWall:
	move.b	obj.angle(a0),d0
	add.b	d1,d0
	move.w	d0,-(sp)
	bsr.w	PlayerCheckBlockFront
	move.w	(sp)+,d0
	tst.w	d1
	bpl.s	PlayerCheckWallReturn
	asl.w	#8,d1
	addi.b	#$20,d0
	andi.b	#$C0,d0
	beq.s	PlayerCheckWallDown
	cmpi.b	#$40,d0
	beq.s	PlayerCheckWallHorizontal
	cmpi.b	#$80,d0
	beq.s	PlayerCheckWallUp
	add.w	d1,obj.x_speed(a0)
	bset	#5,obj.flags(a0)
	move.w	#0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckWallUp:
	sub.w	d1,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckWallHorizontal:
	sub.w	d1,obj.x_speed(a0)
	bset	#5,obj.flags(a0)
	move.w	#0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckWallDown:
	add.w	d1,obj.y_speed(a0)

PlayerCheckWallReturn:
	rts

; ------------------------------------------------------------------------------

PlayerMoveGroundLeft:
	tst.b	obj.var_2a(a0)
	bne.s	PlayerMoveGroundLeftReturn
	move.w	obj.ground_speed(a0),d0
	beq.s	PlayerMoveGroundLeftTurn
	bpl.s	PlayerMoveGroundLeftAccelerate

PlayerMoveGroundLeftTurn:
	bset	#0,obj.flags(a0)
	bne.s	PlayerMoveGroundLeftCapSpeed
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)

PlayerMoveGroundLeftCapSpeed:
	move.w	d6,d1
	neg.w	d1
	cmp.w	d1,d0
	ble.s	PlayerMoveGroundLeftStoreSpeed
	sub.w	d5,d0
	cmp.w	d1,d0
	bgt.s	PlayerMoveGroundLeftStoreSpeed
	move.w	d1,d0

PlayerMoveGroundLeftStoreSpeed:
	move.w	d0,obj.ground_speed(a0)
	move.b	#0,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveGroundLeftAccelerate:
	sub.w	d4,d0
	bcc.s	PlayerMoveGroundLeftCheckRoll
	move.w	#$FF80,d0

PlayerMoveGroundLeftCheckRoll:
	move.w	d0,obj.ground_speed(a0)
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	bne.s	PlayerMoveGroundLeftReturn
	cmpi.w	#$400,d0
	blt.s	PlayerMoveGroundLeftReturn
	move.b	#$D,obj.anim_id(a0)
	bclr	#0,obj.flags(a0)
	move.w	#$90,d0
	jsr	PlayFmSound

PlayerMoveGroundLeftReturn:
	rts

; ------------------------------------------------------------------------------

PlayerMoveGroundRight:
	tst.b	obj.var_2a(a0)
	bne.s	PlayerMoveGroundRightReturn
	move.w	obj.ground_speed(a0),d0
	bmi.s	PlayerMoveGroundRightAccelerate
	bclr	#0,obj.flags(a0)
	beq.s	PlayerMoveGroundRightCapSpeed
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)

PlayerMoveGroundRightCapSpeed:
	cmp.w	d6,d0
	bge.s	PlayerMoveGroundRightStoreSpeed
	add.w	d5,d0
	cmp.w	d6,d0
	blt.s	PlayerMoveGroundRightStoreSpeed
	move.w	d6,d0

PlayerMoveGroundRightStoreSpeed:
	move.w	d0,obj.ground_speed(a0)
	move.b	#0,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveGroundRightAccelerate:
	add.w	d4,d0
	bcc.s	PlayerMoveGroundRightCheckRoll
	move.w	#$80,d0

PlayerMoveGroundRightCheckRoll:
	move.w	d0,obj.ground_speed(a0)
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	bne.s	PlayerMoveGroundRightReturn
	cmpi.w	#$FC00,d0
	bgt.s	PlayerMoveGroundRightReturn
	move.b	#$D,obj.anim_id(a0)
	bset	#0,obj.flags(a0)
	move.w	#$90,d0
	jsr	PlayFmSound

PlayerMoveGroundRightReturn:
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
	bne.w	PlayerMoveRollUpdateVelocity
	tst.w	obj.var_3e(a0)
	bne.s	PlayerMoveRollAfterInput
	btst	#2,player_joy_hold
	beq.s	PlayerMoveRollAfterLeft
	bsr.w	PlayerMoveRollLeft

PlayerMoveRollAfterLeft:
	btst	#3,player_joy_hold
	beq.s	PlayerMoveRollAfterInput
	bsr.w	PlayerMoveRollRight

PlayerMoveRollAfterInput:
	tst.b	obj.var_2a(a0)
	beq.w	PlayerMoveRollBrake
	move.w	#$32,d0
	move.w	player_max_speed,d1
	move.w	d1,d2
	asl.w	#1,d1
	tst.b	speed_shoes
	beq.s	PlayerMoveRollSpeedShoes
	asr.w	#1,d2
	sub.w	d2,d1

PlayerMoveRollSpeedShoes:
	btst	#0,obj.flags(a0)
	beq.s	PlayerMoveRollApplyDirection
	neg.w	d0
	neg.w	d1

PlayerMoveRollApplyDirection:
	add.w	d0,obj.ground_speed(a0)
	move.w	obj.ground_speed(a0),d0
	btst	#0,obj.flags(a0)
	beq.s	PlayerMoveRollCapForward
	cmp.w	d0,d1
	ble.s	PlayerMoveRollStoreSpeed
	bra.s	PlayerMoveRollCapStoreValue

; ------------------------------------------------------------------------------

PlayerMoveRollCapForward:
	cmp.w	d1,d0
	ble.s	PlayerMoveRollStoreSpeed

PlayerMoveRollCapStoreValue:
	move.w	d1,d0

PlayerMoveRollStoreSpeed:
	move.w	d0,obj.ground_speed(a0)
	btst	#1,player_joy_hold
	beq.s	PlayerMoveRollReleaseCheck
	rts

; ------------------------------------------------------------------------------

PlayerMoveRollRelease:
	move.w	#$AB,d0
	jsr	PlayFmSound
	move.b	#0,obj.var_2a(a0)
	move.w	#0,obj.ground_speed(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.y_speed(a0)
	bra.w	PlayerMoveRollRestoreStanding

; ------------------------------------------------------------------------------

PlayerMoveRollReleaseCheck:
	cmpi.b	#$2D,obj.var_2a(a0)
	bne.s	PlayerMoveRollRelease
	move.b	#0,obj.var_2a(a0)
	move.w	#$91,d0
	jsr	PlayFmSound
	btst	#0,obj.flags(a0)
	bne.s	PlayerMoveRollReleaseMoveLeft
	bsr.w	PlayerMoveRollRight
	bra.s	PlayerMoveRollBrake

; ------------------------------------------------------------------------------

PlayerMoveRollReleaseMoveLeft:
	bsr.w	PlayerMoveRollLeft
	bra.s	PlayerMoveRollBrake

; ------------------------------------------------------------------------------

	rts

; ------------------------------------------------------------------------------

PlayerMoveRollBrake:
	move.w	obj.ground_speed(a0),d0
	beq.s	PlayerMoveRollCheckStop
	bmi.s	PlayerMoveRollBrakeReverse
	sub.w	d5,d0
	bcc.s	PlayerMoveRollBrakeForwardStore
	move.w	#0,d0

PlayerMoveRollBrakeForwardStore:
	move.w	d0,obj.ground_speed(a0)
	bra.s	PlayerMoveRollCheckStop

; ------------------------------------------------------------------------------

PlayerMoveRollBrakeReverse:
	add.w	d5,d0
	bcc.s	PlayerMoveRollBrakeReverseStore
	move.w	#0,d0

PlayerMoveRollBrakeReverseStore:
	move.w	d0,obj.ground_speed(a0)

PlayerMoveRollCheckStop:
	tst.w	obj.ground_speed(a0)
	bne.s	PlayerMoveRollUpdateVelocity

PlayerMoveRollRestoreStanding:
	bclr	#2,obj.flags(a0)
	tst.b	shrunk_player
	beq.s	PlayerMoveRollRestoreNormalSize
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	bra.s	PlayerMoveRollSetAnimation

; ------------------------------------------------------------------------------

PlayerMoveRollRestoreNormalSize:
	move.b	#$13,obj.height(a0)
	move.b	#9,obj.width(a0)
	subq.w	#5,obj.y(a0)

PlayerMoveRollSetAnimation:
	move.b	#5,obj.anim_id(a0)

PlayerMoveRollUpdateVelocity:
	move.b	obj.angle(a0),d0
	jsr	SineCosine
	muls.w	obj.ground_speed(a0),d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a0)
	muls.w	obj.ground_speed(a0),d1
	asr.l	#8,d1
	cmpi.w	#$1000,d1
	ble.s	PlayerMoveRollClampXSpeedLower
	move.w	#$1000,d1

PlayerMoveRollClampXSpeedLower:
	cmpi.w	#$F000,d1
	bge.s	PlayerMoveRollStoreXSpeed
	move.w	#$F000,d1


PlayerMoveRollStoreXSpeed:
	move.w	d1,obj.x_speed(a0)
	bra.w	PlayerCheckWallAngle

; ------------------------------------------------------------------------------

PlayerMoveRollLeft:
	move.w	obj.ground_speed(a0),d0
	beq.s	PlayerMoveRollLeftSetDirection
	bpl.s	PlayerMoveRollLeftAccelerate

PlayerMoveRollLeftSetDirection:
	bset	#0,obj.flags(a0)
	move.b	#2,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveRollLeftAccelerate:
	sub.w	d4,d0
	bcc.s	PlayerMoveRollLeftStoreSpeed
	move.w	#$FF80,d0

PlayerMoveRollLeftStoreSpeed:
	move.w	d0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveRollRight:
	move.w	obj.ground_speed(a0),d0
	bmi.s	PlayerMoveRollRightAccelerate
	bclr	#0,obj.flags(a0)
	move.b	#2,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveRollRightAccelerate:
	add.w	d4,d0
	bcc.s	PlayerMoveRollRightStoreSpeed
	move.w	#$80,d0

PlayerMoveRollRightStoreSpeed:
	move.w	d0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveAir:
	move.w	player_max_speed,d6
	move.w	player_acceleration,d5
	asl.w	#1,d5
	move.w	obj.x_speed(a0),d0
	tst.w	zone
	bne.s	PlayerMoveAirHorizontalInput
	cmpi.w	#$6C8,obj.x(a0)
	bcs.s	PlayerMoveAirZoneGate
	cmpi.w	#$840,obj.x(a0)
	bcs.s	PlayerMoveAirStoreHorizontal

PlayerMoveAirZoneGate:
	btst	#1,obj.var_2c(a0)
	bne.s	PlayerMoveAirStoreHorizontal

PlayerMoveAirHorizontalInput:
	btst	#2,player_joy_hold
	beq.s	PlayerMoveAirRightInput
	bset	#0,obj.flags(a0)
	sub.w	d5,d0
	move.w	d6,d1
	neg.w	d1
	cmp.w	d1,d0
	bgt.s	PlayerMoveAirRightInput
	move.w	d1,d0

PlayerMoveAirRightInput:
	btst	#3,player_joy_hold
	beq.s	PlayerMoveAirStoreHorizontal
	bclr	#0,obj.flags(a0)
	add.w	d5,d0
	cmp.w	d6,d0
	blt.s	PlayerMoveAirStoreHorizontal
	move.w	d6,d0

PlayerMoveAirStoreHorizontal:
	move.w	d0,obj.x_speed(a0)
	cmpi.w	#$60,scroll_focus_y
	beq.s	PlayerMoveAirApplyDrag
	bcc.s	PlayerMoveAirFocusCenter
	addq.w	#4,scroll_focus_y

PlayerMoveAirFocusCenter:
	subq.w	#2,scroll_focus_y

PlayerMoveAirApplyDrag:
	cmpi.w	#$FC00,obj.y_speed(a0)
	bcs.s	PlayerMoveAirReturn
	move.w	obj.x_speed(a0),d0
	move.w	d0,d1
	asr.w	#5,d1
	beq.s	PlayerMoveAirReturn
	bmi.s	PlayerMoveAirDragNegative
	sub.w	d1,d0
	bcc.s	PlayerMoveAirDragPositiveStore
	move.w	#0,d0

PlayerMoveAirDragPositiveStore:
	move.w	d0,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveAirDragNegative:
	sub.w	d1,d0
	bcs.s	PlayerMoveAirDragNegativeStore
	move.w	#0,d0

PlayerMoveAirDragNegativeStore:
	move.w	d0,obj.x_speed(a0)

PlayerMoveAirReturn:
	rts

; ------------------------------------------------------------------------------

PlayerUnusedCheckSquish:
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	bne.s	PlayerUnusedCheckSquishReturn
	bsr.w	PlayerCheckBlockUpWide
	tst.w	d1
	bpl.s	PlayerUnusedCheckSquishReturn
	move.w	#0,obj.ground_speed(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.y_speed(a0)
	move.b	#$B,obj.anim_id(a0)

PlayerUnusedCheckSquishReturn:
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
	bhi.s	PlayerCheckBoundsClampX
	move.w	right_bound,d0
	addi.w	#$130,d0
	tst.b	boss_started
	bne.s	PlayerCheckBoundsCheckRight
	addi.w	#$38,d0

PlayerCheckBoundsCheckRight:
	cmp.w	d1,d0
	bls.s	PlayerCheckBoundsClampX

PlayerCheckBoundsCheckBottom:
	move.w	bottom_bound,d0
	addi.w	#$E0,d0
	cmp.w	obj.y(a0),d0
	blt.s	PlayerCheckBoundsKillBelow
	rts

; ------------------------------------------------------------------------------

PlayerCheckBoundsKillBelow:
	cmpi.b	#$2B,obj.anim_id(a0)
	bne.w	KillPlayer
	move.b	#6,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckBoundsClampX:
	move.w	d0,obj.x(a0)
	move.w	#0,obj.x+2(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.ground_speed(a0)
	bra.s	PlayerCheckBoundsCheckBottom

; ------------------------------------------------------------------------------

PlayerCheckRoll:
	tst.b	water_slide_flag
	bne.s	PlayerCheckRollReturn
	move.w	obj.ground_speed(a0),d0
	bpl.s	PlayerCheckRollCheckSpeed
	neg.w	d0

PlayerCheckRollCheckSpeed:
	cmpi.w	#$80,d0
	bcs.s	PlayerCheckRollReturn
	move.b	player_joy_hold,d0
	andi.b	#$C,d0
	bne.s	PlayerCheckRollReturn
	btst	#1,player_joy_hold
	bne.s	PlayerStartRoll

PlayerCheckRollReturn:
	rts

; ------------------------------------------------------------------------------

PlayerStartRoll:
	btst	#2,obj.flags(a0)
	beq.s	PlayerStartRollSetRolling
	rts

; ------------------------------------------------------------------------------

PlayerStartRollSetRolling:
	bset	#2,obj.flags(a0)
	tst.b	shrunk_player
	beq.s	PlayerStartRollSetNormalSize
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	bra.s	PlayerStartRollSetAnimation

; ------------------------------------------------------------------------------

PlayerStartRollSetNormalSize:
	move.b	#$E,obj.height(a0)
	move.b	#7,obj.width(a0)
	addq.w	#5,obj.y(a0)

PlayerStartRollSetAnimation:
	move.b	#2,obj.anim_id(a0)
	tst.w	obj.ground_speed(a0)
	bne.s	PlayerStartRollReturn
	move.w	#$200,obj.ground_speed(a0)

PlayerStartRollReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckJump:
	tst.b	obj.var_2a(a0)
	beq.s	PlayerCheckJumpCheckHorizontal
	rts

; ------------------------------------------------------------------------------

PlayerCheckJumpCheckHorizontal:
	move.b	player_joy_hold,d0
	andi.b	#3,d0
	beq.s	PlayerCheckJumpCheckTap
	tst.w	obj.ground_speed(a0)
	beq.w	PlayerCheckJumpReturn

PlayerCheckJumpCheckTap:
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.w	PlayerCheckJumpReturn
	btst	#3,obj.flags(a0)
	beq.s	PlayerCheckJumpCheckClearance
	jsr	PlayerCheckFlipper
	beq.s	PlayerCheckJumpApplyImpulse

PlayerCheckJumpCheckClearance:
	moveq	#0,d0
	move.b	obj.angle(a0),d0
	addi.b	#-$80,d0
	bsr.w	PlayerCheckBlockAbove
	cmpi.w	#6,d1
	blt.w	PlayerCheckJumpReturn
	move.w	#$680,d2
	btst	#6,obj.flags(a0)
	beq.s	PlayerCheckJumpSetAngle
	move.w	#$380,d2

PlayerCheckJumpSetAngle:
	moveq	#0,d0
	move.b	obj.angle(a0),d0
	subi.b	#$40,d0

PlayerCheckJumpApplyImpulse:
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
	bne.s	PlayerCheckJumpSetAirborne
	tst.b	shrunk_player
	beq.s	PlayerCheckJumpSetNormalSize
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	bra.s	PlayerCheckJumpSetRolling

; ------------------------------------------------------------------------------

PlayerCheckJumpSetNormalSize:
	move.b	#$E,obj.height(a0)
	move.b	#7,obj.width(a0)
	addq.w	#5,obj.y(a0)

PlayerCheckJumpSetRolling:
	bset	#2,obj.flags(a0)
	move.b	#2,obj.anim_id(a0)

PlayerCheckJumpReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckJumpSetAirborne:
	bset	#4,obj.flags(a0)
	rts

; ------------------------------------------------------------------------------

PlayerJumpHeight:
	tst.b	obj.var_3c(a0)
	beq.s	PlayerJumpHeightInactiveReturn
	move.w	#$FC00,d1
	btst	#6,obj.flags(a0)
	beq.s	PlayerJumpHeightCheckCap
	move.w	#$FE00,d1

PlayerJumpHeightCheckCap:
	cmp.w	obj.y_speed(a0),d1
	ble.s	PlayerJumpHeightCapReturn
	move.b	player_joy_hold,d0
	andi.b	#$70,d0
	bne.s	PlayerJumpHeightCapReturn
	move.b	#0,obj.var_2a(a0)
	move.w	d1,obj.y_speed(a0)

PlayerJumpHeightCapReturn:
	rts

; ------------------------------------------------------------------------------

PlayerJumpHeightInactiveReturn:
	rts

; ------------------------------------------------------------------------------

PlayerSlopeResist:
	tst.b	obj.var_2a(a0)
	bne.s	PlayerSlopeResistReturn
	move.b	obj.angle(a0),d0
	addi.b	#$60,d0
	cmpi.b	#$C0,d0
	bcc.s	PlayerSlopeResistReturn
	move.b	obj.angle(a0),d0
	jsr	SineCosine
	muls.w	#$20,d0
	asr.l	#8,d0
	tst.w	obj.ground_speed(a0)
	beq.s	PlayerSlopeResistReturn
	bmi.s	PlayerSlopeResistApplyReverse
	tst.w	d0
	beq.s	PlayerSlopeResistNoSlope
	add.w	d0,obj.ground_speed(a0)

PlayerSlopeResistNoSlope:
	rts

; ------------------------------------------------------------------------------

PlayerSlopeResistApplyReverse:
	add.w	d0,obj.ground_speed(a0)

PlayerSlopeResistReturn:
	rts

; ------------------------------------------------------------------------------

PlayerSlopeResistRoll:
	tst.b	obj.var_2a(a0)
	bne.s	PlayerSlopeResistRollReturn
	move.b	obj.angle(a0),d0
	addi.b	#$60,d0
	cmpi.b	#$C0,d0
	bcc.s	PlayerSlopeResistRollReturn
	move.b	obj.angle(a0),d0
	jsr	SineCosine
	muls.w	#$50,d0
	asr.l	#8,d0
	tst.w	obj.ground_speed(a0)
	bmi.s	PlayerSlopeResistRollApplyReverse
	tst.w	d0
	bpl.s	PlayerSlopeResistRollScaleForward
	asr.l	#2,d0

PlayerSlopeResistRollScaleForward:
	add.w	d0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerSlopeResistRollApplyReverse:
	tst.w	d0
	bmi.s	PlayerSlopeResistRollApply
	asr.l	#2,d0

PlayerSlopeResistRollApply:
	add.w	d0,obj.ground_speed(a0)

PlayerSlopeResistRollReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckFall:
	nop
	tst.b	obj.var_38(a0)
	bne.s	PlayerCheckFallReturn
	tst.w	obj.var_3e(a0)
	bne.s	PlayerCheckFallDecrementTimer
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	beq.s	PlayerCheckFallReturn
	move.w	obj.ground_speed(a0),d0
	bpl.s	PlayerCheckFallCheckSpeed
	neg.w	d0

PlayerCheckFallCheckSpeed:
	cmpi.w	#$280,d0
	bcc.s	PlayerCheckFallReturn
	clr.w	obj.ground_speed(a0)
	bset	#1,obj.flags(a0)
	move.w	#$1E,obj.var_3e(a0)

PlayerCheckFallReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckFallDecrementTimer:
	subq.w	#1,obj.var_3e(a0)
	rts

; ------------------------------------------------------------------------------

PlayerResetAngle:
	btst	#1,obj.var_2c(a0)
	bne.s	PlayerResetAngleReturn
	move.b	obj.angle(a0),d0
	beq.s	PlayerResetAngleReturn
	bpl.s	PlayerResetAngleDecrease
	addq.b	#2,d0
	bcc.s	PlayerResetAngleIncreaseComplete
	moveq	#0,d0

PlayerResetAngleIncreaseComplete:
	bra.s	PlayerResetAngleStore

; ------------------------------------------------------------------------------

PlayerResetAngleDecrease:
	subq.b	#2,d0
	bcc.s	PlayerResetAngleStore
	moveq	#0,d0

PlayerResetAngleStore:
	move.b	d0,obj.angle(a0)

PlayerResetAngleReturn:
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
	beq.w	PlayerBlockCollideAirLeftUpDown
	cmpi.b	#$80,d0
	beq.w	PlayerBlockCollideAirLeftRightUp
	cmpi.b	#$C0,d0
	beq.w	PlayerBlockCollideAirRightUpDown
	bsr.w	PlayerCheckBlockLeft
	tst.w	d1
	bpl.s	PlayerBlockCollideAirLeftRightDownCheckRight
	sub.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)

PlayerBlockCollideAirLeftRightDownCheckRight:
	bsr.w	PlayerCheckBlockRight
	tst.w	d1
	bpl.s	PlayerBlockCollideAirLeftRightDownCheckDown
	add.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)

PlayerBlockCollideAirLeftRightDownCheckDown:
	bsr.w	PlayerCheckBlockDownWide
	move.b	d1,debug_floor_distance
	tst.w	d1
	bpl.s	PlayerBlockCollideAirReturn
	move.b	obj.y_speed(a0),d2
	addq.b	#8,d2
	neg.b	d2
	cmp.b	d2,d1
	bge.s	PlayerBlockCollideAirLeftRightDownLand
	cmp.b	d2,d0
	blt.s	PlayerBlockCollideAirReturn

PlayerBlockCollideAirLeftRightDownLand:
	add.w	d1,obj.y(a0)
	move.b	d3,obj.angle(a0)
	bsr.w	PlayerSetGround
	move.b	#0,obj.anim_id(a0)
	move.b	d3,d0
	addi.b	#$20,d0
	andi.b	#$40,d0
	bne.s	PlayerBlockCollideAirLeftRightDownLandSteep
	move.b	d3,d0
	addi.b	#$10,d0
	andi.b	#$20,d0
	beq.s	PlayerBlockCollideAirLeftRightDownLandShallow
	asr	obj.y_speed(a0)
	bra.s	PlayerBlockCollideAirLeftRightDownStoreGroundSpeed

; ------------------------------------------------------------------------------

PlayerBlockCollideAirLeftRightDownLandShallow:
	move.w	#0,obj.y_speed(a0)
	move.w	obj.x_speed(a0),obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerBlockCollideAirLeftRightDownLandSteep:
	move.w	#0,obj.x_speed(a0)
	cmpi.w	#$FC0,obj.y_speed(a0)
	ble.s	PlayerBlockCollideAirLeftRightDownStoreGroundSpeed
	move.w	#$FC0,obj.y_speed(a0)

PlayerBlockCollideAirLeftRightDownStoreGroundSpeed:
	move.w	obj.y_speed(a0),obj.ground_speed(a0)
	tst.b	d3
	bpl.s	PlayerBlockCollideAirReturn
	neg.w	obj.ground_speed(a0)

PlayerBlockCollideAirReturn:
	rts

; ------------------------------------------------------------------------------

PlayerBlockCollideAirLeftUpDown:
	bsr.w	PlayerCheckBlockLeft
	tst.w	d1
	bpl.s	PlayerBlockCollideAirLeftUpDownCheckUp
	sub.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	obj.y_speed(a0),obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerBlockCollideAirLeftUpDownCheckUp:
	bsr.w	PlayerCheckBlockUpWide
	tst.w	d1
	bpl.s	PlayerBlockCollideAirLeftUpDownCheckDown
	sub.w	d1,obj.y(a0)
	tst.w	obj.y_speed(a0)
	bpl.s	PlayerBlockCollideAirLeftUpDownReturnUp
	move.w	#0,obj.y_speed(a0)

PlayerBlockCollideAirLeftUpDownReturnUp:
	rts

; ------------------------------------------------------------------------------

PlayerBlockCollideAirLeftUpDownCheckDown:
	tst.w	obj.y_speed(a0)
	bmi.s	PlayerBlockCollideAirLeftUpDownReturn
	bsr.w	PlayerCheckBlockDownWide
	tst.w	d1
	bpl.s	PlayerBlockCollideAirLeftUpDownReturn
	add.w	d1,obj.y(a0)
	move.b	d3,obj.angle(a0)
	bsr.w	PlayerSetGround
	move.b	#0,obj.anim_id(a0)
	move.w	#0,obj.y_speed(a0)
	move.w	obj.x_speed(a0),obj.ground_speed(a0)

PlayerBlockCollideAirLeftUpDownReturn:
	rts

; ------------------------------------------------------------------------------

PlayerBlockCollideAirLeftRightUp:
	bsr.w	PlayerCheckBlockLeft
	tst.w	d1
	bpl.s	PlayerBlockCollideAirLeftRightUpCheckRight
	sub.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)

PlayerBlockCollideAirLeftRightUpCheckRight:
	bsr.w	PlayerCheckBlockRight
	tst.w	d1
	bpl.s	PlayerBlockCollideAirLeftRightUpCheckUp
	add.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)

PlayerBlockCollideAirLeftRightUpCheckUp:
	bsr.w	PlayerCheckBlockUpWide
	tst.w	d1
	bpl.s	PlayerBlockCollideAirLeftRightUpReturn
	sub.w	d1,obj.y(a0)
	move.b	d3,d0
	addi.b	#$20,d0
	andi.b	#$40,d0
	bne.s	PlayerBlockCollideAirLeftRightUpLandSteep
	move.w	#0,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerBlockCollideAirLeftRightUpLandSteep:
	move.b	d3,obj.angle(a0)
	bsr.w	PlayerSetGroundSteep
	move.w	obj.y_speed(a0),obj.ground_speed(a0)
	tst.b	d3
	bpl.s	PlayerBlockCollideAirLeftRightUpReturn
	neg.w	obj.ground_speed(a0)

PlayerBlockCollideAirLeftRightUpReturn:
	rts

; ------------------------------------------------------------------------------

PlayerBlockCollideAirRightUpDown:
	bsr.w	PlayerCheckBlockRight
	tst.w	d1
	bpl.s	PlayerBlockCollideAirRightUpDownCheckUp
	add.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	obj.y_speed(a0),obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerBlockCollideAirRightUpDownCheckUp:
	bsr.w	PlayerCheckBlockUpWide
	tst.w	d1
	bpl.s	PlayerBlockCollideAirRightUpDownCheckDown
	sub.w	d1,obj.y(a0)
	tst.w	obj.y_speed(a0)
	bpl.s	PlayerBlockCollideAirRightUpDownReturnUp
	move.w	#0,obj.y_speed(a0)

PlayerBlockCollideAirRightUpDownReturnUp:
	rts

; ------------------------------------------------------------------------------

PlayerBlockCollideAirRightUpDownCheckDown:
	tst.w	obj.y_speed(a0)
	bmi.s	PlayerBlockCollideAirRightUpDownReturn
	bsr.w	PlayerCheckBlockDownWide
	tst.w	d1
	bpl.s	PlayerBlockCollideAirRightUpDownReturn
	add.w	d1,obj.y(a0)
	move.b	d3,obj.angle(a0)
	bsr.w	PlayerSetGround
	move.b	#0,obj.anim_id(a0)
	move.w	#0,obj.y_speed(a0)
	move.w	obj.x_speed(a0),obj.ground_speed(a0)

PlayerBlockCollideAirRightUpDownReturn:
	rts

; ------------------------------------------------------------------------------

PlayerSetGround:
	btst	#4,obj.flags(a0)
	beq.s	PlayerSetGroundCheckRolling
	nop

PlayerSetGroundCheckRolling:
	bclr	#5,obj.flags(a0)
	bclr	#1,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	btst	#2,obj.flags(a0)
	beq.s	PlayerSetGroundFinish
	bclr	#2,obj.flags(a0)
	tst.b	shrunk_player
	beq.s	PlayerSetGroundNormalSize
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	bra.s	PlayerSetGroundFinishAnimation

; ------------------------------------------------------------------------------

PlayerSetGroundNormalSize:
	move.b	#$13,obj.height(a0)
	move.b	#9,obj.width(a0)
	subq.w	#5,obj.y(a0)

PlayerSetGroundFinishAnimation:
	move.b	#0,obj.anim_id(a0)

PlayerSetGroundFinish:
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
	beq.s	PlayerHurtCheckBlocks
	subi.w	#$20,obj.y_speed(a0)

PlayerHurtCheckBlocks:
	bsr.w	PlayerHurtRecover
	bsr.w	PlayerCheckBounds
	bsr.w	PlayerBufferPosition
	bsr.w	PlayerAnimate
	jmp	DrawObject

; ------------------------------------------------------------------------------

PlayerHurtRecover:
	move.w	bottom_bound,d0
	addi.w	#$E0,d0
	cmp.w	obj.y(a0),d0
	bcs.w	KillPlayer
	bsr.w	PlayerBlockCollideAir
	btst	#1,obj.flags(a0)
	bne.s	PlayerHurtRecoverReturn
	moveq	#0,d0
	move.w	d0,obj.y_speed(a0)
	move.w	d0,obj.x_speed(a0)
	move.w	d0,obj.ground_speed(a0)
	move.b	#0,obj.anim_id(a0)
	subq.b	#2,obj.routine(a0)
	move.w	#$78,obj.var_30(a0)

PlayerHurtRecoverReturn:
	rts

; ------------------------------------------------------------------------------

PlayerDead:
	bsr.w	PlayerDeadProcess
	jsr	MoveObjectFall
	bsr.w	PlayerBufferPosition
	bsr.w	PlayerAnimate
	jmp	DrawObject

; ------------------------------------------------------------------------------

PlayerDeadProcess:
	move.w	bottom_bound,d0
	addi.w	#$100,d0
	cmp.w	obj.y(a0),d0
	bcc.w	PlayerDeadReturn
	move.w	#$FFC8,obj.y_speed(a0)
	addq.b	#2,obj.routine(a0)
	clr.b	update_hud_time
	addq.b	#1,update_hud_lives
	subq.b	#1,lives
	bpl.s	PlayerDeadCheckLives
	clr.b	lives

PlayerDeadCheckLives:
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.s	PlayerDeadSpawnLifeIcon
	tst.b	time_attack
	beq.s	PlayerDeadSpawnLifeIcon
	move.b	#0,lives
	bra.s	PlayerDeadSetRestartTimer

; ------------------------------------------------------------------------------

PlayerDeadSpawnLifeIcon:
	jsr	SpawnObject
	move.b	#$3B,0(a1)
	move.w	#$1E0,obj.var_3a(a0)
	tst.b	lives
	beq.s	PlayerDeadReturn

PlayerDeadSetRestartTimer:
	move.w	#$3C,obj.var_3a(a0)

PlayerDeadReturn:
	rts

; ------------------------------------------------------------------------------

PlayerRestart:
	tst.w	obj.var_3a(a0)
	beq.w	PlayerRestartReturn
	subq.w	#1,obj.var_3a(a0)
	bne.w	PlayerRestartReturn
	move.w	#1,restart_stage
	bsr.w	ResetObjectStates
	clr.l	flower_counts
	tst.b	respawn_checkpoint
	bne.s	PlayerRestartSelectSpawn
	cmpi.b	#1,time_zone
	bne.s	PlayerRestartSelectSpawn
	bclr	#1,stage_start_flags

PlayerRestartSelectSpawn:
	move.w	#$E,d0
	tst.b	lives
	beq.s	PlayerRestartSendCommand
	cmpi.b	#1,time_zone
	bne.s	PlayerRestartDefaultSpawn
	tst.b	respawn_checkpoint
	beq.s	PlayerRestartSendCommand
	move.b	#1,spawn_mode
	bra.s	PlayerRestartSendCommand

; ------------------------------------------------------------------------------

PlayerRestartDefaultSpawn:
	clr.b	spawn_mode

PlayerRestartSendCommand:
	bra.w	SubCpuCommand

; ------------------------------------------------------------------------------

PlayerRestartReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckChunk:
	rts

; ------------------------------------------------------------------------------

	cmpi.b	#5,zone
	beq.s	PlayerCheckChunkMapLookup
	cmpi.b	#2,zone
	beq.s	PlayerCheckChunkMapLookup
	tst.b	zone
	bne.w	PlayerCheckChunkReturn

PlayerCheckChunkMapLookup:
	move.w	obj.y(a0),d0
	lsr.w	#1,d0
	andi.w	#$380,d0
	move.b	obj.x(a0),d1
	andi.w	#$7F,d1
	add.w	d1,d0
	lea	stage_map,a1
	move.b	(a1,d0.w),d1
	cmp.b	roll_chunk_1,d1
	bne.s	PlayerCheckChunkRollMatch2
	tst.b	zone
	bne.w	PlayerCheckChunkStartRoll
	move.w	obj.y(a0),d0
	andi.w	#$FF,d0
	cmpi.w	#$90,d0
	bcc.w	PlayerCheckChunkStartRoll
	bra.s	PlayerCheckChunkLoopChecks

; ------------------------------------------------------------------------------

PlayerCheckChunkRollMatch2:
	cmp.b	roll_chunk_2,d1
	beq.w	PlayerCheckChunkStartRoll

PlayerCheckChunkLoopChecks:
	cmp.b	loop_chunk_1,d1
	beq.s	PlayerCheckChunkLoopMatch2Return
	cmp.b	loop_chunk_2,d1
	beq.s	PlayerCheckChunkLoopMatch2
	bclr	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckChunkLoopMatch2:
	cmpi.b	#5,zone
	beq.w	PlayerCheckChunkZone5Flip
	btst	#1,obj.flags(a0)
	beq.s	PlayerCheckChunkLoopMatch2Return
	bclr	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckChunkLoopMatch2Return:
	rts

; ------------------------------------------------------------------------------

PlayerCheckChunkLoopMatch1:
	move.w	obj.x(a0),d2
	cmpi.b	#$2C,d2
	bcc.s	PlayerCheckChunkCheckXRight
	bclr	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckChunkCheckXRight:
	cmpi.b	#$E0,d2
	bcs.s	PlayerCheckChunkCheckAngle
	bset	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckChunkCheckAngle:
	btst	#6,obj.sprite_flags(a0)
	bne.s	PlayerCheckChunkAngleFlipSet
	move.b	obj.angle(a0),d1
	beq.s	PlayerCheckChunkReturn
	cmpi.b	#$80,d1
	bhi.s	PlayerCheckChunkReturn
	bset	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckChunkAngleFlipSet:
	move.b	obj.angle(a0),d1
	cmpi.b	#$80,d1
	bls.s	PlayerCheckChunkReturn
	bclr	#6,obj.sprite_flags(a0)

PlayerCheckChunkReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckChunkStartRoll:
	if REGION<>USA
		move.w	#$9C,d0
		jsr	PlayFmSound
	endif
	jmp	PlayerStartRoll

; ------------------------------------------------------------------------------

PlayerCheckChunkZone5Flip:
	tst.w	obj.y_speed(a0)
	bmi.s	PlayerCheckChunkZone5Return
	move.w	obj.y(a0),d1
	andi.w	#$FF,d1
	move.w	obj.x(a0),d0
	andi.w	#$FF,d0
	cmpi.w	#$80,d0
	bcc.s	PlayerCheckChunkZone5CheckRight
	cmpi.w	#$38,d1
	bcs.s	PlayerCheckChunkZone5SetFlip
	cmpi.w	#$80,d1
	bcs.s	PlayerCheckChunkZone5Return

PlayerCheckChunkZone5ClearFlip:
	bclr	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckChunkZone5SetFlip:
	bset	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckChunkZone5CheckRight:
	cmpi.w	#$38,d1
	bcs.s	PlayerCheckChunkZone5ClearFlip
	cmpi.w	#$80,d1
	bcc.s	PlayerCheckChunkZone5SetFlip

PlayerCheckChunkZone5Return:
	rts

; ------------------------------------------------------------------------------

PlayerAnimate:
	lea	PlayerAnims,a1
	moveq	#0,d0
	move.b	obj.anim_id(a0),d0
	cmp.b	obj.prev_anim_id(a0),d0
	beq.s	PlayerAnimateCheckFrame
	move.b	d0,obj.prev_anim_id(a0)
	move.b	#0,obj.anim_index(a0)
	move.b	#0,obj.anim_timer(a0)

PlayerAnimateCheckFrame:
	bsr.w	PlayerAnimateMapAnimation
	add.w	d0,d0
	adda.w	(a1,d0.w),a1
	move.b	(a1),d0
	bmi.s	PlayerAnimateDynamic
	move.b	obj.flags(a0),d1
	andi.b	#1,d1
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d1,obj.sprite_flags(a0)
	subq.b	#1,obj.anim_timer(a0)
	bpl.s	PlayerAnimateFrameReturn
	move.b	d0,obj.anim_timer(a0)

; ------------------------------------------------------------------------------

PlayerAnimateAdvanceFrame:
	moveq	#0,d1
	move.b	obj.anim_index(a0),d1
	move.b	1(a1,d1.w),d0
	beq.s	PlayerAnimateStoreFrame
	bpl.s	PlayerAnimateStoreFrame
	cmpi.b	#$FD,d0
	bge.s	PlayerAnimateLoopCommand

PlayerAnimateStoreFrame:
	move.b	d0,obj.sprite_frame(a0)
	addq.b	#1,obj.anim_index(a0)

PlayerAnimateFrameReturn:
	rts

; ------------------------------------------------------------------------------

PlayerAnimateLoopCommand:
	addq.b	#1,d0
	bne.s	PlayerAnimateReverseCommand
	move.b	#0,obj.anim_index(a0)
	move.b	1(a1),d0
	bra.s	PlayerAnimateStoreFrame

; ------------------------------------------------------------------------------

PlayerAnimateReverseCommand:
	addq.b	#1,d0
	bne.s	PlayerAnimateEndCommand
	move.b	2(a1,d1.w),d0
	sub.b	d0,obj.anim_index(a0)
	sub.b	d0,d1
	move.b	1(a1,d1.w),d0
	bra.s	PlayerAnimateStoreFrame

; ------------------------------------------------------------------------------

PlayerAnimateEndCommand:
	addq.b	#1,d0
	bne.s	PlayerAnimateCommandReturn
	move.b	2(a1,d1.w),obj.anim_id(a0)

PlayerAnimateCommandReturn:
	rts

; ------------------------------------------------------------------------------

PlayerAnimateDynamic:
	subq.b	#1,obj.anim_timer(a0)
	bpl.s	PlayerAnimateFrameReturn
	addq.b	#1,d0
	bne.w	PlayerAnimateRollingDynamic
	tst.b	shrunk_player
	bne.w	PlayerAnimateShrunkDynamic
	moveq	#0,d1
	move.b	obj.angle(a0),d0
	move.b	obj.flags(a0),d2
	andi.b	#1,d2
	bne.s	PlayerAnimateDynamicOrientation
	not.b	d0

PlayerAnimateDynamicOrientation:
	btst	#1,obj.var_2c(a0)
	bne.s	PlayerAnimateDynamic3dAngle
	addi.b	#$10,d0
	bra.s	PlayerAnimateDynamicSelect

; ------------------------------------------------------------------------------

PlayerAnimateDynamic3dAngle:
	addq.b	#8,d0

PlayerAnimateDynamicSelect:
	bpl.s	PlayerAnimateDynamicSetQuadrant
	moveq	#3,d1

PlayerAnimateDynamicSetQuadrant:
	andi.b	#$FC,obj.sprite_flags(a0)
	eor.b	d1,d2
	or.b	d2,obj.sprite_flags(a0)
	btst	#5,obj.flags(a0)
	bne.w	PlayerAnimatePushDynamic
	move.w	obj.ground_speed(a0),d2
	bpl.s	PlayerAnimateDynamicSpeed
	neg.w	d2

PlayerAnimateDynamicSpeed:
	btst	#1,obj.var_2c(a0)
	beq.s	PlayerAnimateDynamicPeelout
	lsr.b	#4,d0
	lsl.b	#1,d0
	andi.b	#$E,d0
	lea	PlayerRun3dAnim,a1
	bra.s	PlayerAnimateDynamicSetTimer

; ------------------------------------------------------------------------------

PlayerAnimateDynamicPeelout:
	lsr.b	#4,d0
	andi.b	#6,d0
	lea	PlayerPeeloutAnim,a1
	cmpi.w	#$A00,d2
	bcc.s	PlayerAnimateDynamicSetTimer
	lea	PlayerRunAnim,a1
	cmpi.w	#$600,d2
	bcc.s	PlayerAnimateDynamicSetTimer
	lea	PlayerWalkAnim,a1
	move.b	d0,d1
	lsr.b	#1,d1
	add.b	d1,d0

PlayerAnimateDynamicSetTimer:
	add.b	d0,d0
	move.b	d0,d3
	neg.w	d2
	addi.w	#$800,d2
	bpl.s	PlayerAnimateDynamicClampTimer
	moveq	#0,d2

PlayerAnimateDynamicClampTimer:
	lsr.w	#8,d2
	move.b	d2,obj.anim_timer(a0)
	bsr.w	PlayerAnimateAdvanceFrame
	add.b	d3,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

PlayerAnimateRollingDynamic:
	addq.b	#1,d0
	bne.s	PlayerAnimatePushDispatch
	move.w	obj.ground_speed(a0),d2
	bpl.s	PlayerAnimateRollingSpeed
	neg.w	d2

PlayerAnimateRollingSpeed:
	lea	PlayerRollShrunkAnim,a1
	tst.b	shrunk_player
	bne.s	PlayerAnimateRollingSetTimer
	lea	PlayerRollFastAnim,a1
	btst	#1,obj.var_2c(a0)
	beq.s	PlayerAnimateRollingSelectNormal
	move.b	obj.angle(a0),d0
	addi.b	#$10,d0
	andi.b	#$C0,d0
	beq.s	PlayerAnimateRollingSetTimer
	lea	PlayerRoll3dAnim,a1
	bra.s	PlayerAnimateRollingSetTimer

; ------------------------------------------------------------------------------

PlayerAnimateRollingSelectNormal:
	cmpi.w	#$600,d2
	bcc.s	PlayerAnimateRollingSetTimer
	lea	PlayerRollAnim,a1

PlayerAnimateRollingSetTimer:
	neg.w	d2
	addi.w	#$400,d2
	bpl.s	PlayerAnimateRollingClampTimer
	moveq	#0,d2

PlayerAnimateRollingClampTimer:
	lsr.w	#8,d2
	move.b	d2,obj.anim_timer(a0)
	move.b	obj.flags(a0),d1
	andi.b	#1,d1
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d1,obj.sprite_flags(a0)
	bra.w	PlayerAnimateAdvanceFrame

; ------------------------------------------------------------------------------

PlayerAnimatePushDispatch:
	addq.b	#1,d0
	bne.s	PlayerAnimateStaticFrame

PlayerAnimatePushDynamic:
	move.w	obj.ground_speed(a0),d2
	bmi.s	PlayerAnimatePushSpeed
	neg.w	d2

PlayerAnimatePushSpeed:
	addi.w	#$800,d2
	bpl.s	PlayerAnimatePushSetTimer
	moveq	#0,d2

PlayerAnimatePushSetTimer:
	lsr.w	#6,d2
	move.b	d2,obj.anim_timer(a0)
	lea	PlayerPushShrunkAnim,a1
	tst.b	shrunk_player
	bne.s	PlayerAnimatePushSelectNormal
	lea	PlayerPushAnim,a1

PlayerAnimatePushSelectNormal:
	move.b	obj.flags(a0),d1
	andi.b	#1,d1
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d1,obj.sprite_flags(a0)
	bra.w	PlayerAnimateAdvanceFrame

; ------------------------------------------------------------------------------

PlayerAnimateStaticFrame:
	moveq	#0,d1
	move.b	obj.anim_index(a0),d1
	move.b	1(a1,d1.w),obj.sprite_frame(a0)
	move.b	#0,obj.anim_timer(a0)
	rts

; ------------------------------------------------------------------------------

PlayerAnimateShrunkDynamic:
	moveq	#0,d1
	move.b	obj.angle(a0),d0
	move.b	obj.flags(a0),d2
	andi.b	#1,d2
	bne.s	PlayerAnimateShrunkOrientation
	not.b	d0

PlayerAnimateShrunkOrientation:
	addi.b	#$10,d0
	bpl.s	PlayerAnimateShrunkSetQuadrant
	moveq	#0,d1

PlayerAnimateShrunkSetQuadrant:
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d2,obj.sprite_flags(a0)
	addi.b	#$30,d0
	cmpi.b	#$60,d0
	bcs.s	PlayerAnimateShrunkCheckRoll
	bset	#2,obj.flags(a0)
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	move.b	#$FF,d0
	bra.w	PlayerAnimateRollingDynamic

; ------------------------------------------------------------------------------

PlayerAnimateShrunkCheckRoll:
	move.w	obj.ground_speed(a0),d2
	bpl.s	PlayerAnimateShrunkSpeed
	neg.w	d2

PlayerAnimateShrunkSpeed:
	lea	PlayerRunShrunkAnim,a1
	cmpi.w	#$600,d2
	bcc.s	PlayerAnimateShrunkSetTimer
	lea	PlayerWalkShrunkAnim,a1

PlayerAnimateShrunkSetTimer:
	neg.w	d2
	addi.w	#$800,d2
	bpl.s	PlayerAnimateShrunkClampTimer
	moveq	#0,d2

PlayerAnimateShrunkClampTimer:
	lsr.w	#8,d2
	move.b	d2,obj.anim_timer(a0)
	bra.w	PlayerAnimateAdvanceFrame

; ------------------------------------------------------------------------------

PlayerAnimateMapAnimation:
	tst.b	shrunk_player
	beq.s	PlayerAnimateMapReturn
	move.b	PlayerShrunkAnimationMap(pc,d0.w),d0

PlayerAnimateMapReturn:
	rts

; ------------------------------------------------------------------------------

PlayerShrunkAnimationMap:
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
	beq.w	LoadPlayerGfxReturn
	lea	player_sprite_frame,a2
	moveq	#0,d0
	move.b	obj.sprite_frame(a0),d0
	cmp.b	(a2),d0
	beq.s	LoadPlayerGfxReturn
	move.b	d0,(a2)
	lea	PlayerGfxScript,a2
	add.w	d0,d0
	adda.w	(a2,d0.w),a2
	moveq	#0,d1
	move.w	(a2)+,d1
	subq.b	#1,d1
	bmi.s	LoadPlayerGfxReturn
	lea	player_gfx,a3
	move.b	#1,update_player_gfx

LoadPlayerGfxScriptLoop:
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

LoadPlayerGfxCopyTiles:
	movem.l	(a1)+,d2-d6/a4-a6
	movem.l	d2-d6/a4-a6,(a3)
	lea	$20(a3),a3
	dbf	d0,LoadPlayerGfxCopyTiles
	dbf	d1,LoadPlayerGfxScriptLoop

LoadPlayerGfxReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckFlipper:
	moveq	#0,d0
	move.b	obj.var_3d(a0),d0
	lsl.w	#6,d0
	addi.l	#object_pool&$FFFFFF,d0
	movea.l	d0,a1
	cmpi.b	#$1E,obj.id(a1)
	bne.s	PlayerCheckFlipperReturn
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
	bne.s	PlayerCheckFlipperAdjustX
	move.w	#$40,d1
	sub.w	d3,d1
	move.w	d1,d3

PlayerCheckFlipperAdjustX:
	move.w	#-$A00,d2
	move.w	d2,d1
	ext.l	d1
	muls.w	d3,d1
	divs.w	#$40,d1
	add.w	d1,d2
	moveq	#0,d1

PlayerCheckFlipperReturn:
	rts

; ------------------------------------------------------------------------------
