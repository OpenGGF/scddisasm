; ------------------------------------------------------------------------------

	if def(R8_VARIANT)
		if (R8_VARIANT=5)&(DEMO<>0)&(REGION<>USA)
player_shrunk_state	equ	$FF1587
		else
player_shrunk_state	equ	shrunk_player
		endif
	else
player_shrunk_state	equ	shrunk_player
	endif

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
	if def(R8_VARIANT)
		if (R8_VARIANT<>5)|(DEMO=0)|(REGION=USA)
			move.b	#0,obj.sprite_layer(a0)
		endif
	else
		move.b	#0,obj.sprite_layer(a0)
	endif
	move.b	#1,lives
	move.w	#-$500,obj.y_speed(a0)
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
	if (REGION<>USA)|((REGION=USA)&(DEMO=0))
	tst.b	time_attack
	bne.s	PlayerObjectCheckDebug
	cmpa.w	#player_object_2,a0
	beq.s	PlayerObjectCheckDebug
	if (REGION<>USA)&(DEMO<>0)
		btst	#7,$FFFFF607.w
		beq.s	.skipDemoPlayerState
		eori.b	#1,$FF1588
	.skipDemoPlayerState:
	endif
	tst.b	debug_mode
	beq.s	PlayerObjectCheckDebug
	jmp	DebugModeLegacy
	endif

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
	tst.b	player_shrunk_state
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
	andi.b	#1,d0
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
	move.b	d0,obj.sprite_flags(a1)
	move.b	d0,obj.flags(a1)

PlayerMakeSplashReturn:
	rts

; ------------------------------------------------------------------------------

PlayerMakeSplashWrongChunkReturn:
	rts

; ------------------------------------------------------------------------------

PlayerGetChunk:
	move.w	d2,d0
	lsr.w	#1,d0
	andi.w	#$380,d0
	move.w	d3,d1
	lsr.w	#8,d1
	andi.w	#$7F,d1
	add.w	d1,d0
	if STANDALONE=0
		move.l	#StageChunks,d1
	endif
	lea	stage_map,a1
	move.b	(a1,d0.w),d1
	andi.b	#$7F,d1
	rts

; ------------------------------------------------------------------------------

PlayerExtendedCamera:
	move.w	scroll_focus_x,d1
	move.w	obj.ground_speed(a0),d0
	bpl.s	PlayerExtendedCameraReverseSpeed
	neg.w	d0

PlayerExtendedCameraReverseSpeed:
	btst	#1,obj.var_2c(a0)
	beq.s	PlayerExtendedCameraApplySpeed
	cmpi.w	#$1B00,obj.x(a0)
	bcs.s	PlayerExtendedCameraCenter

PlayerExtendedCameraApplySpeed:
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
	bcc.s	PlayerExtendedCameraMoveRight
	addq.w	#2,d1
	bra.s	PlayerExtendedCameraCommitFocus

; ------------------------------------------------------------------------------

PlayerExtendedCameraMoveRight:
	subq.w	#2,d1

PlayerExtendedCameraCommitFocus:
	move.w	d1,scroll_focus_x
	rts

; ------------------------------------------------------------------------------

PlayerMain:
	bsr.s	PlayerExtendedCamera
	bsr.w	PlayerMakeSplash
	tst.w	debug_cheat
	beq.s	PlayerMainAfterDebugCheat
	btst	#4,p1_joy_tap
	beq.s	PlayerMainAfterDebugCheat
	move.b	#1,debug_mode
	rts

; ------------------------------------------------------------------------------

PlayerMainAfterDebugCheat:
	tst.b	control_locked
	bne.s	PlayerMainAfterControlInput
	move.w	p1_joy_hold,player_joy_hold

PlayerMainAfterControlInput:
	btst	#0,obj.var_2c(a0)
	beq.s	PlayerMainNormalState
	cmpi.b	#6,zone
	bne.s	PlayerMainWarpCheck
	clr.w	warp_timer
	clr.b	warping
	bra.s	PlayerMainAfterWarp

; ------------------------------------------------------------------------------

PlayerMainWarpCheck:
	bsr.w	PlayerCheckWarp
	bra.s	PlayerMainAfterWarp

; ------------------------------------------------------------------------------

PlayerMainNormalState:
	moveq	#0,d0
	move.b	obj.flags(a0),d0
	andi.w	#6,d0
	move.w	PlayerStates(pc,d0.w),d1
	jsr	PlayerStates(pc,d1.w)
	jsr	PlayerCheckBlock

PlayerMainAfterWarp:
	bsr.s	PlayerUpdatePowerups
	bsr.w	PlayerBufferPosition
	bsr.w	PlayerCheckWater
	move.b	collide_angle_1,obj.var_36(a0)
	move.b	collide_angle_2,obj.var_37(a0)
	tst.b	water_current_flag
	beq.s	PlayerMainAnimate
	tst.b	obj.anim_id(a0)
	bne.s	PlayerMainAnimate
	move.b	obj.prev_anim_id(a0),obj.anim_id(a0)

PlayerMainAnimate:
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

; ------------------------------------------------------------------------------

S1StageMusicIds2:
	dc.b	$81, $82, $83, $84, $85, $86

; ------------------------------------------------------------------------------

PlayerUpdatePowerups:
	cmpi.w	#210,warp_timer
	bcc.s	PlayerUpdatePowerupsAfterBlink
	move.w	obj.var_30(a0),d0
	beq.s	PlayerUpdatePowerupsBlinkReady
	subq.w	#1,obj.var_30(a0)
	lsr.w	#3,d0
	bcc.s	PlayerUpdatePowerupsAfterBlink

PlayerUpdatePowerupsBlinkReady:
	btst	#6,obj.var_2c(a0)
	bne.s	PlayerUpdatePowerupsAfterBlink
	jsr	DrawObject

PlayerUpdatePowerupsAfterBlink:
	tst.b	invincible
	beq.s	PlayerUpdatePowerupsSpeedShoes
	tst.w	obj.var_32(a0)
	beq.s	PlayerUpdatePowerupsSpeedShoes
	subq.w	#1,obj.var_32(a0)
	bne.s	PlayerUpdatePowerupsSpeedShoes
	tst.b	speed_shoes
	bne.s	PlayerUpdatePowerupsPlayMusic
	tst.b	boss_music
	bne.s	PlayerUpdatePowerupsPlayMusic
	tst.b	time_zone
	bne.s	PlayerUpdatePowerupsRestoreMusic
	move.w	#$E,d0
	jsr	SubCpuCommand

PlayerUpdatePowerupsRestoreMusic:
	jsr	PlayStageMusic

PlayerUpdatePowerupsPlayMusic:
	move.b	#0,invincible

PlayerUpdatePowerupsSpeedShoes:
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
	bne.s	PlayerUpdatePowerupsSpeedShoesPlayMusic
	tst.b	boss_music
	bne.s	PlayerUpdatePowerupsSpeedShoesPlayMusic
	tst.b	time_zone
	bne.s	PlayerUpdatePowerupsSpeedShoesRestoreMusic
	move.w	#$E,d0
	jsr	SubCpuCommand

PlayerUpdatePowerupsSpeedShoesRestoreMusic:
	jsr	PlayStageMusic

PlayerUpdatePowerupsSpeedShoesPlayMusic:
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
	cmpi.b	#2,zone
	beq.s	PlayerCheckWaterActive

PlayerCheckWaterReturn:
	rts

; ------------------------------------------------------------------------------

PlayerCheckWaterActive:
	cmpi.b	#1,act
	bne.s	PlayerCheckWaterEnter
	cmpi.w	#$C8,obj.x(a0)
	bcs.s	PlayerCheckWaterReturn

PlayerCheckWaterEnter:
	move.w	water_y,d0
	cmp.w	obj.y(a0),d0
	bge.s	PlayerCheckWaterSurface
	bset	#6,obj.flags(a0)
	bne.s	PlayerCheckWaterReturn
	bsr.w	PlayerResetDrown
	move.b	#$21,bubbles_object+obj.id
	move.b	#$81,bubbles_object+obj.subtype
	move.w	#$300,player_max_speed
	move.w	#6,player_acceleration
	move.w	#$40,player_deceleration
	asr.w	obj.x_speed(a0)
	asr.w	obj.y_speed(a0)
	asr.w	obj.y_speed(a0)
	beq.s	PlayerCheckWaterReturn
	bra.s	PlayerCheckWaterSpawnBubbles

; ------------------------------------------------------------------------------

PlayerCheckWaterSurface:
	tst.w	obj.y_speed(a0)
	beq.s	PlayerCheckWaterExit
	bpl.s	PlayerCheckWaterReturn

