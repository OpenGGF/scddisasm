; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos R3 compatibility aliases
; -------------------------------------------------------------------------
;
; Collision Chaos Act 3 retains the legacy object ABI used by the recovered
; R3 sources.  Its RAM and service names match the compatibility layer used
; by the recovered Quartz Quadrant and Wacky Workbench graphs.
;
; The shared R5 compatibility file evaluates the Quartz Quadrant variant in
; one legacy hook even when that family is not being assembled.
QQ_VARIANT		EQU	0

	include	"Level/Wacky Workbench/R6 Compatibility.asm"

; R3-only scratch bytes occupy otherwise unnamed slots in the common RAM
; layout.  These offsets match the recovered global-variable table.
bg_water_deform		EQU	updateHUDBonus+2
r3_no_bumper		EQU	debugBlock+2

; The semantic palette fade engine uses the later queue-service name. The
; recovered R3 graphs retain the byte-identical historical implementation.
	if def(R3_SEMANTIC_GENERAL)
		if R3_SEMANTIC_GENERAL=0
ProcessPLCs		EQU	AdvanceGfxQueue
		endif
	else
ProcessPLCs		EQU	AdvanceGfxQueue
	endif

	if def(R3_SEMANTIC_MAIN)
		if R3_SEMANTIC_MAIN<>0
; Recovered public names for the canonical level main loop and interrupts.
InitStage		EQU	LevelStart
SpawnPlayer		EQU	LoadPlayer
RestoreFlowers		EQU	RestoreZoneFlowers
LoadStageCollision	EQU	LoadLevelCollision
PlayStageMusic		EQU	PlayLevelMusic
PlayStageMusic2	EQU	PlayLevelMusic2
VBlank			EQU	VInterrupt
HBlank			EQU	HInterrupt
UpdateWarpTimer	EQU	RunTimeWarp
UpdateBoredTimer	EQU	RunBoredTimer
ResetSavedObjFlags	EQU	ResetObjectStates
LevelDataIndex		EQU	StageDataIndex
	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL=0
LevelSizeLoad		EQU	InitScroll
LevelScroll		EQU	UpdateScroll
		endif
	else
LevelSizeLoad		EQU	InitScroll
LevelScroll		EQU	UpdateScroll
	endif
	if def(R3_SEMANTIC_DATA_LOAD)
		if R3_SEMANTIC_DATA_LOAD=0
LoadLevelData		EQU	LoadStageData
		endif
	else
LoadLevelData		EQU	LoadStageData
	endif
	if def(R3_SEMANTIC_DRAW)
		if R3_SEMANTIC_DRAW=0
InitLevelDraw		EQU	InitStageDraw
		endif
	else
InitLevelDraw		EQU	InitStageDraw
	endif
UpdateAnimTiles	EQU	AnimateStageGfx
	if def(R3_SEMANTIC_SUB_CPU)
		if R3_SEMANTIC_SUB_CPU=0
SubCPUCmd		EQU	SubCpuCommand
		endif
	else
SubCPUCmd		EQU	SubCpuCommand
	endif
SpawnObjects		EQU	SpawnStageObjects
	if def(R3_SEMANTIC_OBJECT_FUNCS)
		if R3_SEMANTIC_OBJECT_FUNCS=0
RunObjects		EQU	UpdateObjects
		endif
	else
RunObjects		EQU	UpdateObjects
	endif
	if def(R3_SEMANTIC_SECTION_ART)
		if R3_SEMANTIC_SECTION_ART=0
UpdateSectionArt	EQU	UpdateSectionGfx
		endif
	else
UpdateSectionArt	EQU	UpdateSectionGfx
	endif
LevelCollision		EQU	StageCollision
Art_LifeIcon		EQU	LivesIconsGfx
	if def(R3_SEMANTIC_DRAW)
		if R3_SEMANTIC_DRAW=0
DrawLevelBG		EQU	DrawStageBg
DrawLevel		EQU	DrawStage
		endif
	else
DrawLevelBG		EQU	DrawStageBg
DrawLevel		EQU	DrawStage
	endif
LoadSonicDynPLC	EQU	LoadPlayerGfx
	if def(R3_SEMANTIC_HUD_POINTS)
		if R3_SEMANTIC_HUD_POINTS=0
UpdateHUD		EQU	UpdateHudNumbers
		endif
	else
