; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R83C)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r83c_e_1.bin"

StageChunks:
	incbin	"src/maps/r83c/chunks.bin"
	even

Ani_21DA00:
	include	"src/anims/r8/Ani_21DA00.asm"
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
	incbin	"src/gfx/r8/laser.nem"
	even

TitleCardTextGfx:
	incbin	"src/gfx/r8/title_card_text.nem"
	even

byte_21E396:
	incbin	"src/data/r8/byte_2345CA_c.bin"
	even

byte_21E496:
	incbin	"src/data/r8/byte_2346CA_c.bin"
	even

byte_21E596:
	incbin	"src/data/r8/byte_2347CA_c.bin"
	even

byte_21E696:
	incbin	"src/data/r8/byte_2348CA_c.bin"
	even

byte_21E796:
	incbin	"src/data/r8/byte_2349CA_c.bin"
	even

byte_21E896:
	incbin	"src/data/r8/byte_234ACA_c.bin"
	even

byte_21E996:
	incbin	"src/data/r8/byte_234BCA_c.bin"
	even

byte_21EA96:
	incbin	"src/data/r8/byte_234CCA_c.bin"
	even

byte_21EC96:
	incbin	"src/data/r8/byte_234ECA_c.bin"
	even

byte_21EE96:
	incbin	"src/data/r8/byte_2350CA_c.bin"
	even

byte_21F096:
	incbin	"src/data/r8/byte_21EC96_c.bin"
	even

byte_21F296:
	incbin	"src/data/r8/byte_21FA16.bin"
	even

byte_21F316:
	incbin	"src/data/r8/byte_21FA96.bin"
	even

byte_21F396:
	incbin	"src/data/r8/byte_21FB16.bin"
	even

byte_21F416:
	incbin	"src/data/r8/byte_21FB96.bin"
	even

byte_21F496:
	incbin	"src/data/r8/byte_21FC16.bin"
	even

byte_21F516:
	incbin	"src/data/r8/byte_21FC96.bin"

Padding2:
	incbin	"padding/r83c_e_2.bin"

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

RevolveDoorGfx:
	incbin	"src/gfx/r8/revolve_door.nem"
	even

BossDoorGfx:
	incbin	"src/gfx/r8/boss_door.nem"
	even

BossPanelsGfx1:
	incbin	"src/gfx/r8/boss_panels_1.nem"
	even

BossPanelsGfx2:
	incbin	"src/gfx/r8/boss_panels_2.nem"
	even

BossPanelsGfx3:
	incbin	"src/gfx/r8/boss_panels_3.nem"
	even

BossMachineGfx:
	incbin	"src/gfx/r8/boss_machine.nem"
	even

unk_2364C4:
	dc.w	Spr_23669C-unk_2364C4
	dc.w	Spr_236746-unk_2364C4
	dc.w	Spr_236804-unk_2364C4
	dc.w	Spr_2368DA-unk_2364C4
	dc.w	Spr_236912-unk_2364C4
	dc.w	Spr_236988-unk_2364C4

Spr_2364D0:
	include	"src/sprites/r8/Spr_2364D0.asm"
	even

Spr_2365BC:
	include	"src/sprites/r8/Spr_2365BC.asm"
	even

Spr_2365CC:
	include	"src/sprites/r8/Spr_2365CC.asm"
	even

Spr_23669C:
	include	"src/sprites/r8/Spr_23669C.asm"
	even

Spr_236746:
	include	"src/sprites/r8/Spr_236746.asm"
	even

Spr_236804:
	include	"src/sprites/r8/Spr_236804.asm"
	even

Spr_2368DA:
	include	"src/sprites/r8/Spr_2368DA.asm"
	even

Spr_236912:
	include	"src/sprites/r8/Spr_236912.asm"
	even

Spr_236988:
	include	"src/sprites/r8/Spr_236988.asm"
	even

AmyRoseGfx:
	incbin	"src/gfx/r8/amy_rose.nem"
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
	incbin	"src/maps/r83c/collision.bin"
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
	incbin	"src/maps/r83c/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r83c/background.bin"
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
	incbin	"src/maps/r83c/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r83c/gfx.nem"
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

DoorGfx:
	incbin	"src/gfx/r8/door.nem"
	even

SpikesGfx:
	incbin	"src/gfx/r8/spikes.nem"
	even

CrusherGfx:
	incbin	"src/gfx/r8/crusher.nem"
	even

CollapseFloorGfx:
	incbin	"src/gfx/r8/collapse_floor.nem"
	even

SwitchGfx:
	incbin	"src/gfx/r8/switch.nem"
	even

SpikePoleGfx:
	incbin	"src/gfx/r8/spike_pole.nem"
	even

BumperGfx:
	incbin	"src/gfx/bumper.nem"
	even

BlockGfx:
	incbin	"src/gfx/r8/block.nem"
	even

RotatePlatformGfx:
	incbin	"src/gfx/r8/rotate_platform.nem"
	even

BuzzsawGfx:
	incbin	"src/gfx/r8/buzzsaw.nem"
	even

BuzzsawGfxC:
	incbin	"src/gfx/r8/buzzsaw_c.nem"
	even

SpikeCrusherGfx:
	incbin	"src/gfx/r8/spike_crusher.nem"
	even

SpringWheelGfx:
	incbin	"src/gfx/spring_wheel.nem"
	even

MechaBuGfx:
	incbin	"src/gfx/r8/mecha_bu.nem"
	even

HotaruGfx:
	incbin	"src/gfx/r8/hotaru.nem"
	even

AnimalGfx:
	incbin	"src/gfx/r8/animals.nem"
	even

Spr_23E2CE:
	include	"src/sprites/r8/Spr_23E2CE.asm"
	even

Spr_23E35A:
	include	"src/sprites/r8/Spr_23E35A.asm"
	even

Spr_23EBF2:
	include	"src/sprites/r8/Spr_23EBF2_2.asm"

Padding3:
	incbin	"padding/r83c_e_3.bin"

; ------------------------------------------------------------------------------
