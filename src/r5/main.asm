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
	cmpi.b	#$7F,(game_time_stones).l
	bne.s	loc_20142A
	tst.b	(time_attack).l
	bne.s	loc_20142A
	move.b	#1,(good_future).l

loc_20142A:
	clr.b	(vblank_routine).w
	clr.b	(r5_conveyor_reverse).l
	clr.b	(use_player_2).l
	move.b	#0,(paused).w
	move.b	#0,(stage_started).l
	bset	#0,(stage_start_flags).l
	bne.s	loc_201498
	move.b	#0,(palette_fade_flags).l
	clr.b	(respawn_checkpoint).l
	move.l	#$1388,(next_life_score).l
	bsr.w	ResetObjectStates
	clr.b	(spawn_mode).l
	clr.b	(zone_good_futures).l
	clr.l	(score).l
	move.b	#3,(lives).l
	tst.b	(time_attack).l
	beq.s	loc_201498
	move.b	#1,(lives).l

loc_201498:
	bset	#7,(game_mode).w
	bsr.w	ClearGfxQueue
	tst.b	(enter_special_stage).l
	bne.s	loc2_2014BE
	btst	#7,(time_zone).l
	beq.s	loc_2014F4
	bset	#0,(palette_fade_flags).l
	beq.s	loc2_2014CA

loc2_2014BE:
	bsr.w	FadeToWhite
	bclr	#0,(palette_fade_flags).l

loc2_2014CA:
	clr.b	(warp_direction).w
	tst.w	(restart_stage).l
	beq.w	loc_201564
	move.w	#0,(restart_stage).l
	cmpi.b	#2,(act).l
	bne.s	locret_2014F2
	bclr	#7,(time_zone).l

locret_2014F2:
	rts

; ------------------------------------------------------------------------------

loc_2014F4:
	bset	#0,(palette_fade_flags).l
	beq.s	loc_201502
	bsr.w	FadeToBlack

loc_201502:
	cmpi.w	#2,(restart_stage).l
	bne.s	loc_20151E
	move.w	#0,(restart_stage).l
	move.b	#0,(palette_fade_flags).l
	bra.s	loc_201546

; ------------------------------------------------------------------------------

loc_20151E:
	tst.b	(lives).l
	bne.s	loc_201564
	move.b	#0,(stage_start_flags).l
	move.b	#0,(respawn_checkpoint).l
	move.b	#0,(spawn_mode).l
	move.b	#0,(palette_fade_flags).l

loc_201546:
	lea	(palette).w,a1
	move.w	#$1F,d6

loc_20154E:
	move.l	#0,(a1)+
	dbf	d6,loc_20154E
	move.b	#$C,(vblank_routine).w
	bsr.w	VSync
	rts

; ------------------------------------------------------------------------------

loc_201564:
	cmpi.w	#$800,(demo_index).w
	bne.s	loc_20157C
	move.w	#0,(demo_index).w
	move.b	#0,(palette_fade_flags).l
	rts

; ------------------------------------------------------------------------------

loc_20157C:
	moveq	#0,d0
	btst	#0,(palette_clear_flags).l
	bne.s	loc_201592
	btst	#7,(time_zone).l
	beq.s	loc_201598

loc_201592:
	move.l	#$EEE0EEE,d0

loc_201598:
	lea	(palette).w,a1
	move.w	#$1F,d6

loc_2015A0:
	move.l	d0,(a1)+
	dbf	d6,loc_2015A0

loc_2015A6:
	move.b	#$C,(vblank_routine).w
	bsr.w	VSync
	bsr.w	AdvanceGfxQueue
	bne.s	loc_2015A6
	tst.l	(gfx_queue).w
	bne.s	loc_2015A6
	bsr.w	PlayStageMusic
	moveq	#0,d0
	lea	(StageDataIndex).l,a2
	moveq	#0,d0
	move.b	(a2),d0
	beq.s	loc_2015D2
	bsr.w	LoadGfxList

loc_2015D2:
	moveq	#1,d0
	bsr.w	LoadGfxList
	clr.b	(powerup_changed).l
	clr.l	(flower_counts).l
	lea	(object_draw_queue).w,a1
	moveq	#0,d0
	move.w	#$FF,d1

loc_2015EE:
	move.l	d0,(a1)+
	dbf	d1,loc_2015EE
	lea	(flower_positions).l,a1
	moveq	#0,d0
	move.w	#$27F,d1

