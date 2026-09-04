; R4 stage bootstrap: reset runtime state, load stage graphics, and enter play.
InitStage:
	clr.w	stage_demo
	cmpi.b	#$7F,game_time_stones
	bne.s	InitStageResetRuntime
	tst.b	time_attack
	bne.s	InitStageResetRuntime
	move.b	#1,good_future

InitStageResetRuntime:
	clr.b	vblank_routine
	clr.b	use_player_2
	if DEMO<>0
		move.b	#0,respawn_checkpoint
		bset	#1,stage_start_flags
	endif
	move.b	#0,paused
	move.b	#0,stage_started
	bset	#0,stage_start_flags
	bne.s	InitStagePrepareMode
	move.b	#0,palette_fade_flags
	clr.b	respawn_checkpoint
	move.l	#5000,next_life_score
	bsr.w	ResetObjectStates
	clr.b	spawn_mode
	clr.b	zone_good_futures
	clr.l	score
	move.b	#3,lives
	tst.b	time_attack
	beq.s	InitStagePrepareMode
	move.b	#1,lives

InitStagePrepareMode:
	bset	#7,game_mode
	bsr.w	ClearGfxQueue
	tst.b	enter_special_stage
	bne.s	InitStageFadeWhite
	btst	#7,time_zone
	beq.s	InitStageFadeBlackPath
	bset	#0,palette_fade_flags
	beq.s	InitStageClearWarp

InitStageFadeWhite:
	bsr.w	FadeToWhite
	bclr	#0,palette_fade_flags

InitStageClearWarp:
	clr.b	warp_direction
	tst.w	restart_stage
	beq.w	InitStageDemoBoundary
	move.w	#0,restart_stage
	rts

; ------------------------------------------------------------------------------

InitStageFadeBlackPath:
	bset	#0,palette_fade_flags
	beq.s	InitStageHandleRestart
	bsr.w	FadeToBlack

InitStageHandleRestart:
	cmpi.w	#2,restart_stage
	bne.s	InitStageCheckLives
	move.w	#0,restart_stage
	move.b	#0,palette_fade_flags
	bra.s	InitStageClearPalette

; ------------------------------------------------------------------------------

InitStageCheckLives:
	tst.b	lives
	bne.s	InitStageDemoBoundary
	move.b	#0,stage_start_flags
	move.b	#0,respawn_checkpoint
	move.b	#0,spawn_mode
	move.b	#0,palette_fade_flags

InitStageClearPalette:
	lea	palette,a1
	move.w	#$1F,d6

InitStageClearPaletteLoop:
	move.l	#0,(a1)+
	dbf	d6,InitStageClearPaletteLoop
	move.b	#$C,vblank_routine
	bsr.w	VSync
	rts

; ------------------------------------------------------------------------------

InitStageDemoBoundary:
	cmpi.w	#$800,demo_index
	bne.s	InitStagePaletteSetup
	move.w	#0,demo_index
	clr.w	stage_demo
	move.b	#0,palette_fade_flags
	rts

; ------------------------------------------------------------------------------

InitStagePaletteSetup:
	moveq	#0,d0
	btst	#0,palette_clear_flags
	bne.s	InitStageFuturePalette
	btst	#7,time_zone
	beq.s	InitStageClearPaletteWords

InitStageFuturePalette:
	move.l	#$EEE0EEE,d0

InitStageClearPaletteWords:
	lea	palette,a1
	move.w	#$1F,d6

InitStageClearPaletteLoop2:
	move.l	d0,(a1)+
	dbf	d6,InitStageClearPaletteLoop2

InitStageWaitGfxQueue:
	move.b	#$C,vblank_routine
	bsr.w	VSync
	bsr.w	AdvanceGfxQueue
	bne.s	InitStageWaitGfxQueue
	tst.l	gfx_queue
	bne.s	InitStageWaitGfxQueue
	bsr.w	PlayStageMusic
	moveq	#0,d0
	lea	StageDataIndex,a2
	moveq	#0,d0
	move.b	(a2),d0
	beq.s	InitStageLoadCommonGfx
	bsr.w	LoadGfxList

InitStageLoadCommonGfx:
	moveq	#1,d0
	bsr.w	LoadGfxList
	clr.b	powerup_changed
	clr.l	flower_counts
	lea	object_draw_queue,a1
	moveq	#0,d0
	move.w	#$FF,d1

InitStageClearObjectDrawQueue:
	move.l	d0,(a1)+
	dbf	d1,InitStageClearObjectDrawQueue
	lea	flower_positions,a1
	moveq	#0,d0
	move.w	#$27F,d1

InitStageClearFlowerPositions:
	move.l	d0,(a1)+
	dbf	d1,InitStageClearFlowerPositions
	lea	player_object,a1
	moveq	#0,d0
	move.w	#$7FF,d1

