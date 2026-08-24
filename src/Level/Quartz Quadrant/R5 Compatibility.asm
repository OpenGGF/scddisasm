; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Quartz Quadrant R5 compatibility aliases
; -------------------------------------------------------------------------
;
; The recovered R41 object routines use the object layout and service names
; from the earlier disassembly.  The level engine now keeps the same
; 0x40-byte object ABI, but uses descriptive names for its RAM fields and
; shared routines.  These aliases bind the old routines to that ABI without
; changing their recovered instruction streams.
; -------------------------------------------------------------------------

; -------------------------------------------------------------------------
; Object fields
; -------------------------------------------------------------------------

obj.id			EQU	oID
obj.sprite_flags	EQU	oSprFlags
obj.sprite_tile		EQU	oTile
obj.sprite_data		EQU	oMap
obj.x			EQU	oX
obj.x_speed		EQU	oXVel
obj.y			EQU	oY
obj.y_speed		EQU	oYVel
obj.ground_speed	EQU	oPlayerGVel
obj.height		EQU	oYRadius
obj.width		EQU	oXRadius
obj.sprite_layer	EQU	oPriority
obj.width_2		EQU	oWidth
obj.sprite_frame	EQU	oMapFrame
obj.anim_index		EQU	oAnimFrame
obj.anim_id		EQU	oAnim
obj.prev_anim_id	EQU	oPrevAnim
obj.anim_timer		EQU	oAnimTime
obj.var_1f		EQU	oVar1F
obj.collide_type	EQU	oColType
obj.collide_status	EQU	oColStatus
obj.flags		EQU	oFlags
obj.state_id		EQU	oSavedFlagsID
obj.routine		EQU	oRoutine
obj.routine_2		EQU	oRoutine2
obj.angle		EQU	oAngle
obj.var_27		EQU	oVar27
obj.subtype		EQU	oSubtype
obj.subtype_2		EQU	oSubtype2
obj.var_2a		EQU	oVar2A
obj.var_2b		EQU	oVar2B
obj.var_2c		EQU	oVar2C
obj.var_2d		EQU	oVar2D
obj.var_2e		EQU	oVar2E
obj.var_2f		EQU	oVar2F
obj.var_30		EQU	oVar30
obj.var_31		EQU	oVar31
obj.var_32		EQU	oVar32
obj.var_33		EQU	oVar33
obj.var_34		EQU	oVar34
obj.var_35		EQU	oVar35
obj.var_36		EQU	oVar36
obj.var_37		EQU	oVar37
obj.var_38		EQU	oVar38
obj.var_39		EQU	oVar39
obj.var_3a		EQU	oVar3A
obj.var_3b		EQU	oVar3B
obj.var_3c		EQU	oVar3C
obj.var_3d		EQU	oVar3D
obj.var_3e		EQU	oVar3E
obj.var_3f		EQU	oVar3F
obj.struct_len		EQU	oSize

; -------------------------------------------------------------------------
; RAM names
; -------------------------------------------------------------------------

player_object		EQU	objPlayerSlot
player_object_2		EQU	objPlayerSlot2
hud_score_object	EQU	objHUDScoreSlot
hud_lives_object	EQU	objHUDLivesSlot
hud_rings_object	EQU	objHUDRingsSlot
hud_icon_object		EQU	objHUDIconSlot
title_card_object	EQU	objTtlCardSlot
bubbles_object		EQU	objBubblesSlot
object_pool		EQU	objects
object_spawn_pool	EQU	dynObjects
object_states		EQU	savedObjFlags

stage_map		EQU	levelLayout
stage_blocks		EQU	blockBuffer
stage_chunks		EQU	LevelChunks
stage_collision		EQU	collisionPtr
stage_frames		EQU	levelFrames
stage_vblank_frames	EQU	levelVIntCounter
stage_started		EQU	levelStarted
stage_demo		EQU	demoMode
score_chain		EQU	scoreChain
time_zone		EQU	timeZone
good_future		EQU	goodFuture
time_attack		EQU	timeAttackMode
time_stop		EQU	timeStopTimer
time_seconds		EQU	timeSeconds
projector_destroyed	EQU	projDestroyed
spawn_mode		EQU	spawnMode
drown_timer		EQU	drownTimer
gfx_section_id		EQU	sectionID