loc_201600:
	move.l	d0,(a1)+
	dbf	d1,loc_201600
	lea	(player_object).w,a1
	moveq	#0,d0
	move.w	#$7FF,d1

loc_201610:
	move.l	d0,(a1)+
	dbf	d1,loc_201610
	lea	(vblank_e_count).w,a1
	moveq	#0,d0
	move.w	#$15,d1

loc_201620:
	move.l	d0,(a1)+
	dbf	d1,loc_201620
	lea	(scroll_fg_x).w,a1
	moveq	#0,d0
	move.w	#$3F,d1

loc_201630:
	move.l	d0,(a1)+
	dbf	d1,loc_201630
	move	#$2700,sr
	move.l	#(StageChunks+$6C00),(demo_data).w
	move.w	#0,(demo_index).w
	bsr.w	ClearScreen
	lea	(VDP_CTRL).l,a6
	move.w	#$8B03,(a6)
	move.w	#$8230,(a6)
	move.w	#$8407,(a6)
	move.w	#$857C,(a6)
	move.w	#$9001,(a6)
	move.w	#$8004,(a6)
	move.w	#$8720,(a6)
	move.w	#$8ADF,(hblank_vdp_reg).w
	move.w	(hblank_vdp_reg).w,(a6)
	move.w	#$1E,(drown_timer).l
	move	#$2300,sr
	moveq	#3,d0
	bsr.w	LoadPalette
	moveq	#3,d0
	bsr.w	LoadFadePalette
	bsr.w	InitScroll
	bsr.w	UpdateScroll
	bset	#2,(scroll_flags_fg).w
	bsr.w	LoadStageData
	bsr.w	InitStageDraw
	jsr	ConvertStageCollision
	bsr.w	LoadStageCollision

loc_2016B0:
	move.b	#$C,(vblank_routine).w
	bsr.w	VSync
	bsr.w	AdvanceGfxQueue
	bne.s	loc_2016B0
	tst.l	(gfx_queue).w
	bne.s	loc_2016B0
	bsr.w	SpawnPlayer
	move.b	#$1C,(hud_score_object+obj.id).w
	move.b	#$1C,(hud_lives_object+obj.id).w
	move.b	#1,(hud_lives_object+obj.subtype).w
	move.b	#$1C,(hud_rings_object+obj.id).w
	move.b	#1,(hud_rings_object+obj.subtype_2).w
	bsr.w	LoadLifeIcon
	move.b	#$19,(hud_icon_object+obj.id).w
	move.b	#$A,(hud_icon_object+obj.subtype).w
	bset	#1,(stage_start_flags).l
	bne.s	loc_201714
	move.b	#$3C,(title_card_object+obj.id).w
	move.b	#1,(control_locked).w
	clr.b	(gfx_section_id).l

loc_201714:
	move.w	#0,(player_joy_hold).w
	move.w	#0,(p1_joy_hold).w
	move.w	#0,(p2_joy_hold).w
	move.w	#0,(bored_timer).w
	move.w	#0,(bored_timer_p2).w
	move.b	#0,(r5_bg_change).l
	moveq	#0,d0
	tst.b	(spawn_mode).l
	bne.s	loc_201756
	move.w	d0,(rings).l
	move.l	d0,(time).l
	move.b	d0,(lives_flags).l

loc_201756:
	move.b	d0,(time_over).l
	move.b	d0,(shield).l
	move.b	d0,(invincible).l
	move.b	d0,(speed_shoes).l
	move.b	d0,(warping).l
	move.w	d0,(debug_mode).l
	move.w	d0,(restart_stage).l
	move.w	d0,(stage_frames).l
	move.b	d0,(spawn_mode).l
	move.b	#1,(update_hud_score).l
	move.b	#1,(update_hud_rings).l
	move.b	#1,(update_hud_time).l
	move.b	#1,(update_hud_lives).l
	move.b	#$80,(update_hud_rings).l
	move.b	#$80,(update_hud_score).l
	move.w	#0,(s1_demo_index).w
	move.w	#$202F,(palette_fade_start).w
	jsr	AnimateStageGfx
	jsr	CheckBackgroundSwap
	move.b	#1,(fade_enable_display).l
	bclr	#7,(time_zone).l
	beq.s	loc_2017EC

loc_2017E6:
	bsr.w	FadeFromWhite
	bra.s	loc_2017FA

