; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R63C)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r63c_e_1.bin"

StageChunks:
	incbin	"src/maps/r63c/chunks.bin"

Padding2:
	incbin	"padding/r63c_e_2.bin"

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
	include	"src/sprites/r6/flower.asm"
	even

FlowerGfx:
	incbin	"src/gfx/r6/flower.nem"
	even

TitleCardTextGfx:
	incbin	"src/gfx/r6/title_card_text.nem"
	even

byte_233B0C:
	incbin	"src/data/r63c/byte_233B0C.bin"
	even

byte_233B8C:
	incbin	"src/data/r63c/byte_233B8C.bin"
	even

byte_233C0C:
	incbin	"src/data/r63c/byte_233C0C.bin"
	even

byte_233D0C:
	incbin	"src/data/r63c/byte_233D0C.bin"
	even

byte_233E0C:
	incbin	"src/data/r63c/byte_233E0C.bin"
	even

LauncherGfx:
	incbin	"src/data/r63c/LauncherGfx.bin"
	even

FreezerGfx:
	incbin	"src/data/r63c/FreezerGfx.bin"
	even

IceBlockGfx:
	incbin	"src/data/r63c/IceBlockGfx.bin"
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
	incbin	"src/maps/r63c/collision.bin"
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
	incbin	"src/maps/r63c/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r63c/background.bin"
	even

StageMapNull:
	incbin	"src/data/r63c/StageMapNull.bin"
	even

StageMapUnk1:
	incbin	"src/data/r63c/StageMapUnk1.bin"
	even

StageMapUnk3:
	incbin	"src/data/r63c/StageMapUnk3.bin"
	even

StageMapUnk4:
	incbin	"src/data/r63c/StageMapUnk4.bin"
	even

StageMapUnk2:
	incbin	"src/data/r63c/StageMapUnk2.bin"
	even

StageMapUnk5:
	incbin	"src/data/r63c/StageMapUnk5.bin"
	even

StageBlocks:
	incbin	"src/maps/r63c/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r63c/gfx.nem"
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

PistonGfx:
	incbin	"src/data/r63c/PistonGfx.bin"
	even

PlatformGfxA:
	incbin	"src/data/r63c/PlatformGfxA.bin"
	even

PlatformGfxB:
	incbin	"src/data/r63c/PlatformGfxB.bin"
	even

PlatformGfxCD:
	incbin	"src/data/r63c/PlatformGfxCD.bin"
	even

BouncePlatformGfx:
	incbin	"src/data/r63c/BouncePlatformGfx.bin"
	even

SwitchGfx:
	incbin	"src/gfx/r6/switch.nem"
	even

DoorGfx:
	incbin	"src/gfx/r6/door.nem"
	even

BossDoorGfx:
	incbin	"src/data/r63c/BossDoorGfx.bin"
	even

CrusherGfx:
	incbin	"src/data/r63c/CrusherGfx.bin"
	even

CrusherGfxC:
	incbin	"src/data/r63c/CrusherGfxC.bin"
	even

TubeDoorGfx:
	incbin	"src/data/r63c/TubeDoorGfx.bin"
	even

ElectricOrbGfxA:
	incbin	"src/data/r63c/ElectricOrbGfxA.bin"
	even

ElectricOrbGfxB:
	incbin	"src/data/r63c/ElectricOrbGfxB.bin"
	even

ElectricOrbGfxC:
	incbin	"src/data/r63c/ElectricOrbGfxC.bin"
	even

ElectricOrbGfxD:
	incbin	"src/data/r63c/ElectricOrbGfxD.bin"
	even

BataPyonGfx:
	incbin	"src/data/r63c/BataPyonGfx.bin"
	even

PohBeeGfx:
	incbin	"src/data/r63c/PohBeeGfx.bin"
	even

MinomusiGfx:
	incbin	"src/data/r63c/MinomusiGfx.bin"
	even

SemiBombGfx:
	incbin	"src/gfx/bomb.nem"
	even

SnakeBlocksGfx:
	incbin	"src/data/r63c/SnakeBlocksGfx.bin"
	even

SemiGfx:
	incbin	"src/data/r63c/SemiGfx.bin"
	even

SeesawGfx:
	incbin	"src/data/r63c/SeesawGfx.bin"
	even

EggmanStatueGfx:
	incbin	"src/data/r63c/EggmanStatueGfx.bin"
	even

SpikeBallGfx:
	incbin	"src/gfx/spike_ball.nem"
	even

AnimalGfx:
	incbin	"src/gfx/r6/animals.nem"
	even

ProjectorAnimalGfx:
	incbin	"src/gfx/r6/projector_animals.nem"
	even

RobotGeneratorDecayGfx:
	incbin	"src/gfx/r6/robot_generator_decay.nem"
	even

RobotGeneratorGfx:
	incbin	"src/gfx/r6/robot_generator.nem"
	even

ProjectorGfx:
	incbin	"src/gfx/r6/projector.nem"
	even

BossMachineGfx:
	incbin	"src/data/r63c/BossMachineGfx.bin"
	even

EggmanGfx:
	incbin	"src/data/r63c/EggmanGfx.bin"
	even

EggmanEscapeGfx:
	incbin	"src/data/r63c/EggmanEscapeGfx.bin"
	even

BossDestroyedGfx:
	incbin	"src/data/r63c/BossDestroyedGfx.bin"
	even

BossBrokenFloorGfx:
	incbin	"src/data/r63c/BossBrokenFloorGfx.bin"
	even

BossArenaPiecesGfx:
	incbin	"src/data/r63c/BossArenaPiecesGfx.bin"

Padding3:
	incbin	"padding/r63c_e_3.bin"

; ------------------------------------------------------------------------------
