; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R51D)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r51d_e_1.bin"

StageChunks:
	incbin	"src/maps/r51d/chunks.bin"

Padding2:
	incbin	"padding/r51d_e_2.bin"

PlayerGfx:
	incbin	"src/gfx/player.unc"
	even

PlayerSprites:
	include	"src/sprites/player.asm"
	even

PlayerGfxScript:
	include	"src/sprites/player_gfx.asm"
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

FlowerAnims:
	include	"src/anims/flower.asm"
	even

FlowerSprites:
	include	"src/sprites/r5/flower.asm"
	even

FlowerGfx:
	incbin	"src/gfx/r5/flower.nem"
	even

TitleCardTextGfx:
	incbin	"src/gfx/r5/title_card_text.nem"
	even

BossGfx1:
	incbin	"src/data/r51d/BossGfx1.bin"
	even

BossGfx2:
	incbin	"src/data/r51d/BossGfx2.bin"
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
	incbin	"src/maps/r51d/collision.bin"
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
	incbin	"src/maps/r51d/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r51d/background.bin"
	even

StageMapNull:
	incbin	"src/data/r51d/StageMapNull.bin"
	even

StageMapUnk1:
	incbin	"src/data/r51d/StageMapUnk1.bin"
	even

StageMapUnk3:
	incbin	"src/data/r51d/StageMapUnk3.bin"
	even

StageMapUnk4:
	incbin	"src/data/r51d/StageMapUnk4.bin"
	even

StageMapUnk2:
	incbin	"src/data/r51d/StageMapUnk2.bin"
	even

StageMapUnk5:
	incbin	"src/data/r51d/StageMapUnk5.bin"
	even

StageBlocks:
	incbin	"src/maps/r51d/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r51d/gfx.nem"
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

InsideBgGfx:
	incbin	"src/data/r51d/InsideBgGfx.bin"
	even

OutsideBgGfx:
	incbin	"src/data/r51d/OutsideBgGfx.bin"
	even

BridgeGfx:
	incbin	"src/data/r51d/BridgeGfx.bin"
	even

ConveyorControlGfx:
	incbin	"src/data/r51d/ConveyorControlGfx.bin"
	even

PlatformGfx:
	incbin	"src/data/r51d/PlatformGfx.bin"
	even

AnimalGfx:
	incbin	"src/gfx/r5/animals.nem"
	even

ProjectorAnimalGfx:
	incbin	"src/gfx/r5/projector_animals.nem"
	even

ProjectorGfx:
	incbin	"src/gfx/r5/projector.nem"
	even

BreakWallGfx:
	incbin	"src/data/r51d/BreakWallGfx.bin"
	even

ChainGfx:
	incbin	"src/data/r51d/ChainGfx.bin"
	even

CollapseFloorGfx:
	incbin	"src/data/r51d/CollapseFloorGfx.bin"
	even

SpikesGfx:
	incbin	"src/gfx/r5/spikes.nem"
	even

StalactiteGfx:
	incbin	"src/data/r51d/StalactiteGfx.bin"
	even

RockGfx:
	incbin	"src/data/r51d/RockGfx.bin"
	even

KumoKumoGfx:
	incbin	"src/data/r51d/KumoKumoGfx.bin"
	even

KemusiGfx:
	incbin	"src/data/r51d/KemusiGfx.bin"
	even

SasoriGfx:
	incbin	"src/data/r51d/SasoriGfx.bin"
	even

NoroNoroGfx:
	incbin	"src/data/r51d/NoroNoroGfx.bin"
	even

SinePlatformGfx:
	incbin	"src/data/r51d/SinePlatformGfx.bin"
	even

CollapseFloorGfx2:
	incbin	"src/data/r51d/CollapseFloorGfx2.bin"

Padding3:
	incbin	"padding/r51d_e_3.bin"

; ------------------------------------------------------------------------------