; ------------------------------------------------------------------------------

loc_2017EC:
	bclr	#0,(palette_clear_flags).l
	bne.s	loc_2017E6
	bsr.w	FadeFromBlack

loc_2017FA:
	bclr	#7,(game_mode).w
	move.b	#1,(stage_started).l

loc_201808:
	move.b	#8,(vblank_routine).w
	bsr.w	VSync
	tst.b	(control_locked).w
	bne.s	loc_201826
	btst	#7,(p1_joy_tap).w
	beq.s	loc_201826
	eori.b	#1,(paused).w

loc_201826:
	btst	#0,(paused).w
	beq.w	loc_2018A6
	bsr.w	PauseMusic
	move.b	(p1_joy_tap).w,d0
	tst.b	(time_attack).l
	bne.s	loc_20188A
	andi.b	#$70,d0
	cmpi.b	#$70,d0
	bne.s	loc_201808
	subq.b	#1,(lives).l
	bpl.s	loc_201858
	clr.b	(lives).l

loc_201858:
	move.w	#$E,d0
	jsr	SubCpuCommand
	bsr.w	ResetObjectStates
	clr.b	(spawn_mode).l
	jsr	StopZ80
	move.b	#1,(Z80_RAM+$1C3E).l
	jsr	StartZ80
	move.w	#1,(restart_stage).l
	bra.s	loc_201898

; ------------------------------------------------------------------------------

loc_20188A:
	andi.b	#$70,d0
	beq.w	loc_201808
	clr.b	(lives).l

loc_201898:
	clr.b	(paused).w
	clr.w	(stage_demo).l
	bra.w	loc_201916

; ------------------------------------------------------------------------------

loc_2018A6:
	bsr.w	UnpauseMusic
	addq.w	#1,(stage_frames).l
	jsr	SpawnStageObjects
	jsr	UpdateObjects
	cmpi.w	#$800,(demo_index).w
	beq.w	loc_201916
	tst.w	(restart_stage).l
	bne.w	loc_201916
	tst.w	(debug_mode).l
	bne.s	loc_2018EE
	cmpi.b	#6,(player_object+obj.routine).w
	bcs.s	loc_2018EE
	move.w	(scroll_fg_y).w,(bottom_bound).w
	move.w	(scroll_fg_y).w,(target_bottom_bound).w
	bra.s	loc_2018F2

; ------------------------------------------------------------------------------

loc_2018EE:
	bsr.w	UpdateScroll

loc_2018F2:
	jsr	DrawObjects
	tst.w	(time_stop).l
	bne.s	loc_201904
	bsr.w	CyclePalette

loc_201904:
	jsr	UpdateSectionGfx
	bsr.w	AdvanceGfxQueue
	bsr.w	UpdateGlobalAnims
	bra.w	loc_201808

; ------------------------------------------------------------------------------

loc_201916:
	clr.b	(r5_bg_change).l
	bra.w	InitStage

; ------------------------------------------------------------------------------

SpawnPlayer:
	lea	(player_object).w,a1
	moveq	#1,d0
	move.b	d0,obj.id(a1)
	tst.b	(spawn_mode).l
	beq.s	locret_201938
	move.w	#120,obj.var_30(a1)

locret_201938:
	rts

; ------------------------------------------------------------------------------

UnusedSpawnFlowers:
	lea	(flower_counts).l,a1
	moveq	#0,d0
	move.b	(time_zone).l,d0
	bclr	#7,d0
	move.b	(a1,d0.w),d0
	beq.s	locret_201992
	subq.b	#1,d0
	lea	(object_spawn_pool).w,a2
	moveq	#0,d1

loc_20195A:
	move.b	#$1F,obj.id(a2)
	move.w	d1,d2
	add.w	d2,d2
	add.w	d2,d2
	moveq	#0,d3
	move.b	(time_zone).l,d3
	bclr	#7,d3
	lsl.w	#8,d3
	add.w	d3,d2
	lea	(flower_positions).l,a3
	move.w	(a3,d2.w),obj.x(a2)
	move.w	2(a3,d2.w),obj.y(a2)
	adda.w	#obj.struct_len,a2
	addq.b	#1,d1
	dbf	d0,loc_20195A

locret_201992:
	rts

; ------------------------------------------------------------------------------

LoadStageCollision:
	moveq	#0,d0
	move.b	(zone).l,d0
	lsl.w	#2,d0
	move.l	off_2019A6(pc,d0.w),(stage_collision).w
	rts

