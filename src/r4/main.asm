; ------------------------------------------------------------------------------

InitStage:
	clr.w	stage_demo
	cmpi.b	#$7F,game_time_stones
	bne.s	loc_20145A
	tst.b	time_attack
	bne.s	loc_20145A
	move.b	#1,good_future

loc_20145A:
	clr.b	vblank_routine
	clr.b	use_player_2
	if DEMO<>0
		move.b	#0,respawn_checkpoint
		bset	#1,stage_start_flags
	endif
	move.b	#0,paused
	move.b	#0,stage_started
	bset	#0,stage_start_flags
	bne.s	loc_2014C2
	move.b	#0,palette_fade_flags
	clr.b	respawn_checkpoint
	move.l	#5000,next_life_score
	bsr.w	ResetObjectStates
	clr.b	spawn_mode
	clr.b	zone_good_futures
	clr.l	score
	move.b	#3,lives
	tst.b	time_attack
	beq.s	loc_2014C2
	move.b	#1,lives

loc_2014C2:
	bset	#7,game_mode
	bsr.w	ClearGfxQueue
	tst.b	enter_special_stage
	bne.s	loc_2014E8
	btst	#7,time_zone
	beq.s	loc_20150C
	bset	#0,palette_fade_flags
	beq.s	loc_2014F4

loc_2014E8:
	bsr.w	FadeToWhite
	bclr	#0,palette_fade_flags

loc_2014F4:
	clr.b	warp_direction
	tst.w	restart_stage
	beq.w	loc_20157C
	move.w	#0,restart_stage
	rts

; ------------------------------------------------------------------------------

loc_20150C:
	bset	#0,palette_fade_flags
	beq.s	loc_20151A
	bsr.w	FadeToBlack

loc_20151A:
	cmpi.w	#2,restart_stage
	bne.s	loc_201536
	move.w	#0,restart_stage
	move.b	#0,palette_fade_flags
	bra.s	loc_20155E

; ------------------------------------------------------------------------------

loc_201536:
	tst.b	lives
	bne.s	loc_20157C
	move.b	#0,stage_start_flags
	move.b	#0,respawn_checkpoint
	move.b	#0,spawn_mode
	move.b	#0,palette_fade_flags

loc_20155E:
	lea	palette,a1
	move.w	#$1F,d6

loc_201566:
	move.l	#0,(a1)+
	dbf	d6,loc_201566
	move.b	#$C,vblank_routine
	bsr.w	VSync
	rts

; ------------------------------------------------------------------------------

loc_20157C:
	cmpi.w	#$800,demo_index
	bne.s	loc_20159A
	move.w	#0,demo_index
	clr.w	stage_demo
	move.b	#0,palette_fade_flags
	rts

; ------------------------------------------------------------------------------

loc_20159A:
	moveq	#0,d0
	btst	#0,palette_clear_flags
	bne.s	loc_2015B0
	btst	#7,time_zone
	beq.s	loc_2015B6

loc_2015B0:
	move.l	#$EEE0EEE,d0

loc_2015B6:
	lea	palette,a1
	move.w	#$1F,d6

loc_2015BE:
	move.l	d0,(a1)+
	dbf	d6,loc_2015BE

loc_2015C4:
	move.b	#$C,vblank_routine
	bsr.w	VSync
	bsr.w	AdvanceGfxQueue
	bne.s	loc_2015C4
	tst.l	gfx_queue
	bne.s	loc_2015C4
	bsr.w	PlayStageMusic
	moveq	#0,d0
	lea	StageDataIndex,a2
	moveq	#0,d0
	move.b	(a2),d0
	beq.s	loc_2015F0
	bsr.w	LoadGfxList

loc_2015F0:
	moveq	#1,d0
	bsr.w	LoadGfxList
	clr.b	powerup_changed
	clr.l	flower_counts
	lea	object_draw_queue,a1
	moveq	#0,d0
	move.w	#$FF,d1

loc_20160C:
	move.l	d0,(a1)+
	dbf	d1,loc_20160C
	lea	flower_positions,a1
	moveq	#0,d0
	move.w	#$27F,d1

loc_20161E:
	move.l	d0,(a1)+
	dbf	d1,loc_20161E
	lea	player_object,a1
	moveq	#0,d0
	move.w	#$7FF,d1

