; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic Act 2 Present data
; -------------------------------------------------------------------------

; -------------------------------------------------------------------------
; Level data
; -------------------------------------------------------------------------

LevelDataIndex:
	dc.l	$3000000|Art_LevelTiles
	dc.l	$2000000|LevelBlocks
	dc.l	LevelChunks
	dc.b	0
	dc.b	$81

LevelPaletteID:
	dc.b	5
	dc.b	5

; -------------------------------------------------------------------------
; PLC lists
; -------------------------------------------------------------------------

	include	"Level/Palmtree Panic/Graphics Lists (Act 2 Present).asm"

; -------------------------------------------------------------------------
; Leftover data from other level files used as padding, can be replaced
; with a "align $10000"
; -------------------------------------------------------------------------

	incbin	"Level/Palmtree Panic/Data/Padding/1 (Act 2 Present).bin"

; -------------------------------------------------------------------------

LevelChunks:
	incbin	"Level/Palmtree Panic/Data/Chunks (Act 2 Present).bin"
	even
Ani_Powerup:
	include	"Level/_Objects/Powerup/Data/Animations.asm"
	even
MapSpr_Powerup:
	include	"Level/_Objects/Powerup/Data/Mappings.asm"
	even
Ani_TunnelDoorSplash:
	include	"Level/_Objects/Spin Tunnel/Data/Animations (Door Splash).asm"
	even
MapSpr_TunnelDoorSplash:
	include	"Level/_Objects/Spin Tunnel/Data/Mappings (Door Splash).asm"
	even
Ani_TunnelDoor:
	include	"Level/_Objects/Spin Tunnel/Data/Animations (Door).asm"
	even
MapSpr_TunnelDoor:
	include	"Level/_Objects/Spin Tunnel/Data/Mappings (Door).asm"
	even
Ani_TunnelWaterfall:
	include	"Level/_Objects/Spin Tunnel/Data/Animations (Waterfall Splash).asm"
	even
MapSpr_TunnelWaterfall:
	include	"Level/_Objects/Spin Tunnel/Data/Mappings (Waterfall Splash).asm"
	even
Ani_Explosion:
	include	"Level/_Objects/Explosion/Data/Animations.asm"
	even
MapSpr_Explosion:
	include	"Level/_Objects/Explosion/Data/Mappings.asm"
	even

	incbin	"Level/_Data/Unused/Unknown Data.bin"
	even

Ani_Checkpoint:
	include	"Level/_Objects/Checkpoint/Data/Animations.asm"
	even
MapSpr_Checkpoint:
	include	"Level/_Objects/Checkpoint/Data/Mappings.asm"
	even
Ani_BigRing:
	include	"Level/_Objects/Level End/Data/Animations (Big Ring).asm"
	even
MapSpr_BigRing:
	include	"Level/_Objects/Level End/Data/Mappings (Big Ring).asm"
	even
Ani_Signpost:
	include	"Level/_Objects/Level End/Data/Animations (Signpost).asm"
	even
MapSpr_GoalSignpost:
	include	"Level/_Objects/Level End/Data/Mappings (Post).asm"
	even
Ani_FlowerCapsule:
	include	"Level/_Objects/Level End/Data/Animations (Flower Capsule).asm"
	even
MapSpr_FlowerCapsule:
	include	"Level/_Objects/Level End/Data/Mappings (Flower Capsule).asm"
	even

; -------------------------------------------------------------------------
; Leftover data from other level files used as padding, can be replaced
; with a "align $20000"
; -------------------------------------------------------------------------

	incbin	"Level/Palmtree Panic/Data/Padding/2 (Act 2 Present).bin"

; -------------------------------------------------------------------------

Art_Sonic:
	incbin	"Level/_Objects/Sonic/Data/Art.bin"
	even
MapSpr_Sonic:
	include	"Level/_Objects/Sonic/Data/Mappings.asm"
	even
DPLC_Sonic:
	include	"Level/_Objects/Sonic/Data/DPLCs.asm"
	even
Art_Points:
	incbin	"Level/_Objects/HUD and Points/Data/Art (Points).nem"
	even
Art_FlowerCapsule:
	incbin	"Level/_Objects/Level End/Data/Art (Flower Capsule).nem"
	even
Art_BigRing:
	incbin	"Level/_Objects/Level End/Data/Art (Big Ring).nem"
	even
Art_GoalPost:
	incbin	"Level/_Objects/Level End/Data/Art (Goal Post).nem"
	even
Art_Signpost:
	incbin	"Level/_Objects/Level End/Data/Art (Signpost).nem"
	even
Art_Results:
	incbin	"Level/_Objects/Results/Data/Art.nem"
	even
Art_TimeOver:
	incbin	"Level/_Objects/Game Over/Data/Art (Time Over).nem"
	even
Art_GameOver:
	incbin	"Level/_Objects/Game Over/Data/Art (Game Over).nem"
	even
Art_TitleCard:
	incbin	"Level/_Objects/Title Card/Data/Art.nem"
	even