UpdateHUD		EQU	UpdateHudNumbers
	endif
	endif
	endif

	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL<>0
InitScroll		EQU	LevelSizeLoad
UpdateScroll		EQU	LevelScroll
LoadCheckpointData	EQU	LoadCheckpoint
		if def(R3_SEMANTIC_EVENTS)
			if R3_SEMANTIC_EVENTS=0
RunLevelEvents		EQU	StageEvents
			endif
		else
RunLevelEvents		EQU	StageEvents
		endif
		endif
	endif

	if def(R3_SEMANTIC_EVENTS)
		if R3_SEMANTIC_EVENTS<>0
StageEvents		EQU	RunLevelEvents
		endif
	endif

	if def(R3_SEMANTIC_OBJECT_FUNCS)
		if R3_SEMANTIC_OBJECT_FUNCS<>0
; Recovered object-service ABI for the structured shared implementation.
UpdateObjects		EQU	RunObjects
MoveObjectFall	EQU	ObjMoveGrv
MoveObject		EQU	ObjMove
DeleteOtherObject	EQU	DeleteObject
CheckObjectVisible	EQU	ChkObjOnScreen
CheckObjectVisibleWide EQU	ChkObjOnScrWidth
		endif
	endif

	if def(R3_SEMANTIC_OBJECT_INDEX)
		if R3_SEMANTIC_OBJECT_INDEX<>0
; Semantic dispatch-table names bound to the recovered R31A object providers.
ObjSonic		EQU	PlayerObject
	if def(R3_SEMANTIC_POWERUP)
		if R3_SEMANTIC_POWERUP=0
ObjPowerup		EQU	PowerupObject
		endif
	else
ObjPowerup		EQU	PowerupObject
	endif
	if def(R3_SEMANTIC_TEST_BADNIK)
		if R3_SEMANTIC_TEST_BADNIK=0
ObjTestBadnik		EQU	TestObject
		endif
	else
ObjTestBadnik		EQU	TestObject
	endif
	if def(R3_SEMANTIC_SPRING)
		if R3_SEMANTIC_SPRING=0
ObjSpring		EQU	SpringObject
		endif
	else
ObjSpring		EQU	SpringObject
	endif
	if def(R3_SEMANTIC_TUNNEL_DOOR)
		if R3_SEMANTIC_TUNNEL_DOOR=0
ObjTunnelDoorSplash	EQU	HDoorSplashObject
ObjTunnelDoorSplashSet EQU	HDoorSplashSetObject
ObjTunnelDoor		EQU	HDoorObject
		endif
	else
ObjTunnelDoorSplash	EQU	HDoorSplashObject
ObjTunnelDoorSplashSet EQU	HDoorSplashSetObject
ObjTunnelDoor		EQU	HDoorObject
	endif
	if def(R3_SEMANTIC_TUNNEL_SPLASH)
		if R3_SEMANTIC_TUNNEL_SPLASH=0
ObjSpinSplash		EQU	TunnelSplashObject
		endif
	else
ObjSpinSplash		EQU	TunnelSplashObject
	endif
	if def(R3_SEMANTIC_SPRING)
		if R3_SEMANTIC_SPRING=0
ObjMovingSpring	EQU	MoveSpringObject
		endif
	else
ObjMovingSpring	EQU	MoveSpringObject
	endif
	if def(R3_SEMANTIC_RING)
		if R3_SEMANTIC_RING=0
ObjRing			EQU	RingObject
ObjLostRing		EQU	LostRingObject
		endif
	else
ObjRing			EQU	RingObject
ObjLostRing		EQU	LostRingObject
	endif
	if def(R3_SEMANTIC_FLOAT_BLOCK)
		if R3_SEMANTIC_FLOAT_BLOCK=0
ObjFloatBlock		EQU	FloatBlockObject
		endif
	else
ObjFloatBlock		EQU	FloatBlockObject
	endif
	if def(R3_SEMANTIC_CHECKPOINT)
		if R3_SEMANTIC_CHECKPOINT=0
ObjCheckpoint		EQU	CheckpointObject
		endif
	else
ObjCheckpoint		EQU	CheckpointObject
	endif
	if def(R3_SEMANTIC_LEVEL_END)
		if R3_SEMANTIC_LEVEL_END=0