loc_20162E:
	move.l	d0,(a1)+
	dbf	d1,loc_20162E
	lea	vblank_e_count,a1
	moveq	#0,d0
	move.w	#$15,d1

loc_20163E:
	move.l	d0,(a1)+
	dbf	d1,loc_20163E
	lea	scroll_fg_x,a1
	moveq	#0,d0
	move.w	#$3F,d1

loc_20164E:
	move.l	d0,(a1)+
	dbf	d1,loc_20164E
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
	bne.s	loc_2016E2
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

loc_2016E2:
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

loc_20171A:
	move.b	#$C,vblank_routine
	bsr.w	VSync
	bsr.w	AdvanceGfxQueue
	bne.s	loc_20171A
	tst.l	gfx_queue
	bne.s	loc_20171A
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
	bne.s	loc_20177E
	move.b	#$3C,title_card_object+obj.id
	move.b	#1,control_locked
	clr.b	gfx_section_id

loc_20177E:
	move.b	#4,object_spawn_pool+obj.id
	move.w	#0,player_joy_hold
	move.w	#0,p1_joy_hold
	move.w	#0,p2_joy_hold
	move.w	#0,bored_timer
	move.w	#0,bored_timer_p2
	moveq	#0,d0
	tst.b	spawn_mode
	bne.s	loc_2017BE
	move.w	d0,rings
	move.l	d0,time
	move.b	d0,lives_flags

loc_2017BE:
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
	beq.s	loc_20184E

loc_201848:
	bsr.w	FadeFromWhite
	bra.s	loc_20185C

; ------------------------------------------------------------------------------

loc_20184E:
	bclr	#0,palette_clear_flags
	bne.s	loc_201848
	bsr.w	FadeFromBlack

loc_20185C:
	cmpi.b	#2,zone
	bne.s	loc_20186C
	moveq	#0,d0
	bsr.w	LoadWaterPalette

loc_20186C:
	bclr	#7,game_mode
	move.b	#1,stage_started

loc_20187A:
	move.b	#8,vblank_routine
	bsr.w	VSync
	cmpi.b	#6,player_object+obj.routine
	bcc.s	loc_201898
	tst.b	control_locked
	bne.s	loc_201898
	btst	#7,p1_joy_tap
	beq.s	loc_201898
	eori.b	#1,paused

loc_201898:
	btst	#0,paused
	beq.w	loc_20191E
	bsr.w	PauseMusic
	if DEMO<>0
		tst.w	stage_demo
		bne.s	loc_2018FC
	endif
	move.b	p1_joy_tap,d0
	tst.b	time_attack
	bne.s	loc_2018FC
	andi.b	#$70,d0
	beq.s	loc_20187A
	subq.b	#1,lives
	bpl.s	loc_2018CA
	clr.b	lives

loc_2018CA:
	move.w	#$E,d0
	jsr	SubCpuCommand
	bsr.w	ResetObjectStates
	clr.b	spawn_mode
	jsr	StopZ80
	move.b	#1,Z80_RAM+$1C3E
	jsr	StartZ80
	move.w	#1,restart_stage
	bra.s	loc_20190A

; ------------------------------------------------------------------------------

loc_2018FC:
	andi.b	#$70,d0
	beq.w	loc_20187A
	clr.b	lives

loc_20190A:
	clr.b	paused
	clr.w	stage_demo
	clr.b	respawn_checkpoint
	if DEMO<>0
		move.w	#$800,demo_index
	endif
	bra.w	InitStage

; ------------------------------------------------------------------------------

loc_20191E:
	bsr.w	UnpauseMusic
	addq.w	#1,stage_frames
	jsr	SpawnStageObjects
	jsr	UpdateObjects
	cmpi.w	#$800,demo_index
	beq.w	InitStage
	tst.w	restart_stage
	bne.w	InitStage
	tst.w	debug_mode
	bne.s	loc_201966
	cmpi.b	#6,player_object+obj.routine
	bcs.s	loc_201966
	move.w	scroll_fg_y,bottom_bound
	move.w	scroll_fg_y,target_bottom_bound
	bra.s	loc_20196A

; ------------------------------------------------------------------------------

loc_201966:
	bsr.w	UpdateScroll

