; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R82C)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r82c_e_1.bin"

StageChunks:
	incbin	"src/maps/r82c/chunks.bin"
	even

Ani_21DA00:
	include	"src/data/r82c/Ani_21DA00.asm"
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
	incbin	"src/data/r82c/LaserGfx.bin"
	even

TitleCardTextGfx:
	incbin	"src/gfx/r8/title_card_text.nem"
	even

byte_21DF96:
	incbin	"src/data/r82c/byte_21DF96.bin"
	even

byte_21E096:
	incbin	"src/data/r82c/byte_21E096.bin"
	even

byte_21E196:
	incbin	"src/data/r82c/byte_21E196.bin"
	even

byte_21E296:
	incbin	"src/data/r82c/byte_21E296.bin"
	even

byte_21E396:
	incbin	"src/data/r82c/byte_21E396.bin"
	even

byte_21E496:
	incbin	"src/data/r82c/byte_21E496.bin"
	even

byte_21E596:
	incbin	"src/data/r82c/byte_21E596.bin"
	even

byte_21E696:
	incbin	"src/data/r82c/byte_21E696.bin"
	even

byte_21E896:
	incbin	"src/data/r82c/byte_21E896.bin"
	even

byte_21EA96:
	incbin	"src/data/r82c/byte_21EA96.bin"
	even

byte_21EC96:
	incbin	"src/data/r82c/byte_21EC96.bin"
	even

byte_21EE96:
	incbin	"src/data/r82c/byte_21EE96.bin"
	even

byte_21EF16:
	incbin	"src/data/r82c/byte_21EF16.bin"
	even

byte_21EF96:
	incbin	"src/data/r82c/byte_21EF96.bin"
	even

byte_21F016:
	incbin	"src/data/r82c/byte_21F016.bin"
	even

byte_21F096:
	incbin	"src/data/r82c/byte_21F096.bin"
	even

byte_21F116:
	incbin	"src/data/r82c/byte_21F116.bin"
	even

PowerupAnims:
	include	"src/anims/powerup.asm"
	even

PowerupSprites:
	include	"src/sprites/powerup.asm"
	even

TunnelSplashSprites:
TunnelSplashAnims:
HDoorSprites:
HDoorAnims:
SplashSprites:
SplashAnims:

ExplosionAnims:
	include	"src/anims/explosion.asm"
	even

ExplosionSprites:
	include	"src/sprites/explosion.asm"
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

CapsuleSprites:
CapsuleAnims:

Padding2:
	incbin	"padding/r82c_e_2.bin"

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
	incbin	"src/data/r82c/RevolveDoorGfx.bin"
	even

BossDoorGfx:
	incbin	"src/data/r82c/BossDoorGfx.bin"
	even

BossPanelsGfx1:
	incbin	"src/data/r82c/BossPanelsGfx1.bin"
	even

BossPanelsGfx2:
	incbin	"src/data/r82c/BossPanelsGfx2.bin"
	even

BossPanelsGfx3:
	incbin	"src/data/r82c/BossPanelsGfx3.bin"
	even

BossMachineGfx:
	incbin	"src/data/r82c/BossMachineGfx.bin"
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
	incbin	"src/maps/r82c/collision.bin"
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
	incbin	"src/maps/r82c/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r82c/background.bin"
	even

StageMapNull:
	incbin	"src/data/r82c/StageMapNull.bin"
	even

StageMapUnk1:
	incbin	"src/data/r82c/StageMapUnk1.bin"
	even

StageMapUnk3:
	incbin	"src/data/r82c/StageMapUnk3.bin"
	even

StageMapUnk4:
	incbin	"src/data/r82c/StageMapUnk4.bin"
	even

StageMapUnk2:
	incbin	"src/data/r82c/StageMapUnk2.bin"
	even

StageMapUnk5:
	incbin	"src/data/r82c/StageMapUnk5.bin"
	even

StageBlocks:
	incbin	"src/maps/r82c/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r82c/gfx.nem"
	even

DoorGfx:
	incbin	"src/gfx/r8/door.nem"
	even