Art_Shield:
	incbin	"Level/_Objects/Powerup/Data/Art (Shield).bin"
	even
Art_InvStars:
	incbin	"Level/_Objects/Powerup/Data/Art (Invincibility Stars).bin"
	even
Art_TimeStars:
	incbin	"Level/_Objects/Powerup/Data/Art (Time Warp Stars).bin"
	even
Art_DiagonalSpring:
	incbin	"Level/_Objects/Spring/Data/Art (Diagonal).nem"
	even
Art_Springs:
	incbin	"Level/_Objects/Spring/Data/Art (Normal).nem"
	even
Art_MonitorTimePosts:
	incbin	"Level/_Objects/Monitor and Time Post/Data/Art.nem"
	even
Art_Explosions:
	incbin	"Level/_Objects/Explosion/Data/Art.nem"
	even
Art_Rings:
	incbin	"Level/_Objects/Ring/Data/Art.nem"
	even
Art_LifeIcon:
	incbin	"Level/_Objects/HUD and Points/Data/Art (Life Icon).bin"
	even
Art_HUDNumbers:
	incbin	"Level/_Objects/HUD and Points/Data/Art (Numbers).bin"
	even
Art_HUD:
	incbin	"Level/_Objects/HUD and Points/Data/Art (HUD).nem"
	even
Art_Checkpoint:
	incbin	"Level/_Objects/Checkpoint/Data/Art.Nem"
	even
Art_LogShadowWithered:
	incbin	"Level/Palmtree Panic/Objects/Log Shadow/Data/Art (Withered).nem"
	even
Art_LogShadow:
	incbin	"Level/Palmtree Panic/Objects/Log Shadow/Data/Art.nem"
	even
Ani_Flower:
	include	"Level/Palmtree Panic/Objects/Flower/Data/Animations.asm"
	even
MapSpr_Flower:
	include	"Level/Palmtree Panic/Objects/Flower/Data/Mappings.asm"
	even
Art_Flower:
	incbin	"Level/Palmtree Panic/Objects/Flower/Data/Art.nem"
	even
Art_TitleCardText:
	incbin	"Level/Palmtree Panic/Objects/Title Card/Art.nem"
	even
Art_Platform:
	incbin	"Level/Palmtree Panic/Objects/Platform/Data/Art.nem"
	even
Art_Boulder:
	incbin	"Level/_Objects/Boulder/Data/Art.nem"
	even
Art_FloatBlock:
	incbin	"Level/_Objects/Floating Block/Data/Art.nem"
	even
Art_SpringWheel:
	incbin	"Level/_Objects/Spring/Data/Art (Wheel).nem"
	even
Art_SpikesV2:
	incbin	"gfx/spikes_v2.nem"
	even
Art_Block:
	incbin	"gfx/r1/block.nem"
	even
Art_Swing:
	incbin	"gfx/r1/swing.nem"
	even
Art_Spring45:
	incbin	"gfx/spring_45.nem"
	even
Art_Splash:
	incbin	"gfx/splash.nem"
	even
Art_RobotTransport:
	incbin	"gfx/robot_transport_a.nem"
	even
Art_SpinningDisc:
	incbin	"Level/Palmtree Panic/Objects/Spinning Disc/Data/Art.nem"
	even
Art_TunnelWaterfall:
	incbin	"Level/_Objects/Spin Tunnel/Data/Art (Waterfall Splash).nem"
	even
Art_Waterfall:
	incbin	"Level/Palmtree Panic/Objects/Effects/Data/Art (Waterfall).nem"
	even
Art_TunnelDoor:
	incbin	"Level/Palmtree Panic/Objects/Tunnel Door/Data/Art.nem"
	even
Art_TunnelDoorSplash:
	incbin	"Level/_Objects/Spin Tunnel/Data/Art (Door Splash).nem"
	even
Art_Anton:
	incbin	"Level/Palmtree Panic/Objects/Anton/Data/Art.nem"
	even
Art_Mosqui:
	incbin	"Level/Palmtree Panic/Objects/Mosqui/Data/Art.nem"
	even
Art_PataBata:
	incbin	"Level/Palmtree Panic/Objects/Pata-Bata/Data/Art.nem"
	even
Art_TagaTaga:
	incbin	"Level/Palmtree Panic/Objects/Taga-Taga/Data/Art.nem"
	even
Art_Tamabboh:
	incbin	"Level/Palmtree Panic/Objects/Tamabboh/Data/Art.nem"
	even
Art_Springboard:
	incbin	"Level/Palmtree Panic/Objects/Springboard/Data/Art.nem"
	even
Art_Button:
	incbin	"Level/Palmtree Panic/Data/Unused/Art (Button).nem"
	even
Art_Spikes:
	incbin	"Level/_Objects/Spikes/Data/Art.nem"
	even
Art_SwingingPlatform:
	incbin	"Level/Palmtree Panic/Data/Unused/Art (Swinging Platform).nem"
	even