PlayerCheckWaterExit:
	bclr	#6,obj.flags(a0)
	beq.s	PlayerCheckWaterReturn
	move.w	#$600,player_max_speed
	move.w	#$C,player_acceleration
	move.w	#$80,player_deceleration
	asl.w	obj.y_speed(a0)
	beq.w	PlayerCheckWaterReturn
	cmpi.w	#-$1000,obj.y_speed(a0)
	bgt.s	PlayerCheckWaterSpawnBubbles
	move.w	#-$1000,obj.y_speed(a0)

PlayerCheckWaterSpawnBubbles:
	jsr	SpawnObject
	bne.s	PlayerCheckWaterSpawnReturn
	move.b	#$B,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)

PlayerCheckWaterSpawnReturn:
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
	bclr	#6,warp_player_flags
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
	bcs.s	PlayerSetWarpRespawnStoreTime
	move.l	#$50000,d0

PlayerSetWarpRespawnStoreTime:
	move.l	d0,warp_time
	if def(R8_VARIANT)
		if (R8_VARIANT<>5)|(DEMO=0)|(REGION=USA)
			move.b	shrunk_player,warp_shrunk
		endif
	else
		move.b	shrunk_player,warp_shrunk
	endif
	rts

; ------------------------------------------------------------------------------

PlayerCheckWarp:
	cmpi.w	#0,zone
	bne.s	PlayerCheckWarpActive
	tst.b	time_zone
	beq.s	PlayerCheckWarpStageGate
	cmpi.b	#2,time_zone
	bne.s	PlayerCheckWarpActive

PlayerCheckWarpStageGate:
	cmpi.w	#$900,obj.x(a0)
	bcs.w	PlayerCheckWarpReset

PlayerCheckWarpActive:
	tst.b	obj.var_2a(a0)
	bne.w	PlayerCheckWarpReturn
	tst.b	warp_direction
	beq.w	PlayerCheckWarpReturn
	move.w	#$600,d2
	moveq	#0,d0
	move.w	obj.ground_speed(a0),d0
	bpl.s	PlayerCheckWarpSpeedAbs
	neg.w	d0

PlayerCheckWarpSpeedAbs:
	tst.w	warp_timer
	bne.s	PlayerCheckWarpStartTimer
	move.w	#1,warp_timer

PlayerCheckWarpStartTimer:
	move.w	warp_timer,d1
	cmpi.w	#230,d1
	bcs.s	PlayerCheckWarpTransitionThreshold
	move.b	#1,restart_stage
	bra.w	FadeOutMusic

; ------------------------------------------------------------------------------

PlayerCheckWarpTransitionThreshold:
	cmpi.w	#210,d1
	bcs.s	PlayerCheckWarpCreateStars
	cmpi.b	#2,spawn_mode
	beq.s	PlayerCheckWarpReturnAfterTransition
	move.b	#1,scroll_lock
	move.b	time_zone,d0
	bne.s	PlayerCheckWarpSelectTimeZone
	move.w	#$82,d0
	jsr	SubCpuCommand
	moveq	#0,d0

PlayerCheckWarpSelectTimeZone:
	add.b	warp_direction,d0
	bpl.s	PlayerCheckWarpClampTimeZone
	moveq	#0,d0
	bra.s	PlayerCheckWarpCommitTimeZone

; ------------------------------------------------------------------------------

PlayerCheckWarpClampTimeZone:
	cmpi.b	#3,d0
	bcs.s	PlayerCheckWarpCommitTimeZone
	moveq	#2,d0

PlayerCheckWarpCommitTimeZone:
	bset	#7,d0
	move.b	d0,time_zone
	bsr.w	SetPlayerWarpRespawn
	move.b	#2,spawn_mode

PlayerCheckWarpReturnAfterTransition:
	rts

; ------------------------------------------------------------------------------

PlayerCheckWarpCreateStars:
	cmpi.w	#90,d1
	bcc.s	PlayerCheckWarpCancelIfSlow
	cmp.w	d2,d0
	bcc.w	PlayerMakeWarpStars
	clr.w	warp_timer
	clr.b	warping
	rts

; ------------------------------------------------------------------------------

PlayerCheckWarpCancelIfSlow:
	cmp.w	d2,d0
	bcc.s	PlayerCheckWarpReturn

PlayerCheckWarpReset:
	clr.w	warp_timer
	clr.b	warp_direction
	clr.b	warping

PlayerCheckWarpReturn:
	rts

; ------------------------------------------------------------------------------

PlayerGroundState:
	bsr.w	PlayerCheckBored
	cmpi.b	#$2B,obj.anim_id(a0)
	bne.s	PlayerGroundStateNormal
	tst.b	player_shrunk_state
	beq.s	PlayerGroundStateShrunkFrame
	cmpi.b	#$79,obj.sprite_frame(a0)
	bne.s	PlayerGroundStateReturn
	bra.s	PlayerGroundStateFall

; ------------------------------------------------------------------------------

PlayerGroundStateShrunkFrame:
	cmpi.b	#$17,obj.sprite_frame(a0)
	bcs.s	PlayerGroundStateReturn

PlayerGroundStateFall:
	bsr.w	PlayerCheckBounds
	jmp	MoveObjectFall

; ------------------------------------------------------------------------------

PlayerGroundStateNormal:
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
	tst.b	water_current_flag
	bne.s	PlayerFallStateMove
	cmpi.b	#$15,obj.anim_id(a0)
	beq.s	PlayerFallStateMove
	tst.w	obj.y_speed(a0)
	bmi.s	PlayerFallStateMove
	move.b	#0,obj.anim_id(a0)

PlayerFallStateMove:
	bsr.w	PlayerCheckBooster3d
	bsr.w	PlayerCheckWarp
	bsr.w	PlayerJumpHeight
	bsr.w	PlayerMoveAir
	bsr.w	PlayerCheckBounds
	jsr	MoveObjectFall
	btst	#6,obj.flags(a0)
	beq.s	PlayerFallStateAfterWater
	subi.w	#$28,obj.y_speed(a0)

PlayerFallStateAfterWater:
	bsr.w	PlayerResetAngle
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
	bsr.w	PlayerCheckBooster3d
	bsr.w	PlayerCheckWarp
	bsr.w	PlayerJumpHeight
	bsr.w	PlayerMoveAir
	bsr.w	PlayerCheckBounds
	jsr	MoveObjectFall
	btst	#6,obj.flags(a0)
	beq.s	PlayerJumpStateAfterWater
	subi.w	#$28,obj.y_speed(a0)

PlayerJumpStateAfterWater:
	bsr.w	PlayerResetAngle
	bsr.w	PlayerBlockCollideAir
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
	dc.b	$49
	dc.b	$4C
	dc.b	-1

; ------------------------------------------------------------------------------

PlayerMoveGround:
	move.w	player_max_speed,d6
	move.w	player_acceleration,d5
	move.w	player_deceleration,d4
	tst.b	water_slide_flag
	bne.w	PlayerMoveGroundSetVelocity
	tst.w	obj.var_3e(a0)
	bne.w	PlayerMoveGroundNeutralFocus
	btst	#2,player_joy_hold
	beq.s	PlayerMoveGroundAfterLeft
	bsr.w	PlayerMoveGroundLeft

PlayerMoveGroundAfterLeft:
	btst	#3,player_joy_hold
	beq.s	PlayerMoveGroundCheckSlope
	bsr.w	PlayerMoveGroundRight

PlayerMoveGroundCheckSlope:
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	bne.w	PlayerMoveGroundNeutralFocus
	tst.w	obj.ground_speed(a0)
	beq.s	PlayerMoveGroundStop
	tst.b	obj.var_2a(a0)
	beq.w	PlayerMoveGroundNeutralFocus
	bra.s	PlayerMoveGroundCheckAttachedObject

; ------------------------------------------------------------------------------

PlayerMoveGroundStop:
	bclr	#5,obj.flags(a0)
	move.b	#5,obj.anim_id(a0)

PlayerMoveGroundCheckAttachedObject:
	btst	#3,obj.flags(a0)
	beq.s	PlayerMoveGroundCheckStep
	moveq	#0,d0
	move.b	obj.var_3d(a0),d0
	lsl.w	#6,d0
	lea	object_pool,a1
	lea	(a1,d0.w),a1
	tst.b	obj.flags(a1)
	bmi.w	PlayerMoveGroundFocusMode
	cmpi.b	#$1E,obj.id(a1)
	bne.s	PlayerMoveGroundCheckAttachedRange
	move.b	#0,obj.anim_id(a0)
	bra.w	PlayerMoveGroundNeutralFocus

; ------------------------------------------------------------------------------

PlayerMoveGroundCheckAttachedRange:
	moveq	#0,d1
	move.b	obj.width_2(a1),d1
	move.w	d1,d2
	add.w	d2,d2
	subq.w	#4,d2
	add.w	obj.x(a0),d1
	sub.w	obj.x(a1),d1
	cmpi.w	#4,d1
	blt.s	PlayerMoveGroundCheckFacing
	cmp.w	d2,d1
	bge.s	PlayerMoveGroundSelectAnim
	bra.s	PlayerMoveGroundFocusMode

