; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic Act 3 time-variant data
; -------------------------------------------------------------------------

LevelDataIndex:
	dc.l	$3000000|Art_LevelTiles
	dc.l	$2000000|LevelBlocks
	dc.l	LevelChunks
	dc.b	0
	dc.b	$81

LevelPaletteID:
	dc.b	4
	dc.b	4

	include	"Level/Palmtree Panic/Graphics Lists (Act 3).asm"

; -------------------------------------------------------------------------
; Leftover data from other level files used as padding.
; -------------------------------------------------------------------------

Padding1:
	if ACT2_FUTURE_VARIANT=1
		include	"Level/Palmtree Panic/Data/R13C Pre-Chunks.asm"
		if REGION=USA
			include	"Level/USA Legacy R13 Prefix.asm"
			include	"Level/USA Legacy Animation Tail.asm"
		endif
	else
		include	"Level/Palmtree Panic/Data/R13D Pre-Chunks.asm"
		if REGION=USA
			include	"Level/USA Legacy R13 Prefix.asm"
			include	"Level/USA Legacy Animation Tail.asm"
		endif
	endif

LevelChunks:
StageChunks:
	if ACT2_FUTURE_VARIANT=1
		incbin	"maps/r13c/chunks.bin"
	else
		incbin	"maps/r13d/chunks.bin"
	endif
	even

BossMachineGfx:
	incbin	"gfx/r1/boss_machine.nem"
	even

EggmanGfx:
	incbin	"gfx/r1/eggman.nem"

Padding2:
	include	"Level/Palmtree Panic/Data/R13 Padding 2.asm"

; -------------------------------------------------------------------------
; Common game graphics.
; -------------------------------------------------------------------------

Art_Sonic:
PlayerGfx:
	incbin	"gfx/player.unc"
	even

PlayerSprites:
MapSpr_Sonic:
	include	"sprites/player.asm"
	even

PlayerGfxScript:
DPLC_Sonic:
	include	"sprites/player_gfx.asm"
	even

PointsGfx:
Art_Points:
	incbin	"Level/_Objects/HUD and Points/Data/Art (Points).nem"
	even

CapsuleGfx:
Art_FlowerCapsule:
	incbin	"Level/_Objects/Level End/Data/Art (Flower Capsule).nem"
	even

BigRingGfx:
Art_BigRing:
	incbin	"Level/_Objects/Level End/Data/Art (Big Ring).nem"
	even

GoalGfx:
Art_GoalPost:
	incbin	"Level/_Objects/Level End/Data/Art (Goal Post).nem"
	even

SignpostGfx:
Art_Signpost:
	incbin	"Level/_Objects/Level End/Data/Art (Signpost).nem"
	even

ResultsGfx:
Art_Results:
	incbin	"Level/_Objects/Results/Data/Art.nem"
	even

TimeOverGfx:
Art_TimeOver:
	incbin	"Level/_Objects/Game Over/Data/Art (Time Over).nem"
	even

GameOverGfx:
Art_GameOver:
	incbin	"Level/_Objects/Game Over/Data/Art (Game Over).nem"
	even

TitleCardGfx:
Art_TitleCard:
	incbin	"Level/_Objects/Title Card/Data/Art.nem"
	even

ShieldGfx:
Art_Shield:
	incbin	"Level/_Objects/Powerup/Data/Art (Shield).bin"
	even

InvincibleGfx:
Art_InvStars:
	incbin	"Level/_Objects/Powerup/Data/Art (Invincibility Stars).bin"
	even

WarpGfx:
Art_TimeStars:
	incbin	"Level/_Objects/Powerup/Data/Art (Time Warp Stars).bin"
	even

Spring45Gfx:
Art_DiagonalSpring:
Art_Spring45:
	incbin	"Level/_Objects/Spring/Data/Art (Diagonal).nem"
	even

