; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R41A)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r41a_e_1.bin"

StageChunks:
	incbin	"src/maps/r41a/chunks.bin"
	even

PowerupAnims:
	include	"src/anims/powerup.asm"
	even

PowerupSprites:
	include	"src/sprites/powerup.asm"
	even

SplashAnims:
	include	"src/anims/splash.asm"
	even

SplashSprites:
	include	"src/sprites/splash.asm"
	even

HDoorAnims:
	include	"src/anims/r1/h_door.asm"
	even

HDoorSprites:
	include	"src/sprites/r1/h_door.asm"
	even

TunnelSplashAnims:
	include	"src/anims/r1/tunnel_splash.asm"
	even

TunnelSplashSprites:
	include	"src/sprites/r1/tunnel_splash.asm"
	even

ExplosionAnims:
	include	"src/anims/explosion.asm"
	even

ExplosionSprites:
	include	"src/sprites/explosion.asm"
	even

byte_21D7A6:
	incbin	"src/data/wobble.bin"
	even

CheckpointAnims:
	include	"src/anims/checkpoint.asm"
	even

CheckpointSprites:
	include	"src/sprites/checkpoint.asm"
	even

BigRingAnims:
	include	"src/anims/big_ring.asm"
	even

BigRingSprites:
	include	"src/sprites/big_ring.asm"
	even

SignpostAnims:
	include	"src/anims/signpost.asm"
	even

SignpostSprites:
	include	"src/sprites/signpost.asm"
	even

CapsuleAnims:
	include	"src/anims/capsule.asm"
	even

CapsuleSprites:
	include	"src/sprites/capsule.asm"
	even

WaterSurfaceGfx:
	incbin	"src/data/r41a/WaterSurfaceGfx.bin"
	even

FlowerAnims:
	include	"src/anims/flower.asm"
	even

FlowerSprites:
	include	"src/sprites/r4/flower.asm"
	even

FlowerGfx:
	incbin	"src/gfx/r4/flower.nem"
	even

TitleCardTextGfx:
	incbin	"src/gfx/r4/title_card_text.nem"
	even

BubbleNumbersGfx:
	incbin	"src/data/r41a/BubbleNumbersGfx.bin"
	even

Spr_21E9B4:
	include	"src/data/r41a/Spr_21E9B4.asm"
	even

SpikeBallGfx:
	incbin	"src/data/r41a/SpikeBallGfx.bin"
	even

ChainGfx:
	incbin	"src/data/r41a/ChainGfx.bin"
	even

TurbineGfx:
	incbin	"src/data/r41a/TurbineGfx.bin"
	even

CollapseFloorGfx:
	incbin	"src/data/r41a/CollapseFloorGfx.bin"
	even

ElectricBeamGfx:
	incbin	"src/data/r41a/ElectricBeamGfx.bin"
	even

ShooterGfx:
	incbin	"src/data/r41a/ShooterGfx.bin"
	even

TonboGfx:
	incbin	"src/data/r41a/TonboGfx.bin"
	even

TagaTagaGfx:
	incbin	"src/gfx/r4/taga_taga.nem"
	even

YagoGfx:
	incbin	"src/data/r41a/YagoGfx.bin"
	even

AmenboGfx:
	incbin	"src/data/r41a/AmenboGfx.bin"
	even

WoodBlockGfx:
	incbin	"src/data/r41a/WoodBlockGfx.bin"
	even

AnimalGfx:
	incbin	"src/gfx/r4/animals.nem"
	even

RobotGeneratorDecayGfx:
	incbin	"src/gfx/r4/robot_generator_decay.nem"

Padding2:
	incbin	"padding/r41a_e_2.bin"

PlayerGfx:
	incbin	"src/gfx/r4/player.unc"
	even

PlayerSprites:
	include	"src/sprites/r4/player.asm"
	even

PlayerGfxScript:
	include	"src/sprites/r4/player_gfx.asm"
	even

PointsGfx:
	incbin	"src/gfx/points.nem"
	even

CapsuleGfx:
	incbin	"src/gfx/capsule.nem"
	even

BigRingGfx:
	incbin	"src/gfx/big_ring.nem"
	even

GoalGfx:
	incbin	"src/gfx/goal.nem"
	even

SignpostGfx:
	incbin	"src/gfx/signpost.nem"
	even

ResultsGfx:
	incbin	"src/gfx/results.nem"
	even

TimeOverGfx:
	incbin	"src/gfx/time_over.unc"
	even

GameOverGfx:
	incbin	"src/gfx/game_over.unc"
	even

TitleCardGfx:
	incbin	"src/gfx/title_card.nem"
	even