loc_20196A:
	bsr.w	CheckWaterCurrents
	jsr	DrawObjects
	tst.w	time_stop
	bne.s	loc_201980
	bsr.w	CyclePalette

loc_201980:
	jsr	UpdateSectionGfx
	bsr.w	AdvanceGfxQueue
	bsr.w	UpdateGlobalAnims
	bra.w	loc_20187A

; ------------------------------------------------------------------------------

SpawnPlayer:
	lea	player_object,a1
	moveq	#1,d0
	move.b	d0,0(a1)
	tst.b	spawn_mode
	beq.s	locret_2019AA
	move.w	#$78,$30(a1)

locret_2019AA:
	rts

; ------------------------------------------------------------------------------

UnusedSpawnFlowers:
	rts

; ------------------------------------------------------------------------------

LoadStageCollision:
	move.l	#StageCollision,stage_collision
	rts

; ------------------------------------------------------------------------------

UpdateGlobalAnims:
	subq.b	#1,log_spike_anim_timer
	bpl.s	loc_2019D6
	move.b	#$B,log_spike_anim_timer
	subq.b	#1,log_spike_anim_frame
	andi.b	#7,log_spike_anim_frame

loc_2019D6:
	subq.b	#1,ring_anim_timer
	bpl.s	loc_2019F4
	move.b	#7,ring_anim_timer
	addq.b	#1,ring_anim_frame
	andi.b	#3,ring_anim_frame

loc_2019F4:
	subq.b	#1,unk_anim_timer
	bpl.s	loc_201A1C
	move.b	#7,unk_anim_timer
	addq.b	#1,unk_anim_frame
	cmpi.b	#6,unk_anim_frame
	bcs.s	loc_201A1C
	move.b	#0,unk_anim_frame

loc_201A1C:
	tst.b	lost_ring_anim_timer
	beq.s	locret_201A4A
	moveq	#0,d0
	move.b	lost_ring_anim_timer,d0
	add.w	lost_ring_anim_accum,d0
	move.w	d0,lost_ring_anim_accum
	rol.w	#7,d0
	andi.w	#3,d0
	move.b	d0,lost_ring_anim_frame
	subq.b	#1,lost_ring_anim_timer

locret_201A4A:
	rts

; ------------------------------------------------------------------------------

PlayStageMusic:
	moveq	#0,d0
	moveq	#0,d1
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	time_attack
	bne.s	loc_201A6E
	cmpi.b	#2,d0
	bne.s	loc_201A6E
	add.b	good_future,d0

loc_201A6E:
	move.b	zone,d1
	add.w	d1,d1
	add.w	d1,d1
	add.w	d0,d1
	moveq	#0,d0
	move.b	byte_201A86(pc,d1.w),d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

byte_201A86:
	dc.b	$80, $F, $11, $10
	dc.b	$80, $12, $14, $13
	dc.b	$80, $15, $17, $16

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

UpdateWater:
	tst.b	paused
	bne.s	locret_201B60
	cmpi.b	#6,player_object+obj.routine
	bcc.s	loc_201B12
	bsr.w	WaterEvents

loc_201B12:
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
	bcc.s	loc_201B52
	tst.w	d0
	bpl.s	loc_201B52
	move.b	#$DF,hblank_vdp_reg+1
	move.b	#1,water_full

loc_201B52:
	cmpi.w	#$DF,d0
	bcs.s	loc_201B5C
	move.w	#$DF,d0

loc_201B5C:
	move.b	d0,hblank_vdp_reg+1

locret_201B60:
	rts

; ------------------------------------------------------------------------------

WaterHeights:
	dc.w	$300, $280, $1D0, $FFF
	dc.w	$5B0, $530, $510, $FFF
	dc.w	$490, $490, $490, $FFF

; ------------------------------------------------------------------------------

WaterEvents:
	moveq	#0,d0
	move.b	act,d0
	add.w	d0,d0
	move.w	off_201BA6(pc,d0.w),d0
	jsr	off_201BA6(pc,d0.w)
	moveq	#0,d1
	move.b	water_speed,d1
	move.w	target_water_y,d0
	sub.w	static_water_y,d0
	beq.s	locret_201BA4
	bcc.s	loc_201BA0
	neg.w	d1

loc_201BA0:
	add.w	d1,static_water_y

locret_201BA4:
	rts

; ------------------------------------------------------------------------------

