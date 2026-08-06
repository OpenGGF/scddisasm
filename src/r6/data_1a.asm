; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R61A)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r61a_e_1.bin"

StageChunks:
	incbin	"src/maps/r61a/chunks.bin"

Padding2:
	incbin	"padding/r61a_e_2.bin"

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
	incbin	"src/data/r6/byte_233B0C.bin"
	even

byte_233B8C:
	incbin	"src/data/r6/byte_233B8C.bin"
	even

byte_233C0C:
	incbin	"src/data/r6/byte_233C0C.bin"
	even

byte_233D0C:
	incbin	"src/data/r6/byte_233D0C.bin"
	even

byte_233E0C:
	incbin	"src/data/r6/byte_233E0C.bin"
	even

byte_233F0C:
	incbin	"src/data/r6/byte_233F0C.bin"
	even

byte_233F8C:
	incbin	"src/data/r6/byte_233F8C.bin"
	even

byte_23400C:
	incbin	"src/data/r6/byte_23400C.bin"
	even

byte_23408C:
	incbin	"src/data/r6/byte_23408C.bin"
	even

LauncherGfx:
	incbin	"src/gfx/r6/launcher.nem"
	even

FreezerGfx:
	incbin	"src/gfx/r6/freezer.nem"
	even

IceBlockGfx:
	incbin	"src/gfx/r6/ice_block.nem"
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
	incbin	"src/maps/r61a/collision.bin"
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
	incbin	"src/maps/r61a/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r61a/background.bin"
	even

StageMapNull:
	incbin	"src/maps/empty.bin"
	even

StageMapUnk1:
	incbin	"src/maps/ghz2_foreground.bin"
	even

StageMapUnk3:
	incbin	"src/maps/empty.bin"
	even

StageMapUnk4:
	incbin	"src/maps/ghz3_foreground.bin"
	even

StageMapUnk2:
	incbin	"src/maps/empty.bin"
	even

StageMapUnk5:
	incbin	"src/maps/empty.bin"
	even

StageBlocks:
	incbin	"src/maps/r61a/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r61a/gfx.nem"
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
	incbin	"src/gfx/r6/piston.nem"
	even

PlatformGfxA:
	incbin	"src/gfx/r6/platform_a.nem"
	even

PlatformGfxB:
	incbin	"src/gfx/r6/platform_b.nem"
	even

PlatformGfxCD:
	incbin	"src/gfx/r6/platform_c_d.nem"
	even

BouncePlatformGfx:
	incbin	"src/gfx/r6/bounce_platform.nem"
	even

SwitchGfx:
	incbin	"src/gfx/r6/switch.nem"
	even

DoorGfx:
	incbin	"src/gfx/r6/door.nem"
	even

BossDoorGfx:
	incbin	"src/gfx/r6/boss_door.nem"
	even

CrusherGfx:
	incbin	"src/gfx/r6/crusher.nem"
	even

CrusherGfxC:
	incbin	"src/gfx/r6/crusher_c.nem"
	even

TubeDoorGfx:
	incbin	"src/gfx/r6/tube_door.nem"
	even

ElectricOrbGfxA:
	incbin	"src/gfx/r6/electric_orb_a.nem"
	even

ElectricOrbGfxB:
	incbin	"src/gfx/r6/electric_orb_b.nem"
	even

ElectricOrbGfxC:
	incbin	"src/gfx/r6/electric_orb_c.nem"
	even

ElectricOrbGfxD:
	incbin	"src/gfx/r6/electric_orb_d.nem"
	even

BataPyonGfx:
	incbin	"src/gfx/r6/bata_pyon.nem"
	even

PohBeeGfx:
	incbin	"src/gfx/r6/poh_bee.nem"
	even

MinomusiGfx:
	incbin	"src/gfx/r6/minomusi.nem"
	even

SemiBombGfx:
	incbin	"src/gfx/bomb.nem"
	even

SnakeBlocksGfx:
	incbin	"src/gfx/r6/snake_blocks.nem"
	even

SemiGfx:
	incbin	"src/gfx/r6/semi.nem"
	even

SeesawGfx:
	incbin	"src/gfx/r6/seesaw.nem"
	even

EggmanStatueGfx:
	incbin	"src/gfx/r6/eggman_statue.nem"
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
	incbin	"padding/r61a_e_3.bin"

; ------------------------------------------------------------------------------