ShieldGfx:
	incbin	"src/gfx/shield.unc"
	even

InvincibleGfx:
	incbin	"src/gfx/invincible.unc"
	even

WarpStarGfx:
	incbin	"src/gfx/warp.unc"
	even

DSpringGfx:
	incbin	"src/gfx/spring_diagonal.nem"
	even

SpringGfx:
	incbin	"src/gfx/spring.nem"
	even

MonitorTimeGfx:
	incbin	"src/gfx/monitor_time.nem"
	even

ExplosionGfx:
	incbin	"src/gfx/explosion.nem"
	even

RingGfx:
	incbin	"src/gfx/ring.nem"
	even

LifeIconGfx:
	incbin	"src/gfx/life_icon.unc"
	even

HudNumbersGfx:
	incbin	"src/gfx/hud_numbers.unc"
	even

HudGfx:
	incbin	"src/gfx/hud.nem"
	even

CheckpointGfx:
	incbin	"src/gfx/checkpoint.nem"
	even

byte_238A42:
	incbin	"src/data/r41a/byte_238A42.bin"
	even

byte_238C42:
	incbin	"src/data/r41a/byte_238C42.bin"
	even

byte_238E42:
	incbin	"src/data/r41a/byte_238E42.bin"
	even

byte_239042:
	incbin	"src/data/r41a/byte_239042.bin"
	even

byte_239242:
	incbin	"src/data/r41a/byte_239242.bin"
	even

byte_239442:
	incbin	"src/data/r41a/byte_239442.bin"
	even

byte_239642:
	incbin	"src/data/r41a/byte_239642.bin"
	even

byte_239842:
	incbin	"src/data/r41a/byte_239842.bin"
	even

StageCollisionAngles:
	incbin	"src/maps/collision_angles.bin"
	even

StageCollisionColumns:
	incbin	"src/maps/collision_columns.bin"
	even

StageCollisionRows:
	incbin	"src/maps/collision_rows.bin"
	even

StageCollision:
	incbin	"src/maps/r41a/collision.bin"
	even

StageMaps:
	dc.w	StageMapFg-*
	dc.w	StageMapBg-StageMaps
	dc.w	StageMapNull-StageMaps
	dc.w	StageMapUnk1-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk3-StageMaps
	dc.w	StageMapUnk4-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapFg-StageMaps
	dc.w	StageMapBg-StageMaps
	dc.w	StageMapNull-StageMaps
	dc.w	StageMapUnk1-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk3-StageMaps
	dc.w	StageMapUnk4-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapFg-StageMaps
	dc.w	StageMapBg-StageMaps
	dc.w	StageMapNull-StageMaps
	dc.w	StageMapUnk1-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk3-StageMaps
	dc.w	StageMapUnk4-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk2-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapUnk5-StageMaps
	dc.w	StageMapUnk5-StageMaps

StageMapFg:
	incbin	"src/maps/r41a/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r41a/background.bin"
	even

StageMapNull:
	incbin	"src/data/r41a/StageMapNull.bin"
	even

StageMapUnk1:
	incbin	"src/data/r41a/StageMapUnk1.bin"
	even

StageMapUnk3:
	incbin	"src/data/r41a/StageMapUnk3.bin"
	even

StageMapUnk4:
	incbin	"src/data/r41a/StageMapUnk4.bin"
	even

StageMapUnk2:
	incbin	"src/data/r41a/StageMapUnk2.bin"
	even

StageMapUnk5:
	incbin	"src/data/r41a/StageMapUnk5.bin"
	even

StageBlocks:
	incbin	"src/maps/r41a/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r41a/gfx.nem"
	even

BreakPoleGfx:
	incbin	"src/data/r41a/BreakPoleGfx.bin"
	even

SpikesGfx:
	incbin	"src/gfx/r4/spikes.nem"
	even

BlockPresentGfx:
	incbin	"src/data/r41a/BlockPresentGfx.bin"
	even

SwitchGfx:
	incbin	"src/gfx/r4/switch.nem"
	even

SlopeElevatorGfx:
	incbin	"src/data/r41a/SlopeElevatorGfx.bin"
	even

SwingGfx:
	incbin	"src/data/r41a/SwingGfx.bin"
	even

PrizePointsGfx:
	incbin	"src/data/r41a/PrizePointsGfx.bin"
	even

DoorPresentGfx:
	incbin	"src/data/r41a/DoorPresentGfx.bin"
	even

GeyserGfx:
	incbin	"src/data/r41a/GeyserGfx.bin"

Padding3:
	incbin	"padding/r41a_e_3.bin"

; ------------------------------------------------------------------------------