SpikesGfx:
	incbin	"src/gfx/r8/spikes.nem"
	even

CrusherGfx:
	incbin	"src/data/r82c/CrusherGfx.bin"
	even

CollapseFloorGfx:
	incbin	"src/data/r82c/CollapseFloorGfx.bin"
	even

BigbomGfx:
	incbin	"src/data/r82c/BigbomGfx.bin"
	even

TrapDoorGfx:
	incbin	"src/data/r82c/TrapDoorGfx.bin"
	even

SeesawGfx:
	incbin	"src/data/r82c/SeesawGfx.bin"
	even

SeesawGfxC:
	incbin	"src/data/r82c/SeesawGfxC.bin"
	even

SpikeCrusherGfx:
	incbin	"src/data/r82c/SpikeCrusherGfx.bin"
	even

TwinWalkerGfx:
	incbin	"src/data/r82c/TwinWalkerGfx.bin"
	even

SwitchGfx:
	incbin	"src/gfx/r8/switch.nem"
	even

SpringWheelGfx:
	incbin	"src/gfx/spring_wheel.nem"
	even

MechaBuGfx:
	incbin	"src/data/r82c/MechaBuGfx.bin"
	even

TubeCoverGfx:
	incbin	"src/data/r82c/TubeCoverGfx.bin"
	even

AnimalGfx:
	incbin	"src/gfx/r8/animals.nem"
	even

DangoGfx:
	incbin	"src/data/r82c/DangoGfx.bin"
	even

RobotGeneratorDecayGfx:
	incbin	"src/gfx/r8/robot_generator_decay.nem"
	even

RobotGeneratorGfx:
	incbin	"src/gfx/r8/robot_generator.nem"
	even

unk_23E876:
	incbin	"src/data/r82c/unk_23E876.bin"
	even

RobotGeneratorSprites:
	include	"src/data/r82c/RobotGeneratorSprites.asm"
	even

Spr_23C15C:
	dc.w	@Spr_23C186_0-*
	dc.w	@Spr_23C186_1-Spr_23C15C
	dc.w	@Spr_23C186_2-Spr_23C15C
	dc.w	@Spr_23C186_3-Spr_23C15C
	dc.w	@Spr_23C15C_4-Spr_23C15C
	dc.w	@Spr_23C186_5-Spr_23C15C
	dc.w	@Spr_23C186_6-Spr_23C15C
	dc.w	@Spr_23C186_7-Spr_23C15C
	dc.w	@Spr_23C186_8-Spr_23C15C
	dc.w	@Spr_23C186_9-Spr_23C15C
	dc.w	@Spr_23C186_A-Spr_23C15C
	dc.w	@Spr_23C186_B-Spr_23C15C
	dc.w	@Spr_23C186_C-Spr_23C15C
	dc.w	@Spr_23C15C_D-Spr_23C15C
	dc.w	@Spr_23C15C_E-Spr_23C15C
	dc.w	@Spr_23C15C_F-Spr_23C15C
	dc.w	@Spr_23C15C_10-Spr_23C15C
	dc.w	@Spr_23C15C_11-Spr_23C15C
	dc.w	@Spr_23C15C_12-Spr_23C15C
	dc.w	@Spr_23C15C_13-Spr_23C15C
	dc.w	@Spr_23C15C_14-Spr_23C15C

Spr_23C186:
	dc.w	@Spr_23C186_0-*
	dc.w	@Spr_23C186_1-Spr_23C186
	dc.w	@Spr_23C186_2-Spr_23C186
	dc.w	@Spr_23C186_3-Spr_23C186
	dc.w	@Spr_23C186_4-Spr_23C186
	dc.w	@Spr_23C186_5-Spr_23C186
	dc.w	@Spr_23C186_6-Spr_23C186
	dc.w	@Spr_23C186_7-Spr_23C186
	dc.w	@Spr_23C186_8-Spr_23C186
	dc.w	@Spr_23C186_9-Spr_23C186
	dc.w	@Spr_23C186_A-Spr_23C186
	dc.w	@Spr_23C186_B-Spr_23C186
	dc.w	@Spr_23C186_C-Spr_23C186
	dc.w	@Spr_23C186_D-Spr_23C186
	dc.w	@Spr_23C186_E-Spr_23C186
	dc.w	@Spr_23C186_F-Spr_23C186
	dc.w	@Spr_23C186_10-Spr_23C186
	dc.w	@Spr_23C186_11-Spr_23C186
	dc.w	@Spr_23C186_12-Spr_23C186
	dc.w	@Spr_23C186_13-Spr_23C186
	dc.w	@Spr_23C186_14-Spr_23C186