SpringGfx:
Art_Springs:
	incbin	"Level/_Objects/Spring/Data/Art (Normal).nem"
	even

MonitorTimeGfx:
Art_MonitorTimePosts:
	incbin	"Level/_Objects/Monitor and Time Post/Data/Art.nem"
	even

ExplosionGfx:
Art_Explosions:
	incbin	"Level/_Objects/Explosion/Data/Art.nem"
	even

RingGfx:
Art_Rings:
	incbin	"Level/_Objects/Ring/Data/Art.nem"
	even

LivesIconsGfx:
Art_LifeIcon:
	incbin	"Level/_Objects/HUD and Points/Data/Art (Life Icon).bin"
	even

HudNumbersGfx:
Art_HUDNumbers:
	incbin	"Level/_Objects/HUD and Points/Data/Art (Numbers).bin"
	even

HudGfx:
Art_HUD:
	incbin	"Level/_Objects/HUD and Points/Data/Art (HUD).nem"
	even

CheckpointGfx:
Art_Checkpoint:
	incbin	"Level/_Objects/Checkpoint/Data/Art.nem"
	even

LogInsideGfxCD:
Art_LogShadowWithered:
	incbin	"Level/Palmtree Panic/Objects/Log Shadow/Data/Art (Withered).nem"
	even

LogInsideGfxAB:
Art_LogShadow:
	incbin	"Level/Palmtree Panic/Objects/Log Shadow/Data/Art.nem"
	even

FlowerAnims:
Ani_Flower:
	include	"Level/Palmtree Panic/Objects/Flower/Data/Animations.asm"
	even

FlowerSprites:
MapSpr_Flower:
	include	"Level/Palmtree Panic/Objects/Flower/Data/Mappings.asm"
	even

FlowerGfx:
Art_Flower:
	incbin	"gfx/r1/flower.nem"
	even

TitleCardTextGfx:
Art_TitleCardText:
	incbin	"Level/Palmtree Panic/Objects/Title Card/Art.nem"
	even

PlatformGfx:
Art_Platform:
	incbin	"Level/Palmtree Panic/Objects/Platform/Data/Art.nem"
	even

BoulderGfx:
Art_Boulder:
	incbin	"Level/_Objects/Boulder/Data/Art.nem"
	even

BlockGfx:
Art_FloatBlock:
Art_Block:
	incbin	"Level/_Objects/Floating Block/Data/Art.nem"
	even

SpringWheelGfx:
Art_SpringWheel:
	incbin	"Level/_Objects/Spring/Data/Art (Wheel).nem"
	even

SpinDiscGfx:
Art_SpinningDisc:
	incbin	"Level/Palmtree Panic/Objects/Spinning Disc/Data/Art.nem"
	even

TunnelSplashGfx:
Art_TunnelWaterfall:
	incbin	"Level/_Objects/Spin Tunnel/Data/Art (Waterfall Splash).nem"
	even

WaterfallGfx:
Art_Waterfall:
	incbin	"Level/Palmtree Panic/Objects/Effects/Data/Art (Waterfall).nem"
	even

DoorGfx:
Art_TunnelDoor:
	incbin	"Level/Palmtree Panic/Objects/Tunnel Door/Data/Art.nem"
	even

SplashGfx:
Art_Splash:
Art_TunnelDoorSplash:
	incbin	"Level/_Objects/Spin Tunnel/Data/Art (Door Splash).nem"
	even

AntonGfx:
Art_Anton:
	incbin	"Level/Palmtree Panic/Objects/Anton/Data/Art.nem"
	even

MosquiGfx:
Art_Mosqui:
	incbin	"Level/Palmtree Panic/Objects/Mosqui/Data/Art.nem"
	even

PataBataGfx:
Art_PataBata:
	incbin	"Level/Palmtree Panic/Objects/Pata-Bata/Data/Art.nem"
	even

