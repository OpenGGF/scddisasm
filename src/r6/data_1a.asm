; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R61A)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"Level/Wacky Workbench/Data/Padding/1 (Act 1 Present, JE).bin"

StageChunks:
	incbin	"maps/r61a/chunks.bin"

Padding2:
	incbin	"Level/Wacky Workbench/Data/Padding/2 (Act 1 Present).bin"

PlayerGfx:
	incbin	"gfx/player.unc"
	even

PlayerSprites:
	include	"sprites/player.asm"
	even

PlayerGfxScript:
	include	"sprites/player_gfx.asm"
	even

PointsGfx:
	incbin	"gfx/points.nem"
	even

CapsuleGfx:
	incbin	"gfx/capsule.nem"
	even

BigRingGfx:
	incbin	"gfx/big_ring.nem"
	even

GoalGfx:
	incbin	"gfx/goal.nem"
	even

SignpostGfx:
	incbin	"gfx/signpost.nem"
	even

ResultsGfx:
	incbin	"gfx/results.nem"
	even

TimeOverGfx:
	incbin	"gfx/time_over.unc"
	even

GameOverGfx:
	incbin	"gfx/game_over.unc"
	even

TitleCardGfx:
	incbin	"gfx/title_card.nem"
	even

ShieldGfx:
	incbin	"gfx/shield.unc"
	even

InvincibleGfx:
	incbin	"gfx/invincible.unc"
	even

WarpGfx:
	incbin	"gfx/warp.unc"
	even

Spring45Gfx:
	incbin	"gfx/spring_45.nem"
	even

SpringGfx:
	incbin	"gfx/spring.nem"
	even

MonitorTimeGfx:
	incbin	"gfx/monitor_time.nem"
	even

ExplosionGfx:
	incbin	"gfx/explosion.nem"
	even

RingGfx:
	incbin	"gfx/ring.nem"
	even

LivesIconsGfx:
	incbin	"gfx/lives_icons.unc"
	even

HudNumbersGfx:
	incbin	"gfx/hud_numbers.unc"
	even

HudGfx:
	incbin	"gfx/hud.nem"
	even

CheckpointGfx:
	incbin	"gfx/checkpoint.nem"
	even

FlowerAnims:
	include	"anims/flower.asm"
	even

FlowerSprites:
	include	"sprites/r6/flower.asm"
	even

FlowerGfx:
	incbin	"gfx/r6/flower.nem"
	even

TitleCardTextGfx:
	incbin	"gfx/r6/title_card_text.nem"
	even

byte_233B0C:
	incbin	"data/r6/byte_233B0C.bin"
	even

byte_233B8C:
	incbin	"data/r6/byte_233B8C.bin"
	even

byte_233C0C:
	incbin	"data/r6/byte_233C0C.bin"
	even

byte_233D0C:
	incbin	"data/r6/byte_233D0C.bin"
	even

byte_233E0C:
	incbin	"data/r6/byte_233E0C.bin"
	even

byte_233F0C:
	incbin	"data/r6/byte_233F0C.bin"
	even

byte_233F8C:
	incbin	"data/r6/byte_233F8C.bin"
	even

byte_23400C:
	incbin	"data/r6/byte_23400C.bin"
	even

byte_23408C:
	incbin	"data/r6/byte_23408C.bin"
	even

LaunchGfx:
	incbin	"gfx/r6/launch.nem"
	even

FreezerGfx:
	incbin	"gfx/r6/freezer.nem"
	even

IceBlockGfx:
	incbin	"gfx/r6/ice_block.nem"
	even

StageCollisionAngles:
	incbin	"maps/collision_angles.bin"
	even

StageCollisionColumns:
	incbin	"maps/collision_columns.bin"
	even

StageCollisionRows:
	incbin	"maps/collision_rows.bin"
	even

StageCollision:
	incbin	"maps/r61a/collision.bin"
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
	incbin	"maps/r61a/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r61a/background.bin"
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
	even

StageBlocks:
	incbin	"maps/r61a/blocks.nem"
	even

StageGfx:
	incbin	"maps/r61a/gfx.nem"
	even