InitStageClearObjectPool:
	move.l	d0,(a1)+
	dbf	d1,InitStageClearObjectPool
	lea	vblank_e_count,a1
	moveq	#0,d0
	move.w	#$15,d1

InitStageClearVBlankCounters:
	move.l	d0,(a1)+
	dbf	d1,InitStageClearVBlankCounters
	lea	scroll_fg_x,a1
	moveq	#0,d0
	move.w	#$3F,d1

InitStageClearScrollState:
	move.l	d0,(a1)+
	dbf	d1,InitStageClearScrollState
	move	#$2700,sr
	move.l	#$213600,demo_data
	if DEMO<>0
		move.w	#1,stage_demo
	endif
	move.w	#0,demo_index
	bsr.w	ClearScreen
	lea	VDP_CTRL,a6
	move.w	#$8B03,(a6)
	move.w	#$8230,(a6)
	move.w	#$8407,(a6)
	move.w	#$857C,(a6)
	move.w	#$9001,(a6)
	move.w	#$8004,(a6)
	move.w	#$8720,(a6)
	move.w	#$8ADF,hblank_vdp_reg
	move.w	hblank_vdp_reg,(a6)
	cmpi.b	#2,zone
	bne.s	InitStageWaterSetupDone
	move.w	#$8014,(a6)
	moveq	#0,d0
	move.b	act,d0
	lsl.w	#3,d0
	moveq	#0,d1
	move.b	time_zone,d1
	bclr	#7,d1
	add.w	d1,d1
	add.w	d1,d0
	lea	WaterHeights,a1
	move.w	(a1,d0.w),d0
	move.w	d0,water_y
	move.w	d0,static_water_y
	move.w	d0,target_water_y
	clr.b	water_routine
	clr.b	water_full
	move.b	#1,water_speed

InitStageWaterSetupDone:
	move.w	#$1E,drown_timer
	move	#$2300,sr
	moveq	#3,d0
	bsr.w	LoadPalette
	moveq	#3,d0
	bsr.w	LoadFadePalette
	bsr.w	InitScroll
	bsr.w	UpdateScroll
	bset	#2,scroll_flags_fg
	bsr.w	LoadStageData
	bsr.w	InitStageDraw
	jsr	ConvertStageCollision
	bsr.w	LoadStageCollision

InitStageWaitForGfx:
	move.b	#$C,vblank_routine
	bsr.w	VSync
	bsr.w	AdvanceGfxQueue
	bne.s	InitStageWaitForGfx
	tst.l	gfx_queue
	bne.s	InitStageWaitForGfx
	bsr.w	SpawnPlayer
	move.b	#$1C,hud_score_object+obj.id
	move.b	#$1C,hud_lives_object+obj.id
	move.b	#1,hud_lives_object+obj.subtype
	move.b	#$1C,hud_rings_object+obj.id
	move.b	#1,hud_rings_object+obj.subtype_2
	bsr.w	LoadLifeIcon
	move.b	#$19,hud_icon_object+obj.id
	move.b	#$A,hud_icon_object+obj.subtype
	bset	#1,stage_start_flags
	bne.s	InitStageResetInputTimers
	move.b	#$3C,title_card_object+obj.id
	move.b	#1,control_locked
	clr.b	gfx_section_id

InitStageResetInputTimers:
	move.b	#4,object_spawn_pool+obj.id
	move.w	#0,player_joy_hold
	move.w	#0,p1_joy_hold
	move.w	#0,p2_joy_hold
	move.w	#0,bored_timer
	move.w	#0,bored_timer_p2
	moveq	#0,d0
	tst.b	spawn_mode
	bne.s	InitStageResetPlayerState
	move.w	d0,rings
	move.l	d0,time
	move.b	d0,lives_flags

InitStageResetPlayerState:
	move.b	d0,time_over
	move.b	d0,shield
	move.b	d0,invincible
	move.b	d0,speed_shoes
	move.b	d0,warping
	move.w	d0,debug_mode
	move.w	d0,restart_stage
	move.w	d0,stage_frames
	move.b	d0,spawn_mode
	move.b	#1,update_hud_score
	move.b	#1,update_hud_rings
	move.b	#1,update_hud_time
	move.b	#1,update_hud_lives
	move.b	#$80,update_hud_rings
	move.b	#$80,update_hud_score
	move.w	#0,s1_demo_index
	move.w	#$202F,palette_fade_start
	jsr	AnimateStageGfx
	move.b	#1,fade_enable_display
	bclr	#7,time_zone
	beq.s	InitStageFadeFromBlack

InitStageFadeFromWhite:
	bsr.w	FadeFromWhite
	bra.s	InitStageLoadWaterPalette

; ------------------------------------------------------------------------------

InitStageFadeFromBlack:
	bclr	#0,palette_clear_flags
	bne.s	InitStageFadeFromWhite
	bsr.w	FadeFromBlack

