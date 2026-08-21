; ------------------------------------------------------------------------------

S1StageMusicIds:
	dc.b	$81
	dc.b	$82
	dc.b	$83
	dc.b	$84
	dc.b	$85
	dc.b	$86
	dc.b	$8D
	even

; ------------------------------------------------------------------------------

InitStage:
	clr.w	stage_demo
	cmpi.b	#$7F,game_time_stones
	bne.s	loc_201512
	tst.b	time_attack
	bne.s	loc_201512
	move.b	#1,good_future

loc_201512:
	move.b	#0,stage_started
	clr.b	vblank_routine
	clr.b	use_player_2
	move.b	#0,paused
	bset	#0,stage_start_flags
	bne.s	loc_201578
	clr.b	palette_fade_flags
	clr.b	respawn_checkpoint
	move.l	#$1388,next_life_score
	bsr.w	ResetObjectStates
	clr.b	spawn_mode
	clr.b	zone_good_futures
	clr.l	score
	move.b	#3,lives
	tst.b	time_attack
	beq.s	loc_201578
	move.b	#1,lives

loc_201578:
	bset	#7,game_mode
	bsr.w	ClearGfxQueue
	tst.b	enter_special_stage
	bne.s	loc_20159E
	btst	#7,time_zone
	beq.s	loc_2015D4
	bset	#0,palette_fade_flags
	beq.s	loc_2015AA

loc_20159E:
	bsr.w	FadeToWhite
	bclr	#0,palette_fade_flags

loc_2015AA:
	clr.b	warp_direction
	tst.w	restart_stage
	beq.w	loc_201644
	move.w	#0,restart_stage
	cmpi.b	#2,act
	bne.s	locret_2015D2
	bclr	#7,time_zone

locret_2015D2:
	rts

; ------------------------------------------------------------------------------

loc_2015D4:
	bset	#0,palette_fade_flags
	beq.s	loc_2015E2
	bsr.w	FadeToBlack

loc_2015E2:
	cmpi.w	#2,restart_stage
	bne.s	loc_2015FE
	move.w	#0,restart_stage
	move.b	#0,palette_fade_flags
	bra.s	loc_201626

; ------------------------------------------------------------------------------

loc_2015FE:
	tst.b	lives
	bne.s	loc_201644
	move.b	#0,stage_start_flags
	move.b	#0,respawn_checkpoint
	move.b	#0,spawn_mode
	move.b	#0,palette_fade_flags

loc_201626:
	lea	palette,a1
	move.w	#$1F,d6

loc_20162E:
	move.l	#0,(a1)+
	dbf	d6,loc_20162E
	move.b	#$C,vblank_routine
	bsr.w	VSync
	rts

; ------------------------------------------------------------------------------

loc_201644:
	cmpi.w	#$800,demo_index
	bne.s	loc_201662
	move.w	#0,demo_index
	clr.w	stage_demo
	move.b	#0,palette_fade_flags
	rts

; ------------------------------------------------------------------------------

loc_201662:
	moveq	#0,d0
	btst	#0,palette_clear_flags
	bne.s	loc_201678
	btst	#7,time_zone
	beq.s	loc_20167E

loc_201678:
	move.l	#$EEE0EEE,d0

loc_20167E:
	lea	palette,a1
	move.w	#$1F,d6

loc_201686:
	move.l	d0,(a1)+
	dbf	d6,loc_201686

loc_20168C:
	move.b	#$C,vblank_routine
	bsr.w	VSync
	bsr.w	AdvanceGfxQueue
	bne.s	loc_20168C
	tst.l	gfx_queue
	bsr.w	PlayStageMusic
	moveq	#0,d0
	lea	StageDataIndex,a2
	moveq	#0,d0
	move.b	(a2),d0
	beq.s	loc_2016B6
	bsr.w	LoadGfxList

loc_2016B6:
	moveq	#1,d0
	bsr.w	LoadGfxList
	clr.b	powerup_changed
	clr.l	flower_counts
	lea	object_draw_queue,a1
	moveq	#0,d0
	move.w	#$FF,d1

loc_2016D2:
	move.l	d0,(a1)+
	dbf	d1,loc_2016D2

	lea	flower_positions,a1
	moveq	#0,d0
	move.w	#$27F,d1

.ClearVariables1:
	move.l	d0,(a1)+
	dbf	d1,.ClearVariables1

	lea	object_pool,a1
	moveq	#0,d0
	move.w	#$7FF,d1

loc_2016F4:
	move.l	d0,(a1)+
	dbf	d1,loc_2016F4
	lea	unk_buffer_2,a1
	moveq	#0,d0
	move.w	#$3FF,d1