PowerupAnims:
	include	"anims/powerup.asm"
	even

PowerupSprites:
	include	"sprites/powerup.asm"
	even

SplashAnims:
	include	"anims/splash.asm"
	even

SplashSprites:
	include	"sprites/splash.asm"
	even

HDoorAnims:
	include	"anims/r1/h_door.asm"
	even

HDoorSprites:
	include	"sprites/r1/h_door.asm"
	even

TunnelSplashAnims:
	include	"anims/r1/tunnel_splash.asm"
	even

TunnelSplashSprites:
	include	"sprites/r1/tunnel_splash.asm"
	even

ExplosionAnims:
	include	"anims/explosion.asm"
	even

ExplosionSprites:
	include	"sprites/explosion.asm"
	even

WobbleTable:
	incbin	"data/wobble.bin"
	even

CheckpointAnims:
	include	"anims/checkpoint.asm"
	even

CheckpointSprites:
	include	"sprites/checkpoint.asm"
	even

BigRingAnims:
	include	"anims/big_ring.asm"
	even

BigRingSprites:
	include	"sprites/big_ring.asm"
	even

SignpostAnims:
	include	"anims/signpost.asm"
	even

SignpostSprites:
	include	"sprites/signpost.asm"
	even

CapsuleAnims:
	include	"anims/capsule.asm"
	even

CapsuleSprites:
	include	"sprites/capsule.asm"
	even

PistonGfx:
	incbin	"gfx/r6/piston.nem"
	even

PlatformGfxA:
	incbin	"gfx/r6/platform_a.nem"
	even

PlatformGfxB:
	incbin	"gfx/r6/platform_b.nem"
	even

PlatformGfxCD:
	incbin	"gfx/r6/platform_cd.nem"
	even

BouncePlatformGfx:
	incbin	"gfx/r6/bounce_platform.nem"
	even

SwitchGfx:
	incbin	"gfx/switch.nem"
	even

DoorGfx:
	incbin	"gfx/r6/door.nem"
	even

BossDoorGfx:
	incbin	"gfx/r6/boss_door.nem"
	even

CrusherGfxABD:
	incbin	"gfx/r6/crusher_abd.nem"
	even

CrusherGfxC:
	incbin	"gfx/r6/crusher_c.nem"
	even

TubeDoorGfx:
	incbin	"gfx/r6/tube_door.nem"
	even

ElectricOrbA:
	incbin	"gfx/r6/electric_orb_a.nem"
	even

ElectricOrbB:
	incbin	"gfx/r6/electric_orb_b.nem"
	even

ElectricOrbC:
	incbin	"gfx/r6/electric_orb_c.nem"
	even

ElectricOrbD:
	incbin	"gfx/r6/electric_orb_d.nem"
	even

BataPyonGfx:
	incbin	"gfx/r6/bata_pyon.nem"
	even

PohBeeGfx:
	incbin	"gfx/r6/poh_bee.nem"
	even

MinomusiGfx:
	incbin	"gfx/r6/minomusi.nem"
	even

SpikeBombGfx:
	incbin	"gfx/spike_bomb.nem"
	even

SnakeBlocksGfx:
	incbin	"gfx/r6/snake_blocks.nem"
	even

SemiGfx:
	incbin	"gfx/r6/semi.nem"
	even

SeesawGfx:
	incbin	"gfx/r6/seesaw.nem"
	even

EggmanStatueGfx:
	incbin	"gfx/r6/eggman_statue.nem"
	even

SpikeChainGfx:
	incbin	"gfx/spike_chain.nem"
	even

AnimalsGfx:
	incbin	"gfx/r6/animals.nem"
	even

HologramAnimalsGfx:
	incbin	"gfx/r6/hologram_animals.nem"
	even

RobotTransportGfxA:
	incbin	"gfx/robot_transport_a.nem"

Padding3:
	include	"Level/Wacky Workbench/Data/R61A Padding 3 Prefix.asm"
	include	"Level/Wacky Workbench/Data/R61AC Padding 3 Suffix Prefix.asm"
	include	"Level/Wacky Workbench/Data/R61 Padding 3 Final.asm"

; ------------------------------------------------------------------------------