off_201BA6:
	dc.w	WaterEventsAct1-*
	dc.w	WaterEventsAct2-off_201BA6
	dc.w	WaterEventsAct3-off_201BA6

; ------------------------------------------------------------------------------

WaterEventsAct1:
	move.w	player_object+obj.x,d2
	moveq	#0,d0
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	d0
	bne.s	loc_201BC2
	rts

; ------------------------------------------------------------------------------

loc_201BC2:
	cmpi.b	#1,d0
	bne.s	loc_201BD8
	move.w	#$280,d1
	cmpi.w	#$5E0,d2
	bcs.s	loc_201BF6
	move.w	#$260,d1
	bra.s	loc_201BF6

; ------------------------------------------------------------------------------

loc_201BD8:
	move.w	#$1D0,d1
	cmpi.w	#$920,d2
	bcs.s	loc_201BF6
	move.w	#$110,d1
	cmpi.w	#$1980,d2
	bcs.s	loc_201BF6
	move.w	#$240,d1
	move.b	#3,water_speed

loc_201BF6:
	move.w	d1,target_water_y
	rts

; ------------------------------------------------------------------------------

WaterEventsAct2:
	move.w	player_object+obj.x,d2
	move.w	scroll_fg_y,d1
	addi.w	#$E8,d1
	cmpi.w	#$200,d2
	bcs.s	loc_201C24
	cmpi.w	#$600,player_object+obj.y
	bcs.s	loc_201C2A
	cmpi.w	#$6C0,player_object+obj.y
	bcc.s	loc_201C2A
	cmpi.w	#$2A0,d2
	bcc.s	loc_201C2A

loc_201C24:
	move.w	d1,static_water_y
	bra.s	loc_201C9A

; ------------------------------------------------------------------------------

loc_201C2A:
	moveq	#0,d0
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	d0
	bne.s	loc_201C40
	move.w	#$5B0,d1
	bra.s	loc_201C24

; ------------------------------------------------------------------------------

loc_201C40:
	cmpi.b	#1,d0
	bne.s	loc_201C78
	move.w	#$530,d1
	cmpi.w	#$C00,d2
	bcs.s	loc_201C9A
	move.w	#$780,d1
	cmpi.w	#$DC0,d2
	bcs.s	loc_201C9A
	move.w	#$500,d1
	cmpi.w	#$1380,d2
	bcc.s	loc_201C9A
	cmpi.w	#$400,player_object+obj.y
	bcc.s	locret_201C76
	move.w	#$3C0,d1
	cmpi.w	#$1100,d2
	bcc.s	loc_201C9A

locret_201C76:
	rts

; ------------------------------------------------------------------------------

loc_201C78:
	move.w	#$510,d1
	cmpi.w	#$400,d2
	bcs.s	loc_201C9A
	move.w	#$390,d1
	cmpi.w	#$1600,d2
	bcs.s	loc_201C9A
	move.w	#$410,d1
	cmpi.w	#$1900,d2
	bcs.s	loc_201C9A
	move.w	#$500,d1

loc_201C9A:
	move.w	d1,target_water_y
	rts

; ------------------------------------------------------------------------------

WaterEventsAct3:
	move.w	player_object+obj.x,d2
	move.w	scroll_fg_y,d1
	addi.w	#$E8,d1
	cmpi.w	#$7C0,d2
	bcc.s	loc_201CB8
	move.w	d1,static_water_y
	bra.s	loc_201CCC

; ------------------------------------------------------------------------------

loc_201CB8:
	move.w	#$490,d1
	cmpi.w	#$AF0,d2
	bcs.s	loc_201CCC
	move.b	#2,water_speed
	move.w	#$5C0,d1

loc_201CCC:
	move.w	d1,target_water_y
	rts

; ------------------------------------------------------------------------------

CheckWaterCurrents:
	lea	player_object,a1
	cmpi.b	#$2B,obj.anim_id(a1)
	beq.w	locret_201DF2
	btst	#0,obj.var_2c(a1)
	bne.w	locret_201DF2
	tst.b	(a1)
	beq.w	locret_201DF2
	tst.w	debug_mode
	bne.w	locret_201DF2
	moveq	#0,d0
	move.b	act,d0
	cmpi.b	#2,d0
	bcc.w	locret_201DF2
	lea	WaterCurrents,a2