ObjBigRing		EQU	BigRingObject
ObjCapsule		EQU	CapsuleObject
ObjGoalPost		EQU	GoalObject
ObjSignpost		EQU	SignpostObject
		endif
	else
ObjBigRing		EQU	BigRingObject
ObjCapsule		EQU	CapsuleObject
ObjGoalPost		EQU	GoalObject
ObjSignpost		EQU	SignpostObject
	endif
	if def(R3_SEMANTIC_EXPLOSION)
		if R3_SEMANTIC_EXPLOSION=0
ObjExplosion		EQU	ExplosionObject
		endif
	else
ObjExplosion		EQU	ExplosionObject
	endif
	if def(R3_SEMANTIC_MONITOR_TIME)
		if R3_SEMANTIC_MONITOR_TIME=0
ObjMonitorTimePost	EQU	MonitorTimeObject
ObjMonitorItem		EQU	MonitorItemObject
		endif
	else
ObjMonitorTimePost	EQU	MonitorTimeObject
ObjMonitorItem		EQU	MonitorItemObject
	endif
	if def(R3_SEMANTIC_BOULDER)
		if R3_SEMANTIC_BOULDER=0
ObjBoulder		EQU	BoulderObject
		endif
	else
ObjBoulder		EQU	BoulderObject
	endif
	if def(R3_SEMANTIC_HUD_POINTS)
		if R3_SEMANTIC_HUD_POINTS=0
ObjHUDPoints		EQU	HudPointsObject
		endif
	else
ObjHUDPoints		EQU	HudPointsObject
	endif
	if def(R3_SEMANTIC_BUMPER_FLIPPER)
		if R3_SEMANTIC_BUMPER_FLIPPER=0
ObjBumper		EQU	BumperObject
ObjFlipper		EQU	FlipperObject
		else
CheckObjDespawn2	EQU	CheckObjectDespawn2
		endif
	else
ObjBumper		EQU	BumperObject
ObjFlipper		EQU	FlipperObject
	endif
	if def(R3_SEMANTIC_FLOWER)
		if R3_SEMANTIC_FLOWER=0
ObjFlower		EQU	FlowerObject
		endif
	else
ObjFlower		EQU	FlowerObject
	endif
	if def(R3_SEMANTIC_CC_SPIKES)
		if R3_SEMANTIC_CC_SPIKES=0
ObjSpikes		EQU	SpikesObject
		endif
	else
ObjSpikes		EQU	SpikesObject
	endif
	if def(R3_SEMANTIC_BLOCKS)
		if R3_SEMANTIC_BLOCKS=0
ObjBlock		EQU	BlockObject
ObjHiddenBlock	EQU	HiddenBlockObject
		endif
	else
ObjBlock		EQU	BlockObject
ObjHiddenBlock	EQU	HiddenBlockObject
	endif
	if def(R3_SEMANTIC_METAL_PLATFORM)
		if R3_SEMANTIC_METAL_PLATFORM=0
ObjMetalPlatform	EQU	MetalPlatformObject
		endif
	else
ObjMetalPlatform	EQU	MetalPlatformObject
	endif
	if def(R3_SEMANTIC_KAMA_KAMA)
		if R3_SEMANTIC_KAMA_KAMA=0
ObjKamaKama		EQU	KamaKamaObject
ObjKamaSickle		EQU	KamaSickleObject
		endif
	else
ObjKamaKama		EQU	KamaKamaObject
ObjKamaSickle		EQU	KamaSickleObject
	endif
	if def(R3_SEMANTIC_DOOR)
		if R3_SEMANTIC_DOOR=0
ObjDoor			EQU	DoorObject
		endif
	else
ObjDoor			EQU	DoorObject
	endif
	if def(R3_SEMANTIC_FIRE_SHOOTER)
		if R3_SEMANTIC_FIRE_SHOOTER=0
ObjFireShooter	EQU	FireShooterObject
		endif
	else
ObjFireShooter	EQU	FireShooterObject
	endif
	if def(R3_SEMANTIC_DRUM_PLATFORM)
		if R3_SEMANTIC_DRUM_PLATFORM=0
ObjDrumPlatform	EQU	DrumPlatformObject
		endif
	else
ObjDrumPlatform	EQU	DrumPlatformObject
	endif
	if def(R3_SEMANTIC_GLASS_SHATTER)
		if R3_SEMANTIC_GLASS_SHATTER=0