water_y			EQU	waterHeight
static_water_y		EQU	waterHeight2
target_water_y		EQU	destWaterHeight
water_speed		EQU	waterMoveSpeed
water_routine		EQU	waterRoutine
water_full		EQU	waterFullscreen
	if (STAGE_ZONE=1)|(STAGE_ZONE=2)|((REGION=USA)&((STAGE_ZONE=3)|(STAGE_ZONE=5)|(STAGE_ZONE=6)))
		; Collision Chaos and Tidal Tempest retain the earlier current-water flag address in every region. USA also retains it for Quartz Quadrant, Stardust Speedway, and Metallic Madness.
water_current_flag	EQU	windTunnelFlag
	else
water_current_flag	EQU	waterSlideFlag
	endif

ring_anim_timer		EQU	ringAnimTimer
ring_anim_frame		EQU	ringAnimFrame
lost_ring_anim_timer	EQU	ringLossAnimTimer
lost_ring_anim_frame	EQU	ringLossAnimFrame
lost_ring_anim_accum	EQU	ringLossAnimAccum
log_spike_anim_timer	EQU	logSpikeAnimTimer
log_spike_anim_frame	EQU	logSpikeAnimFrame
unk_anim_timer		EQU	unkAnimTimer
unk_anim_frame		EQU	unkAnimFrame

scroll_fg_x		EQU	cameraX
scroll_fg_y		EQU	cameraY
scroll_bg_x		EQU	cameraBgX
scroll_bg_y		EQU	cameraBgY
scroll_bg2_x		EQU	cameraBg2X
scroll_bg2_y		EQU	cameraBg2Y
scroll_bg3_x		EQU	cameraBg3X
scroll_bg3_y		EQU	cameraBg3Y
scroll_fg_x_work	EQU	camXCopy
scroll_fg_y_work	EQU	camYCopy
scroll_bg_x_work	EQU	camXBgCopy
scroll_bg_y_work	EQU	camYBgCopy
scroll_bg2_x_work	EQU	camXBg2Copy
scroll_bg2_y_work	EQU	camYBg2Copy
scroll_bg3_x_work	EQU	camXBg3Copy
scroll_bg3_y_work	EQU	camYBg3Copy
scroll_flags_fg	EQU	scrollFlags
scroll_flags_bg	EQU	scrollFlagsBg
scroll_flags_bg2	EQU	scrollFlagsBg2
scroll_flags_bg3	EQU	scrollFlagsBg3
	if REGION=USA
		; USA R5 clears this legacy stage-state byte during stage setup.
r5_usa_unknown_195c	EQU	$00FF195C
	endif
scroll_flags_fg_work	EQU	scrollFlagsCopy
scroll_flags_bg_work	EQU	scrollFlagsBgCopy
scroll_flags_bg2_work	EQU	scrollFlagsBg2Copy
scroll_flags_bg3_work	EQU	scrollFlagsBg3Copy
scroll_x_move		EQU	scrollXDiff
scroll_y_move		EQU	scrollYDiff
scroll_focus_x		EQU	camXCenter
scroll_focus_y		EQU	camYCenter
scroll_lock		EQU	scrollLock

left_bound		EQU	leftBound
right_bound		EQU	rightBound
top_bound		EQU	topBound
bottom_bound		EQU	bottomBound
target_left_bound	EQU	destLeftBound
target_right_bound	EQU	destRightBound
target_top_bound	EQU	destTopBound
target_bottom_bound	EQU	destBottomBound
bottom_bound_shift	EQU	btmBoundShift

switch_flags		EQU	switchFlags
boss_flags		EQU	bossFlags
boss_started		EQU	bossFight
warping			EQU	timeWarp
debug_cheat		EQU	debugCheat
debug_mode		EQU	debugMode
combine_ring		EQU	combineRing
hblank_vdp_reg		EQU	vdpReg0A
p1_joy_hold		EQU	p1CtrlHold
p1_joy_tap		EQU	p1CtrlTap
stage_layer		EQU	layer

