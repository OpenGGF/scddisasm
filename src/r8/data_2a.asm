; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R82A)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"../padding/r82a_e_1.bin"

StageChunks:
	incbin	"maps/r82a/chunks.bin"
	even

LaserAnims:
	include	"anims/r8/laser.asm"
	even

FlowerAnims:
	include	"anims/flower.asm"
	even

FlowerSprites:
	include	"sprites/r8/flower.asm"
	even

FlowerGfx:
	incbin	"gfx/r8/flower.nem"
	even

LaserGfx:
	incbin	"gfx/r8/laser.nem"
	even

TitleCardTextGfx:
	incbin	"gfx/r8/title_card_text.nem"
	even

byte_21DF96:
	incbin	"data/r8/byte_2345CA.bin"
	even

byte_21E096:
	incbin	"data/r8/byte_2346CA.bin"
	even

byte_21E196:
	incbin	"data/r8/byte_2347CA.bin"
	even

byte_21E296:
	incbin	"data/r8/byte_2348CA.bin"
	even

byte_21E396:
	incbin	"data/r8/byte_2349CA.bin"
	even

byte_21E496:
	incbin	"data/r8/byte_234ACA.bin"
	even

byte_21E596:
	incbin	"data/r8/byte_234BCA.bin"
	even

byte_21E696:
	incbin	"data/r8/byte_234CCA.bin"
	even

byte_21E896:
	incbin	"data/r8/byte_234ECA.bin"
	even

byte_21EA96:
	incbin	"data/r8/byte_2350CA.bin"
	even

byte_21EC96:
	incbin	"data/r8/byte_2352CA_a.bin"
	even

byte_2354CA:
	incbin	"data/r8/byte_2354CA_a.bin"
	even

byte_2356CA:
	incbin	"data/r8/byte_2356CA_a.bin"
	even

byte_2358CA:
	incbin	"data/r8/byte_2358CA_a.bin"
	even

byte_235ACA:
	incbin	"data/r8/byte_235ACA_a.bin"
	even

byte_21F696:
	incbin	"data/r8/byte_235CCA.bin"
	even

byte_21F716:
	incbin	"data/r8/byte_235D4A.bin"
	even

byte_21F796:
	incbin	"data/r8/byte_235DCA.bin"
	even

byte_21F816:
	incbin	"data/r8/byte_235E4A.bin"
	even

byte_21F896:
	incbin	"data/r8/byte_235ECA.bin"
	even

byte_21F916:
	incbin	"data/r8/byte_235F4A.bin"
	even

byte_21F996:
	incbin	"data/r8/byte_21FD96.bin"
	even

byte_21FA16:
	incbin	"data/r8/byte_21FA16.bin"
	even

byte_21FA96:
	incbin	"data/r8/byte_21FA96.bin"
	even

byte_21FB16:
	incbin	"data/r8/byte_21FB16.bin"
	even

byte_21FB96:
	incbin	"data/r8/byte_21FB96.bin"
	even

byte_21FC16:
	incbin	"data/r8/byte_21FC16.bin"
	even

byte_21FC96:
	incbin	"data/r8/byte_21FC96.bin"

Padding2:
	incbin	"../padding/r82a_e_2.bin"

PlayerGfx:
	incbin	"gfx/r8/player.unc"
	even

PlayerSprites:
	include	"sprites/r8/player.asm"
	even

PlayerGfxScript:
	include	"sprites/r8/player_gfx.asm"
	even

PointsGfx:
	incbin	"gfx/points.nem"
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
	incbin	"maps/r82a/collision.bin"
	even

StageMaps:
	dc.w	StageMapFg-*
	dc.w	StageMapBg-StageMaps

StageMapFg:
	incbin	"maps/r82a/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r82a/background.bin"
	even

StageBlocks:
	incbin	"maps/r82a/blocks.nem"
	even

StageGfx:
	incbin	"maps/r82a/gfx.nem"
	even

PowerupAnims:
	include	"anims/powerup.asm"
	even

PowerupSprites:
	include	"sprites/powerup.asm"
	even

TunnelSplashSprites:
TunnelSplashAnims:
HDoorSprites:
HDoorAnims:
SplashSprites:
SplashAnims:

ExplosionAnims:
	include	"anims/explosion.asm"
	even

ExplosionSprites:
	include	"sprites/explosion.asm"
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

CapsuleSprites:
CapsuleAnims:

DoorGfx:
	incbin	"gfx/r8/door.nem"
	even

SpikesV4Gfx:
	incbin	"gfx/spikes_v4.nem"
	even

CrusherGfx:
	incbin	"gfx/r8/crusher.nem"
	even

CollapseFloorGfx:
	incbin	"gfx/r8/collapse_floor.nem"
	even

BigbomGfx:
	incbin	"gfx/r8/bigbom.nem"
	even

TrapDoorGfx:
	incbin	"gfx/r8/trap_door.nem"
	even

SeesawGfxABD:
	incbin	"gfx/r8/seesaw_abd.nem"
	even

SeesawGfxC:
	incbin	"gfx/r8/seesaw_c.nem"
	even

SpikeCrusherGfx:
	incbin	"gfx/r8/spike_crusher.nem"
	even

TwinWalkerGfx:
	incbin	"gfx/r8/twin_walker.nem"
	even

SwitchGfx:
	incbin	"gfx/switch.nem"
	even

SpringWheelGfx:
	incbin	"gfx/spring_wheel.nem"
	even

MechaBuGfx:
	incbin	"gfx/r8/mecha_bu.nem"
	even

TubeCoverGfx:
	incbin	"gfx/r8/tube_cover.nem"
	even

AnimalsGfx:
	incbin	"gfx/r8/animals.nem"
	even

DangoGfx:
	incbin	"gfx/r8/dango.nem"
	even

RobotTransportGfxA:
	incbin	"gfx/robot_transport_a.nem"
	even

RobotTransportGfxB:
	incbin	"gfx/robot_transport_b.nem"
	even

SpinPlatform1Data:
	incbin	"data/r8/spin_platform_1.bin"
	even

RobotTransportSprites:
	include	"sprites/robot_transport.asm"
	even

LaserSprites:
	include	"sprites/r8/laser.asm"
	even
LaserSprites1		equ .Sprites1
LaserSprites2		equ .Sprites2

RevolveDoorGfx:
	incbin	"gfx/r8/revolve_door.nem"

Padding3:
	incbin	"../padding/r82a_e_3.bin"

; ------------------------------------------------------------------------------