ObjGlassShatter	EQU	GlassShatterObject
		endif
	else
ObjGlassShatter	EQU	GlassShatterObject
	endif
	if def(R3_SEMANTIC_BUMPER_PLATFORM)
		if R3_SEMANTIC_BUMPER_PLATFORM=0
ObjBumperPlatform	EQU	BumperPlatformObject
		endif
	else
ObjBumperPlatform	EQU	BumperPlatformObject
	endif
	if def(R3_SEMANTIC_TELEPORTER)
		if R3_SEMANTIC_TELEPORTER=0
ObjTeleporter		EQU	TeleporterObject
		endif
	else
ObjTeleporter		EQU	TeleporterObject
	endif
	if def(R3_SEMANTIC_SPIKE_CHAIN)
		if R3_SEMANTIC_SPIKE_CHAIN=0
ObjSpikeChain		EQU	SpikeChainObject
		endif
	else
ObjSpikeChain		EQU	SpikeChainObject
	endif
	if def(R3_SEMANTIC_GA)
		if R3_SEMANTIC_GA=0
ObjGa			EQU	GaObject
		else
			if def(R3_SEMANTIC_TIME_CHECK)
				if R3_SEMANTIC_TIME_CHECK=0
DestroyOnGoodFuture	EQU	DestroyInGoodFuture
				endif
			else
DestroyOnGoodFuture	EQU	DestroyInGoodFuture
			endif
		endif
	else
ObjGa			EQU	GaObject
	endif
	if def(R3_SEMANTIC_TENTOU)
		if R3_SEMANTIC_TENTOU=0
ObjTentou		EQU	TentouObject
		else
ObjGetLWallDist	EQU	CheckBlockLeft
ObjGetRWallDist	EQU	CheckBlockRight
ObjGetFloorDist2	EQU	CheckBlockDown2
		endif
	else
ObjTentou		EQU	TentouObject
	endif
	if def(R3_SEMANTIC_POCKET)
		if R3_SEMANTIC_POCKET=0
ObjPocket		EQU	PocketObject
		endif
	else
ObjPocket		EQU	PocketObject
	endif
ObjIntroSpikes	EQU	IntroSpikesObject
ObjMetalSonic		EQU	MetalSonicObject
ObjAmyRose		EQU	AmyRoseObject
ObjAmyHeart		EQU	HeartObject
ObjMetalSonic_Exhaust EQU	MetalSonicExhaustObject
	if def(R3_SEMANTIC_ROLL_TUNNEL)
		if R3_SEMANTIC_ROLL_TUNNEL=0
ObjRollTunnel		EQU	RollTunnelObject
		endif
	else
ObjRollTunnel		EQU	RollTunnelObject
	endif
ObjRobotGenerator	EQU	RobotGeneratorObject
ObjProjector		EQU	ProjectorObject
ObjCCAnimal		EQU	AnimalObject
	if def(R3_SEMANTIC_RESULTS)
		if R3_SEMANTIC_RESULTS=0
ObjResults		EQU	ResultsObject
		endif
	else
ObjResults		EQU	ResultsObject
	endif
	if def(R3_SEMANTIC_GAME_OVER)
		if R3_SEMANTIC_GAME_OVER=0
ObjGameOver		EQU	GameOverObject
		endif
	else
ObjGameOver		EQU	GameOverObject
	endif
	if def(R3_SEMANTIC_TITLE_CARD)
		if R3_SEMANTIC_TITLE_CARD=0
ObjTitleCard		EQU	TitleCardObject
		endif
	else
ObjTitleCard		EQU	TitleCardObject
	endif

NullObject		EQU	ObjNull
	endif
	endif

	if def(R3_SEMANTIC_RESULTS)
		if R3_SEMANTIC_RESULTS<>0
ResultsObject	EQU	ObjResults
		endif
	endif

	if def(R3_SEMANTIC_GAME_OVER)
		if R3_SEMANTIC_GAME_OVER<>0
GameOverObject	EQU	ObjGameOver
		endif
	endif

	if def(R3_SEMANTIC_TITLE_CARD)
		if R3_SEMANTIC_TITLE_CARD<>0
TitleCardObject	EQU	ObjTitleCard
MapSpr_TitleCard	EQU	TitleCardSprites
ObjTitleCard_Data	EQU	word_20B014
		endif
	endif

	if def(R3_SEMANTIC_SUB_CPU)
		if R3_SEMANTIC_SUB_CPU<>0