; ------------------------------------------------------------------------------

PlayerMoveGroundCheckStep:
	jsr	CheckBlockDown
	cmpi.w	#$C,d1
	blt.s	PlayerMoveGroundFocusMode
	move.w	#$AB,d0
	jsr	PlayFmSound
	move.b	#0,obj.var_2a(a0)
	move.w	#0,obj.ground_speed(a0)
	cmpi.b	#3,obj.var_36(a0)
	bne.s	PlayerMoveGroundCheckOppositeAngle

PlayerMoveGroundSelectAnim:
	btst	#0,obj.flags(a0)
	bne.s	PlayerMoveGroundSetAnim32
	bra.s	PlayerMoveGroundSetAnim6

; ------------------------------------------------------------------------------

PlayerMoveGroundCheckOppositeAngle:
	cmpi.b	#3,obj.var_37(a0)
	bne.s	PlayerMoveGroundFocusMode

PlayerMoveGroundCheckFacing:
	btst	#0,obj.flags(a0)
	bne.s	PlayerMoveGroundSetAnim6

PlayerMoveGroundSetAnim32:
	move.b	#$32,obj.anim_id(a0)
	bra.w	PlayerMoveGroundNeutralFocus

; ------------------------------------------------------------------------------

PlayerMoveGroundSetAnim6:
	move.b	#6,obj.anim_id(a0)
	bra.w	PlayerMoveGroundNeutralFocus

; ------------------------------------------------------------------------------

PlayerMoveGroundFocusMode:
	move.b	focus_mode,d0
	andi.b	#$F,d0
	beq.s	PlayerMoveGroundFocusDispatch
	addq.b	#1,focus_mode
	andi.b	#$CF,focus_mode

PlayerMoveGroundFocusDispatch:
	btst	#7,focus_mode
	bne.w	PlayerMoveGroundLookUp
	btst	#6,focus_mode
	bne.w	PlayerMoveGroundLookDownOrRoll
	btst	#1,player_joy_hold
	bne.w	PlayerMoveGroundLookDownOrRoll
	andi.b	#$F,focus_mode
	beq.s	PlayerMoveGroundFocusTap
	btst	#0,player_joy_tap
	beq.s	PlayerMoveGroundAccelerate
	bset	#7,focus_mode
	bra.w	PlayerMoveGroundDecelerate

; ------------------------------------------------------------------------------

PlayerMoveGroundFocusTap:
	btst	#0,player_joy_tap
	beq.w	PlayerMoveGroundAccelerate
	move.b	#1,focus_mode
	bra.w	PlayerMoveGroundDecelerate

; ------------------------------------------------------------------------------

PlayerMoveGroundAccelerate:
	btst	#0,player_joy_hold
	beq.s	PlayerMoveGroundBrake
	move.b	#7,obj.anim_id(a0)
	tst.b	obj.var_2a(a0)
	beq.s	PlayerMoveGroundStartRoll
	move.b	#0,obj.anim_id(a0)
	moveq	#100,d0
	move.w	player_max_speed,d1
	move.w	d1,d2
	asl.w	#1,d1
	tst.b	speed_shoes
	beq.s	PlayerMoveGroundSpeedShoesLimit
	asr.w	#1,d2
	sub.w	d2,d1

PlayerMoveGroundSpeedShoesLimit:
	btst	#0,obj.flags(a0)
	beq.s	PlayerMoveGroundApplyDirection
	neg.w	d0
	neg.w	d1

PlayerMoveGroundApplyDirection:
	add.w	d0,obj.ground_speed(a0)
	move.w	obj.ground_speed(a0),d0
	btst	#0,obj.flags(a0)
	beq.s	PlayerMoveGroundClampReverse
	cmp.w	d0,d1
	ble.s	PlayerMoveGroundStoreSpeed
	bra.s	PlayerMoveGroundClampForward

; ------------------------------------------------------------------------------

PlayerMoveGroundClampReverse:
	cmp.w	d1,d0
	ble.s	PlayerMoveGroundStoreSpeed

PlayerMoveGroundClampForward:
	move.w	d1,d0

PlayerMoveGroundStoreSpeed:
	move.w	d0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveGroundStartRoll:
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.s	PlayerMoveGroundAfterRollInput
	move.b	#1,obj.var_2a(a0)
	move.w	#$9C,d0
	jsr	PlayFmSound

PlayerMoveGroundAfterRollInput:
	bra.w	PlayerMoveGroundDecelerate

; ------------------------------------------------------------------------------

PlayerMoveGroundBrake:
	cmpi.b	#$1E,obj.var_2a(a0)
	beq.s	PlayerMoveGroundStopAfterBrake
	move.w	#$AB,d0
	jsr	PlayFmSound
	move.b	#0,obj.var_2a(a0)
	move.w	#0,obj.ground_speed(a0)
	bra.s	PlayerMoveGroundLookDownOrRoll

; ------------------------------------------------------------------------------

PlayerMoveGroundStopAfterBrake:
	move.b	#0,obj.var_2a(a0)
	move.w	#$91,d0
	jsr	PlayFmSound
	bra.w	PlayerMoveGroundNeutralFocus

; ------------------------------------------------------------------------------

	bsr.w	PlayerMoveGroundLeft
	bra.w	PlayerMoveGroundNeutralFocus

; ------------------------------------------------------------------------------

PlayerMoveGroundLookUp:
	btst	#0,player_joy_hold
	beq.s	PlayerMoveGroundLookDownOrRoll
	move.b	#7,obj.anim_id(a0)
	cmpi.w	#$C8,scroll_focus_y
	beq.w	PlayerMoveGroundDecelerate
	addq.w	#2,scroll_focus_y
	bra.w	PlayerMoveGroundDecelerate

; ------------------------------------------------------------------------------

PlayerMoveGroundLookDownOrRoll:
	btst	#6,focus_mode
	bne.w	PlayerMoveGroundLookDown
	andi.b	#$F,focus_mode
	beq.s	PlayerMoveGroundFocusTapDown
	btst	#1,player_joy_tap
	beq.s	PlayerMoveGroundRollInput
	bset	#6,focus_mode
	bra.w	PlayerMoveGroundDecelerate

; ------------------------------------------------------------------------------

PlayerMoveGroundFocusTapDown:
	btst	#1,player_joy_tap
	beq.s	PlayerMoveGroundRollInput
	move.b	#1,focus_mode
	bra.w	PlayerMoveGroundDecelerate

; ------------------------------------------------------------------------------

PlayerMoveGroundRollInput:
	btst	#1,player_joy_hold
	beq.s	PlayerMoveGroundNeutralFocus
	move.b	#8,obj.anim_id(a0)
	tst.b	obj.var_2a(a0)
	bne.s	PlayerMoveGroundAfterRoll
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.s	PlayerMoveGroundAfterRoll
	move.b	#1,obj.var_2a(a0)
	move.w	#$16,obj.ground_speed(a0)
	btst	#0,obj.flags(a0)
	beq.s	PlayerMoveGroundStartRollCommit
	neg.w	obj.ground_speed(a0)

PlayerMoveGroundStartRollCommit:
	move.w	#$9C,d0
	jsr	PlayFmSound
	bsr.w	PlayerStartRoll

PlayerMoveGroundAfterRoll:
	bra.s	PlayerMoveGroundDecelerate

; ------------------------------------------------------------------------------

PlayerMoveGroundLookDown:
	btst	#1,player_joy_hold
	beq.s	PlayerMoveGroundNeutralFocus
	move.b	#8,obj.anim_id(a0)
	cmpi.w	#8,scroll_focus_y
	beq.s	PlayerMoveGroundDecelerate
	subq.w	#2,scroll_focus_y
	bra.s	PlayerMoveGroundDecelerate

; ------------------------------------------------------------------------------

PlayerMoveGroundNeutralFocus:
	cmpi.w	#$60,scroll_focus_y
	bne.s	PlayerMoveGroundCenterFocus
	move.b	focus_mode,d0
	andi.b	#$F,d0
	bne.s	PlayerMoveGroundDecelerate
	move.b	#0,focus_mode
	bra.s	PlayerMoveGroundDecelerate

; ------------------------------------------------------------------------------

PlayerMoveGroundCenterFocus:
	bcc.s	PlayerMoveGroundFocusStep
	addq.w	#4,scroll_focus_y

PlayerMoveGroundFocusStep:
	subq.w	#2,scroll_focus_y

PlayerMoveGroundDecelerate:
	move.b	player_joy_hold,d0
	andi.b	#$C,d0
	bne.s	PlayerMoveGroundSetVelocity
	move.w	obj.ground_speed(a0),d0
	beq.s	PlayerMoveGroundSetVelocity
	bmi.s	PlayerMoveGroundDecelerateReverse
	sub.w	d5,d0
	bcc.s	PlayerMoveGroundStoreForwardSpeed
	move.w	#0,d0

