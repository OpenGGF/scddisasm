; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R83D)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r83d_e_1.bin"

StageChunks:
	incbin	"src/maps/r83d/chunks.bin"
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

PlayerGfxScript:
	include	"src/sprites/r8/player_gfx.asm"

Padding2:
	incbin	"padding/r83d_e_2.bin"

PlayerGfx:
	incbin	"src/gfx/r8/player.unc"
	even

PlayerSprites:
	include	"src/sprites/r8/player.asm"
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
	incbin	"src/data/r83d/RevolveDoorGfx.bin"
	even

BossDoorGfx:
	incbin	"src/data/r83d/BossDoorGfx.bin"
	even

BossPanelsGfx1:
	incbin	"src/data/r83d/BossPanelsGfx1.bin"
	even

BossPanelsGfx2:
	incbin	"src/data/r83d/BossPanelsGfx2.bin"
	even

BossPanelsGfx3:
	incbin	"src/data/r83d/BossPanelsGfx3.bin"
	even

BossMachineGfx:
	incbin	"src/data/r83d/BossMachineGfx.bin"
	even

unk_2364C4:
	dc.w	Spr_23669C-unk_2364C4
	dc.w	Spr_236746-unk_2364C4
	dc.w	Spr_236804-unk_2364C4
	dc.w	Spr_2368DA-unk_2364C4
	dc.w	Spr_236912-unk_2364C4
	dc.w	Spr_236988-unk_2364C4

Spr_2364D0:
	include	"src/data/r83d/Spr_2364D0.asm"
	even

Spr_2365BC:
	include	"src/data/r83d/Spr_2365BC.asm"
	even

Spr_2365CC:
	include	"src/data/r83d/Spr_2365CC.asm"
	even

Spr_23669C:
	include	"src/data/r83d/Spr_23669C.asm"
	even

Spr_236746:
	include	"src/data/r83d/Spr_236746.asm"
	even

Spr_236804:
	include	"src/data/r83d/Spr_236804.asm"
	even

Spr_2368DA:
	include	"src/data/r83d/Spr_2368DA.asm"
	even

Spr_236912:
	include	"src/data/r83d/Spr_236912.asm"
	even

Spr_236988:
	include	"src/data/r83d/Spr_236988.asm"
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
	incbin	"src/maps/r83d/collision.bin"
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
	incbin	"src/maps/r83d/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r83d/background.bin"
	even

StageMapNull:
	incbin	"src/data/r83d/StageMapNull.bin"
	even

StageMapUnk1:
	incbin	"src/data/r83d/StageMapUnk1.bin"
	even

StageMapUnk3:
	incbin	"src/data/r83d/StageMapUnk3.bin"
	even

StageMapUnk4:
	incbin	"src/data/r83d/StageMapUnk4.bin"
	even

StageMapUnk2:
	incbin	"src/data/r83d/StageMapUnk2.bin"
	even

StageMapUnk5:
	incbin	"src/data/r83d/StageMapUnk5.bin"
	even

StageBlocks:
	incbin	"src/maps/r83d/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r83d/gfx.nem"
	even

Ani_21DA00:
	include	"src/data/r83d/Ani_21DA00.asm"
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
	incbin	"src/data/r83d/LaserGfx.bin"
	even

TitleCardTextGfx:
	incbin	"src/gfx/r8/title_card_text.nem"
	even

byte_23C27A:
	incbin	"src/data/r83d/byte_23C27A.bin"
	even

byte_23C37A:
	incbin	"src/data/r83d/byte_23C37A.bin"
	even

byte_23C47A:
	incbin	"src/data/r83d/byte_23C47A.bin"
	even

byte_23C57A:
	incbin	"src/data/r83d/byte_23C57A.bin"
	even

byte_23C67A:
	incbin	"src/data/r83d/byte_23C67A.bin"
	even

byte_23C77A:
	incbin	"src/data/r83d/byte_23C77A.bin"
	even

byte_23C87A:
	incbin	"src/data/r83d/byte_23C87A.bin"
	even

byte_23C97A:
	incbin	"src/data/r83d/byte_23C97A.bin"
	even

byte_23CB7A:
	incbin	"src/data/r83d/byte_23CB7A.bin"
	even

byte_23CD7A:
	incbin	"src/data/r83d/byte_23CD7A.bin"
	even

byte_23CF7A:
	incbin	"src/data/r83d/byte_23CF7A.bin"
	even

byte_23D97A:
	incbin	"src/data/r83d/byte_23D97A.bin"
	even

byte_23D9FA:
	incbin	"src/data/r83d/byte_23D9FA.bin"
	even

byte_23DA7A:
	incbin	"src/data/r83d/byte_23DA7A.bin"
	even

byte_23DAFA:
	incbin	"src/data/r83d/byte_23DAFA.bin"
	even

byte_23DB7A:
	incbin	"src/data/r83d/byte_23DB7A.bin"
	even

byte_23DBFA:
	incbin	"src/data/r83d/byte_23DBFA.bin"
	even

byte_23DC7A:
	incbin	"src/data/r83d/byte_23DC7A.bin"
	even

byte_23DCFA:
	incbin	"src/data/r83d/byte_23DCFA.bin"
	even

byte_23DD7A:
	incbin	"src/data/r83d/byte_23DD7A.bin"
	even

byte_23DDFA:
	incbin	"src/data/r83d/byte_23DDFA.bin"
	even

byte_23DE7A:
	incbin	"src/data/r83d/byte_23DE7A.bin"
	even

byte_23DEFA:
	incbin	"src/data/r83d/byte_23DEFA.bin"
	even

byte_23DF7A:
	incbin	"src/data/r83d/byte_23DF7A.bin"
	even

DoorGfx:
	incbin	"src/gfx/r8/door.nem"
	even

SpikesGfx:
	incbin	"src/gfx/r8/spikes.nem"
	even

CrusherGfx:
	incbin	"src/data/r83d/CrusherGfx.bin"
	even

CollapseFloorGfx:
	incbin	"src/data/r83d/CollapseFloorGfx.bin"
	even

SwitchGfx:
	incbin	"src/gfx/r8/switch.nem"
	even

SpikePoleGfx:
	incbin	"src/data/r83d/SpikePoleGfx.bin"
	even

BumperGfx:
	incbin	"src/gfx/bumper.nem"
	even

BlockGfx:
	incbin	"src/data/r83d/BlockGfx.bin"
	even

RotatePlatformGfx:
	incbin	"src/data/r83d/RotatePlatformGfx.bin"
	even

BuzzsawGfx:
	incbin	"src/data/r83d/BuzzsawGfx.bin"
	even

BuzzsawGfxC:
	incbin	"src/data/r83d/BuzzsawGfxC.bin"
	even

SpikeCrusherGfx:
	incbin	"src/data/r83d/SpikeCrusherGfx.bin"
	even

SpringWheelGfx:
	incbin	"src/gfx/spring_wheel.nem"
	even

MechaBuGfx:
	incbin	"src/data/r83d/MechaBuGfx.bin"
	even

HotaruGfx:
	incbin	"src/data/r83d/HotaruGfx.bin"
	even

AnimalGfx:
	incbin	"src/gfx/r8/animals.nem"
	even

Spr_23E2CE:
	include	"src/data/r83d/Spr_23E2CE.asm"
	even

Spr_23E35A:
	include	"src/data/r83d/Spr_23E35A.asm"
	even

Spr_23EBF2:
	include	"src/data/r83d/Spr_23EBF2.asm"

Padding3:
	incbin	"padding/r83d_e_3.bin"

; ------------------------------------------------------------------------------