; ------------------------------------------------------------------------------

off_2019A6:
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
	subq.b	#1,(log_spike_anim_timer).l
	bpl.s	loc_2019E4
	move.b	#$B,(log_spike_anim_timer).l
	subq.b	#1,(log_spike_anim_frame).l
	andi.b	#7,(log_spike_anim_frame).l

loc_2019E4:
	subq.b	#1,(ring_anim_timer).l
	bpl.s	loc_201A02
	move.b	#7,(ring_anim_timer).l
	addq.b	#1,(ring_anim_frame).l
	andi.b	#3,(ring_anim_frame).l

loc_201A02:
	subq.b	#1,(unk_anim_timer).l
	bpl.s	loc_201A2A
	move.b	#7,(unk_anim_timer).l
	addq.b	#1,(unk_anim_frame).l
	cmpi.b	#6,(unk_anim_frame).l
	bcs.s	loc_201A2A
	move.b	#0,(unk_anim_frame).l

loc_201A2A:
	tst.b	(lost_ring_anim_timer).l
	beq.s	locret_201A58
	moveq	#0,d0
	move.b	(lost_ring_anim_timer).l,d0
	add.w	(lost_ring_anim_accum).l,d0
	move.w	d0,(lost_ring_anim_accum).l
	rol.w	#7,d0
	andi.w	#3,d0
	move.b	d0,(lost_ring_anim_frame).l
	subq.b	#1,(lost_ring_anim_timer).l

locret_201A58:
	rts

; ------------------------------------------------------------------------------

PlayStageMusic:
	moveq	#0,d0
	moveq	#0,d1
	move.b	(time_zone).l,d0
	bclr	#7,d0
	tst.b	(time_attack).l
	bne.s	loc_201A7C
	cmpi.b	#2,d0
	bne.s	loc_201A7C
	add.b	(good_future).l,d0

loc_201A7C:
	move.b	(zone).l,d1
	add.w	d1,d1
	add.w	d1,d1
	add.w	d0,d1
	moveq	#0,d0
	move.b	byte_201A94(pc,d1.w),d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

byte_201A94:
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
	move.b	(time_zone).l,d2
	bclr	#7,d2
	lsl.w	#7,d2
	move.l	d0,4(a6)
	lea	(LifeIconGfx).l,a1
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
	bset	#7,(paused).w
	bne.s	locret_201B62
	move.b	(time_zone).l,d0
	bclr	#7,d0
	tst.b	d0
	beq.s	loc_201B48

loc_201B3E:
	move.w	#$D5,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

loc_201B48:
	tst.b	(invincible).l
	bne.s	loc_201B3E
	tst.b	(speed_shoes).l
	bne.s	loc_201B3E
	move.w	#$90,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

locret_201B62:
	rts

; ------------------------------------------------------------------------------

UnpauseMusic:
	bclr	#7,(paused).w
	beq.s	locret_201B9E
	move.b	(time_zone).l,d0
	bclr	#7,d0
	tst.b	d0
	beq.s	loc_201B84

loc_201B7A:
	move.w	#$D6,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

loc_201B84:
	tst.b	(invincible).l
	bne.s	loc_201B7A
	tst.b	(speed_shoes).l
	bne.s	loc_201B7A
	move.w	#$91,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

locret_201B9E:
	rts

; ------------------------------------------------------------------------------

VBlank:
	if STANDALONE=0
		bset	#0,(MCD_INTERRUPT).l
	endif
	movem.l	d0-d7/a0-a6,-(sp)
	tst.b	(vblank_routine).w
	beq.s	VBlankLag
	move.w	(VDP_CTRL).l,d0
	move.l	#$40000010,(VDP_CTRL).l
	move.l	(scroll_y).w,(VDP_DATA).l
	btst	#6,(system_version).l
	beq.s	loc_201BDC
	move.w	#$700,d0

loc_201BD8:
	dbf	d0,loc_201BD8

loc_201BDC:
	move.b	(vblank_routine).w,d0
	move.b	#0,(vblank_routine).w
	andi.w	#$3E,d0
	move.w	VBlankIndex(pc,d0.w),d0
	jsr	VBlankIndex(pc,d0.w)

loc_201BF2:
	jsr	FlushFmQueues
	tst.b	(paused).w
	bne.s	loc_201C06
	bsr.w	UpdateBoredTimer
	bsr.w	UpdateWarpTimer