loc_201706:
	move.l	d0,(a1)+
	dbf	d1,loc_201706
	lea	vblank_e_count,a1
	moveq	#0,d0
	move.w	#$15,d1

loc_201716:
	move.l	d0,(a1)+
	dbf	d1,loc_201716
	lea	scroll_fg_x,a1
	moveq	#0,d0
	move.w	#$3F,d1

loc_201726:
	move.l	d0,(a1)+
	dbf	d1,loc_201726
	move	#$2700,sr
	move.l	#(StageChunks+$6C00),demo_data
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

loc_2017A6:
	move.b	#$C,vblank_routine
	bsr.w	VSync
	bsr.w	AdvanceGfxQueue
	bne.s	loc_2017A6
	tst.l	gfx_queue
	bne.s	loc_2017A6
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
	bne.s	loc_20180A
	move.b	#$3C,title_card_object+obj.id
	move.b	#1,control_locked
	clr.b	gfx_section_id

loc_20180A:
	move.w	#0,player_joy_hold
	move.w	#0,p1_joy_hold
	move.w	#0,p2_joy_hold
	move.w	#0,bored_timer
	move.w	#0,bored_timer_p2
	move.b	#0,r5_bg_change
	moveq	#0,d0
	tst.b	spawn_mode
	bne.s	loc_20184C
	move.w	d0,rings
	move.l	d0,time
	move.b	d0,lives_flags

loc_20184C:
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
	beq.s	loc_2018DC

loc_2018D6:
	bsr.w	FadeFromWhite
	bra.s	loc_2018EA

; ------------------------------------------------------------------------------

loc_2018DC:
	bclr	#0,palette_clear_flags
	bne.s	loc_2018D6
	bsr.w	FadeFromBlack

loc_2018EA:
	bclr	#7,game_mode
	move.b	#1,stage_started

loc_2018F8:
	move.b	#8,vblank_routine
	bsr.w	VSync
	cmpi.b	#6,player_object+obj.routine
	bcc.s	loc_201916
	tst.b	control_locked
	bne.s	loc_201916
	btst	#7,p1_joy_tap
	beq.s	loc_201916
	eori.b	#1,paused

loc_201916:
	btst	#0,paused
	beq.w	loc_201988
	bsr.w	PauseMusic
	move.b	p1_joy_tap,d0
	tst.b	time_attack
	bne.s	loc_201966
	andi.b	#$70,d0
	beq.s	loc_2018F8
	subq.b	#1,lives
	bpl.s	loc_201948
	clr.b	lives

loc_201948:
	move.w	#$E,d0
	jsr	SubCpuCommand
	bsr.w	ResetObjectStates
	clr.b	spawn_mode
	move.w	#1,restart_stage
	bra.s	loc_201974

; ------------------------------------------------------------------------------

loc_201966:
	andi.b	#$70,d0
	beq.w	loc_2018F8
	clr.b	lives

loc_201974:
	clr.b	paused
	clr.w	stage_demo
	clr.b	respawn_checkpoint
	bra.w	InitStage

; ------------------------------------------------------------------------------

loc_201988:
	bsr.w	UnpauseMusic
	addq.w	#1,stage_frames
	jsr	SpawnStageObjects
	jsr	UpdateObjects
	cmpi.w	#$800,demo_index
	beq.w	InitStage
	tst.w	restart_stage
	bne.w	InitStage
	tst.w	debug_mode
	bne.s	loc_2019D0
	cmpi.b	#6,player_object+obj.routine
	bcs.s	loc_2019D0
	move.w	scroll_fg_y,bottom_bound
	move.w	scroll_fg_y,target_bottom_bound
	bra.s	loc_2019D4

; ------------------------------------------------------------------------------

loc_2019D0:
	bsr.w	UpdateScroll

loc_2019D4:
	jsr	DrawObjects
	tst.w	time_stop
	bne.s	loc_2019E6
	bsr.w	CyclePalette

loc_2019E6:
	jsr	UpdateSectionGfx
	bsr.w	AdvanceGfxQueue
	bsr.w	UpdateGlobalAnims
	bra.w	loc_2018F8

; ------------------------------------------------------------------------------

SpawnPlayer:
	lea	player_object,a1
	moveq	#1,d0
	move.b	d0,obj.id(a1)
	tst.b	spawn_mode
	beq.s	locret_201A10
	move.w	#$78,obj.var_30(a1)

locret_201A10:
	rts