; Names used by the recovered main-loop and interrupt code.
palette_fade_flags	EQU	palFadeFlags
palette_fade_start	EQU	palFadeStart
speed_shoes		EQU	speedShoes
respawn_checkpoint	EQU	checkpoint
next_life_score		EQU	nextLifeScore
	if R6_LEGACY_PLAYER=0
resetobjectstates	EQU	ResetSavedObjFlags
	endif
warp_direction		EQU	timeWarpDir
warp_timer		EQU	timeWarpTimer
control_locked		EQU	ctrlLocked
p2_joy_hold		EQU	p2CtrlHold
bored_timer		EQU	boredTimer
bored_timer_p2		EQU	boredTimerP2
s1_demo_index		EQU	demoS1Index
s1_credits_index	EQU	s1CreditsIndex
system_version		EQU	versionCache
water_palette		EQU	waterPalette
palette_cycle_steps	EQU	palCycleSteps
palette_cycle_timers	EQU	palCycleTimers
time_stop		EQU	timeStopTimer
event_routine		EQU	eventRoutine
bg_scroll_lines		EQU	deformBuffer
	if R6_LEGACY_PLAYER=0
loop_chunk_1	EQU	unkBuffer+0
loop_chunk_2	EQU	unkBuffer+1
roll_chunk_1	EQU	unkBuffer+2
roll_chunk_2	EQU	unkBuffer+3
	else
loop_chunk_1	EQU	$FFFFF7AC
loop_chunk_2	EQU	$FFFFF7AD
roll_chunk_1	EQU	$FFFFF7AE
roll_chunk_2	EQU	$FFFFF7AF
	endif
colanglemap		EQU	StageCollisionAngles
colheightmap		EQU	StageCollisionColumns
colwidthmap		EQU	StageCollisionRows

; Hardware names retained by the earlier level wrapper.
MCD_INTERRUPT		EQU	GAIRQ2
VDP_CTRL		EQU	VDPCTRL
VDP_DATA		EQU	VDPDATA
Z80_RAM		EQU	Z80RAM

; The level entry wrapper installs the recovered R5 interrupt routines below.
	if R6_LEGACY_PLAYER=0
HInterrupt		EQU	HBlank
VInterrupt		EQU	VBlank
	endif

; -------------------------------------------------------------------------
; R5-only RAM names
; -------------------------------------------------------------------------