loc_201C06:
	addq.l	#1,(stage_vblank_frames).l
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
	tst.b	(stage_started).l
	beq.w	loc_201BF2
	cmpi.b	#2,(zone).l
	bne.w	loc_201BF2
	move.w	(VDP_CTRL).l,d0
	btst	#6,(system_version).l
	beq.s	loc_201C5A
	move.w	#$700,d0

loc_201C56:
	dbf	d0,loc_201C56

loc_201C5A:
	move.w	#1,(do_hblank).w
	jsr	StopZ80
	tst.b	(water_full).w
	bne.s	loc_201C92
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	bra.s	loc_201CB6

; ------------------------------------------------------------------------------

loc_201C92:
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9540,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_201CB6:
	move.w	(hblank_vdp_reg).w,(a5)
	jsr	StartZ80
	bra.w	loc_201BF2

; ------------------------------------------------------------------------------

VBlankGeneral:
	bsr.w	VBlankCommon

VBlankS1SegaLogo:
	tst.w	(global_timer).w
	beq.w	locret_201CD4
	subq.w	#1,(global_timer).w

locret_201CD4:
	rts

; ------------------------------------------------------------------------------

VBlankS1Title:
	bsr.w	VBlankCommon
	bsr.w	DrawStageBg
	bsr.w	ProcessGfxQueueFast
	tst.w	(global_timer).w
	beq.w	locret_201CEE
	subq.w	#1,(global_timer).w

locret_201CEE:
	rts

; ------------------------------------------------------------------------------

VBlankUnk6:
	bsr.w	VBlankCommon
	rts

; ------------------------------------------------------------------------------

VBlankPause:
	cmpi.b	#$10,(game_mode).w
	beq.w	VBlankS1SpecialStage

; ------------------------------------------------------------------------------

VBlankStage:
	jsr	StopZ80
	bsr.w	ReadJoypads
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	lea	(VDP_CTRL).l,a5
	move.l	#$940193C0,(a5)
	move.l	#$96E69500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7C00,(a5)
	move.w	#$83,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	lea	(VDP_CTRL).l,a5
	move.l	#$94019340,(a5)
	move.l	#$96FC9500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7800,(a5)
	move.w	#$83,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	lea	(player_object).w,a0
	bsr.w	LoadPlayerGfx
	tst.b	(update_player_gfx).w
	beq.s	loc_201DAE
	lea	(VDP_CTRL).l,a5
	move.l	#$94019370,(a5)
	move.l	#$96E49500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7000,(a5)
	move.w	#$83,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	move.b	#0,(update_player_gfx).w

loc_201DAE:
	tst.w	(time_stop).l
	bne.s	loc_201DBC
	jsr	AnimateStageGfx

loc_201DBC:
	jsr	StartZ80
	movem.l	(scroll_fg_x).w,d0-d7
	movem.l	d0-d7,(scroll_fg_x_work).l
	movem.l	(scroll_flags_fg).w,d0-d1
	movem.l	d0-d1,(scroll_flags_fg_work).l

; ------------------------------------------------------------------------------

sub_201DDE:
	bsr.w	DrawStage
	jsr	CheckBackgroundSwap
	bsr.w	ProcessGfxQueueSlow
	jmp	UpdateHudNumbers

; ------------------------------------------------------------------------------

VBlankS1SpecialStage:
	rts

; ------------------------------------------------------------------------------

VBlankStageLoad:
	jsr	StopZ80
	bsr.w	ReadJoypads
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	lea	(VDP_CTRL).l,a5
	move.l	#$940193C0,(a5)
	move.l	#$96E69500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7C00,(a5)
	move.w	#$83,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	lea	(VDP_CTRL).l,a5
	move.l	#$94019340,(a5)
	move.l	#$96FC9500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7800,(a5)
	move.w	#$83,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	lea	(player_object).w,a0
	bsr.w	LoadPlayerGfx
	tst.b	(update_player_gfx).w
	beq.s	loc_201EA2
	lea	(VDP_CTRL).l,a5
	move.l	#$94019370,(a5)
	move.l	#$96E49500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7000,(a5)
	move.w	#$83,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	move.b	#0,(update_player_gfx).w

