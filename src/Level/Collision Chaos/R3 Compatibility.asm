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
UpdateSectionArt	EQU	UpdateSectionGfx
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
UpdateHUD		EQU	UpdateHudNumbers
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
ObjPowerup		EQU	PowerupObject
	if def(R3_SEMANTIC_TEST_BADNIK)
		if R3_SEMANTIC_TEST_BADNIK=0
ObjTestBadnik		EQU	TestObject
		endif
	else
ObjTestBadnik		EQU	TestObject
	endif
ObjSpring		EQU	SpringObject
ObjTunnelDoorSplash	EQU	HDoorSplashObject
ObjTunnelDoorSplashSet EQU	HDoorSplashSetObject
ObjTunnelDoor		EQU	HDoorObject
ObjSpinSplash		EQU	TunnelSplashObject
ObjMovingSpring	EQU	MoveSpringObject
ObjRing			EQU	RingObject
ObjLostRing		EQU	LostRingObject
ObjFloatBlock		EQU	FloatBlockObject
	if def(R3_SEMANTIC_CHECKPOINT)
		if R3_SEMANTIC_CHECKPOINT=0
ObjCheckpoint		EQU	CheckpointObject
		endif
	else
ObjCheckpoint		EQU	CheckpointObject
	endif
ObjBigRing		EQU	BigRingObject
ObjCapsule		EQU	CapsuleObject
ObjGoalPost		EQU	GoalObject
ObjSignpost		EQU	SignpostObject
ObjExplosion		EQU	ExplosionObject
ObjMonitorTimePost	EQU	MonitorTimeObject
ObjMonitorItem		EQU	MonitorItemObject
ObjBoulder		EQU	BoulderObject
ObjHUDPoints		EQU	HudPointsObject
ObjBumper		EQU	BumperObject
ObjFlipper		EQU	FlipperObject
ObjFlower		EQU	FlowerObject
ObjSpikes		EQU	SpikesObject
ObjBlock		EQU	BlockObject
ObjHiddenBlock	EQU	HiddenBlockObject
ObjMetalPlatform	EQU	MetalPlatformObject
ObjKamaKama		EQU	KamaKamaObject
ObjKamaSickle		EQU	KamaSickleObject
ObjDoor			EQU	DoorObject
ObjFireShooter	EQU	FireShooterObject
ObjDrumPlatform	EQU	DrumPlatformObject
ObjGlassShatter	EQU	GlassShatterObject
ObjBumperPlatform	EQU	BumperPlatformObject
ObjTeleporter		EQU	TeleporterObject
ObjSpikeChain		EQU	SpikeChainObject
ObjGa			EQU	GaObject
ObjTentou		EQU	TentouObject
ObjPocket		EQU	PocketObject
ObjIntroSpikes	EQU	IntroSpikesObject
ObjMetalSonic		EQU	MetalSonicObject
ObjAmyRose		EQU	AmyRoseObject
ObjAmyHeart		EQU	HeartObject
ObjMetalSonic_Exhaust EQU	MetalSonicExhaustObject
ObjRollTunnel		EQU	RollTunnelObject
ObjRobotGenerator	EQU	RobotGeneratorObject
ObjProjector		EQU	ProjectorObject
ObjCCAnimal		EQU	AnimalObject
ObjResults		EQU	ResultsObject
ObjGameOver		EQU	GameOverObject
ObjTitleCard		EQU	TitleCardObject
NullObject		EQU	ObjNull
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
LoadSectionArt	EQU	InitSectionGfx
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