; R4 water stages load an additional palette before gameplay starts.
InitStageLoadWaterPalette:
	cmpi.b	#2,zone
	bne.s	InitStageEnterPlay
	moveq	#0,d0
	bsr.w	LoadWaterPalette

InitStageEnterPlay:
	bclr	#7,game_mode
	move.b	#1,stage_started

; Per-frame loop: service VBlank, pause/restart input, then update and draw.
StageMainLoop:
	move.b	#8,vblank_routine
	bsr.w	VSync
	if REGION=USA
	cmpi.b	#6,player_object+obj.routine
	bcc.s	StageMainLoopPauseCheck
	endif
	tst.b	control_locked
	bne.s	StageMainLoopPauseCheck
	btst	#7,p1_joy_tap
	beq.s	StageMainLoopPauseCheck
	eori.b	#1,paused

StageMainLoopPauseCheck:
	btst	#0,paused
	beq.w	StageMainLoopUpdate
	bsr.w	PauseMusic
	if DEMO<>0
		tst.w	stage_demo
		if R4_VARIANT=8
			bne.s	R43DemoPauseSkipInput
		else
			bne.s	StageMainLoopPauseAction
		endif
	endif
	move.b	p1_joy_tap,d0
	tst.b	time_attack
	bne.s	StageMainLoopPauseAction
	andi.b	#$70,d0
	if REGION=USA
	beq.s	StageMainLoop
	else
	cmpi.b	#$70,d0
	bne.s	StageMainLoop
	endif
	subq.b	#1,lives
	bpl.s	StageMainLoopRestartLife
	clr.b	lives

StageMainLoopRestartLife:
	move.w	#$E,d0
	jsr	SubCpuCommand
	bsr.w	ResetObjectStates
	clr.b	spawn_mode
	jsr	StopZ80
	move.b	#1,Z80_RAM+$1C3E
	jsr	StartZ80
	move.w	#1,restart_stage
	bra.s	StageMainLoopRestart

; ------------------------------------------------------------------------------

StageMainLoopPauseAction:
	andi.b	#$70,d0
	beq.w	StageMainLoop
	if (DEMO<>0)&(R4_VARIANT=8)
R43DemoPauseSkipInput:
	endif
	clr.b	lives

StageMainLoopRestart:
	clr.b	paused
	clr.w	stage_demo
	clr.b	respawn_checkpoint
	if DEMO<>0
		move.w	#$800,demo_index
	endif
	bra.w	InitStage

; ------------------------------------------------------------------------------

StageMainLoopUpdate:
	bsr.w	UnpauseMusic
	addq.w	#1,stage_frames
	jsr	SpawnStageObjects
	jsr	UpdateObjects
	cmpi.w	#$800,demo_index
	beq.w	InitStage
	tst.w	restart_stage
	bne.w	InitStage
	tst.w	debug_mode
	bne.s	StageMainLoopUpdateScroll
	cmpi.b	#6,player_object+obj.routine
	bcs.s	StageMainLoopUpdateScroll
	move.w	scroll_fg_y,bottom_bound
	move.w	scroll_fg_y,target_bottom_bound
	bra.s	StageMainLoopDraw

; ------------------------------------------------------------------------------

StageMainLoopUpdateScroll:
	bsr.w	UpdateScroll

StageMainLoopDraw:
	bsr.w	CheckWaterCurrents
	jsr	DrawObjects
	tst.w	time_stop
	bne.s	StageMainLoopUpdateGraphics
	bsr.w	CyclePalette

StageMainLoopUpdateGraphics:
	jsr	UpdateSectionGfx
	bsr.w	AdvanceGfxQueue
	bsr.w	UpdateGlobalAnims
	bra.w	StageMainLoop

; ------------------------------------------------------------------------------

SpawnPlayer:
	lea	player_object,a1
	moveq	#1,d0
	move.b	d0,0(a1)
	tst.b	spawn_mode
	beq.s	SpawnPlayerDone
	move.w	#$78,$30(a1)

SpawnPlayerDone:
	rts

; ------------------------------------------------------------------------------

UnusedSpawnFlowers:
	rts

; ------------------------------------------------------------------------------

LoadStageCollision:
	move.l	#StageCollision,stage_collision
	rts

; ------------------------------------------------------------------------------

; Advance the shared ring, spike, unknown, and lost-ring animation timers.
UpdateGlobalAnims:
	subq.b	#1,log_spike_anim_timer
	bpl.s	UpdateGlobalAnimsRing
	move.b	#$B,log_spike_anim_timer
	subq.b	#1,log_spike_anim_frame
	andi.b	#7,log_spike_anim_frame

UpdateGlobalAnimsRing:
	subq.b	#1,ring_anim_timer
	bpl.s	UpdateGlobalAnimsUnknown
	move.b	#7,ring_anim_timer
	addq.b	#1,ring_anim_frame
	andi.b	#3,ring_anim_frame