Art_Animals:
	incbin	"Level/Palmtree Panic/Objects/Animal/Data/Art.nem"
	even
Art_SpinningDiscDrill:
	incbin	"Level/Palmtree Panic/Data/Unused/Art (Spinning Disc Drill).nem"
	even
Art_RobotGenWithered:
	incbin	"Level/_Objects/Robot Generator/Data/Art (Withered).nem"
	even

; -------------------------------------------------------------------------
; Collision data
; -------------------------------------------------------------------------

ColAngleMap:
	incbin	"Level/_Data/Collision Angles.bin"
	even
ColHeightMap:
	incbin	"Level/_Data/Collision Height Map.bin"
	even
ColWidthMap:
	incbin	"Level/_Data/Collision Width Map.bin"
	even
LevelCollision:
	incbin	"Level/Palmtree Panic/Data/Collision (Act 2 Present).bin"
	even

; -------------------------------------------------------------------------
; Level layout
; -------------------------------------------------------------------------

LevelLayouts:
	dc.w	LevelLayoutForeground-LevelLayouts, LevelLayoutBackground-LevelLayouts, LevelLayoutNull-LevelLayouts
	dc.w	LevelLayoutUnk1-LevelLayouts, LevelLayoutUnk2-LevelLayouts, LevelLayoutUnk3-LevelLayouts
	dc.w	LevelLayoutUnk4-LevelLayouts, LevelLayoutUnk2-LevelLayouts, LevelLayoutUnk2-LevelLayouts
	dc.w	LevelLayoutUnk5-LevelLayouts, LevelLayoutUnk5-LevelLayouts, LevelLayoutUnk5-LevelLayouts
	dc.w	LevelLayoutForeground-LevelLayouts, LevelLayoutBackground-LevelLayouts, LevelLayoutNull-LevelLayouts
	dc.w	LevelLayoutUnk1-LevelLayouts, LevelLayoutUnk2-LevelLayouts, LevelLayoutUnk3-LevelLayouts
	dc.w	LevelLayoutUnk4-LevelLayouts, LevelLayoutUnk2-LevelLayouts, LevelLayoutUnk2-LevelLayouts
	dc.w	LevelLayoutUnk5-LevelLayouts, LevelLayoutUnk5-LevelLayouts, LevelLayoutUnk5-LevelLayouts
	dc.w	LevelLayoutForeground-LevelLayouts, LevelLayoutBackground-LevelLayouts, LevelLayoutNull-LevelLayouts
	dc.w	LevelLayoutUnk1-LevelLayouts, LevelLayoutUnk2-LevelLayouts, LevelLayoutUnk3-LevelLayouts
	dc.w	LevelLayoutUnk4-LevelLayouts, LevelLayoutUnk2-LevelLayouts, LevelLayoutUnk2-LevelLayouts
	dc.w	LevelLayoutUnk5-LevelLayouts, LevelLayoutUnk5-LevelLayouts, LevelLayoutUnk5-LevelLayouts


LevelLayoutForeground:
	incbin	"Level/Palmtree Panic/Data/Foreground (Act 2 Present).bin"
	even
LevelLayoutBackground:
	incbin	"Level/Palmtree Panic/Data/Background (Act 2 Present).bin"
	even

LevelLayoutNull:
	incbin	"maps/empty.bin"
	even
LevelLayoutUnk1:
	incbin	"maps/ghz2_foreground.bin"
	even
LevelLayoutUnk2:
	incbin	"maps/empty.bin"
	even
LevelLayoutUnk3:
	incbin	"maps/empty.bin"
	even
LevelLayoutUnk4:
	incbin	"maps/ghz3_foreground.bin"
	even
LevelLayoutUnk5:
	incbin	"maps/empty.bin"
	even

; -------------------------------------------------------------------------

Art_SonicHole:
	incbin	"Level/Palmtree Panic/Objects/Tunnel Path/Data/Art (Hole).nem"
	even
Art_Scenery:
	incbin	"Level/Palmtree Panic/Objects/Scenery/Data/Art (Past).nem"
	even
LevelBlocks:
	incbin	"Level/Palmtree Panic/Data/Blocks (Act 2 Present).nem"
	even
Art_LevelTiles:
StageGfx:
	incbin	"Level/Palmtree Panic/Data/Tiles (Act 2 Present).nem"
	even
Art_RobotGenerator:
	incbin	"Level/_Objects/Robot Generator/Data/Art.nem"
	even
Art_ProjAnimals:
	incbin	"Level/Palmtree Panic/Objects/Projector/Data/Art (Animals).nem"
	even
Art_Projector:
	incbin	"Level/Palmtree Panic/Objects/Projector/Data/Art.nem"
	even

; -------------------------------------------------------------------------
; Leftover data from other level files used as padding, can be replaced
; with a "align $40000"
; -------------------------------------------------------------------------

	incbin	"Level/Palmtree Panic/Data/Padding/3 (Act 2 Present).bin"

; -------------------------------------------------------------------------
