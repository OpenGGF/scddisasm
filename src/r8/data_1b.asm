; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R81B)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r81b_e_1.bin"

StageChunks:
	incbin	"src/maps/r81b/chunks.bin"

Padding2:
	incbin	"padding/r81b_e_2.bin"

PlayerGfx:
	incbin	"src/gfx/r8/player.unc"
	even

PlayerSprites:
	include	"src/sprites/r8/player.asm"
	even

PlayerGfxScript:
	include	"src/sprites/r8/player_gfx.asm"
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

Ani_21DA00:
	include	"src/data/r81b/Ani_21DA00.asm"
	even

FlowerAnims:
	include	"src/anims/flower.asm"
	even

FlowerSprites:
	include	"src/sprites/r8/flower.asm"
	even

FlowerGfx:
	incbin	"src/gfx/r8/flower.nem"
	even

LaserGfx:
	incbin	"src/data/r81b/LaserGfx.bin"
	even

TitleCardTextGfx:
	incbin	"src/gfx/r8/title_card_text.nem"
	even

byte_2345CA:
	incbin	"src/data/r81b/byte_2345CA.bin"
	even

byte_2346CA:
	incbin	"src/data/r81b/byte_2346CA.bin"
	even

byte_2347CA:
	incbin	"src/data/r81b/byte_2347CA.bin"
	even

byte_2348CA:
	incbin	"src/data/r81b/byte_2348CA.bin"
	even

byte_2349CA:
	incbin	"src/data/r81b/byte_2349CA.bin"
	even

byte_234ACA:
	incbin	"src/data/r81b/byte_234ACA.bin"
	even

byte_234BCA:
	incbin	"src/data/r81b/byte_234BCA.bin"
	even

byte_234CCA:
	incbin	"src/data/r81b/byte_234CCA.bin"
	even

byte_234ECA:
	incbin	"src/data/r81b/byte_234ECA.bin"
	even

byte_2350CA:
	incbin	"src/data/r81b/byte_2350CA.bin"
	even

byte_2352CA:
	incbin	"src/data/r81b/byte_2352CA.bin"
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
	incbin	"src/maps/r81b/collision.bin"
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
	incbin	"src/maps/r81b/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r81b/background.bin"
	even

StageMapNull:
	incbin	"src/data/r81b/StageMapNull.bin"
	even

StageMapUnk1:
	incbin	"src/data/r81b/StageMapUnk1.bin"
	even

StageMapUnk3:
	incbin	"src/data/r81b/StageMapUnk3.bin"
	even

StageMapUnk4:
	incbin	"src/data/r81b/StageMapUnk4.bin"
	even

StageMapUnk2:
	incbin	"src/data/r81b/StageMapUnk2.bin"
	even

StageMapUnk5:
	incbin	"src/data/r81b/StageMapUnk5.bin"
	even

StageBlocks:
	incbin	"src/maps/r81b/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r81b/gfx.nem"
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
	incbin	"src/data/r81b/byte_21D7A6.bin"
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

DoorGfx:
	incbin	"src/gfx/r8/door.nem"
	even

SpikesGfx:
	incbin	"src/gfx/r8/spikes.nem"
	even

CrusherGfx:
	incbin	"src/data/r81b/CrusherGfx.bin"
	even

CollapseFloorGfx:
	incbin	"src/data/r81b/CollapseFloorGfx.bin"
	even

VanishPlatformGfx:
	incbin	"src/data/r81b/VanishPlatformGfx.bin"
	even

PropellerGfx:
	incbin	"src/data/r81b/PropellerGfx.bin"
	even

BuzzsawGfx:
	incbin	"src/data/r81b/BuzzsawGfx.bin"
	even

BuzzsawGfxC:
	incbin	"src/data/r81b/BuzzsawGfxC.bin"
	even

TrapDoorGfx:
	incbin	"src/data/r81b/TrapDoorGfx.bin"
	even

HVPlatformGfx:
	incbin	"src/data/r81b/HVPlatformGfx.bin"
	even

SeesawGfx:
	incbin	"src/data/r81b/SeesawGfx.bin"
	even

SeesawGfxC:
	incbin	"src/data/r81b/SeesawGfxC.bin"
	even

RotatePlatformGfx:
	incbin	"src/data/r81b/RotatePlatformGfx.bin"
	even

SwitchGfx:
	incbin	"src/gfx/r8/switch.nem"
	even

SpringWheelGfx:
	incbin	"src/gfx/spring_wheel.nem"
	even

MechaBuGfx:
	incbin	"src/data/r81b/MechaBuGfx.bin"
	even

PohBeeGfx:
	incbin	"src/data/r81b/PohBeeGfx.bin"
	even

ScarabGfx:
	incbin	"src/data/r81b/ScarabGfx.bin"
	even

AnimalGfx:
	incbin	"src/gfx/r8/animals.nem"
	even

RobotGeneratorDecayGfx:
	incbin	"src/gfx/r8/robot_generator_decay.nem"
	even

RobotGeneratorGfx:
	incbin	"src/gfx/r8/robot_generator.nem"
	even

unk_23E876:
	incbin	"src/data/r81b/unk_23E876.bin"
	even

Spr_23EBF2:
	include	"src/data/r81b/Spr_23EBF2.asm"
	even

RobotGeneratorSprites:
	include	"src/data/r81b/RobotGeneratorSprites.asm"

Padding3:
	incbin	"padding/r81b_e_3.bin"

; ------------------------------------------------------------------------------