UpdateGlobalAnimsUnknown:
	subq.b	#1,unk_anim_timer
	bpl.s	UpdateGlobalAnimsLostRing
	move.b	#7,unk_anim_timer
	addq.b	#1,unk_anim_frame
	cmpi.b	#6,unk_anim_frame
	bcs.s	UpdateGlobalAnimsLostRing
	move.b	#0,unk_anim_frame

UpdateGlobalAnimsLostRing:
	tst.b	lost_ring_anim_timer
	beq.s	UpdateGlobalAnimsDone
	moveq	#0,d0
	move.b	lost_ring_anim_timer,d0
	add.w	lost_ring_anim_accum,d0
	move.w	d0,lost_ring_anim_accum
	rol.w	#7,d0
	andi.w	#3,d0
	move.b	d0,lost_ring_anim_frame
	subq.b	#1,lost_ring_anim_timer

UpdateGlobalAnimsDone:
	rts

; ------------------------------------------------------------------------------

; Select one of the R4 zone/time music commands and hand it to the Sub CPU.
PlayStageMusic:
	moveq	#0,d0
	moveq	#0,d1
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	time_attack
	bne.s	PlayStageMusicSelect
	cmpi.b	#2,d0
	bne.s	PlayStageMusicSelect
	add.b	good_future,d0

PlayStageMusicSelect:
	move.b	zone,d1
	add.w	d1,d1
	add.w	d1,d1
	add.w	d0,d1
	moveq	#0,d0
	move.b	StageMusicCommandTable(pc,d1.w),d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

; Three R4 zones, each with normal, past, present, and future commands.
StageMusicCommandTable:
	dc.b	$80, $F, $11, $10
	dc.b	$80, $12, $14, $13
	dc.b	$80, $15, $17, $16

; ------------------------------------------------------------------------------

PlayStageMusic2:
	move.w	#$F,d0
	jsr	SubCpuCommand

; ------------------------------------------------------------------------------

; Upload the time-zone-specific 32x32 life icon tile block to the VDP.
LoadLifeIcon:
	move.l	#$74200002,d0
	moveq	#0,d2
	move.b	time_zone,d2
	bclr	#7,d2
	lsl.w	#7,d2
	move.l	d0,4(a6)
	lea	LivesIconsGfx,a1
	lea	(a1,d2.w),a3
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	move.l	(a3)+,(a6)
	rts

; ------------------------------------------------------------------------------

; Update water height and the H-blank scanline used by R4 water stages.
UpdateWater:
	tst.b	paused
	bne.s	UpdateWaterDone
	cmpi.b	#6,player_object+obj.routine
	bcc.s	UpdateWaterAnimate
	bsr.w	WaterEvents

UpdateWaterAnimate:
	move.b	#0,water_full
	moveq	#0,d0
	addq.b	#2,water_angle
	move.b	water_angle,d0
	jsr	SineCosine
	lsr.w	#6,d0
	ext.w	d0
	add.w	static_water_y,d0
	move.w	d0,water_y
	move.w	water_y,d0
	sub.w	scroll_fg_y,d0
	bcc.s	UpdateWaterClamp
	tst.w	d0
	bpl.s	UpdateWaterClamp
	move.b	#$DF,hblank_vdp_reg+1
	move.b	#1,water_full

UpdateWaterClamp:
	cmpi.w	#$DF,d0
	bcs.s	UpdateWaterWriteScanline
	move.w	#$DF,d0

UpdateWaterWriteScanline:
	move.b	d0,hblank_vdp_reg+1

UpdateWaterDone:
	rts

; ------------------------------------------------------------------------------

WaterHeights:
	dc.w	$300, $280, $1D0, $FFF
	dc.w	$5B0, $530, $510, $FFF
	dc.w	$490, $490, $490, $FFF

; ------------------------------------------------------------------------------

; Select the act-specific target-water routine, then move toward its target.
WaterEvents:
	moveq	#0,d0
	move.b	act,d0
	add.w	d0,d0
	move.w	WaterEventsByAct(pc,d0.w),d0
	jsr	WaterEventsByAct(pc,d0.w)
	moveq	#0,d1
	move.b	water_speed,d1
	move.w	target_water_y,d0
	sub.w	static_water_y,d0
	beq.s	WaterEventsDone
	bcc.s	WaterEventsApplySpeed
	neg.w	d1

WaterEventsApplySpeed:
	add.w	d1,static_water_y

WaterEventsDone:
	rts

; ------------------------------------------------------------------------------

; Act-indexed table of target-water handlers.
WaterEventsByAct:
	dc.w	WaterEventsAct1-*
	dc.w	WaterEventsAct2-WaterEventsByAct
	dc.w	WaterEventsAct3-WaterEventsByAct

; ------------------------------------------------------------------------------

WaterEventsAct1:
	move.w	player_object+obj.x,d2
	moveq	#0,d0
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	d0
	bne.s	WaterEventsAct1Past
	rts