; ------------------------------------------------------------------------------
; Unused function that restores flowers that were despawned
; ------------------------------------------------------------------------------

RestoreFlowers:
	lea	flower_counts,a1				; Get flower count
	moveq	#0,d0
	move.b	time_zone,d0
	bclr	#7,d0
	move.b	(a1,d0.w),d0
	beq.s	.End						; If there are no flowers to spawn, branch

	subq.b	#1,d0						; Decrement flower count for loop
	lea	object_spawn_pool,a2				; Object spawn pool
	moveq	#0,d1						; Position buffer slot ID

.SpawnFlowers:
	move.b	#$1F,obj.id(a2)					; Spawn flower

	move.w	d1,d2						; Get position slot
	add.w	d2,d2
	add.w	d2,d2
	moveq	#0,d3						; Get time zone specific slot
	move.b	time_zone,d3
	bclr	#7,d3
	lsl.w	#8,d3
	add.w	d3,d2

	lea	flower_positions,a3				; Set flower position
	move.w	(a3,d2.w),obj.x(a2)
	move.w	2(a3,d2.w),obj.y(a2)

	adda.w	#obj.struct_len,a2				; Next object slot
	addq.b	#1,d1						; Next position slot
	dbf	d0,.SpawnFlowers				; Loop until finished

.End:
	rts

; ------------------------------------------------------------------------------

LoadStageCollision:
	moveq	#0,d0
	move.b	zone,d0
	lsl.w	#2,d0
	move.l	off_201A7E(pc,d0.w),stage_collision
	rts

; ------------------------------------------------------------------------------

off_201A7E:
	dc.l	StageCollision
	dc.l	StageCollision
	dc.l	StageCollision
	dc.l	StageCollision
	dc.l	StageCollision
	dc.l	StageCollision
	dc.l	StageCollision
	dc.l	StageCollision

; ------------------------------------------------------------------------------

UpdateGlobalAnims:
	subq.b	#1,log_spike_anim_timer
	bpl.s	loc_201ABC
	move.b	#$B,log_spike_anim_timer
	subq.b	#1,log_spike_anim_frame
	andi.b	#7,log_spike_anim_frame

loc_201ABC:
	subq.b	#1,ring_anim_timer
	bpl.s	loc_201ADA
	move.b	#7,ring_anim_timer
	addq.b	#1,ring_anim_frame
	andi.b	#3,ring_anim_frame

loc_201ADA:
	subq.b	#1,unk_anim_timer
	bpl.s	loc_201B02
	move.b	#7,unk_anim_timer
	addq.b	#1,unk_anim_frame
	cmpi.b	#6,unk_anim_frame
	bcs.s	loc_201B02
	move.b	#0,unk_anim_frame

loc_201B02:
	tst.b	lost_ring_anim_timer
	beq.s	locret_201B30
	moveq	#0,d0
	move.b	lost_ring_anim_timer,d0
	add.w	lost_ring_anim_accum,d0
	move.w	d0,lost_ring_anim_accum
	rol.w	#7,d0
	andi.w	#3,d0
	move.b	d0,lost_ring_anim_frame
	subq.b	#1,lost_ring_anim_timer

locret_201B30:
	rts

; ------------------------------------------------------------------------------

PlayStageMusic:
	moveq	#0,d0
	moveq	#0,d1
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	time_attack
	bne.s	loc_201B54
	cmpi.b	#2,d0
	bne.s	loc_201B54
	add.b	good_future,d0

loc_201B54:
	move.b	zone,d1
	add.w	d1,d1
	add.w	d1,d1
	add.w	d0,d1
	moveq	#0,d0
	move.b	byte_201B6C(pc,d1.w),d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

byte_201B6C:
	dc.b	$80, $F, $11, $10
	dc.b	$80, $12, $14, $13
	dc.b	$80, $15, $17, $16
	dc.b	$80, $18, $1A, $19
	dc.b	$80, $1B, $1D, $1C
	dc.b	$80, $1E, $20, $1F
	dc.b	$80, $21, $66, $22

; ------------------------------------------------------------------------------

PlayStageMusic2:
	move.w	#$F,d0
	jsr	SubCpuCommand

; ------------------------------------------------------------------------------

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

PauseMusic:
	move.w	#$AB,d0
	jsr	PlayFmSound
	bset	#7,paused
	bne.s	locret_201C3A
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	d0
	beq.s	loc_201C20

loc_201C16:
	move.w	#$D5,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

loc_201C20:
	tst.b	invincible
	bne.s	loc_201C16
	tst.b	speed_shoes
	bne.s	loc_201C16
	move.w	#$90,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