PlayerMoveGroundStoreForwardSpeed:
	move.w	d0,obj.ground_speed(a0)
	bra.s	PlayerMoveGroundSetVelocity

; ------------------------------------------------------------------------------

PlayerMoveGroundDecelerateReverse:
	add.w	d5,d0
	bcc.s	PlayerMoveGroundStoreVelocity
	move.w	#0,d0

PlayerMoveGroundStoreVelocity:
	move.w	d0,obj.ground_speed(a0)

PlayerMoveGroundSetVelocity:
	move.b	obj.angle(a0),d0
	jsr	SineCosine
	muls.w	obj.ground_speed(a0),d1
	asr.l	#8,d1
	move.w	d1,obj.x_speed(a0)
	muls.w	obj.ground_speed(a0),d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a0)

PlayerCheckWall:
	move.b	obj.angle(a0),d0
	addi.b	#$40,d0
	bmi.s	locret_204654
	move.b	#$40,d1
	tst.w	obj.ground_speed(a0)
	beq.s	locret_204654
	bmi.s	loc_2045FC
	neg.w	d1

loc_2045FC:
	move.b	obj.angle(a0),d0
	add.b	d1,d0
	move.w	d0,-(sp)
	bsr.w	PlayerCheckBlockFront
	move.w	(sp)+,d0
	tst.w	d1
	bpl.s	locret_204654
	asl.w	#8,d1
	addi.b	#$20,d0
	andi.b	#$C0,d0
	beq.s	loc_204650
	cmpi.b	#$40,d0
	beq.s	loc_20463E
	cmpi.b	#$80,d0
	beq.s	loc_204638
	add.w	d1,obj.x_speed(a0)
	bset	#5,obj.flags(a0)
	move.w	#0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_204638:
	sub.w	d1,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_20463E:
	sub.w	d1,obj.x_speed(a0)
	bset	#5,obj.flags(a0)
	move.w	#0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_204650:
	add.w	d1,obj.y_speed(a0)

locret_204654:
	rts

; ------------------------------------------------------------------------------

PlayerMoveGroundLeft:
	tst.b	obj.var_2a(a0)
	bne.s	locret_2046CA
	move.w	obj.ground_speed(a0),d0
	beq.s	loc_204664
	bpl.s	loc_204694

loc_204664:
	bset	#0,obj.flags(a0)
	bne.s	loc_204678
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)

loc_204678:
	move.w	d6,d1
	neg.w	d1
	cmp.w	d1,d0
	ble.s	loc_204688
	sub.w	d5,d0
	cmp.w	d1,d0
	bgt.s	loc_204688
	move.w	d1,d0

loc_204688:
	move.w	d0,obj.ground_speed(a0)
	move.b	#0,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_204694:
	sub.w	d4,d0
	bcc.s	loc_20469C
	move.w	#-$80,d0

loc_20469C:
	move.w	d0,obj.ground_speed(a0)
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	bne.s	locret_2046CA
	cmpi.w	#$400,d0
	blt.s	locret_2046CA
	move.b	#$D,obj.anim_id(a0)
	bclr	#0,obj.flags(a0)
	move.w	#$90,d0
	jsr	PlayFmSound

locret_2046CA:
	rts

; ------------------------------------------------------------------------------

PlayerMoveGroundRight:
	tst.b	obj.var_2a(a0)
	bne.s	locret_20473A
	move.w	obj.ground_speed(a0),d0
	bmi.s	loc_204704
	bclr	#0,obj.flags(a0)
	beq.s	loc_2046EC
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)

loc_2046EC:
	cmp.w	d6,d0
	bge.s	loc_2046F8
	add.w	d5,d0
	cmp.w	d6,d0
	blt.s	loc_2046F8
	move.w	d6,d0

loc_2046F8:
	move.w	d0,obj.ground_speed(a0)
	move.b	#0,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_204704:
	add.w	d4,d0
	bcc.s	loc_20470C
	move.w	#$80,d0

loc_20470C:
	move.w	d0,obj.ground_speed(a0)
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	bne.s	locret_20473A
	cmpi.w	#$FC00,d0
	bgt.s	locret_20473A
	move.b	#$D,obj.anim_id(a0)
	bset	#0,obj.flags(a0)
	move.w	#$90,d0
	jsr	PlayFmSound

locret_20473A:
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
	bne.w	loc_204886
	tst.w	obj.var_3e(a0)
	bne.s	loc_204774
	btst	#2,player_joy_hold
	beq.s	loc_204768
	bsr.w	PlayerMoveRollLeft

loc_204768:
	btst	#3,player_joy_hold
	beq.s	loc_204774
	bsr.w	PlayerMoveRollRight

loc_204774:
	tst.b	obj.var_2a(a0)
	beq.w	loc_20481E
	move.w	#$4B,d0
	move.w	player_max_speed,d1
	move.w	d1,d2
	asl.w	#1,d1
	tst.b	speed_shoes
	beq.s	loc_204794
	asr.w	#1,d2
	sub.w	d2,d1

loc_204794:
	btst	#0,obj.flags(a0)
	beq.s	loc_2047A0
	neg.w	d0
	neg.w	d1

loc_2047A0:
	add.w	d0,obj.ground_speed(a0)
	move.w	obj.ground_speed(a0),d0
	btst	#0,obj.flags(a0)
	beq.s	loc_2047B6
	cmp.w	d0,d1
	ble.s	loc_2047BC
	bra.s	loc_2047BA

; ------------------------------------------------------------------------------

loc_2047B6:
	cmp.w	d1,d0
	ble.s	loc_2047BC

loc_2047BA:
	move.w	d1,d0

loc_2047BC:
	move.w	d0,obj.ground_speed(a0)
	btst	#1,player_joy_hold
	beq.s	loc_2047F0
	rts

; ------------------------------------------------------------------------------

loc_2047CA:
	move.w	#$AB,d0
	jsr	PlayFmSound
	move.b	#0,obj.var_2a(a0)
	move.w	#0,obj.ground_speed(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.y_speed(a0)
	bra.w	loc_204850

; ------------------------------------------------------------------------------

loc_2047F0:
	cmpi.b	#$2D,obj.var_2a(a0)
	bne.s	loc_2047CA
	move.b	#0,obj.var_2a(a0)
	move.w	#$91,d0
	jsr	PlayFmSound
	btst	#0,obj.flags(a0)
	bne.s	loc_204816
	bsr.w	PlayerMoveRollRight
	bra.s	loc_20481E

; ------------------------------------------------------------------------------

loc_204816:
	bsr.w	PlayerMoveRollLeft
	bra.s	loc_20481E

; ------------------------------------------------------------------------------

	rts

; ------------------------------------------------------------------------------

loc_20481E:
	move.w	obj.ground_speed(a0),d0
	beq.s	loc_204840
	bmi.s	loc_204834
	sub.w	d5,d0
	bcc.s	loc_20482E
	move.w	#0,d0

loc_20482E:
	move.w	d0,obj.ground_speed(a0)
	bra.s	loc_204840

; ------------------------------------------------------------------------------

loc_204834:
	add.w	d5,d0
	bcc.s	loc_20483C
	move.w	#0,d0

loc_20483C:
	move.w	d0,obj.ground_speed(a0)

loc_204840:
	tst.w	obj.ground_speed(a0)
	bne.s	loc_204886
	move.w	#$AB,d0
	jsr	PlayFmSound

loc_204850:
	bclr	#2,obj.flags(a0)
	tst.b	player_shrunk_state
	beq.s	loc_204870
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	subq.w	#2,obj.y(a0)
	bra.s	loc_204880

; ------------------------------------------------------------------------------

loc_204870:
	move.b	#$13,obj.height(a0)
	move.b	#9,obj.width(a0)
	subq.w	#5,obj.y(a0)

loc_204880:
	move.b	#5,obj.anim_id(a0)

loc_204886:
	move.b	obj.angle(a0),d0
	jsr	SineCosine
	muls.w	obj.ground_speed(a0),d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a0)
	muls.w	obj.ground_speed(a0),d1
	asr.l	#8,d1
	cmpi.w	#$1000,d1
	ble.s	loc_2048AA
	move.w	#$1000,d1

loc_2048AA:
	cmpi.w	#-$1000,d1
	bge.s	loc_2048B4
	move.w	#-$1000,d1

loc_2048B4:
	move.w	d1,obj.x_speed(a0)
	bra.w	PlayerCheckWall

; ------------------------------------------------------------------------------

PlayerMoveRollLeft:
	move.w	obj.ground_speed(a0),d0
	beq.s	loc_2048C4
	bpl.s	loc_2048D2