game_mode		EQU	gameMode
player_joy_hold		EQU	playerCtrlHold
player_joy_tap		EQU	playerCtrlTap
display_vdp_reg		EQU	vdpReg01
global_timer		EQU	vintTimer
scroll_y		EQU	vscrollScreen
scroll_x		EQU	hscrollScreen
dma_stack		EQU	dmaCmdLow
vblank_e_count		EQU	vintECount
vblank_routine		EQU	vintRoutine
sprite_count		EQU	spriteCount
random_seed		EQU	rngSeed
do_hblank		EQU	hintFlag
do_hblank_updates	EQU	waterFullscreen+1
stage_anim_frames	EQU	aniArtFrames
stage_anim_timers	EQU	aniArtTimers
gfx_queue		EQU	plcBuffer
gfx_queue_write		EQU	plcNemWrite
gfx_queue_repeat	EQU	plcRepeat
gfx_queue_pixel		EQU	plcPixel
gfx_queue_row		EQU	plcRow
gfx_queue_read		EQU	plcRead
gfx_queue_shift		EQU	plcShift
gfx_queue_tiles		EQU	plcTileCount
gfx_queue_process	EQU	plcProcTileCnt
unused_scroll_routine	EQU	unusedF730
unused_scroll_x_keep	EQU	leftBound3
unused_scroll_x_flag	EQU	unusedF740
unused_scroll_y_flag	EQU	unusedF741
unused_scroll_die	EQU	unusedF746
unused_scroll_timer	EQU	unusedF748
scroll_cross_x		EQU	horizBlkCrossed
scroll_cross_y		EQU	vertiBlkCrossed
scroll_cross_bg_x	EQU	horizBlkCrossedBg
scroll_cross_bg_y	EQU	vertiBlkCrossedBg
scroll_cross_bg2_x	EQU	horizBlkCrossedBg2
scroll_cross_bg2_y	EQU	horizBlkCrossedBg2+1
scroll_cross_bg3_x	EQU	horizBlkCrossedBg3
scroll_cross_bg3_y	EQU	horizBlkCrossedBg3+1
player_max_speed	EQU	sonicTopSpeed
player_acceleration	EQU	sonicAcceleration
player_deceleration	EQU	sonicDeceleration
player_sprite_frame	EQU	sonicLastFrame
update_player_gfx	EQU	updateSonicArt
collide_angle_2	EQU	secondaryAngle
spawn_routine		EQU	objSpawnRoutine
prev_spawn_chunk	EQU	objPrevChunk
spawn_chunk_right	EQU	objChunkRight
spawn_chunk_left		EQU	objChunkLeft
spawn_chunk_right_2	EQU	objChunkNullR
spawn_chunk_left_2	EQU	objChunkNullL
focus_mode		EQU	lookMode
demo_data		EQU	demoDataPtr
demo_index		EQU	demoDataIndex
stage_anim_gfx		EQU	aniArtBuffer
bg_scroll_speeds	EQU	scrlSectSpeeds
flower_positions	EQU	flowerPosBuf
flower_counts		EQU	flowerCount
fade_enable_display	EQU	fadeEnableDisplay
unk_buffer_2		EQU	unkBuffer2
player_gfx		EQU	sonicArtBuf
player_positions	EQU	sonicRecordBuf
scroll_lines		EQU	hscroll
object_draw_queue	EQU	objDrawQueue
stage_started		EQU	levelStarted
stage_start_flags	EQU	plcLoadFlags
game_time_stones	EQU	timeStones
special_stage		EQU	specialStage
palette_clear_flags	EQU	palClearFlags
restart_stage		EQU	levelRestart
use_player_2		EQU	usePlayer2
time_over		EQU	timeOver
lives_flags		EQU	livesFlags
update_hud_lives	EQU	updateHUDLives
update_hud_rings	EQU	updateHUDRings
update_hud_time	EQU	updateHUDTime
update_hud_score	EQU	updateHUDScore
time_minutes		EQU	timeMinutes
time_seconds		EQU	timeSeconds
time_frames		EQU	timeFrames
powerup_changed	EQU	powerup
r5_bg_change		EQU	unkLevelFlag
enter_special_stage	EQU	specialStage
zone_good_futures	EQU	goodFutureFlags
r5_conveyor_reverse	EQU	checkpoint+1

explode.points		EQU	oVar3E
collide_angle_1		EQU	primaryAngle

; -------------------------------------------------------------------------
; Object index aliases
; -------------------------------------------------------------------------

	if R6_LEGACY_PLAYER=0
PlayerObject		EQU	ObjSonic
PowerupObject		EQU	ObjPowerup
TestObject		EQU	ObjTestBadnik
NullObject		EQU	ObjNull
SpringObject		EQU	ObjSpring
MoveSpringObject	EQU	ObjMovingSpring
RingObject		EQU	ObjRing
LostRingObject		EQU	ObjLostRing
CheckpointObject	EQU	ObjCheckpoint
BigRingObject		EQU	ObjBigRing
CapsuleObject		EQU	ObjCapsule
GoalObject		EQU	ObjGoalPost
SignpostObject		EQU	ObjSignpost
ExplosionObject		EQU	ObjExplosion
MonitorTimeObject	EQU	ObjTimePost
MonitorItemObject	EQU	ObjMonitorItem
HudPointsObject		EQU	ObjHUDPoints
FlowerObject		EQU	ObjFlower
ResultsObject		EQU	ObjResults
GameOverObject		EQU	ObjGameOver
TitleCardObject		EQU	ObjTitleCard
	endif