SubCpuCommand		EQU	SubCPUCmd
		endif
	endif

	if def(R3_SEMANTIC_CHECKPOINT)
		if R3_SEMANTIC_CHECKPOINT<>0
CheckpointObject	EQU	ObjCheckpoint
MapSpr_Checkpoint	EQU	CheckpointSprites
Ani_Checkpoint		EQU	CheckpointAnims
FindObjSlot		EQU	SpawnObject
CheckObjDespawn	EQU	CheckObjectDespawn
		endif
	endif

	if def(R3_SEMANTIC_RESUME_MUSIC)
		if R3_SEMANTIC_RESUME_MUSIC<>0
PlayerResetDrown	EQU	ResumeMusicS1
		endif
	endif

	if def(R3_SEMANTIC_TEST_BADNIK)
		if R3_SEMANTIC_TEST_BADNIK<>0
TestObject		EQU	ObjTestBadnik
MapSpr_Powerup	EQU	PowerupSprites
Ani_Powerup		EQU	PowerupAnims
		endif
	endif

	if def(R3_SEMANTIC_EXPLOSION)
		if R3_SEMANTIC_EXPLOSION<>0
ExplosionObject	EQU	ObjExplosion
MapSpr_Explosion	EQU	ExplosionSprites
Ani_Explosion		EQU	ExplosionAnims
		endif
	endif

	if def(R3_SEMANTIC_FLOWER)
		if R3_SEMANTIC_FLOWER<>0
FlowerObject		EQU	ObjFlower
MapSpr_Flower		EQU	FlowerSprites
Ani_Flower		EQU	FlowerAnims
ObjGetFloorDist	EQU	CheckBlockDown
		endif
	endif

	if def(R3_SEMANTIC_TUNNEL_SPLASH)
		if R3_SEMANTIC_TUNNEL_SPLASH<>0
TunnelSplashObject	EQU	ObjSpinSplash
MapSpr_TunnelWaterfall EQU	TunnelSplashSprites
Ani_TunnelWaterfall	EQU	TunnelSplashAnims
		endif
	endif

	if def(R3_SEMANTIC_TUNNEL_DOOR)
		if R3_SEMANTIC_TUNNEL_DOOR<>0
HDoorObject		EQU	ObjTunnelDoor
HDoorSplashSetObject	EQU	ObjTunnelDoorSplashSet
HDoorSplashObject	EQU	ObjTunnelDoorSplash
MapSpr_TunnelDoor	EQU	HDoorSprites
Ani_TunnelDoor		EQU	HDoorAnims
MapSpr_TunnelDoorSplash EQU	SplashSprites
Ani_TunnelDoorSplash	EQU	SplashAnims
		if def(R3_SEMANTIC_SECTION_ART)
			if R3_SEMANTIC_SECTION_ART=0
SetObjectTileID	EQU	SetObjectSpriteTile
			endif
		else
SetObjectTileID	EQU	SetObjectSpriteTile
		endif
		endif
	endif

	if def(R3_SEMANTIC_POWERUP)
		if R3_SEMANTIC_POWERUP<>0
PowerupObject		EQU	ObjPowerup
LoadPowerupArt	EQU	LoadShieldArt
Art_Shield		EQU	ShieldGfx
Art_InvStars		EQU	InvincibleGfx
Art_TimeStars	EQU	WarpGfx
Art_GameOver	EQU	GameOverGfx
Art_TimeOver	EQU	TimeOverGfx
		endif
	endif

	if def(R3_SEMANTIC_ROLL_TUNNEL)
		if R3_SEMANTIC_ROLL_TUNNEL<>0
RollTunnelObject	EQU	ObjRollTunnel
		endif
	endif

	if def(R3_SEMANTIC_BOULDER)
		if R3_SEMANTIC_BOULDER<>0
BoulderObject		EQU	ObjBoulder
		endif
	endif

	if def(R3_SEMANTIC_FLOAT_BLOCK)
		if R3_SEMANTIC_FLOAT_BLOCK<>0
FloatBlockObject	EQU	ObjFloatBlock
		endif
	endif

	if def(R3_SEMANTIC_SPRING)
		if R3_SEMANTIC_SPRING<>0