loc_2048C4:
	bset	#0,obj.flags(a0)
	move.b	#2,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_2048D2:
	sub.w	d4,d0
	bcc.s	loc_2048DA
	move.w	#-$80,d0

loc_2048DA:
	move.w	d0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveRollRight:
	move.w	obj.ground_speed(a0),d0
	bmi.s	loc_2048F4
	bclr	#0,obj.flags(a0)
	move.b	#2,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_2048F4:
	add.w	d4,d0
	bcc.s	loc_2048FC
	move.w	#$80,d0

loc_2048FC:
	move.w	d0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerMoveAir:
	move.w	player_max_speed,d6
	move.w	player_acceleration,d5
	asl.w	#1,d5
	move.w	obj.x_speed(a0),d0
	cmpi.b	#1,time_zone
	bne.s	loc_20493C
	tst.w	zone
	bne.s	loc_20493C
	cmpi.w	#$6C8,obj.x(a0)
	bcs.s	loc_204934
	cmpi.w	#$840,obj.x(a0)
	bcc.s	loc_204934
	rts

; ------------------------------------------------------------------------------

loc_204934:
	btst	#1,obj.var_2c(a0)
	bne.s	loc_20496C

loc_20493C:
	btst	#2,player_joy_hold
	beq.s	loc_204956
	bset	#0,obj.flags(a0)
	sub.w	d5,d0
	move.w	d6,d1
	neg.w	d1
	cmp.w	d1,d0
	bgt.s	loc_204956
	move.w	d1,d0

loc_204956:
	btst	#3,player_joy_hold
	beq.s	loc_20496C
	bclr	#0,obj.flags(a0)
	add.w	d5,d0
	cmp.w	d6,d0
	blt.s	loc_20496C
	move.w	d6,d0

loc_20496C:
	move.w	d0,obj.x_speed(a0)
	cmpi.w	#$60,scroll_focus_y
	beq.s	loc_204982
	bcc.s	loc_20497E
	addq.w	#4,scroll_focus_y

loc_20497E:
	subq.w	#2,scroll_focus_y

loc_204982:
	cmpi.w	#$FC00,obj.y_speed(a0)
	bcs.s	locret_2049B0
	move.w	obj.x_speed(a0),d0
	move.w	d0,d1
	asr.w	#5,d1
	beq.s	locret_2049B0
	bmi.s	loc_2049A4
	sub.w	d1,d0
	bcc.s	loc_20499E
	move.w	#0,d0

loc_20499E:
	move.w	d0,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_2049A4:
	sub.w	d1,d0
	bcs.s	loc_2049AC
	move.w	#0,d0

loc_2049AC:
	move.w	d0,obj.x_speed(a0)

locret_2049B0:
	rts

; ------------------------------------------------------------------------------

PlayerUnusedCheckSquish:
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	bne.s	locret_2049E0
	bsr.w	PlayerCheckBlockUpWide
	tst.w	d1
	bpl.s	locret_2049E0
	move.w	#0,obj.ground_speed(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.y_speed(a0)
	move.b	#$B,obj.anim_id(a0)

locret_2049E0:
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
	bhi.s	loc_204A36
	move.w	right_bound,d0
	addi.w	#$130,d0
	tst.b	boss_started
	bne.s	loc_204A10
	addi.w	#$38,d0

loc_204A10:
	cmp.w	d1,d0
	bls.s	loc_204A36

loc_204A14:
	move.w	bottom_bound,d0
	addi.w	#$E0,d0
	cmp.w	obj.y(a0),d0
	blt.s	loc_204A24
	rts

; ------------------------------------------------------------------------------

loc_204A24:
	cmpi.b	#$2B,obj.anim_id(a0)
	bne.w	KillPlayer
	move.b	#6,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_204A36:
	move.w	d0,obj.x(a0)
	move.w	#0,obj.x+2(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.ground_speed(a0)
	bra.s	loc_204A14

; ------------------------------------------------------------------------------

PlayerCheckRoll:
	tst.b	water_slide_flag
	bne.s	locret_204A74
	move.w	obj.ground_speed(a0),d0
	bpl.s	loc_204A5C
	neg.w	d0

loc_204A5C:
	cmpi.w	#$80,d0
	bcs.s	locret_204A74
	move.b	player_joy_hold,d0
	andi.b	#$C,d0
	bne.s	locret_204A74
	btst	#1,player_joy_hold
	bne.s	PlayerStartRoll

locret_204A74:
	rts

; ------------------------------------------------------------------------------

PlayerStartRoll:
	btst	#2,obj.flags(a0)
	beq.s	loc_204A80
	bra.s	loc_204AB0

; ------------------------------------------------------------------------------

loc_204A80:
	bset	#2,obj.flags(a0)
	tst.b	player_shrunk_state
	beq.s	loc_204AA0
	move.b	#8,obj.height(a0)
	move.b	#5,obj.width(a0)
	addq.w	#2,obj.y(a0)
	bra.s	loc_204AB0

; ------------------------------------------------------------------------------

loc_204AA0:
	move.b	#$E,obj.height(a0)
	move.b	#7,obj.width(a0)
	addq.w	#5,obj.y(a0)

loc_204AB0:
	move.b	#2,obj.anim_id(a0)
	tst.w	obj.ground_speed(a0)
	bmi.s	locret_204ACA
	cmpi.w	#$200,obj.ground_speed(a0)
	bcc.s	locret_204ACA
	move.w	#$200,obj.ground_speed(a0)

locret_204ACA:
	rts

; ------------------------------------------------------------------------------

PlayerCheckJump:
	tst.b	obj.var_2a(a0)
	beq.s	loc_204AD4
	rts

; ------------------------------------------------------------------------------

loc_204AD4:
	move.b	player_joy_hold,d0
	andi.b	#3,d0
	beq.s	loc_204AE6
	tst.w	obj.ground_speed(a0)
	beq.w	locret_204BAC

loc_204AE6:
	move.b	player_joy_tap,d0
	andi.b	#$70,d0
	beq.w	locret_204BAC
	btst	#3,obj.flags(a0)
	beq.s	loc_204B02
	jsr	PlayerCheckFlipper
	beq.s	loc_204B32

loc_204B02:
	moveq	#0,d0
	move.b	obj.angle(a0),d0
	addi.b	#$80,d0
	bsr.w	PlayerCheckBlockAbove
	cmpi.w	#6,d1
	blt.w	locret_204BAC
	move.w	#$680,d2
	btst	#6,obj.flags(a0)
	beq.s	loc_204B28
	move.w	#$380,d2

loc_204B28:
	moveq	#0,d0
	move.b	obj.angle(a0),d0
	subi.b	#$40,d0

loc_204B32:
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
	bne.s	loc_204BAE
	tst.b	player_shrunk_state
	beq.s	loc_204B90
	move.b	#8,obj.height(a0)
	move.b	#5,obj.width(a0)
	addq.w	#2,obj.y(a0)
	bra.s	loc_204BA0

; ------------------------------------------------------------------------------

loc_204B90:
	move.b	#$E,obj.height(a0)
	move.b	#7,obj.width(a0)
	addq.w	#5,obj.y(a0)

loc_204BA0:
	bset	#2,obj.flags(a0)
	move.b	#2,obj.anim_id(a0)

locret_204BAC:
	rts

; ------------------------------------------------------------------------------

loc_204BAE:
	bset	#4,obj.flags(a0)
	rts

; ------------------------------------------------------------------------------

PlayerJumpHeight:
	tst.b	obj.var_3c(a0)
	beq.s	loc_204BE8
	move.w	#-$400,d1
	btst	#6,obj.flags(a0)
	beq.s	loc_204BCC
	move.w	#-$200,d1

loc_204BCC:
	cmp.w	obj.y_speed(a0),d1
	ble.s	locret_204BE6
	move.b	player_joy_hold,d0
	andi.b	#$70,d0
	bne.s	locret_204BE6
	move.b	#0,obj.var_2a(a0)
	move.w	d1,obj.y_speed(a0)

locret_204BE6:
	rts

; ------------------------------------------------------------------------------

loc_204BE8:
	cmpi.w	#-$FC0,obj.y_speed(a0)
	bge.s	locret_204BF6
	move.w	#-$FC0,obj.y_speed(a0)

locret_204BF6:
	rts

; ------------------------------------------------------------------------------

PlayerSlopeResist:
	tst.b	obj.var_2a(a0)
	bne.s	locret_204C32
	move.b	obj.angle(a0),d0
	addi.b	#$60,d0
	cmpi.b	#$C0,d0
	bcc.s	locret_204C32
	move.b	obj.angle(a0),d0
	jsr	SineCosine
	muls.w	#$20,d0
	asr.l	#8,d0
	tst.w	obj.ground_speed(a0)
	beq.s	locret_204C32
	bmi.s	loc_204C2E
	tst.w	d0
	beq.s	locret_204C2C
	add.w	d0,obj.ground_speed(a0)