@Spr_23C186_0:
	dc.b	2
	dc.b	$F4, 2, 0, 0, $F8
	dc.b	$F4, 2, 8, 0, 0
	dc.b	0

@Spr_23C186_1:
	dc.b	2
	dc.b	$F4, 2, 0, 3, $F8
	dc.b	$F4, 2, 8, 3, 0
	dc.b	0

@Spr_23C186_2:
	dc.b	2
	dc.b	$F4, 2, 0, 6, $F8
	dc.b	$F4, 2, 8, 6, 0
	dc.b	0

@Spr_23C186_3:
	dc.b	2
	dc.b	$FC, 0, 0, $C, $F8
	dc.b	$FC, 0, 8, $C, 0
	dc.b	0

@Spr_23C15C_4:
	dc.b	2
	dc.b	$FC, 0, 0, $D, $F8
	dc.b	$FC, 0, 8, $D, 0
	dc.b	0

@Spr_23C186_5:
	dc.b	2
	dc.b	$FC, 0, 0, 9, $FC
	dc.b	$F4, 0, 0, 9, $FC
	dc.b	0

@Spr_23C186_6:
	dc.b	4
	dc.b	$FC, 0, 0, 9, $FC
	dc.b	$F4, 0, 0, 9, $FC
	dc.b	$EC, 0, 0, 9, $FC
	dc.b	$E4, 0, 0, 9, $FC
	dc.b	0

@Spr_23C186_7:
	dc.b	6
	dc.b	$FC, 0, 0, 9, $FC
	dc.b	$F4, 0, 0, 9, $FC
	dc.b	$EC, 0, 0, 9, $FC
	dc.b	$E4, 0, 0, 9, $FC
	dc.b	$DC, 0, 0, 9, $FC
	dc.b	$D4, 0, 0, 9, $FC
	dc.b	0

@Spr_23C186_8:
	dc.b	8
	dc.b	$FC, 0, 0, 9, $FC
	dc.b	$F4, 0, 0, 9, $FC
	dc.b	$EC, 0, 0, 9, $FC
	dc.b	$E4, 0, 0, 9, $FC
	dc.b	$DC, 0, 0, 9, $FC
	dc.b	$D4, 0, 0, 9, $FC
	dc.b	$CC, 0, 0, 9, $FC
	dc.b	$C4, 0, 0, 9, $FC
	dc.b	0

@Spr_23C186_9:
	dc.b	$A
	dc.b	$FC, 0, 0, 9, $FC
	dc.b	$F4, 0, 0, 9, $FC
	dc.b	$EC, 0, 0, 9, $FC
	dc.b	$E4, 0, 0, 9, $FC
	dc.b	$DC, 0, 0, 9, $FC
	dc.b	$D4, 0, 0, 9, $FC
	dc.b	$CC, 0, 0, 9, $FC
	dc.b	$C4, 0, 0, 9, $FC
	dc.b	$BC, 0, 0, 9, $FC
	dc.b	$B4, 0, 0, 9, $FC
	dc.b	0