loc_201D10:
	move.w	obj.x(a1),d0
	cmp.w	(a2),d0
	bcs.w	loc_201DD8
	cmp.w	4(a2),d0
	bcc.w	loc_201DD8
	move.w	obj.y(a1),d2
	cmp.w	2(a2),d2
	bcs.w	loc_201DD8
	cmp.w	6(a2),d2
	bcc.w	loc_201DD8
	move.b	stage_vblank_frames+3,d0
	andi.b	#$3F,d0
	bne.s	loc_201D46
	move.w	#$D0,d0

loc_201D46:
	lea	switch_flags,a3
	moveq	#0,d0
	move.b	$D(a2),d0
	cmpi.b	#1,$C(a2)
	bne.s	loc_201D62
	btst	#6,(a3,d0.w)
	beq.w	locret_201DF2

loc_201D62:
	cmpi.b	#4,obj.routine(a1)
	bcc.w	loc_201DEE
	move.b	#1,water_current_flag
	clr.b	obj.var_3c(a1)
	move.w	8(a2),obj.x_speed(a1)
	move.w	$A(a2),obj.y_speed(a1)
	move.b	#$F,obj.anim_id(a1)
	bset	#1,obj.flags(a1)
	cmpi.b	#2,$C(a2)
	bne.s	loc_201DA6
	btst	#5,(a3,d0.w)
	beq.s	loc_201DA6
	neg.w	obj.x_speed(a1)
	neg.w	obj.y_speed(a1)

loc_201DA6:
	btst	#0,player_joy_hold
	beq.s	loc_201DB2
	subq.w	#1,$C(a1)

loc_201DB2:
	btst	#1,player_joy_hold
	beq.s	loc_201DBE
	addq.w	#1,$C(a1)

loc_201DBE:
	btst	#2,player_joy_hold
	beq.s	loc_201DCA
	subq.w	#1,8(a1)

loc_201DCA:
	btst	#3,player_joy_hold
	beq.s	locret_201DD6
	addq.w	#1,8(a1)

locret_201DD6:
	rts

; ------------------------------------------------------------------------------

loc_201DD8:
	adda.w	#$E,a2
	tst.b	(a2)
	bpl.w	loc_201D10
	tst.b	water_current_flag
	beq.s	locret_201DF2
	move.b	#0,obj.anim_id(a1)

loc_201DEE:
	clr.b	water_current_flag

locret_201DF2:
	rts

; ------------------------------------------------------------------------------

	rts

; ------------------------------------------------------------------------------

PauseMusic:
	move.w	#$AB,d0
	jsr	PlayFmSound
	bset	#7,paused
	bne.s	locret_201E3A
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	d0
	beq.s	loc_201E20

loc_201E16:
	move.w	#$D5,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

loc_201E20:
	tst.b	invincible
	bne.s	loc_201E16
	tst.b	speed_shoes
	bne.s	loc_201E16
	move.w	#$90,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

locret_201E3A:
	rts

; ------------------------------------------------------------------------------

UnpauseMusic:
	bclr	#7,paused
	beq.s	locret_201E76
	move.b	time_zone,d0
	bclr	#7,d0
	tst.b	d0
	beq.s	loc_201E5C

loc_201E52:
	move.w	#$D6,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

loc_201E5C:
	tst.b	invincible
	bne.s	loc_201E52
	tst.b	speed_shoes
	bne.s	loc_201E52
	move.w	#$91,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

locret_201E76:
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
	beq.s	loc_201EB4
	move.w	#$700,d0

loc_201EB0:
	dbf	d0,loc_201EB0

loc_201EB4:
	move.b	vblank_routine,d0
	move.b	#0,vblank_routine
	andi.w	#$3E,d0
	move.w	VBlankIndex(pc,d0.w),d0
	jsr	VBlankIndex(pc,d0.w)

loc_201ECA:
	tst.b	paused
	bne.s	loc_201ED8
	bsr.w	UpdateBoredTimer
	bsr.w	UpdateWarpTimer

loc_201ED8:
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
	beq.s	loc_201ECA
	cmpi.b	#2,zone
	bne.w	loc_201ECA
	move.w	VDP_CTRL,d0
	btst	#6,system_version
	beq.s	loc_201F2A
	move.w	#$700,d0