locret_204C2C:
	rts

; ------------------------------------------------------------------------------

loc_204C2E:
	add.w	d0,obj.ground_speed(a0)

locret_204C32:
	rts

; ------------------------------------------------------------------------------

PlayerSlopeResistRoll:
	tst.b	obj.var_2a(a0)
	bne.s	locret_204C74
	move.b	obj.angle(a0),d0
	addi.b	#$60,d0
	cmpi.b	#$C0,d0
	bcc.s	locret_204C74
	move.b	obj.angle(a0),d0
	jsr	SineCosine
	muls.w	#$50,d0
	asr.l	#8,d0
	tst.w	obj.ground_speed(a0)
	bmi.s	loc_204C6A
	tst.w	d0
	bpl.s	loc_204C64
	asr.l	#2,d0

loc_204C64:
	add.w	d0,obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_204C6A:
	tst.w	d0
	bmi.s	loc_204C70
	asr.l	#2,d0

loc_204C70:
	add.w	d0,obj.ground_speed(a0)

locret_204C74:
	rts

; ------------------------------------------------------------------------------

PlayerCheckFall:
	nop
	tst.b	obj.var_38(a0)
	bne.s	locret_204CB8
	tst.w	obj.var_3e(a0)
	bne.s	loc_204CBA
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	beq.s	locret_204CB8
	move.w	obj.ground_speed(a0),d0
	bpl.s	loc_204C9A
	neg.w	d0

loc_204C9A:
	cmpi.w	#$280,d0
	bcc.s	locret_204CB8
	clr.w	obj.ground_speed(a0)
	nop
	nop
	nop
	nop
	bset	#1,obj.flags(a0)
	move.w	#$1E,obj.var_3e(a0)

locret_204CB8:
	rts

; ------------------------------------------------------------------------------

loc_204CBA:
	subq.w	#1,obj.var_3e(a0)
	rts

; ------------------------------------------------------------------------------

PlayerResetAngle:
	btst	#1,obj.var_2c(a0)
	bne.s	locret_204CE2
	move.b	obj.angle(a0),d0
	beq.s	locret_204CE2
	bpl.s	loc_204CD8
	addq.b	#2,d0
	bcc.s	loc_204CD6
	moveq	#0,d0

loc_204CD6:
	bra.s	loc_204CDE

; ------------------------------------------------------------------------------

loc_204CD8:
	subq.b	#2,d0
	bcc.s	loc_204CDE
	moveq	#0,d0

loc_204CDE:
	move.b	d0,obj.angle(a0)

locret_204CE2:
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
	beq.w	loc_204DC8
	cmpi.b	#$80,d0
	beq.w	loc_204E2A
	cmpi.b	#$C0,d0
	beq.w	loc_204E86
	bsr.w	PlayerCheckBlockLeft
	tst.w	d1
	bpl.s	loc_204D36
	sub.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)

loc_204D36:
	bsr.w	PlayerCheckBlockRight
	tst.w	d1
	bpl.s	loc_204D48
	add.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)

loc_204D48:
	bsr.w	PlayerCheckBlockDownWide
	move.b	d1,debug_floor_distance
	tst.w	d1
	bpl.s	locret_204DC6
	move.b	obj.y_speed(a0),d2
	addq.b	#8,d2
	neg.b	d2
	cmp.b	d2,d1
	bge.s	loc_204D66
	cmp.b	d2,d0
	blt.s	locret_204DC6

loc_204D66:
	add.w	d1,obj.y(a0)
	move.b	d3,obj.angle(a0)
	bsr.w	PlayerSetGround
	move.b	#0,obj.anim_id(a0)
	move.b	d3,d0
	addi.b	#$20,d0
	andi.b	#$40,d0
	bne.s	loc_204DA4
	move.b	d3,d0
	addi.b	#$10,d0
	andi.b	#$20,d0
	beq.s	loc_204D96
	asr.w	obj.y_speed(a0)
	bra.s	loc_204DB8

; ------------------------------------------------------------------------------

loc_204D96:
	move.w	#0,obj.y_speed(a0)
	move.w	obj.x_speed(a0),obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_204DA4:
	move.w	#0,obj.x_speed(a0)
	cmpi.w	#$FC0,obj.y_speed(a0)
	ble.s	loc_204DB8
	move.w	#$FC0,obj.y_speed(a0)

loc_204DB8:
	move.w	obj.y_speed(a0),obj.ground_speed(a0)
	tst.b	d3
	bpl.s	locret_204DC6
	neg.w	obj.ground_speed(a0)

locret_204DC6:
	rts

; ------------------------------------------------------------------------------

loc_204DC8:
	bsr.w	PlayerCheckBlockLeft
	tst.w	d1
	bpl.s	loc_204DE2
	sub.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	obj.y_speed(a0),obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_204DE2:
	bsr.w	PlayerCheckBlockUpWide
	tst.w	d1
	bpl.s	loc_204DFC
	sub.w	d1,obj.y(a0)
	tst.w	obj.y_speed(a0)
	bpl.s	locret_204DFA
	move.w	#0,obj.y_speed(a0)

locret_204DFA:
	rts

; ------------------------------------------------------------------------------

loc_204DFC:
	tst.w	obj.y_speed(a0)
	bmi.s	locret_204E28
	bsr.w	PlayerCheckBlockDownWide
	tst.w	d1
	bpl.s	locret_204E28
	add.w	d1,obj.y(a0)
	move.b	d3,obj.angle(a0)
	bsr.w	PlayerSetGround
	move.b	#0,obj.anim_id(a0)
	move.w	#0,obj.y_speed(a0)
	move.w	obj.x_speed(a0),obj.ground_speed(a0)

locret_204E28:
	rts

; ------------------------------------------------------------------------------

loc_204E2A:
	bsr.w	PlayerCheckBlockLeft
	tst.w	d1
	bpl.s	loc_204E3C
	sub.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)

loc_204E3C:
	bsr.w	PlayerCheckBlockRight
	tst.w	d1
	bpl.s	loc_204E4E
	add.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)

loc_204E4E:
	bsr.w	PlayerCheckBlockUpWide
	tst.w	d1
	bpl.s	locret_204E84
	sub.w	d1,obj.y(a0)
	move.b	d3,d0
	addi.b	#$20,d0
	andi.b	#$40,d0
	bne.s	loc_204E6E
	move.w	#0,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_204E6E:
	move.b	d3,obj.angle(a0)
	bsr.w	PlayerSetGroundSteep
	move.w	obj.y_speed(a0),obj.ground_speed(a0)
	tst.b	d3
	bpl.s	locret_204E84
	neg.w	obj.ground_speed(a0)

locret_204E84:
	rts

; ------------------------------------------------------------------------------