@Spr_23C186_A:
	dc.b	$C
	dc.b	$FC, 0, 0, 9, $FC
	dc.b	$F4, 0, 0, 9, $FC
	dc.b	$EC, 0, 0, 9, $FC
	dc.b	$E4, 0, 0, 9, $FC
	dc.b	$DC, 0, 0, 9, $FC
	dc.b	$D4, 0, 0, 9, $FC
	dc.b	$CC, 0, 0, 9, $FC
	dc.b	$C4, 0, 0, 9, $FC
	dc.b	$BC, 0, 0, 9, $FC
	dc.b	$B4, 0, 0, 9, $FC
	dc.b	$AC, 0, 0, 9, $FC
	dc.b	$A4, 0, 0, 9, $FC
	dc.b	0

@Spr_23C186_B:
	dc.b	$E
	dc.b	$FC, 0, 0, 9, $FC
	dc.b	$F4, 0, 0, 9, $FC
	dc.b	$EC, 0, 0, 9, $FC
	dc.b	$E4, 0, 0, 9, $FC
	dc.b	$DC, 0, 0, 9, $FC
	dc.b	$D4, 0, 0, 9, $FC
	dc.b	$CC, 0, 0, 9, $FC
	dc.b	$C4, 0, 0, 9, $FC
	dc.b	$BC, 0, 0, 9, $FC
	dc.b	$B4, 0, 0, 9, $FC
	dc.b	$AC, 0, 0, 9, $FC
	dc.b	$A4, 0, 0, 9, $FC
	dc.b	$9C, 0, 0, 9, $FC
	dc.b	$94, 0, 0, 9, $FC
	dc.b	0

@Spr_23C186_C:
	dc.b	$10
	dc.b	$FC, 0, 0, 9, $FC
	dc.b	$F4, 0, 0, 9, $FC
	dc.b	$EC, 0, 0, 9, $FC
	dc.b	$E4, 0, 0, 9, $FC
	dc.b	$DC, 0, 0, 9, $FC
	dc.b	$D4, 0, 0, 9, $FC
	dc.b	$CC, 0, 0, 9, $FC
	dc.b	$C4, 0, 0, 9, $FC
	dc.b	$BC, 0, 0, 9, $FC
	dc.b	$B4, 0, 0, 9, $FC
	dc.b	$AC, 0, 0, 9, $FC
	dc.b	$A4, 0, 0, 9, $FC
	dc.b	$9C, 0, 0, 9, $FC
	dc.b	$94, 0, 0, 9, $FC
	dc.b	$8C, 0, 0, 9, $FC
	dc.b	$84, 0, 0, 9, $FC
	dc.b	0

@Spr_23C15C_D:
	dc.b	2
	dc.b	$FC, 0, 0, $A, $FC
	dc.b	$F4, 0, 0, $A, $FC
	dc.b	0

@Spr_23C15C_E:
	dc.b	4
	dc.b	$FC, 0, 0, $A, $FC
	dc.b	$F4, 0, 0, $A, $FC
	dc.b	$EC, 0, 0, $A, $FC
	dc.b	$E4, 0, 0, $A, $FC
	dc.b	0

@Spr_23C15C_F:
	dc.b	6
	dc.b	$FC, 0, 0, $A, $FC
	dc.b	$F4, 0, 0, $A, $FC
	dc.b	$EC, 0, 0, $A, $FC
	dc.b	$E4, 0, 0, $A, $FC
	dc.b	$DC, 0, 0, $A, $FC
	dc.b	$D4, 0, 0, $A, $FC
	dc.b	0

@Spr_23C15C_10:
	dc.b	8
	dc.b	$FC, 0, 0, $A, $FC
	dc.b	$F4, 0, 0, $A, $FC
	dc.b	$EC, 0, 0, $A, $FC
	dc.b	$E4, 0, 0, $A, $FC
	dc.b	$DC, 0, 0, $A, $FC
	dc.b	$D4, 0, 0, $A, $FC
	dc.b	$CC, 0, 0, $A, $FC
	dc.b	$C4, 0, 0, $A, $FC
	dc.b	0