; -------------------------------------------------------------------------
; Shared service aliases
; -------------------------------------------------------------------------

	if R6_LEGACY_PLAYER=0
LevelStart		EQU	InitStage
PlayLevelMusic		EQU	PlayStageMusic
LoadCheckpoint		EQU	LoadCheckpointData
AddGfxQueue		EQU	LoadPLC
InitGfxQueue		EQU	InitPLC
CheckObjectDespawn	EQU	CheckObjDespawn
CheckObjectDespawn2	EQU	CheckObjDespawn2
DestroyInGoodFuture	EQU	DestroyOnGoodFuture
CheckBlockDown		EQU	ObjGetFloorDist
CheckBlockUp		EQU	ObjGetCeilDist
CheckBlockY		EQU	ObjGetFloorDist
CheckBlockDown3		EQU	ObjGetFloorDist

; R5 keeps the later level collision implementation and its no-op conversion
; entry, while the recovered main/object sources retain the historical names.
ConvertStageCollision	EQU	ConvColArray
ObjSonic_SpecialCol	EQU	SetObjectTileID

MoveObject		EQU	ObjMove
MoveObjectGrv		EQU	ObjMoveGrv
PlayerSetGround		EQU	Player_GroundCol
LoadFadePalette		EQU	LoadFadePal
LoadWaterPalette	EQU	LoadWaterPal
LoadWaterFadePalette	EQU	LoadWaterFadePal
LoadCapsulePalette	EQU	LoadCapsulePal
SubCpuCommand		EQU	SubCPUCmd
PlayFmMusic		EQU	PlayFMSound
SineCosine		EQU	CalcSine
Atan2			EQU	CalcAngle
ReadJoypads		EQU	ReadControllers
ClearGfxQueue		EQU	ClearPLCs
AdvanceGfxQueue	EQU	ProcessPLCs
LoadGfxList		EQU	LoadPLCImm
LoadPlayerGfx		EQU	LoadSonicDynPLC
DecompNemesis		EQU	NemDecToRAM
ProcessGfxQueueFast	EQU	DecompPLCFast
ProcessGfxQueueSlow	EQU	DecompPLCSlow
FlushFmQueues		EQU	UpdateFMQueues
SpawnStageObjects	EQU	SpawnObjects
UpdateObjects		EQU	RunObjects
UpdateHudNumbers	EQU	UpdateHUD
LoadPowerupArt		EQU	LoadShieldArt
StageEvents		EQU	RunLevelEvents
PLCLists		EQU	GfxLists
LevelDataIndex		EQU	StageDataIndex
LevelChunks		EQU	StageChunks
LevelBlocks		EQU	StageBlocks
LevelLayouts		EQU	StageMaps
LevelCollision		EQU	StageCollision
ObjectLayouts		EQU	StageObjectMaps
MapSpr_Sonic		EQU	PlayerSprites
Art_Sonic		EQU	PlayerGfx
DPLC_Sonic		EQU	PlayerGfxScript
Ani_Flower		EQU	FlowerAnims
MapSpr_Flower		EQU	FlowerSprites
Ani_Powerup		EQU	PowerupAnims
MapSpr_Powerup		EQU	PowerupSprites
Ani_Checkpoint		EQU	CheckpointAnims
MapSpr_Checkpoint	EQU	CheckpointSprites
Ani_Explosion		EQU	ExplosionAnims
MapSpr_Explosion	EQU	ExplosionSprites
Ani_BigRing		EQU	BigRingAnims
MapSpr_BigRing		EQU	BigRingSprites
Ani_Signpost		EQU	SignpostAnims
MapSpr_GoalSignpost	EQU	SignpostSprites
Ani_FlowerCapsule	EQU	CapsuleAnims
MapSpr_FlowerCapsule	EQU	CapsuleSprites
MapSpr_TitleCard	EQU	TitleCardSprites
ObjTitleCard_Data	EQU	word_20B014
Art_Points		EQU	PointsGfx
Art_FlowerCapsule	EQU	CapsuleGfx
Art_BigRing		EQU	BigRingGfx
Art_GoalPost		EQU	GoalGfx
Art_Signpost		EQU	SignpostGfx
Art_Results		EQU	ResultsGfx
Art_TimeOver		EQU	TimeOverGfx
Art_GameOver		EQU	GameOverGfx
Art_TitleCard		EQU	TitleCardGfx
Art_Shield		EQU	ShieldGfx
Art_InvStars		EQU	InvincibleGfx
Art_TimeStars		EQU	WarpGfx
Art_DiagonalSpring	EQU	Spring45Gfx
Art_Springs		EQU	SpringGfx
Art_MonitorTimePosts	EQU	MonitorTimeGfx
Art_Explosions		EQU	ExplosionGfx
Art_Rings		EQU	RingGfx
Art_LifeIcon		EQU	LivesIconsGfx
Art_HUDNumbers		EQU	HudNumbersGfx
Art_HUD			EQU	HudGfx
Art_Checkpoint		EQU	CheckpointGfx
Art_Flower		EQU	FlowerGfx
Art_TitleCardText	EQU	TitleCardTextGfx
BigRingFlashGfx		EQU	Art_BigRingFlash
SpawnObjectAfter	EQU	SpawnObject
DeleteOtherObject	EQU	DeleteObject
BottomSolidObject	EQU	BtmSolidObject
RingSprites		EQU	MapSpr_Ring
sub_208ACA		EQU	CollectRing
SpringVSprites		EQU	MapSpr_Spring1
SpringHSprites		EQU	MapSpr_Spring2
Spring45Sprites	EQU	MapSpr_Spring3
MonitorTimeSprites	EQU	MapSpr_MonitorTime
DebugItemIndex		EQU	DebugObjects
LevelPaletteID		EQU	StageDataIndex+$E
GetBlock		EQU	GetLevelBlock
PlayerCheckBlockFront	EQU	Player_CalcRoomInFront
	endif