TagaTageGfx:
Art_TagaTaga:
	incbin	"Level/Palmtree Panic/Objects/Taga-Taga/Data/Art.nem"
	even

TamabbohGfx:
Art_Tamabboh:
	incbin	"Level/Palmtree Panic/Objects/Tamabboh/Data/Art.nem"
	even

SpringboardGfx:
Art_Springboard:
	incbin	"Level/Palmtree Panic/Objects/Springboard/Data/Art.nem"
	even

SwitchGfx:
Art_Switch:
Art_Button:
	incbin	"Level/Palmtree Panic/Data/Unused/Art (Button).nem"
	even

SpikesV2Gfx:
Art_SpikesV2:
Art_Spikes:
	incbin	"Level/_Objects/Spikes/Data/Art.nem"
	even

SwingGfx:
Art_Swing:
Art_SwingingPlatform:
	incbin	"Level/Palmtree Panic/Data/Unused/Art (Swinging Platform).nem"
	even

AnimalsGfx:
Art_Animals:
	incbin	"Level/Palmtree Panic/Objects/Animal/Data/Art.nem"
	even

DiscDrillGfx:
Art_SpinningDiscDrill:
	incbin	"Level/Palmtree Panic/Data/Unused/Art (Spinning Disc Drill).nem"
	even

RobotTransportGfxA:
Art_RobotGenWithered:
	incbin	"Level/_Objects/Robot Generator/Data/Art (Withered).nem"
	even

; -------------------------------------------------------------------------
; Collision and level layout data.
; -------------------------------------------------------------------------

StageCollisionAngles:
ColAngleMap:
	incbin	"Level/_Data/Collision Angles.bin"
	even

StageCollisionColumns:
ColHeightMap:
	incbin	"Level/_Data/Collision Height Map.bin"
	even

StageCollisionRows:
ColWidthMap:
	incbin	"Level/_Data/Collision Width Map.bin"
	even

StageCollision:
LevelCollision:
	if ACT2_FUTURE_VARIANT=1
		incbin	"maps/r13c/collision.bin"
	else
		incbin	"maps/r13d/collision.bin"
	endif
	even

StageMaps:
LevelLayouts:
	dc.w	StageMapFg-StageMaps, StageMapBg-StageMaps, StageMapNull-StageMaps
	dc.w	StageMapUnk1-StageMaps, StageMapUnk2-StageMaps, StageMapUnk3-StageMaps
	dc.w	StageMapUnk4-StageMaps, StageMapUnk2-StageMaps, StageMapUnk2-StageMaps
	dc.w	StageMapUnk5-StageMaps, StageMapUnk5-StageMaps, StageMapUnk5-StageMaps
	dc.w	StageMapFg-StageMaps, StageMapBg-StageMaps, StageMapNull-StageMaps
	dc.w	StageMapUnk1-StageMaps, StageMapUnk2-StageMaps, StageMapUnk3-StageMaps
	dc.w	StageMapUnk4-StageMaps, StageMapUnk2-StageMaps, StageMapUnk2-StageMaps
	dc.w	StageMapUnk5-StageMaps, StageMapUnk5-StageMaps, StageMapUnk5-StageMaps
	dc.w	StageMapFg-StageMaps, StageMapBg-StageMaps, StageMapNull-StageMaps
	dc.w	StageMapUnk1-StageMaps, StageMapUnk2-StageMaps, StageMapUnk3-StageMaps
	dc.w	StageMapUnk4-StageMaps, StageMapUnk2-StageMaps, StageMapUnk2-StageMaps
	dc.w	StageMapUnk5-StageMaps, StageMapUnk5-StageMaps, StageMapUnk5-StageMaps

StageMapFg:
LevelLayoutForeground:
	if ACT2_FUTURE_VARIANT=1
		incbin	"maps/r13c/foreground.bin"
	else
		incbin	"maps/r13d/foreground.bin"
	endif
	even

