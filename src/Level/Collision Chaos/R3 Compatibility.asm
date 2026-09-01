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
LevelSizeLoad		EQU	InitScroll
LevelScroll		EQU	UpdateScroll
LoadLevelData		EQU	LoadStageData
InitLevelDraw		EQU	InitStageDraw
UpdateAnimTiles	EQU	AnimateStageGfx
SubCPUCmd		EQU	SubCpuCommand
SpawnObjects		EQU	SpawnStageObjects
RunObjects		EQU	UpdateObjects
UpdateSectionArt	EQU	UpdateSectionGfx
LevelCollision		EQU	StageCollision
Art_LifeIcon		EQU	LivesIconsGfx
DrawLevelBG		EQU	DrawStageBg
LoadSonicDynPLC	EQU	LoadPlayerGfx
DrawLevel		EQU	DrawStage
UpdateHUD		EQU	UpdateHudNumbers
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