@Spr_23C15C_11:
	dc.b	$A
	dc.b	$FC, 0, 0, $A, $FC
	dc.b	$F4, 0, 0, $A, $FC
	dc.b	$EC, 0, 0, $A, $FC
	dc.b	$E4, 0, 0, $A, $FC
	dc.b	$DC, 0, 0, $A, $FC
	dc.b	$D4, 0, 0, $A, $FC
	dc.b	$CC, 0, 0, $A, $FC
	dc.b	$C4, 0, 0, $A, $FC
	dc.b	$BC, 0, 0, $A, $FC
	dc.b	$B4, 0, 0, $A, $FC
	dc.b	0

@Spr_23C15C_12:
	dc.b	$C
	dc.b	$FC, 0, 0, $A, $FC
	dc.b	$F4, 0, 0, $A, $FC
	dc.b	$EC, 0, 0, $A, $FC
	dc.b	$E4, 0, 0, $A, $FC
	dc.b	$DC, 0, 0, $A, $FC
	dc.b	$D4, 0, 0, $A, $FC
	dc.b	$CC, 0, 0, $A, $FC
	dc.b	$C4, 0, 0, $A, $FC
	dc.b	$BC, 0, 0, $A, $FC
	dc.b	$B4, 0, 0, $A, $FC
	dc.b	$AC, 0, 0, $A, $FC
	dc.b	$A4, 0, 0, $A, $FC
	dc.b	0

@Spr_23C15C_13:
	dc.b	$E
	dc.b	$FC, 0, 0, $A, $FC
	dc.b	$F4, 0, 0, $A, $FC
	dc.b	$EC, 0, 0, $A, $FC
	dc.b	$E4, 0, 0, $A, $FC
	dc.b	$DC, 0, 0, $A, $FC
	dc.b	$D4, 0, 0, $A, $FC
	dc.b	$CC, 0, 0, $A, $FC
	dc.b	$C4, 0, 0, $A, $FC
	dc.b	$BC, 0, 0, $A, $FC
	dc.b	$B4, 0, 0, $A, $FC
	dc.b	$AC, 0, 0, $A, $FC
	dc.b	$A4, 0, 0, $A, $FC
	dc.b	$9C, 0, 0, $A, $FC
	dc.b	$94, 0, 0, $A, $FC
	dc.b	0

@Spr_23C15C_14:
	dc.b	$10
	dc.b	$FC, 0, 0, $A, $FC
	dc.b	$F4, 0, 0, $A, $FC
	dc.b	$EC, 0, 0, $A, $FC
	dc.b	$E4, 0, 0, $A, $FC
	dc.b	$DC, 0, 0, $A, $FC
	dc.b	$D4, 0, 0, $A, $FC
	dc.b	$CC, 0, 0, $A, $FC
	dc.b	$C4, 0, 0, $A, $FC
	dc.b	$BC, 0, 0, $A, $FC
	dc.b	$B4, 0, 0, $A, $FC
	dc.b	$AC, 0, 0, $A, $FC
	dc.b	$A4, 0, 0, $A, $FC
	dc.b	$9C, 0, 0, $A, $FC
	dc.b	$94, 0, 0, $A, $FC
	dc.b	$8C, 0, 0, $A, $FC
	dc.b	$84, 0, 0, $A, $FC
	dc.b	0

@Spr_23C186_D:
	dc.b	2
	dc.b	$FC, 0, 0, $B, $FC
	dc.b	$F4, 0, 0, $B, $FC
	dc.b	0

@Spr_23C186_E:
	dc.b	4
	dc.b	$FC, 0, 0, $B, $FC
	dc.b	$F4, 0, 0, $B, $FC
	dc.b	$EC, 0, 0, $B, $FC
	dc.b	$E4, 0, 0, $B, $FC
	dc.b	0

@Spr_23C186_F:
	dc.b	6
	dc.b	$FC, 0, 0, $B, $FC
	dc.b	$F4, 0, 0, $B, $FC
	dc.b	$EC, 0, 0, $B, $FC
	dc.b	$E4, 0, 0, $B, $FC
	dc.b	$DC, 0, 0, $B, $FC
	dc.b	$D4, 0, 0, $B, $FC
	dc.b	0

