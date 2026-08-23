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

	if REGION=USA
		; The USA image has fourteen bytes between the live PLC list and
		; its region-specific legacy table.
		dc.w	$68C0, $0023, $7328, $6E40, $0023, $8982, $7020
		include	"Level/Palmtree Panic/Data/USA Padding 1 (Act 2 Present).asm"
	else
PP_ACT2_PRESENT_SUFFIX_ONLY equ 1
		include	"Level/Palmtree Panic/Data/R12B Pre-Chunks.asm"
	endif

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

; -------------------------------------------------------------------------
; Leftover data from other level files used as padding, can be replaced
; with a "align $20000"
; -------------------------------------------------------------------------

	incbin	"Level/Palmtree Panic/Data/Padding/2 (Act 2 Present).bin"

; -------------------------------------------------------------------------

Art_Sonic:
	incbin	"gfx/r1/player.unc"
	even
MapSpr_Sonic:
	include	"Level/_Objects/Sonic/Data/Mappings.asm"
	even
DPLC_Sonic:
	include	"Level/_Objects/Sonic/Data/DPLCs.asm"
	even
Art_Points:
	incbin	"gfx/points.nem"
	even
Art_FlowerCapsule:
	incbin	"gfx/capsule.nem"
	even
Art_BigRing:
	incbin	"gfx/big_ring.nem"
	even
Art_GoalPost:
	incbin	"gfx/goal.nem"
	even
Art_Signpost:
	incbin	"gfx/signpost.nem"
	even
Art_Results:
	incbin	"gfx/results.nem"
	even
Art_TimeOver:
	incbin	"gfx/time_over.unc"
	even
Art_GameOver:
	incbin	"gfx/game_over.unc"
	even
Art_TitleCard:
	incbin	"gfx/title_card.nem"
	even
Art_Shield:
	incbin	"gfx/shield.unc"
	even
Art_InvStars:
	incbin	"gfx/invincible.unc"
	even
Art_TimeStars:
	incbin	"gfx/warp.unc"
	even
Art_DiagonalSpring:
	incbin	"gfx/spring_45.nem"
	even
Art_Springs:
	incbin	"gfx/spring.nem"
	even
Art_MonitorTimePosts:
	incbin	"gfx/monitor_time.nem"
	even
Art_Explosions:
	incbin	"gfx/explosion.nem"
	even
Art_Rings:
	incbin	"gfx/ring.nem"
	even
Art_LifeIcon:
	incbin	"gfx/lives_icons.unc"
	even
Art_HUDNumbers:
	incbin	"gfx/hud_numbers.unc"
	even
Art_HUD:
	incbin	"gfx/hud.nem"
	even
Art_Checkpoint:
	incbin	"gfx/checkpoint.nem"
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
	incbin	"gfx/r1/flower.nem"
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
	incbin	"gfx/r1/block.nem"
	even
Art_SpringWheel:
	incbin	"gfx/spring_wheel.nem"
	even
Art_SpinningDisc:
	incbin	"Level/Palmtree Panic/Objects/Spinning Disc/Data/Art.nem"
	even
Art_TunnelWaterfall:
	incbin	"Level/_Objects/Spin Tunnel/Data/Art (Waterfall Splash).nem"
	even
Art_Waterfall:
	incbin	"gfx/r1/waterfall.nem"
	even
Art_TunnelDoor:
	incbin	"Level/Palmtree Panic/Objects/Tunnel Door/Data/Art.nem"
	even
Art_TunnelDoorSplash:
	incbin	"gfx/splash.nem"
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
	incbin	"gfx/r1/tamabboh.nem"
	even
Art_Springboard:
	incbin	"Level/Palmtree Panic/Objects/Springboard/Data/Art.nem"
	even
Art_Button:
	incbin	"Level/Palmtree Panic/Data/Unused/Art (Button).nem"
	even
Art_Spikes:
	incbin	"gfx/spikes_v2.nem"
	even
Art_Swing:
	incbin	"gfx/r1/swing.nem"
	even
Art_Animals:
	incbin	"Level/Palmtree Panic/Objects/Animal/Data/Art.nem"
	even
Art_SpinningDiscDrill:
	incbin	"Level/Palmtree Panic/Data/Unused/Art (Spinning Disc Drill).nem"
	even
Art_RobotGenWithered:
	incbin	"gfx/robot_transport_a.nem"
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
	dc.w	StageMapFg-LevelLayouts, StageMapBg-LevelLayouts, StageMapNull-LevelLayouts
	dc.w	StageMapUnk1-LevelLayouts, StageMapUnk2-LevelLayouts, StageMapUnk3-LevelLayouts
	dc.w	StageMapUnk4-LevelLayouts, StageMapUnk2-LevelLayouts, StageMapUnk2-LevelLayouts
	dc.w	StageMapUnk5-LevelLayouts, StageMapUnk5-LevelLayouts, StageMapUnk5-LevelLayouts
	dc.w	StageMapFg-LevelLayouts, StageMapBg-LevelLayouts, StageMapNull-LevelLayouts
	dc.w	StageMapUnk1-LevelLayouts, StageMapUnk2-LevelLayouts, StageMapUnk3-LevelLayouts
	dc.w	StageMapUnk4-LevelLayouts, StageMapUnk2-LevelLayouts, StageMapUnk2-LevelLayouts
	dc.w	StageMapUnk5-LevelLayouts, StageMapUnk5-LevelLayouts, StageMapUnk5-LevelLayouts
	dc.w	StageMapFg-LevelLayouts, StageMapBg-LevelLayouts, StageMapNull-LevelLayouts
	dc.w	StageMapUnk1-LevelLayouts, StageMapUnk2-LevelLayouts, StageMapUnk3-LevelLayouts
	dc.w	StageMapUnk4-LevelLayouts, StageMapUnk2-LevelLayouts, StageMapUnk2-LevelLayouts
	dc.w	StageMapUnk5-LevelLayouts, StageMapUnk5-LevelLayouts, StageMapUnk5-LevelLayouts

StageMapFg:
	incbin	"Level/Palmtree Panic/Data/Foreground (Act 2 Present).bin"
	even
StageMapBg:
	incbin	"Level/Palmtree Panic/Data/Background (Act 2 Present).bin"
	even
StageMapNull:
	incbin	"maps/empty.bin"
	even
StageMapUnk1:
	incbin	"maps/ghz2_foreground.bin"
	even
StageMapUnk3:
	incbin	"maps/empty.bin"
	even
StageMapUnk4:
	incbin	"maps/ghz3_foreground.bin"
	even
StageMapUnk2:
	incbin	"maps/empty.bin"
	even
StageMapUnk5:
	incbin	"maps/empty.bin"

; -------------------------------------------------------------------------

LevelBlocks:
	incbin	"Level/Palmtree Panic/Data/Blocks (Act 2 Present).nem"
	even
Art_LevelTiles:
	incbin	"Level/Palmtree Panic/Data/Tiles (Act 2 Present).nem"

; -------------------------------------------------------------------------
; Leftover data from other level files used as padding, can be replaced
; with a "align $40000"
; -------------------------------------------------------------------------

	include	"Level/Palmtree Panic/Data/Legacy Act 2 Present Tail.asm"

; -------------------------------------------------------------------------