loc_204E86:
	bsr.w	PlayerCheckBlockRight
	tst.w	d1
	bpl.s	loc_204EA0
	add.w	d1,obj.x(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	obj.y_speed(a0),obj.ground_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_204EA0:
	bsr.w	PlayerCheckBlockUpWide
	tst.w	d1
	bpl.s	loc_204EBA
	sub.w	d1,obj.y(a0)
	tst.w	obj.y_speed(a0)
	bpl.s	locret_204EB8
	move.w	#0,obj.y_speed(a0)

locret_204EB8:
	rts

; ------------------------------------------------------------------------------

loc_204EBA:
	tst.w	obj.y_speed(a0)
	bmi.s	locret_204EE6
	bsr.w	PlayerCheckBlockDownWide
	tst.w	d1
	bpl.s	locret_204EE6
	add.w	d1,obj.y(a0)
	move.b	d3,obj.angle(a0)
	bsr.w	PlayerSetGround
	move.b	#0,obj.anim_id(a0)
	move.w	#0,obj.y_speed(a0)
	move.w	obj.x_speed(a0),obj.ground_speed(a0)

locret_204EE6:
	rts

; ------------------------------------------------------------------------------

PlayerSetGround:
	btst	#4,obj.flags(a0)
	beq.s	loc_204EF2
	nop

loc_204EF2:
	bclr	#5,obj.flags(a0)
	bclr	#1,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	btst	#2,obj.flags(a0)
	beq.s	loc_204F4C
	bclr	#2,obj.flags(a0)
	tst.b	player_shrunk_state
	beq.s	loc_204F2C
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	subq.w	#2,obj.y(a0)
	bra.s	loc_204F3C

; ------------------------------------------------------------------------------

loc_204F2C:
	move.b	#$13,obj.height(a0)
	move.b	#9,obj.width(a0)
	subq.w	#5,obj.y(a0)

loc_204F3C:
	move.b	#0,obj.anim_id(a0)
	move.w	#$AB,d0
	jsr	PlayFmSound

loc_204F4C:
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
	beq.s	loc_204F94
	subi.w	#$20,obj.y_speed(a0)

loc_204F94:
	jsr	PlayerCheckBlock
	bsr.w	sub_204FB0
	bsr.w	PlayerCheckBounds
	bsr.w	PlayerBufferPosition
	bsr.w	PlayerAnimate
	jmp	DrawObject

; ------------------------------------------------------------------------------

sub_204FB0:
	move.w	bottom_bound,d0
	addi.w	#$E0,d0
	cmp.w	obj.y(a0),d0
	bcs.w	KillPlayer
	bsr.w	PlayerBlockCollideAir
	btst	#1,obj.flags(a0)
	bne.s	locret_204FEA
	moveq	#0,d0
	move.w	d0,obj.y_speed(a0)
	move.w	d0,obj.x_speed(a0)
	move.w	d0,obj.ground_speed(a0)
	move.b	#0,obj.anim_id(a0)
	subq.b	#2,obj.routine(a0)
	move.w	#$78,obj.var_30(a0)

locret_204FEA:
	rts

; ------------------------------------------------------------------------------

PlayerDead:
	bsr.w	sub_205004
	jsr	MoveObjectFall
	bsr.w	PlayerBufferPosition
	bsr.w	PlayerAnimate
	jmp	DrawObject

; ------------------------------------------------------------------------------

sub_205004:
	move.w	bottom_bound,d0
	addi.w	#$100,d0
	cmp.w	obj.y(a0),d0
	bcc.w	locret_205072
	move.w	#$FFC8,obj.y_speed(a0)
	addq.b	#2,obj.routine(a0)
	clr.b	update_hud_time
	addq.b	#1,update_hud_lives
	subq.b	#1,lives
	if def(R8_VARIANT)
		if (R8_VARIANT<>5)|(DEMO=0)|(REGION=USA)
			bpl.s	loc_205038
			clr.b	lives
		endif
	else
		bpl.s	loc_205038
		clr.b	lives
	endif

loc_205038:
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.s	loc_205052
	tst.b	time_attack
	beq.s	loc_205052
	move.b	#0,lives
	bra.s	loc_20506C

; ------------------------------------------------------------------------------

loc_205052:
	jsr	SpawnObject
	move.b	#$3B,obj.id(a1)
	move.w	#$1E0,obj.var_3a(a0)
	tst.b	lives
	beq.s	locret_205072

loc_20506C:
	move.w	#$3C,obj.var_3a(a0)

locret_205072:
	rts

; ------------------------------------------------------------------------------

PlayerRestart:
	tst.w	obj.var_3a(a0)
	beq.w	locret_2050F6
	subq.w	#1,obj.var_3a(a0)
	bne.w	locret_2050F6
	move.w	#1,restart_stage
	jsr	StopZ80
	move.b	#1,Z80_RAM+$1C3E
	jsr	StartZ80
	bsr.w	ResetObjectStates
	clr.l	flower_counts
	tst.b	respawn_checkpoint
	bne.s	loc_2050C4
	cmpi.b	#1,time_zone
	bne.s	loc_2050C4
	bclr	#1,stage_start_flags

loc_2050C4:
	move.w	#$E,d0
	tst.b	lives
	beq.s	loc_2050F2
	cmpi.b	#1,time_zone
	bne.s	loc_2050EC
	if def(R8_VARIANT)
		if (R8_VARIANT=5)&(DEMO<>0)&(REGION<>USA)
			clr.b	$FF1587
		endif
	endif
	tst.b	respawn_checkpoint
	beq.s	loc_2050F2
	move.b	#1,spawn_mode
	bra.s	loc_2050F2

; ------------------------------------------------------------------------------

loc_2050EC:
	if def(R8_VARIANT)
		if (R8_VARIANT=5)&(DEMO<>0)&(REGION<>USA)
			cmpi.b	#2,act
			beq.s	loc_2050F2
			move.b	#2,spawn_mode
		else
			clr.b	spawn_mode
		endif
	else
	clr.b	spawn_mode
	endif

loc_2050F2:
	bra.w	SubCpuCommand

; ------------------------------------------------------------------------------

locret_2050F6:
	rts

; ------------------------------------------------------------------------------

PlayerCheckChunk:
	cmpi.b	#3,zone
	beq.s	loc_205120
	cmpi.b	#5,zone
	beq.s	loc_205120
	cmpi.b	#2,zone
	beq.s	loc_205120
	tst.b	zone
	bne.w	locret_2051E2

loc_205120:
	move.w	obj.y(a0),d0
	lsr.w	#1,d0
	andi.w	#$380,d0
	move.b	obj.x(a0),d1
	andi.w	#$7F,d1
	add.w	d1,d0
	lea	stage_map,a1
	move.b	(a1,d0.w),d1
	cmp.b	roll_chunk_1,d1
	bne.s	loc_20515E
	tst.b	zone
	bne.w	loc_2051E4
	move.w	obj.y(a0),d0
	andi.w	#$FF,d0
	cmpi.w	#$90,d0
	bcc.w	loc_2051E4
	bra.s	loc_205166

; ------------------------------------------------------------------------------

loc_20515E:
	cmp.b	roll_chunk_2,d1
	beq.w	loc_2051E4

loc_205166:
	cmp.b	loop_chunk_1,d1
	beq.s	loc_205196
	cmp.b	loop_chunk_2,d1
	beq.s	loc_20517A
	bclr	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_20517A:
	cmpi.b	#5,zone
	beq.w	loc_2051FC
	btst	#1,obj.flags(a0)
	beq.s	loc_205196
	bclr	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_205196:
	move.w	obj.x(a0),d2
	cmpi.b	#$2C,d2
	bcc.s	loc_2051A8
	bclr	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_2051A8:
	cmpi.b	#$E0,d2
	bcs.s	loc_2051B6
	bset	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_2051B6:
	btst	#6,obj.sprite_flags(a0)
	bne.s	loc_2051D2
	move.b	obj.angle(a0),d1
	beq.s	locret_2051E2
	cmpi.b	#$80,d1
	bhi.s	locret_2051E2
	bset	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_2051D2:
	move.b	obj.angle(a0),d1
	cmpi.b	#$80,d1
	bls.s	locret_2051E2
	bclr	#6,obj.sprite_flags(a0)

locret_2051E2:
	rts

; ------------------------------------------------------------------------------

loc_2051E4:
	if REGION<>USA
	btst	#2,obj.flags(a0)
	bne.s	loc_2051F6
	move.w	#$9C,d0
	jsr	PlayFmSound
	endif

loc_2051F6:
	jmp	PlayerStartRoll

; ------------------------------------------------------------------------------

loc_2051FC:
	tst.w	obj.y_speed(a0)
	bmi.s	locret_205240
	move.w	obj.y(a0),d1
	andi.w	#$FF,d1
	move.w	obj.x(a0),d0
	andi.w	#$FF,d0
	cmpi.w	#$80,d0
	bcc.s	loc_205234
	cmpi.w	#$38,d1
	bcs.s	loc_20522C
	cmpi.w	#$80,d1
	bcs.s	locret_205240

loc_205224:
	bclr	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_20522C:
	bset	#6,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_205234:
	cmpi.w	#$38,d1
	bcs.s	loc_205224
	cmpi.w	#$80,d1
	bcc.s	loc_20522C

locret_205240:
	rts

; ------------------------------------------------------------------------------

PlayerAnimate:
	lea	PlayerAnims,a1
	moveq	#0,d0
	move.b	obj.anim_id(a0),d0
	cmp.b	obj.prev_anim_id(a0),d0
	beq.s	loc_205264
	move.b	d0,obj.prev_anim_id(a0)
	move.b	#0,obj.anim_index(a0)
	move.b	#0,obj.anim_timer(a0)

loc_205264:
	bsr.w	sub_2054D4
	add.w	d0,d0
	adda.w	(a1,d0.w),a1
	move.b	(a1),d0
	bmi.s	loc_2052DC
	move.b	obj.flags(a0),d1
	andi.b	#1,d1
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d1,obj.sprite_flags(a0)
	subq.b	#1,obj.anim_timer(a0)
	bpl.s	locret_2052AA
	move.b	d0,obj.anim_timer(a0)

; ------------------------------------------------------------------------------

sub_20528E:
	moveq	#0,d1
	move.b	obj.anim_index(a0),d1
	move.b	1(a1,d1.w),d0
	beq.s	loc_2052A2
	bpl.s	loc_2052A2
	cmpi.b	#$FD,d0
	bge.s	loc_2052AC

loc_2052A2:
	move.b	d0,obj.sprite_frame(a0)
	addq.b	#1,obj.anim_index(a0)

locret_2052AA:
	rts

; ------------------------------------------------------------------------------

loc_2052AC:
	addq.b	#1,d0
	bne.s	loc_2052BC
	move.b	#0,obj.anim_index(a0)
	move.b	1(a1),d0
	bra.s	loc_2052A2

; ------------------------------------------------------------------------------

loc_2052BC:
	addq.b	#1,d0
	bne.s	loc_2052D0
	move.b	2(a1,d1.w),d0
	sub.b	d0,obj.anim_index(a0)
	sub.b	d0,d1
	move.b	1(a1,d1.w),d0
	bra.s	loc_2052A2

; ------------------------------------------------------------------------------

loc_2052D0:
	addq.b	#1,d0
	bne.s	locret_2052DA
	move.b	2(a1,d1.w),obj.anim_id(a0)

locret_2052DA:
	rts

; ------------------------------------------------------------------------------

loc_2052DC:
	subq.b	#1,obj.anim_timer(a0)
	bpl.s	locret_2052AA
	addq.b	#1,d0
	bne.w	loc_205396
	tst.b	player_shrunk_state
	bne.w	loc_20545E
	moveq	#0,d1
	move.b	obj.angle(a0),d0
	move.b	obj.flags(a0),d2
	andi.b	#1,d2
	bne.s	loc_205304
	not.b	d0

loc_205304:
	btst	#1,obj.var_2c(a0)
	bne.s	loc_205312
	addi.b	#$10,d0
	bra.s	loc_205314

; ------------------------------------------------------------------------------

loc_205312:
	addq.b	#8,d0

loc_205314:
	bpl.s	loc_205318
	moveq	#3,d1

loc_205318:
	andi.b	#$FC,obj.sprite_flags(a0)
	eor.b	d1,d2
	or.b	d2,obj.sprite_flags(a0)
	btst	#5,obj.flags(a0)
	bne.w	loc_20540A
	move.w	obj.ground_speed(a0),d2
	bpl.s	loc_205336
	neg.w	d2

loc_205336:
	btst	#1,obj.var_2c(a0)
	beq.s	loc_20534E
	lsr.b	#4,d0
	lsl.b	#1,d0
	andi.b	#$E,d0
	lea	PlayerRun3dAnim,a1
	bra.s	loc_205378

; ------------------------------------------------------------------------------

loc_20534E:
	lsr.b	#4,d0
	andi.b	#6,d0
	lea	PlayerPeeloutAnim,a1
	cmpi.w	#$A00,d2
	bcc.s	loc_205378
	lea	PlayerRunAnim,a1
	cmpi.w	#$600,d2
	bcc.s	loc_205378
	lea	PlayerWalkAnim,a1
	move.b	d0,d1
	lsr.b	#1,d1
	add.b	d1,d0

loc_205378:
	add.b	d0,d0
	move.b	d0,d3
	neg.w	d2
	addi.w	#$800,d2
	bpl.s	loc_205386
	moveq	#0,d2

loc_205386:
	lsr.w	#8,d2
	move.b	d2,obj.anim_timer(a0)
	bsr.w	sub_20528E
	add.b	d3,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

loc_205396:
	addq.b	#1,d0
	bne.s	loc_205406
	move.w	obj.ground_speed(a0),d2
	bpl.s	loc_2053A2
	neg.w	d2

loc_2053A2:
	lea	PlayerRollShrunkAnim,a1
	tst.b	player_shrunk_state
	bne.s	loc_2053E0
	lea	PlayerRollFastAnim,a1
	btst	#1,obj.var_2c(a0)
	beq.s	loc_2053D4
	move.b	obj.angle(a0),d0
	addi.b	#$10,d0
	andi.b	#$C0,d0
	beq.s	loc_2053E0
	lea	PlayerRoll3dAnim,a1
	bra.s	loc_2053E0

; ------------------------------------------------------------------------------

loc_2053D4:
	cmpi.w	#$600,d2
	bcc.s	loc_2053E0
	lea	PlayerRollAnim,a1

loc_2053E0:
	neg.w	d2
	addi.w	#$400,d2
	bpl.s	loc_2053EA
	moveq	#0,d2

loc_2053EA:
	lsr.w	#8,d2
	move.b	d2,obj.anim_timer(a0)
	move.b	obj.flags(a0),d1
	andi.b	#1,d1
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d1,obj.sprite_flags(a0)
	bra.w	sub_20528E

; ------------------------------------------------------------------------------

loc_205406:
	addq.b	#1,d0
	bne.s	loc_20544A

loc_20540A:
	move.w	obj.ground_speed(a0),d2
	bmi.s	loc_205412
	neg.w	d2

loc_205412:
	addi.w	#$800,d2
	bpl.s	loc_20541A
	moveq	#0,d2

loc_20541A:
	lsr.w	#6,d2
	move.b	d2,obj.anim_timer(a0)
	lea	PlayerPushShrunkAnim,a1
	tst.b	player_shrunk_state
	bne.s	loc_205434
	lea	PlayerPushAnim,a1

loc_205434:
	move.b	obj.flags(a0),d1
	andi.b	#1,d1
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d1,obj.sprite_flags(a0)
	bra.w	sub_20528E

; ------------------------------------------------------------------------------

loc_20544A:
	moveq	#0,d1
	move.b	obj.anim_index(a0),d1
	move.b	1(a1,d1.w),obj.sprite_frame(a0)
	move.b	#0,obj.anim_timer(a0)
	rts

; ------------------------------------------------------------------------------

loc_20545E:
	moveq	#0,d1
	move.b	obj.angle(a0),d0
	move.b	obj.flags(a0),d2
	andi.b	#1,d2
	bne.s	loc_205470
	not.b	d0

loc_205470:
	addi.b	#$10,d0
	bpl.s	loc_205478
	moveq	#0,d1

loc_205478:
	andi.b	#$FC,obj.sprite_flags(a0)
	or.b	d2,obj.sprite_flags(a0)
	addi.b	#$30,d0
	cmpi.b	#$60,d0
	bcs.s	loc_2054A6
	bset	#2,obj.flags(a0)
	move.b	#$A,obj.height(a0)
	move.b	#5,obj.width(a0)
	move.b	#$FF,d0
	bra.w	loc_205396

; ------------------------------------------------------------------------------

loc_2054A6:
	move.w	obj.ground_speed(a0),d2
	bpl.s	loc_2054AE
	neg.w	d2

loc_2054AE:
	lea	PlayerRunShrunkAnim,a1
	cmpi.w	#$600,d2
	bcc.s	loc_2054C0
	lea	PlayerWalkShrunkAnim,a1

loc_2054C0:
	neg.w	d2
	addi.w	#$800,d2
	bpl.s	loc_2054CA
	moveq	#0,d2

loc_2054CA:
	lsr.w	#8,d2
	move.b	d2,obj.anim_timer(a0)
	bra.w	sub_20528E

; ------------------------------------------------------------------------------

sub_2054D4:
	tst.b	player_shrunk_state
	beq.s	locret_2054E0
	move.b	byte_2054E2(pc,d0.w),d0

locret_2054E0:
	rts

; ------------------------------------------------------------------------------

byte_2054E2:
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
	include	"anims/player.asm"
	even

; ------------------------------------------------------------------------------

LoadPlayerGfx:
	tst.b	(a0)
	beq.w	locret_2057D6
	lea	player_sprite_frame,a2
	moveq	#0,d0
	move.b	obj.sprite_frame(a0),d0
	cmp.b	(a2),d0
	beq.s	locret_2057D6
	move.b	d0,(a2)
	lea	PlayerGfxScript,a2
	add.w	d0,d0
	adda.w	(a2,d0.w),a2
	moveq	#0,d1
	move.w	(a2)+,d1
	subq.b	#1,d1
	bmi.s	locret_2057D6
	lea	player_gfx,a3
	move.b	#1,update_player_gfx

loc_2057A8:
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

loc_2057C2:
	movem.l	(a1)+,d2-d6/a4-a6
	movem.l	d2-d6/a4-a6,(a3)
	lea	$20(a3),a3
	dbf	d0,loc_2057C2
	dbf	d1,loc_2057A8

locret_2057D6:
	rts

; ------------------------------------------------------------------------------

PlayerCheckFlipper:
	moveq	#0,d0
	move.b	obj.var_3d(a0),d0
	lsl.w	#6,d0
	addi.l	#object_pool&$FFFFFF,d0
	movea.l	d0,a1
	cmpi.b	#$1E,obj.id(a1)
	bne.s	locret_20584C
	move.w	#$98,d0
	jsr	PlayFmSound
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
	bne.s	loc_20583A
	move.w	#$40,d1
	sub.w	d3,d1
	move.w	d1,d3

loc_20583A:
	move.w	#-$A00,d2
	move.w	d2,d1
	ext.l	d1
	muls.w	d3,d1
	divs.w	#$40,d1
	add.w	d1,d2
	moveq	#0,d1

locret_20584C:
	rts

; ------------------------------------------------------------------------------