; ------------------------------------------------------------------------------

WaterEventsAct1Past:
	cmpi.b	#1,d0
	bne.s	WaterEventsAct1Future
	move.w	#$280,d1
	cmpi.w	#$5E0,d2
	bcs.s	WaterEventsAct1SetTarget
	move.w	#$260,d1
	bra.s	WaterEventsAct1SetTarget

; ------------------------------------------------------------------------------

WaterEventsAct1Future:
	move.w	#$1D0,d1
	cmpi.w	#$920,d2
	bcs.s	WaterEventsAct1SetTarget
	move.w	#$110,d1
	cmpi.w	#$1980,d2
	bcs.s	WaterEventsAct1SetTarget
	move.w	#$240,d1
	move.b	#3,water_speed

WaterEventsAct1SetTarget:
	move.w	d1,target_water_y
	rts

; ------------------------------------------------------------------------------

WaterEventsAct2:
	move.w	player_object+obj.x,d2
	move.w	scroll_fg_y,d1
	addi.w	#$E8,d1
	cmpi.w	#$200,d2
	bcs.s	WaterEventsAct2SetStatic
	cmpi.w	#$600,player_object+obj.y
	bcs.s	WaterEventsAct2SelectTime
	cmpi.w	#$6C0,player_object+obj.y
	bcc.s	WaterEventsAct2SelectTime
	cmpi.w	#$2A0,d2
	bcc.s	WaterEventsAct2SelectTime

WaterEventsAct2SetStatic:
	move.w	d1,static_water_y
	bra.s	WaterEventsAct2SetTarget

; ------------------------------------------------------------------------------

WaterEventsAct2SelectTime:
	moveq	#0,d0
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	d0
	bne.s	WaterEventsAct2Past
	move.w	#$5B0,d1
	bra.s	WaterEventsAct2SetStatic

; ------------------------------------------------------------------------------

WaterEventsAct2Past:
	cmpi.b	#1,d0
	bne.s	WaterEventsAct2Future
	move.w	#$530,d1
	cmpi.w	#$C00,d2
	bcs.s	WaterEventsAct2SetTarget
	move.w	#$780,d1
	cmpi.w	#$DC0,d2
	bcs.s	WaterEventsAct2SetTarget
	move.w	#$500,d1
	cmpi.w	#$1380,d2
	bcc.s	WaterEventsAct2SetTarget
	cmpi.w	#$400,player_object+obj.y
	bcc.s	WaterEventsAct2PastReturn
	move.w	#$3C0,d1
	cmpi.w	#$1100,d2
	bcc.s	WaterEventsAct2SetTarget

WaterEventsAct2PastReturn:
	rts

; ------------------------------------------------------------------------------

WaterEventsAct2Future:
	move.w	#$510,d1
	cmpi.w	#$400,d2
	bcs.s	WaterEventsAct2SetTarget
	move.w	#$390,d1
	cmpi.w	#$1600,d2
	bcs.s	WaterEventsAct2SetTarget
	move.w	#$410,d1
	cmpi.w	#$1900,d2
	bcs.s	WaterEventsAct2SetTarget
	move.w	#$500,d1

WaterEventsAct2SetTarget:
	move.w	d1,target_water_y
	rts

; ------------------------------------------------------------------------------

WaterEventsAct3:
	move.w	player_object+obj.x,d2
	move.w	scroll_fg_y,d1
	addi.w	#$E8,d1
	cmpi.w	#$7C0,d2
	bcc.s	WaterEventsAct3Late
	move.w	d1,static_water_y
	bra.s	WaterEventsAct3SetTarget

; ------------------------------------------------------------------------------

WaterEventsAct3Late:
	move.w	#$490,d1
	cmpi.w	#$AF0,d2
	bcs.s	WaterEventsAct3SetTarget
	move.b	#2,water_speed
	move.w	#$5C0,d1

WaterEventsAct3SetTarget:
	move.w	d1,target_water_y
	rts

; ------------------------------------------------------------------------------

; Apply the active 14-byte water-current records to the player.
CheckWaterCurrents:
	lea	player_object,a1
	cmpi.b	#$2B,obj.anim_id(a1)
	beq.w	CheckWaterCurrentsDone
	btst	#0,obj.var_2c(a1)
	bne.w	CheckWaterCurrentsDone
	tst.b	(a1)
	beq.w	CheckWaterCurrentsDone
	tst.w	debug_mode
	bne.w	CheckWaterCurrentsDone
	moveq	#0,d0
	move.b	act,d0
	cmpi.b	#2,d0
	bcc.w	CheckWaterCurrentsDone
	lea	WaterCurrents,a2

