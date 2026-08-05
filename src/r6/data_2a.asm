; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R62A)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r62a_e_1.bin"

StageChunks:
	incbin	"src/maps/r62a/chunks.bin"

Padding2:
	incbin	"padding/r62a_e_2.bin"

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
	incbin	"src/data/r62a/byte_233B0C.bin"
	even

byte_233B8C:
	incbin	"src/data/r62a/byte_233B8C.bin"
	even

byte_233C0C:
	incbin	"src/data/r62a/byte_233C0C.bin"
	even

byte_233D0C:
	incbin	"src/data/r62a/byte_233D0C.bin"
	even

byte_233E0C:
	incbin	"src/data/r62a/byte_233E0C.bin"
	even

byte_233F0C:
	incbin	"src/data/r62a/byte_233F0C.bin"
	even

byte_233F8C:
	incbin	"src/data/r62a/byte_233F8C.bin"
	even

byte_23400C:
	incbin	"src/data/r62a/byte_23400C.bin"
	even

byte_23408C:
	incbin	"src/data/r62a/byte_23408C.bin"
	even

LauncherGfx:
	incbin	"src/data/r62a/LauncherGfx.bin"
	even

FreezerGfx:
	incbin	"src/data/r62a/FreezerGfx.bin"
	even

IceBlockGfx:
	incbin	"src/data/r62a/IceBlockGfx.bin"
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
	incbin	"src/maps/r62a/collision.bin"
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
	incbin	"src/maps/r62a/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r62a/background.bin"
	even

StageMapNull:
	incbin	"src/data/r62a/StageMapNull.bin"
	even

StageMapUnk1:
	incbin	"src/data/r62a/StageMapUnk1.bin"
	even

StageMapUnk3:
	incbin	"src/data/r62a/StageMapUnk3.bin"
	even

StageMapUnk4:
	incbin	"src/data/r62a/StageMapUnk4.bin"
	even

StageMapUnk2:
	incbin	"src/data/r62a/StageMapUnk2.bin"
	even

StageMapUnk5:
	incbin	"src/data/r62a/StageMapUnk5.bin"
	even

StageBlocks:
	incbin	"src/maps/r62a/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r62a/gfx.nem"
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
	incbin	"src/data/r62a/PistonGfx.bin"
	even

PlatformGfxA:
	incbin	"src/data/r62a/PlatformGfxA.bin"
	even

PlatformGfxB:
	incbin	"src/data/r62a/PlatformGfxB.bin"
	even

PlatformGfxCD:
	incbin	"src/data/r62a/PlatformGfxCD.bin"
	even

BouncePlatformGfx:
	incbin	"src/data/r62a/BouncePlatformGfx.bin"
	even

SwitchGfx:
	incbin	"src/gfx/r6/switch.nem"
	even

DoorGfx:
	incbin	"src/gfx/r6/door.nem"
	even

BossDoorGfx:
	incbin	"src/data/r62a/BossDoorGfx.bin"
	even

CrusherGfx:
	incbin	"src/data/r62a/CrusherGfx.bin"
	even

CrusherGfxC:
	incbin	"src/data/r62a/CrusherGfxC.bin"
	even

TubeDoorGfx:
	incbin	"src/data/r62a/TubeDoorGfx.bin"
	even

ElectricOrbGfxA:
	incbin	"src/data/r62a/ElectricOrbGfxA.bin"
	even

ElectricOrbGfxB:
	incbin	"src/data/r62a/ElectricOrbGfxB.bin"
	even

ElectricOrbGfxC:
	incbin	"src/data/r62a/ElectricOrbGfxC.bin"
	even

ElectricOrbGfxD:
	incbin	"src/data/r62a/ElectricOrbGfxD.bin"
	even

BataPyonGfx:
	incbin	"src/data/r62a/BataPyonGfx.bin"
	even

PohBeeGfx:
	incbin	"src/data/r62a/PohBeeGfx.bin"
	even

MinomusiGfx:
	incbin	"src/data/r62a/MinomusiGfx.bin"
	even

SemiBombGfx:
	incbin	"src/gfx/bomb.nem"
	even

SnakeBlocksGfx:
	incbin	"src/data/r62a/SnakeBlocksGfx.bin"
	even

SemiGfx:
	incbin	"src/data/r62a/SemiGfx.bin"
	even

SeesawGfx:
	incbin	"src/data/r62a/SeesawGfx.bin"
	even

EggmanStatueGfx:
	incbin	"src/data/r62a/EggmanStatueGfx.bin"
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

Padding3:
	incbin	"padding/r62a_e_3.bin"

; ------------------------------------------------------------------------------