locret_201C3A:
	rts

; ------------------------------------------------------------------------------

UnpauseMusic:
	bclr	#7,paused
	beq.s	locret_201C76
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	d0
	beq.s	loc_201C5C

loc_201C52:
	move.w	#$D6,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

loc_201C5C:
	tst.b	invincible
	bne.s	loc_201C52
	tst.b	speed_shoes
	bne.s	loc_201C52
	move.w	#$91,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

locret_201C76:
	rts

; ------------------------------------------------------------------------------

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
	beq.s	loc_201CB4
	move.w	#$700,d0

loc_201CB0:
	dbf	d0,loc_201CB0

loc_201CB4:
	move.b	vblank_routine,d0
	move.b	#0,vblank_routine
	andi.w	#$3E,d0
	move.w	VBlankIndex(pc,d0.w),d0
	jsr	VBlankIndex(pc,d0.w)

loc_201CCA:
	jsr	FlushFmQueues
	tst.b	paused
	bne.s	loc_201CDE
	bsr.w	UpdateBoredTimer
	bsr.w	UpdateWarpTimer

loc_201CDE:
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
	beq.w	loc_201CCA
	cmpi.b	#2,zone
	bne.w	loc_201CCA
	move.w	VDP_CTRL,d0
	btst	#6,system_version
	beq.s	loc_201D32
	move.w	#$700,d0

loc_201D2E:
	dbf	d0,loc_201D2E

loc_201D32:
	move.w	#1,do_hblank
	jsr	StopZ80
	tst.b	water_full
	bne.s	loc_201D6A
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)
	bra.s	loc_201D8E

; ------------------------------------------------------------------------------

loc_201D6A:
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9540,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

loc_201D8E:
	move.w	hblank_vdp_reg,(a5)
	jsr	StartZ80
	bra.w	loc_201CCA

; ------------------------------------------------------------------------------

VBlankGeneral:
	bsr.w	VBlankCommon

VBlankS1SegaLogo:
	tst.w	global_timer
	beq.w	locret_201DAC
	subq.w	#1,global_timer

locret_201DAC:
	rts

; ------------------------------------------------------------------------------

VBlankS1Title:
	bsr.w	VBlankCommon
	bsr.w	DrawStageBg
	bsr.w	ProcessGfxQueueFast
	tst.w	global_timer
	beq.w	locret_201DC6
	subq.w	#1,global_timer

locret_201DC6:
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
	lea	player_object,a0
	bsr.w	LoadPlayerGfx
	tst.b	update_player_gfx
	beq.s	loc_201E86
	lea	VDP_CTRL,a5
	move.l	#$94019370,(a5)
	move.l	#$96E49500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7000,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	move.b	#0,update_player_gfx

loc_201E86:
	jsr	AnimateStageGfx
	jsr	StartZ80
	movem.l	scroll_fg_x,d0-d7
	movem.l	d0-d7,scroll_fg_x_work
	movem.l	scroll_flags_fg,d0-d1
	movem.l	d0-d1,scroll_flags_fg_work
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
	bne.s	loc_201F90
	addq.b	#1,fade_enable_display
	move.w	display_vdp_reg,d0
	ori.b	#$40,d0
	move.w	d0,VDP_CTRL

loc_201F90:
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
	beq.s	loc_20204C
	lea	VDP_CTRL,a5
	move.l	#$94019370,(a5)
	move.l	#$96E49500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7000,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	move.b	#0,update_player_gfx

loc_20204C:
	tst.w	global_timer
	beq.w	locret_202058
	subq.w	#1,global_timer

locret_202058:
	rts

; ------------------------------------------------------------------------------

VBlankCommon:
	jsr	StopZ80
	bsr.w	ReadJoypads
	tst.b	water_full
	bne.s	loc_202090
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)
	bra.s	loc_2020B4

; ------------------------------------------------------------------------------

loc_202090:
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9540,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

loc_2020B4:
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

HBlank:
	rte

; ------------------------------------------------------------------------------

UpdateWarpTimer:
	tst.b	player_object+obj.var_2a
	bne.s	locret_202114
	tst.w	warp_timer
	beq.s	locret_202114
	addq.w	#1,warp_timer

locret_202114:
	rts

; ------------------------------------------------------------------------------

UpdateBoredTimer:
	tst.w	bored_timer
	beq.s	loc_202120
	addq.w	#1,bored_timer

loc_202120:
	tst.w	bored_timer_p2
	beq.s	locret_20212A
	addq.w	#1,bored_timer_p2

locret_20212A:
	rts

; ------------------------------------------------------------------------------