loc_201F26:
	dbf	d0,loc_201F26

loc_201F2A:
	move.w	#1,do_hblank
	jsr	StopZ80
	jsr	UpdateWater
	tst.b	water_full
	bne.s	loc_201F68
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)
	bra.s	loc_201F8C

; ------------------------------------------------------------------------------

loc_201F68:
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9540,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

loc_201F8C:
	move.w	hblank_vdp_reg,(a5)
	jsr	StartZ80
	bra.w	loc_201ECA

; ------------------------------------------------------------------------------

VBlankGeneral:
	bsr.w	VBlankCommon

VBlankS1SegaLogo:
	tst.w	global_timer
	beq.w	locret_201FAA
	subq.w	#1,global_timer

locret_201FAA:
	rts

; ------------------------------------------------------------------------------

VBlankS1Title:
	bsr.w	VBlankCommon
	bsr.w	DrawStageBg
	bsr.w	ProcessGfxQueueFast
	tst.w	global_timer
	beq.w	locret_201FC4
	subq.w	#1,global_timer

locret_201FC4:
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
	bne.s	loc_202018
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)
	bra.s	loc_20203C

; ------------------------------------------------------------------------------

loc_202018:
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9540,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

loc_20203C:
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
	beq.s	loc_2020C6
	lea	VDP_CTRL,a5
	move.l	#$94019370,(a5)
	move.l	#$96E49500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7000,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	move.b	#0,update_player_gfx

loc_2020C6:
	tst.w	time_stop
	bne.s	loc_2020D4
	jsr	AnimateStageGfx

loc_2020D4:
	jsr	StartZ80
	movem.l	scroll_fg_x,d0-d7
	movem.l	d0-d7,scroll_fg_x_work
	movem.l	scroll_flags_fg,d0-d1
	movem.l	d0-d1,scroll_flags_fg_work
	cmpi.b	#$60,hblank_vdp_reg+1
	bcc.s	sub_20210A
	move.b	#1,do_hblank_updates
	addq.l	#4,sp
	bra.w	loc_201ECA

; ------------------------------------------------------------------------------

sub_20210A:
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
	bne.s	loc_2021EC
	addq.b	#1,fade_enable_display
	move.w	display_vdp_reg,d0
	ori.b	#$40,d0
	move.w	d0,VDP_CTRL

loc_2021EC:
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
	beq.s	loc_2022A8
	lea	VDP_CTRL,a5
	move.l	#$94019370,(a5)
	move.l	#$96E49500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7000,(a5)
	move.w	#$83,dma_stack
	move.w	dma_stack,(a5)
	move.b	#0,update_player_gfx

loc_2022A8:
	tst.w	global_timer
	beq.w	locret_2022B4
	subq.w	#1,global_timer

locret_2022B4:
	rts

; ------------------------------------------------------------------------------

VBlankCommon:
	jsr	StopZ80
	bsr.w	ReadJoypads
	tst.b	water_full
	bne.s	loc_2022EC
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)
	bra.s	loc_202310

; ------------------------------------------------------------------------------

loc_2022EC:
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9540,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

loc_202310:
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
	move	#$2700,sr
	tst.w	do_hblank
	beq.s	locret_2023DC
	move.w	#0,do_hblank
	cmpi.b	#$DF,hblank_vdp_reg+1
	beq.s	locret_2023DC
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
	bne.s	loc_2023DE

locret_2023DC:
	rte

; ------------------------------------------------------------------------------

loc_2023DE:
	clr.b	do_hblank_updates
	movem.l	d0-d7/a0-a6,-(sp)
	bsr.w	sub_20210A
	movem.l	(sp)+,d0-d7/a0-a6
	rte

; ------------------------------------------------------------------------------

UpdateWarpTimer:
	tst.b	player_object+obj.var_2a
	bne.s	locret_202400
	tst.w	warp_timer
	beq.s	locret_202400
	addq.w	#1,warp_timer

locret_202400:
	rts

; ------------------------------------------------------------------------------

UpdateBoredTimer:
	tst.w	bored_timer
	beq.s	loc_20240C
	addq.w	#1,bored_timer

loc_20240C:
	tst.w	bored_timer_p2
	beq.s	locret_202416
	addq.w	#1,bored_timer_p2

locret_202416:
	rts

; ------------------------------------------------------------------------------