CheckWaterCurrentsScan:
	move.w	obj.x(a1),d0
	cmp.w	(a2),d0
	bcs.w	CheckWaterCurrentsNext
	cmp.w	4(a2),d0
	bcc.w	CheckWaterCurrentsNext
	move.w	obj.y(a1),d2
	cmp.w	2(a2),d2
	bcs.w	CheckWaterCurrentsNext
	cmp.w	6(a2),d2
	bcc.w	CheckWaterCurrentsNext
	move.b	stage_vblank_frames+3,d0
	andi.b	#$3F,d0
	bne.s	CheckWaterCurrentsSelectSwitch
	move.w	#$D0,d0

CheckWaterCurrentsSelectSwitch:
	lea	switch_flags,a3
	moveq	#0,d0
	move.b	$D(a2),d0
	cmpi.b	#1,$C(a2)
	bne.s	CheckWaterCurrentsApplyCurrent
	btst	#6,(a3,d0.w)
	beq.w	CheckWaterCurrentsDone

CheckWaterCurrentsApplyCurrent:
	cmpi.b	#4,obj.routine(a1)
	bcc.w	CheckWaterCurrentsClearFlag
	move.b	#1,water_current_flag
	clr.b	obj.var_3c(a1)
	move.w	8(a2),obj.x_speed(a1)
	move.w	$A(a2),obj.y_speed(a1)
	move.b	#$F,obj.anim_id(a1)
	bset	#1,obj.flags(a1)
	cmpi.b	#2,$C(a2)
	bne.s	CheckWaterCurrentsInput
	btst	#5,(a3,d0.w)
	beq.s	CheckWaterCurrentsInput
	neg.w	obj.x_speed(a1)
	neg.w	obj.y_speed(a1)

CheckWaterCurrentsInput:
	btst	#0,player_joy_hold
	beq.s	CheckWaterCurrentsInputDown
	subq.w	#1,$C(a1)

CheckWaterCurrentsInputDown:
	btst	#1,player_joy_hold
	beq.s	CheckWaterCurrentsInputLeft
	addq.w	#1,$C(a1)

CheckWaterCurrentsInputLeft:
	btst	#2,player_joy_hold
	beq.s	CheckWaterCurrentsInputRight
	subq.w	#1,8(a1)

CheckWaterCurrentsInputRight:
	btst	#3,player_joy_hold
	beq.s	CheckWaterCurrentsInputDone
	addq.w	#1,8(a1)

CheckWaterCurrentsInputDone:
	rts

; ------------------------------------------------------------------------------

CheckWaterCurrentsNext:
	adda.w	#$E,a2
	tst.b	(a2)
	bpl.w	CheckWaterCurrentsScan
	tst.b	water_current_flag
	beq.s	CheckWaterCurrentsDone
	move.b	#0,obj.anim_id(a1)

CheckWaterCurrentsClearFlag:
	clr.b	water_current_flag

CheckWaterCurrentsDone:
	rts

; ------------------------------------------------------------------------------

	rts

; ------------------------------------------------------------------------------

; Pause and resume Sub CPU music while retaining the current time-zone mode.
PauseMusic:
	move.w	#$AB,d0
	jsr	PlayFmSound
	bset	#7,paused
	bne.s	PauseMusicDone
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	d0
	beq.s	PauseMusicNormal

PauseMusicSpecial:
	move.w	#$D5,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

PauseMusicNormal:
	tst.b	invincible
	bne.s	PauseMusicSpecial
	tst.b	speed_shoes
	bne.s	PauseMusicSpecial
	move.w	#$90,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

PauseMusicDone:
	rts

; ------------------------------------------------------------------------------

UnpauseMusic:
	bclr	#7,paused
	beq.s	UnpauseMusicDone
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	d0
	beq.s	UnpauseMusicNormal

UnpauseMusicSpecial:
	move.w	#$D6,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

UnpauseMusicNormal:
	tst.b	invincible
	bne.s	UnpauseMusicSpecial
	tst.b	speed_shoes
	bne.s	UnpauseMusicSpecial
	move.w	#$91,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

UnpauseMusicDone:
	rts

; ------------------------------------------------------------------------------

; R4 VBlank dispatcher and DMA paths for stage, title, pause, and load modes.
VBlank:
	if STANDALONE=0
		bset	#0,MCD_INTERRUPT
	endif
	movem.l	d0-d7/a0-a6,-(sp)
	tst.b	vblank_routine
	beq.s	VBlankLag
	move.w	VDP_CTRL,d0
	move.l	#$40000010,VDP_CTRL
	move.l	scroll_y,VDP_DATA
	btst	#6,system_version
	beq.s	VBlankAfterScrollUpload
	move.w	#$700,d0

VBlankDelayForSystem:
	dbf	d0,VBlankDelayForSystem

VBlankAfterScrollUpload:
	move.b	vblank_routine,d0
	move.b	#0,vblank_routine
	andi.w	#$3E,d0
	move.w	VBlankIndex(pc,d0.w),d0
	jsr	VBlankIndex(pc,d0.w)

