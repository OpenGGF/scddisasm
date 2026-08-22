; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R81D)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		include	"Level/USA Legacy R8 R81D Data.asm"
	else
		incbin	"../padding/r81d_e_1.bin"
	endif

StageChunks:
	incbin	"maps/r81d/chunks.bin"
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

byte_21E396:
	incbin	"data/r8/byte_2345CA.bin"
	even

byte_21E496:
	incbin	"data/r8/byte_2346CA.bin"
	even

byte_21E596:
	incbin	"data/r8/byte_2347CA.bin"
	even

byte_21E696:
	incbin	"data/r8/byte_2348CA.bin"
	even

byte_21E796:
	incbin	"data/r8/byte_2349CA.bin"
	even

byte_21E896:
	incbin	"data/r8/byte_234ACA.bin"
	even

byte_21E996:
	incbin	"data/r8/byte_234BCA.bin"
	even

byte_21EA96:
	incbin	"data/r8/byte_234CCA.bin"
	even

byte_21EC96:
	incbin	"data/r8/byte_234ECA.bin"
	even

byte_21EE96:
	incbin	"data/r8/byte_2350CA.bin"
	even

byte_21F096:
	incbin	"data/r8/byte_21F096_d.bin"
	even

byte_21FA96:
	incbin	"data/r8/byte_235CCA.bin"
	even

byte_21FB16:
	incbin	"data/r8/byte_235D4A.bin"
	even

byte_21FB96:
	incbin	"data/r8/byte_235DCA.bin"
	even

byte_21FC16:
	incbin	"data/r8/byte_235E4A.bin"
	even

byte_21FC96:
	incbin	"data/r8/byte_235ECA.bin"
	even

byte_21FD16:
	incbin	"data/r8/byte_235F4A.bin"
	even

byte_21FD96:
	incbin	"data/r8/byte_21FD96.bin"

Padding2:
	incbin	"../padding/r81d_e_2.bin"

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
	incbin	"maps/r81d/collision.bin"
	even

StageMaps:
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
	incbin	"maps/r81d/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r81d/background.bin"
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
	incbin	"maps/r81d/blocks.nem"
	even

StageGfx:
	incbin	"maps/r81d/gfx.nem"
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

VanishPlatformGfx:
	incbin	"gfx/r8/vanish_platform.nem"
	even

PropellerGfx:
	incbin	"gfx/r8/propeller.nem"
	even

BuzzsawGfxABD:
	incbin	"gfx/r8/buzzsaw_abd.nem"
	even

BuzzsawGfxC:
	incbin	"gfx/r8/buzzsaw_c.nem"
	even

TrapDoorGfx:
	incbin	"gfx/r8/trap_door.nem"
	even

HVPlatformGfx:
	incbin	"gfx/r8/hv_platform.nem"
	even

SeesawGfxABD:
	incbin	"gfx/r8/seesaw_abd.nem"
	even

SeesawGfxC:
	incbin	"gfx/r8/seesaw_c.nem"
	even

RotatePlatformGfx:
	incbin	"gfx/r8/rotate_platform.nem"
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

PohBeeGfx:
	incbin	"gfx/r8/poh_bee.nem"
	even

ScarabGfx:
	incbin	"gfx/r8/scarab.nem"
	even

AnimalsGfx:
	incbin	"gfx/r8/animals.nem"
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

BuzzsawSprites:
	include	"sprites/r8/buzzsaw_cd.asm"
	even

RobotTransportSprites:
	include	"sprites/robot_transport.asm"

Padding3:
	incbin	"../padding/r81d_e_3.bin"

; ------------------------------------------------------------------------------
