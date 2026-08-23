; ------------------------------------------------------------------------------
; USA DEMO43C legacy pre-chunk region
;
; This demo file retains the tail of the earlier Palmtree Panic source graph.
; The R43 graphics records at the beginning are emitted separately because
; they overlay the first part of that historical object region.
; ------------------------------------------------------------------------------

; The historical tail keeps the helper and data addresses used by the
; Palmtree Panic graph.  The R4 implementation already has its own ABI, so
; these links are deliberately local to this recovered source fragment.
FindObjSlot		EQU	$20787C
CheckObjDespawn		EQU	$2078B2
CheckObjDespawn2	EQU	$2078B6
ObjMoveGrv		EQU	$203A8A
ObjGetFloorDist		EQU	$206AAE
LoadPLC		EQU	$202574
SubCPUCmd		EQU	$205CEE
CalcSine		EQU	$20085A
ResetSavedObjFlags	EQU	$20766A
LoadShieldArt		EQU	$2065A2
Pal_LevelEnd		EQU	$2007B4
MapSpr_3DRamp		EQU	$21FDBC
MapSpr_BigRing		EQU	$23F16A
Ani_BigRing		EQU	$23F162
MapSpr_GoalSignpost	EQU	$23F228
Ani_Signpost		EQU	$23F21A
MapSpr_FlowerCapsule	EQU	$23F2A6
Ani_FlowerCapsule	EQU	$23F2A6
Art_Projector		EQU	$23F2A6
Art_AmyRose		EQU	$23F2A6
MapSpr_AmyRose		EQU	$23FD1C
Ani_AmyRose		EQU	$23FE38
oExplodeBadnik		EQU	oRoutine2

Art_LevelTiles		EQU	$23C4EE
Art_Checkpoint		EQU	$235DC6
Art_Spikes		EQU	$238018
Art_TunnelDoor		EQU	$236AFE
Art_FloatBlock		EQU	$2365D0
Art_TitleCard		EQU	$233580
Art_TitleCardText	EQU	$2361D4
Art_DiagonalSpring	EQU	$23460C
Art_Platform		EQU	$2362FE
Art_Springs		EQU	$234918
Art_HUD		EQU	$235C9A
Art_MonitorTimePosts	EQU	$234B3A
Art_Explosions		EQU	$23513E
Art_Points		EQU	$2315C4
Art_Flower		EQU	$235F4E
Art_Rings		EQU	$235626
Art_Boulder		EQU	$2364C2
Art_Animals		EQU	$2381C0
Art_Mosqui		EQU	$23702A
Art_Anton		EQU	$236E46
Art_3DPlant		EQU	$23AC7A
Art_3DRampBoost	EQU	$23AE02
Art_GoalPost		EQU	$2320DA
Art_PataBata		EQU	$237378
Art_Tamabboh		EQU	$237950
Art_SonicHole		EQU	$23AC08
Art_TunnelWaterfall	EQU	$236812
Art_SpinningDisc	EQU	$23676C
Art_LogShadow		EQU	$235EC0
Art_RobotGenWithered	EQU	$23846C
Art_Results		EQU	$232876
Art_Signpost		EQU	$23229A
Art_BigRing		EQU	$231CD0

R43_LEGACY_DATA_PREFIX	EQU	1
LevelBlocks		EQU	$23B0A8
LevelChunks		EQU	$210000

	org	Padding1-$62
	include	"Level/_Objects/Level End/Main.asm"
	include	"Level/Palmtree Panic/Objects/3D Ramp/Main.asm"
	include	"Level/_Objects/Robot Generator/Main.asm"
	include	"Level/Palmtree Panic/Objects/Robot Generator/Tile IDs.asm"
	include	"Level/Palmtree Panic/Objects/Projector/Main.asm"
	include	"Level/USA Legacy R43 Demo Time Check.asm"
	include	"Level/Palmtree Panic/Objects/Amy Rose/Main.asm"
	include	"Level/_Objects/Game Over/Main.asm"
	include	"Level/_Objects/Title Card/Main.asm"
	include	"Level/_Objects/Results/Main.asm"
	include	"Level/Palmtree Panic/Title Card Data.asm"
	include	"Level/Palmtree Panic/Objects/Breakable Wall/Main.asm"
	include	"Level/USA Legacy R43 Demo Animated Tiles.asm"
	include	"Level/Palmtree Panic/Data (Act 1 Present).asm"
	include	"Level/USA Legacy R43 Demo Gfx List Tail.asm"

	org	Padding1+$2CF0
