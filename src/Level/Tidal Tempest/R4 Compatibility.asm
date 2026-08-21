; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Tidal Tempest R4 compatibility aliases
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
stage_collision		EQU	LevelCollision
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
water_current_flag	EQU	waterSlideFlag

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

explode.points		EQU	oVar3E
collide_angle_1		EQU	primaryAngle

; -------------------------------------------------------------------------
; Object index aliases
; -------------------------------------------------------------------------

PlayerObject		EQU	ObjSonic
PowerupObject		EQU	ObjPowerup
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
BoulderObject		EQU	ObjBoulder
HudPointsObject		EQU	ObjHUDPoints
FlowerObject		EQU	ObjFlower
ResultsObject		EQU	ObjResults
GameOverObject		EQU	ObjGameOver
TitleCardObject		EQU	ObjTitleCard

; The old object table has one null routine for unused IDs.
ObjNull:
	moveq	#0,d0
	rts

; -------------------------------------------------------------------------
; Shared service aliases
; -------------------------------------------------------------------------

AddGfxQueue		EQU	LoadPLC
InitGfxQueue		EQU	InitPLC
CheckObjectDespawn	EQU	CheckObjDespawn
CheckObjectDespawn2	EQU	CheckObjDespawn2
DestroyInGoodFuture	EQU	DestroyOnGoodFuture
CheckBlockDown		EQU	ObjGetFloorDist
CheckBlockUp		EQU	ObjGetCeilDist
CheckBlockRight		EQU	ObjGetRWallDist
CheckBlockRight3	EQU	ObjGetRWallDist
CheckBlockLeft		EQU	ObjGetLWallDist
CheckBlockLeft3		EQU	ObjGetLWallDist
CheckBlockY		EQU	ObjGetFloorDist
CheckBlockVisible	EQU	CheckObjDespawn
DrawBlockColumn		EQU	DrawBlockCol
GetBlockVramWrite	EQU	GetBlockVDPCmd
GetBlockVramWriteAbsX	EQU	GetBlockVDPCmdAbsX
GetBlockVramWriteAbsXY	EQU	GetBlockVDPCmdAbsXY
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
SpawnObjectAfter	EQU	SpawnObject
DeleteOtherObject	EQU	DeleteObject
BottomSolidObject	EQU	BtmSolidObject
RingSprites		EQU	MapSpr_Ring
sub_208ACA		EQU	CollectRing