@Spr_23C186_10:
	dc.b	8
	dc.b	$FC, 0, 0, $B, $FC
	dc.b	$F4, 0, 0, $B, $FC
	dc.b	$EC, 0, 0, $B, $FC
	dc.b	$E4, 0, 0, $B, $FC
	dc.b	$DC, 0, 0, $B, $FC
	dc.b	$D4, 0, 0, $B, $FC
	dc.b	$CC, 0, 0, $B, $FC
	dc.b	$C4, 0, 0, $B, $FC
	dc.b	0

@Spr_23C186_11:
	dc.b	$A
	dc.b	$FC, 0, 0, $B, $FC
	dc.b	$F4, 0, 0, $B, $FC
	dc.b	$EC, 0, 0, $B, $FC
	dc.b	$E4, 0, 0, $B, $FC
	dc.b	$DC, 0, 0, $B, $FC
	dc.b	$D4, 0, 0, $B, $FC
	dc.b	$CC, 0, 0, $B, $FC
	dc.b	$C4, 0, 0, $B, $FC
	dc.b	$BC, 0, 0, $B, $FC
	dc.b	$B4, 0, 0, $B, $FC
	dc.b	0

@Spr_23C186_12:
	dc.b	$C
	dc.b	$FC, 0, 0, $B, $FC
	dc.b	$F4, 0, 0, $B, $FC
	dc.b	$EC, 0, 0, $B, $FC
	dc.b	$E4, 0, 0, $B, $FC
	dc.b	$DC, 0, 0, $B, $FC
	dc.b	$D4, 0, 0, $B, $FC
	dc.b	$CC, 0, 0, $B, $FC
	dc.b	$C4, 0, 0, $B, $FC
	dc.b	$BC, 0, 0, $B, $FC
	dc.b	$B4, 0, 0, $B, $FC
	dc.b	$AC, 0, 0, $B, $FC
	dc.b	$A4, 0, 0, $B, $FC
	dc.b	0

@Spr_23C186_13:
	dc.b	$E
	dc.b	$FC, 0, 0, $B, $FC
	dc.b	$F4, 0, 0, $B, $FC
	dc.b	$EC, 0, 0, $B, $FC
	dc.b	$E4, 0, 0, $B, $FC
	dc.b	$DC, 0, 0, $B, $FC
	dc.b	$D4, 0, 0, $B, $FC
	dc.b	$CC, 0, 0, $B, $FC
	dc.b	$C4, 0, 0, $B, $FC
	dc.b	$BC, 0, 0, $B, $FC
	dc.b	$B4, 0, 0, $B, $FC
	dc.b	$AC, 0, 0, $B, $FC
	dc.b	$A4, 0, 0, $B, $FC
	dc.b	$9C, 0, 0, $B, $FC
	dc.b	$94, 0, 0, $B, $FC
	dc.b	0

@Spr_23C186_14:
	dc.b	$10
	dc.b	$FC, 0, 0, $B, $FC
	dc.b	$F4, 0, 0, $B, $FC
	dc.b	$EC, 0, 0, $B, $FC
	dc.b	$E4, 0, 0, $B, $FC
	dc.b	$DC, 0, 0, $B, $FC
	dc.b	$D4, 0, 0, $B, $FC
	dc.b	$CC, 0, 0, $B, $FC
	dc.b	$C4, 0, 0, $B, $FC
	dc.b	$BC, 0, 0, $B, $FC
	dc.b	$B4, 0, 0, $B, $FC
	dc.b	$AC, 0, 0, $B, $FC
	dc.b	$A4, 0, 0, $B, $FC
	dc.b	$9C, 0, 0, $B, $FC
	dc.b	$94, 0, 0, $B, $FC
	dc.b	$8C, 0, 0, $B, $FC
	dc.b	$84, 0, 0, $B, $FC
	dc.b	0

@Spr_23C186_4:
	dc.b	2
	dc.b	$FC, 0, 0, $E, $F8
	dc.b	$FC, 0, 0, $F, 0
	dc.b	0

Padding3:
	incbin	"padding/r82c_e_3.bin"

; ------------------------------------------------------------------------------