VBlankDispatchDone:
	tst.b	paused
	bne.s	VBlankUpdateTimers
	bsr.w	UpdateBoredTimer
	bsr.w	UpdateWarpTimer

VBlankUpdateTimers:
	addq.l	#1,stage_vblank_frames
	movem.l	(sp)+,d0-d7/a0-a6
	rte

; ------------------------------------------------------------------------------

VBlankIndex:
	dc.w	VBlankLag-*
	dc.w	VBlankGeneral-VBlankIndex
	dc.w	VBlankS1Title-VBlankIndex
	dc.w	VBlankUnk6-VBlankIndex
	dc.w	VBlankStage-VBlankIndex
	dc.w	VBlankS1SpecialStage-VBlankIndex
	dc.w	VBlankStageLoad-VBlankIndex
	dc.w	VBlankUnkE-VBlankIndex
	dc.w	VBlankPause-VBlankIndex
	dc.w	VBlankPaletteFade-VBlankIndex
	dc.w	VBlankS1SegaLogo-VBlankIndex
	dc.w	VBlankS1Continue-VBlankIndex
	dc.w	VBlankStageLoad-VBlankIndex

; ------------------------------------------------------------------------------

VBlankLag:
	tst.b	stage_started
	beq.s	VBlankDispatchDone
	cmpi.b	#2,zone
	bne.w	VBlankDispatchDone
	move.w	VDP_CTRL,d0
	btst	#6,system_version
	beq.s	VBlankLagDmaSetup
	move.w	#$700,d0

VBlankLagDelay:
	dbf	d0,VBlankLagDelay

VBlankLagDmaSetup:
	move.w	#1,do_hblank
	jsr	StopZ80
	jsr	UpdateWater
	tst.b	water_full
	bne.s	VBlankLagWaterDma
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)
	bra.s	VBlankLagResume

; ------------------------------------------------------------------------------

VBlankLagWaterDma:
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9540,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

VBlankLagResume:
	move.w	hblank_vdp_reg,(a5)
	jsr	StartZ80
	bra.w	VBlankDispatchDone

; ------------------------------------------------------------------------------

VBlankGeneral:
	bsr.w	VBlankCommon

VBlankS1SegaLogo:
	tst.w	global_timer
	beq.w	VBlankSegaLogoTimerDone
	subq.w	#1,global_timer

VBlankSegaLogoTimerDone:
	rts

; ------------------------------------------------------------------------------

VBlankS1Title:
	bsr.w	VBlankCommon
	bsr.w	DrawStageBg
	bsr.w	ProcessGfxQueueFast
	tst.w	global_timer
	beq.w	VBlankTitleTimerDone
	subq.w	#1,global_timer

VBlankTitleTimerDone:
	rts

; ------------------------------------------------------------------------------

VBlankUnk6:
	bsr.w	VBlankCommon
	rts

; ------------------------------------------------------------------------------

VBlankPause:
	cmpi.b	#$10,game_mode
	beq.w	VBlankS1SpecialStage

; ------------------------------------------------------------------------------

VBlankStage:
	jsr	FlushFmQueues
	jsr	StopZ80
	bsr.w	ReadJoypads
	jsr	UpdateWater
	tst.b	water_full
	bne.s	VBlankStageWaterDma
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)
	bra.s	VBlankStageDmaContinue

; ------------------------------------------------------------------------------

VBlankStageWaterDma:
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9540,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

VBlankStageDmaContinue:
	move.w	hblank_vdp_reg,(a5)
	move.w	#1,do_hblank
	lea	VDP_CTRL,a5
	move.l	#$940193C0,(a5)
	move.l	#$96E69500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7C00,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	lea	VDP_CTRL,a5
	move.l	#$94019340,(a5)
	move.l	#$96FC9500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7800,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	lea	player_object,a0
	bsr.w	LoadPlayerGfx
	tst.b	update_player_gfx
	beq.s	VBlankStagePlayerGfxDone
	lea	VDP_CTRL,a5
	move.l	#$94019370,(a5)
	move.l	#$96E49500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7000,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	move.b	#0,update_player_gfx

VBlankStagePlayerGfxDone:
	tst.w	time_stop
	bne.s	VBlankStageResume
	jsr	AnimateStageGfx

VBlankStageResume:
	jsr	StartZ80
	movem.l	scroll_fg_x,d0-d7
	movem.l	d0-d7,scroll_fg_x_work
	movem.l	scroll_flags_fg,d0-d1
	movem.l	d0-d1,scroll_flags_fg_work
	cmpi.b	#$60,hblank_vdp_reg+1
	bcc.s	VBlankStageDraw
	move.b	#1,do_hblank_updates
	addq.l	#4,sp
	bra.w	VBlankDispatchDone

; ------------------------------------------------------------------------------

VBlankStageDraw:
	bsr.w	DrawStage
	bsr.w	ProcessGfxQueueSlow
	jmp	UpdateHudNumbers