loc_201EA2:
	jsr	StartZ80
	movem.l	(scroll_fg_x).w,d0-d7
	movem.l	d0-d7,(scroll_fg_x_work).l
	movem.l	(scroll_flags_fg).w,d0-d1
	movem.l	d0-d1,(scroll_flags_fg_work).l
	bsr.w	DrawStage
	bra.w	ProcessGfxQueueFast

; ------------------------------------------------------------------------------

VBlankUnkE:
	bsr.w	VBlankCommon
	addq.b	#1,(vblank_e_count).w
	move.b	#$E,(vblank_routine).w
	rts

; ------------------------------------------------------------------------------

VBlankPaletteFade:
	bsr.w	VBlankCommon
	cmpi.b	#1,(fade_enable_display).l
	bne.s	loc_201EFE
	addq.b	#1,(fade_enable_display).l
	move.w	(display_vdp_reg).w,d0
	ori.b	#$40,d0
	move.w	d0,(VDP_CTRL).l

loc_201EFE:
	move.w	(hblank_vdp_reg).w,(a5)
	bra.w	ProcessGfxQueueFast

; ------------------------------------------------------------------------------

VBlankS1Continue:
	jsr	StopZ80
	bsr.w	ReadJoypads
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	lea	(VDP_CTRL).l,a5
	move.l	#$94019340,(a5)
	move.l	#$96FC9500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7800,(a5)
	move.w	#$83,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	lea	(VDP_CTRL).l,a5
	move.l	#$940193C0,(a5)
	move.l	#$96E69500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7C00,(a5)
	move.w	#$83,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	jsr	StartZ80
	lea	(player_object).w,a0
	bsr.w	LoadPlayerGfx
	tst.b	(update_player_gfx).w
	beq.s	loc_201FBA
	lea	(VDP_CTRL).l,a5
	move.l	#$94019370,(a5)
	move.l	#$96E49500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7000,(a5)
	move.w	#$83,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	move.b	#0,(update_player_gfx).w

loc_201FBA:
	tst.w	(global_timer).w
	beq.w	locret_201FC6
	subq.w	#1,(global_timer).w

locret_201FC6:
	rts

; ------------------------------------------------------------------------------

VBlankCommon:
	jsr	StopZ80
	bsr.w	ReadJoypads
	tst.b	(water_full).w
	bne.s	loc_201FFE
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9580,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	bra.s	loc_202022

; ------------------------------------------------------------------------------

loc_201FFE:
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$96FD9540,(a5)
	move.w	#$977F,(a5)
	move.w	#$C000,(a5)
	move.w	#$80,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_202022:
	lea	(VDP_CTRL).l,a5
	move.l	#$94019340,(a5)
	move.l	#$96FC9500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7800,(a5)
	move.w	#$83,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	lea	(VDP_CTRL).l,a5
	move.l	#$940193C0,(a5)
	move.l	#$96E69500,(a5)
	move.w	#$977F,(a5)
	move.w	#$7C00,(a5)
	move.w	#$83,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	jmp	StartZ80

; ------------------------------------------------------------------------------

HBlank:
	move	#$2700,sr
	tst.w	(do_hblank).w
	beq.s	locret_2020EE
	move.w	#0,(do_hblank).w
	cmpi.b	#$DF,(hblank_vdp_reg+1).w
	beq.s	locret_2020EE
	movem.l	a0-a1,-(sp)
	lea	(VDP_DATA).l,a1
	lea	(water_palette).w,a0
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
	tst.b	(do_hblank_updates).w
	bne.s	loc_2020F0

locret_2020EE:
	rte

; ------------------------------------------------------------------------------

loc_2020F0:
	clr.b	(do_hblank_updates).w
	movem.l	d0-d7/a0-a6,-(sp)
	bsr.w	sub_201DDE
	movem.l	(sp)+,d0-d7/a0-a6
	rte

; ------------------------------------------------------------------------------

UpdateWarpTimer:
	tst.b	(player_object+obj.var_2a).w
	bne.s	locret_202112
	tst.w	(warp_timer).w
	beq.s	locret_202112
	addq.w	#1,(warp_timer).w

locret_202112:
	rts

; ------------------------------------------------------------------------------

UpdateBoredTimer:
	tst.w	(bored_timer).w
	beq.s	loc_20211E
	addq.w	#1,(bored_timer).w

loc_20211E:
	tst.w	(bored_timer_p2).w
	beq.s	locret_202128
	addq.w	#1,(bored_timer_p2).w

locret_202128:
	rts

; ------------------------------------------------------------------------------