; The imported collision helpers retain their historical entry-point names.
player_objcollide	EQU	PlayerObjectCollide

; The old player routine uses this entry point for its object-collision call.
player_objcollide_entry	EQU	PlayerObjectCollide

; -------------------------------------------------------------------------
; Historical R5 data/debug macros
; -------------------------------------------------------------------------

debugStart macro
	__debug_count_work: = 0
	dc.b	__debug_count, 0
	endm

r5DebugObject macro id, layer, sprites, tile, subtype, flags, subtype_2, frame
	__debug_count_work: = __debug_count_work+1
	dc.b	\id, \layer
	dc.l	\sprites
	dc.w	\tile
	dc.b	\subtype, \flags, \subtype_2, \frame
	endm

r6DebugObject macro id, layer, sprites, tile, subtype, flags, subtype_2, frame
	__debug_count_work: = __debug_count_work+1
	dc.b	\id, \layer
	dc.l	\sprites
	dc.w	\tile
	dc.b	\subtype, \flags, \subtype_2, \frame
	endm

debugInvalid macro
	__debug_count_work: = __debug_count_work+1
	endm

debugEnd macro
	__debug_count: equ __debug_count_work
	endm

stageData macro gfx, blocks, chunks, plc_1, plc_2, music, pal_1, pal_2
	dc.l	(\gfx)|((\plc_1)<<24)
	dc.l	(\blocks)|((\plc_2)<<24)
	dc.l	\chunks
	dc.w	\music
	dc.b	\pal_1, \pal_2
	endm

__gfx_list_id = 0
gfxStart macro
	__gfx_list_count_work\#__gfx_list_id: = -1
	dc.w	__gfx_list_count\#__gfx_list_id
	endm

gfxEntry macro gfx, vram
	__gfx_list_count_work\#__gfx_list_id: = (__gfx_list_count_work\#__gfx_list_id)+1
	dc.l	\gfx
	dc.w	\vram
	endm

gfxEnd macro
	__gfx_list_count\#__gfx_list_id: equ __gfx_list_count_work\#__gfx_list_id
	__gfx_list_id: = __gfx_list_id+1
	endm