StageMapBg:
LevelLayoutBackground:
	if ACT2_FUTURE_VARIANT=1
		incbin	"maps/r13c/background.bin"
	else
		incbin	"maps/r13d/background.bin"
	endif
	even

StageMapNull:
LevelLayoutNull:
	incbin	"maps/empty.bin"
	even

StageMapUnk1:
LevelLayoutUnk1:
	incbin	"maps/ghz2_foreground.bin"
	even

StageMapUnk3:
LevelLayoutUnk3:
	incbin	"maps/empty.bin"
	even

StageMapUnk4:
LevelLayoutUnk4:
	incbin	"maps/ghz3_foreground.bin"
	even

StageMapUnk2:
LevelLayoutUnk2:
	incbin	"maps/empty.bin"
	even

StageMapUnk5:
LevelLayoutUnk5:
	incbin	"maps/empty.bin"
	even

StageBlocks:
LevelBlocks:
	if ACT2_FUTURE_VARIANT=1
		incbin	"maps/r13c/blocks.nem"
	else
		incbin	"maps/r13d/blocks.nem"
	endif
	even

Art_LevelTiles:
StageGfx:
	if ACT2_FUTURE_VARIANT=1
		incbin	"maps/r13c/gfx.nem"
	else
		incbin	"maps/r13d/gfx.nem"
	endif
	even

; -------------------------------------------------------------------------
; Animation and sprite data.
; -------------------------------------------------------------------------

PowerupAnims:
Ani_Powerup:
	include	"anims/powerup.asm"
	even

PowerupSprites:
MapSpr_Powerup:
	include	"sprites/powerup.asm"
	even

SplashAnims:
Ani_TunnelDoorSplash:
	include	"Level/_Objects/Spin Tunnel/Data/Animations (Door Splash).asm"
	even

SplashSprites:
MapSpr_TunnelDoorSplash:
	include	"Level/_Objects/Spin Tunnel/Data/Mappings (Door Splash).asm"
	even

HDoorAnims:
Ani_TunnelDoor:
	include	"anims/r1/h_door.asm"
	even

HDoorSprites:
MapSpr_TunnelDoor:
	include	"sprites/r1/h_door.asm"
	even

TunnelSplashAnims:
Ani_TunnelWaterfall:
	include	"anims/r1/tunnel_splash.asm"
	even

TunnelSplashSprites:
MapSpr_TunnelWaterfall:
	include	"sprites/r1/tunnel_splash.asm"
	even

ExplosionAnims:
Ani_Explosion:
	include	"anims/explosion.asm"
	even

ExplosionSprites:
MapSpr_Explosion:
	include	"sprites/explosion.asm"
	even

WobbleTable:
	incbin	"data/wobble.bin"
	even

CheckpointAnims:
Ani_Checkpoint:
	include	"anims/checkpoint.asm"
	even

CheckpointSprites:
MapSpr_Checkpoint:
	include	"sprites/checkpoint.asm"
	even

BigRingAnims:
Ani_BigRing:
	include	"anims/big_ring.asm"
	even

BigRingSprites:
MapSpr_BigRing:
	include	"sprites/big_ring.asm"
	even

SignpostAnims:
Ani_Signpost:
	include	"anims/signpost.asm"
	even

SignpostSprites:
MapSpr_GoalSignpost:
	include	"sprites/signpost.asm"
	even

CapsuleAnims:
Ani_FlowerCapsule:
	include	"anims/capsule.asm"
	even

CapsuleSprites:
MapSpr_FlowerCapsule:
	include	"sprites/capsule.asm"

; -------------------------------------------------------------------------
; Leftover data from other level files used as padding.
; -------------------------------------------------------------------------

Padding3:
	if ACT2_FUTURE_VARIANT=1
		include	"Level/Palmtree Panic/Data/R13C Padding 3 Prefix.asm"
	endif
	include	"Level/Palmtree Panic/Data/R13 Padding 3 Base.asm"
