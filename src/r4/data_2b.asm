; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R42B)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r42b_e_1.bin"

StageChunks:
	incbin	"src/maps/r42b/chunks.bin"
	even

BreakPoleGfx:
	incbin	"src/data/r42b/BreakPoleGfx.bin"
	even

SpikesGfx:
	incbin	"src/gfx/r4/spikes.nem"
	even

BlockPastGfx:
	incbin	"src/data/r42b/BlockPastGfx.bin"
	even

SwitchGfx:
	incbin	"src/gfx/r4/switch.nem"
	even

SwingGfx:
	incbin	"src/data/r42b/SwingGfx.bin"
	even

PrizePointsGfx:
	incbin	"src/data/r42b/PrizePointsGfx.bin"
	even

DoorPastGfx:
	incbin	"src/data/r42b/DoorPastGfx.bin"
	even

GeyserGfx:
	incbin	"src/data/r42b/GeyserGfx.bin"
	even

UnusedPlatformGfx:
	incbin	"src/data/r42b/UnusedPlatformGfx.bin"
	even

RotateBlockGfx:
	incbin	"src/data/r42b/RotateBlockGfx.bin"
	even

SpikeBallGfx:
	incbin	"src/data/r42b/SpikeBallGfx.bin"
	even

ChainGfx:
	incbin	"src/data/r42b/ChainGfx.bin"
	even

TurbineGfx:
	incbin	"src/data/r42b/TurbineGfx.bin"
	even

CollapseFloorGfx:
	incbin	"src/data/r42b/CollapseFloorGfx.bin"
	even

ElectricBeamGfx:
	incbin	"src/data/r42b/ElectricBeamGfx.bin"
	even

ShooterGfx:
	incbin	"src/data/r42b/ShooterGfx.bin"
	even

TonboGfx:
	incbin	"src/data/r42b/TonboGfx.bin"
	even

TagaTagaGfx:
	incbin	"src/gfx/r4/taga_taga.nem"
	even

YagoGfx:
	incbin	"src/data/r42b/YagoGfx.bin"
	even

AmenboGfx:
	incbin	"src/data/r42b/AmenboGfx.bin"
	even

WoodBlockGfx:
	incbin	"src/data/r42b/WoodBlockGfx.bin"
	even

AnimalGfx:
	incbin	"src/gfx/r4/animals.nem"
	even

RobotGeneratorGfx:
	incbin	"src/gfx/r4/robot_generator.nem"
	even

ProjectorGfx:
	incbin	"src/gfx/r4/projector.nem"

Padding2:
	incbin	"padding/r42b_e_2.bin"

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

WaterSurfaceGfx:
	incbin	"src/data/r42b/WaterSurfaceGfx.bin"
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
	incbin	"src/data/r42b/BubbleNumbersGfx.bin"
	even

Spr_21E9B4:
	include	"src/data/r42b/Spr_21E9B4.asm"
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
	incbin	"src/maps/r42b/collision.bin"
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
	incbin	"src/maps/r42b/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r42b/background.bin"
	even

StageMapNull:
	incbin	"src/data/r42b/StageMapNull.bin"
	even

StageMapUnk1:
	incbin	"src/data/r42b/StageMapUnk1.bin"
	even

StageMapUnk3:
	incbin	"src/data/r42b/StageMapUnk3.bin"
	even

StageMapUnk4:
	incbin	"src/data/r42b/StageMapUnk4.bin"
	even

StageMapUnk2:
	incbin	"src/data/r42b/StageMapUnk2.bin"
	even

StageMapUnk5:
	incbin	"src/data/r42b/StageMapUnk5.bin"
	even

StageBlocks:
	incbin	"src/maps/r42b/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r42b/gfx.nem"
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
	incbin	"src/data/r42b/byte_21D7A6.bin"
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

Padding3:
	incbin	"padding/r42b_e_3.bin"

; ------------------------------------------------------------------------------