SpringObject		EQU	ObjSpring
MoveSpringObject	EQU	ObjMovingSpring
SpringVSprites	EQU	MapSpr_Spring1
SpringHSprites	EQU	MapSpr_Spring2
Spring45Sprites	EQU	MapSpr_Spring3
MoveSpringSprites	EQU	MapSpr_MovingSpring
BtmSolidObject		EQU	BottomSolidObject
		endif
	endif

	if def(R3_SEMANTIC_RING)
		if R3_SEMANTIC_RING<>0
RingObject		EQU	ObjRing
LostRingObject	EQU	ObjLostRing
RingSprites		EQU	MapSpr_Ring
RingAnims		EQU	Ani_Ring
FindNextObjSlot	EQU	SpawnObjectAfter
		endif
	endif

	if def(R3_SEMANTIC_MONITOR_TIME)
		if R3_SEMANTIC_MONITOR_TIME<>0
MonitorTimeObject	EQU	ObjMonitorTimePost
MonitorItemObject	EQU	ObjMonitorItem
MonitorTimeSprites	EQU	MapSpr_MonitorTime
MonitorTimeAnims	EQU	Ani_Monitor
		endif
	endif

	if def(R3_SEMANTIC_HUD_POINTS)
		if R3_SEMANTIC_HUD_POINTS<>0
HudPointsObject	EQU	ObjHUDPoints
UpdateHudNumbers	EQU	UpdateHUD
Art_HUDNumbers	EQU	HudNumbersGfx
		endif
	endif

	if def(R3_SEMANTIC_DRAW)
		if R3_SEMANTIC_DRAW<>0
; The recovered R31A collision object calls the shared block replacement
; routine by its historical public name.
PlaceBlock		EQU	PlaceBlockAtPos
		endif
	endif

	if def(R3_SEMANTIC_DATA_LOAD)
		if R3_SEMANTIC_DATA_LOAD<>0
; Recovered providers used by the structured level-data loader.
LoadStageData		EQU	LoadLevelData
		if def(R3_SEMANTIC_SECTION_ART)
			if R3_SEMANTIC_SECTION_ART=0
LoadSectionArt	EQU	InitSectionGfx
			endif
		else
LoadSectionArt	EQU	InitSectionGfx
		endif
LevelLayouts		EQU	StageMaps
		endif
	endif

	if def(R3_SEMANTIC_COLLISION)
		if R3_SEMANTIC_COLLISION<>0
; The recovered R3 player, main loop, and object collision sources retain
; historical names for entry points in the structured floor collision module.
PlayerGroundCollide	EQU	Player_GroundCol
GetBlock		EQU	GetLevelBlock
CheckBlockY		EQU	FindLevelFloor
CheckBlockX		EQU	FindLevelWall
ConvertStageCollision	EQU	ConvColArray
LevelChunks		EQU	StageChunks
		endif
	endif

	if def(R3_SEMANTIC_GENERAL)
		if R3_SEMANTIC_GENERAL<>0
; Recovered names for the canonical general-service and decompression module.
InitJoypads		EQU	InitControllers
ReadJoypads		EQU	ReadControllers
LoadDummyZ80		EQU	InitZ80Dummy
FlushFmQueues		EQU	UpdateFMQueues
DecompNemesisVram	EQU	NemDec
DecompNemesis		EQU	NemDecToRAM
AddGfxQueue		EQU	LoadPLC
InitGfxQueue		EQU	InitPLC
ClearGfxQueue		EQU	ClearPLCs
AdvanceGfxQueue	EQU	ProcessPLCs
ProcessGfxQueueFast	EQU	DecompPLCFast
ProcessGfxQueueLarge	EQU	DecompPLCFast_Large
ProcessGfxQueueSlow	EQU	DecompPLCSlow
LoadGfxList		EQU	LoadPLCImm
DecompEnigma		EQU	EniDec
DecompKosinski		EQU	KosDec
PLCLists		EQU	GfxLists
		endif
	endif

; The historical R3 debug table uses the original macro name.  The shared
; compatibility layer keeps the same eight-byte table layout under the
; names used by the later recovered graphs.

r3DebugObject macro id, layer, sprites, tile, subtype, flags, subtype_2, frame
	r6DebugObject \id, \layer, \sprites, \tile, \subtype, \flags, \subtype_2, \frame
	endm