; ------------------------------------------------------------------------------

VBlankS1SpecialStage:
	rts

; ------------------------------------------------------------------------------

VBlankStageLoad:
	jsr	StopZ80
	bsr.w	ReadJoypads
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)
	lea	VDP_CTRL,a5
	move.l	#$940193C0,(a5)
	move.l	#$96E69500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7C00,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	lea	VDP_CTRL,a5
	move.l	#$94019340,(a5)
	move.l	#$96FC9500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7800,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	jsr	StartZ80
	movem.l	scroll_fg_x,d0-d7
	movem.l	d0-d7,scroll_fg_x_work
	movem.l	scroll_flags_fg,d0-d1
	movem.l	d0-d1,scroll_flags_fg_work
	bsr.w	DrawStage
	bra.w	ProcessGfxQueueFast

; ------------------------------------------------------------------------------

VBlankUnkE:
	bsr.w	VBlankCommon
	addq.b	#1,vblank_e_count
	move.b	#$E,vblank_routine
	rts

; ------------------------------------------------------------------------------

VBlankPaletteFade:
	bsr.w	VBlankCommon
	cmpi.b	#1,fade_enable_display
	bne.s	VBlankPaletteDisplayEnable
	addq.b	#1,fade_enable_display
	move.w	display_vdp_reg,d0
	ori.b	#$40,d0
	move.w	d0,VDP_CTRL

VBlankPaletteDisplayEnable:
	move.w	hblank_vdp_reg,(a5)
	bra.w	ProcessGfxQueueFast

; ------------------------------------------------------------------------------

VBlankS1Continue:
	jsr	StopZ80
	bsr.w	ReadJoypads
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)
	lea	VDP_CTRL,a5
	move.l	#$94019340,(a5)
	move.l	#$96FC9500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7800,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	lea	VDP_CTRL,a5
	move.l	#$940193C0,(a5)
	move.l	#$96E69500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7C00,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	jsr	StartZ80
	lea	player_object,a0
	bsr.w	LoadPlayerGfx
	tst.b	update_player_gfx
	beq.s	VBlankContinuePlayerGfxDone
	lea	VDP_CTRL,a5
	move.l	#$94019370,(a5)
	move.l	#$96E49500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7000,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	move.b	#0,update_player_gfx

VBlankContinuePlayerGfxDone:
	tst.w	global_timer
	beq.w	VBlankContinueTimerDone
	subq.w	#1,global_timer

VBlankContinueTimerDone:
	rts

; ------------------------------------------------------------------------------

VBlankCommon:
	jsr	StopZ80
	bsr.w	ReadJoypads
	tst.b	water_full
	bne.s	VBlankCommonWaterDma
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)
	bra.s	VBlankCommonResume

; ------------------------------------------------------------------------------

VBlankCommonWaterDma:
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9540,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

VBlankCommonResume:
	lea	VDP_CTRL,a5
	move.l	#$94019340,(a5)
	move.l	#$96FC9500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7800,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	lea	VDP_CTRL,a5
	move.l	#$940193C0,(a5)
	move.l	#$96E69500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7C00,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	jmp	StartZ80

; ------------------------------------------------------------------------------

; Water palette upload and deferred stage drawing run from H-blank.
HBlank:
	move	#$2700,sr
	tst.w	do_hblank
	beq.s	HBlankDone
	move.w	#0,do_hblank
	cmpi.b	#$DF,hblank_vdp_reg+1
	beq.s	HBlankDone
	movem.l	a0-a1,-(sp)
	lea	VDP_DATA,a1
	lea	water_palette,a0
	move.l	#$C0000000,4(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.l	(a0)+,(a1)
	move.w	#$8ADF,4(a1)
	movem.l	(sp)+,a0-a1
	tst.b	do_hblank_updates
	bne.s	HBlankUpdateStage

HBlankDone:
	rte

; ------------------------------------------------------------------------------

HBlankUpdateStage:
	clr.b	do_hblank_updates
	movem.l	d0-d7/a0-a6,-(sp)
	bsr.w	VBlankStageDraw
	movem.l	(sp)+,d0-d7/a0-a6
	rte

; ------------------------------------------------------------------------------

UpdateWarpTimer:
	tst.b	player_object+obj.var_2a
	bne.s	UpdateWarpTimerDone
	tst.w	warp_timer
	beq.s	UpdateWarpTimerDone
	addq.w	#1,warp_timer

UpdateWarpTimerDone:
	rts

; ------------------------------------------------------------------------------

UpdateBoredTimer:
	tst.w	bored_timer
	beq.s	UpdateBoredTimerP2
	addq.w	#1,bored_timer

UpdateBoredTimerP2:
	tst.w	bored_timer_p2
	beq.s	UpdateBoredTimerDone
	addq.w	#1,bored_timer_p2

UpdateBoredTimerDone:
	rts

; ------------------------------------------------------------------------------
