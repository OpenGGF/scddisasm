; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R82D)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r82d_e_1.bin"

StageChunks:
	incbin	"src/maps/r82d/chunks.bin"
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

byte_21DF96:
	incbin	"src/data/r8/byte_2345CA.bin"
	even

byte_21E096:
	incbin	"src/data/r8/byte_2346CA.bin"
	even

byte_21E196:
	incbin	"src/data/r8/byte_2347CA.bin"
	even

byte_21E296:
	incbin	"src/data/r8/byte_2348CA.bin"
	even

byte_21E396:
	incbin	"src/data/r8/byte_2349CA.bin"
	even

byte_21E496:
	incbin	"src/data/r8/byte_234ACA.bin"
	even

byte_21E596:
	incbin	"src/data/r8/byte_234BCA.bin"
	even

byte_21E696:
	incbin	"src/data/r8/byte_234CCA.bin"
	even

byte_21E896:
	incbin	"src/data/r8/byte_234ECA.bin"
	even

byte_21EA96:
	incbin	"src/data/r8/byte_2350CA.bin"
	even

byte_21EC96:
	incbin	"src/data/r8/byte_21F096_d.bin"
	even

byte_21F696:
	incbin	"src/data/r8/byte_235CCA.bin"
	even

byte_21F716:
	incbin	"src/data/r8/byte_235D4A.bin"
	even

byte_21F796:
	incbin	"src/data/r8/byte_235DCA.bin"
	even

byte_21F816:
	incbin	"src/data/r8/byte_235E4A.bin"
	even

byte_21F896:
	incbin	"src/data/r8/byte_235ECA.bin"
	even

byte_21F916:
	incbin	"src/data/r8/byte_235F4A.bin"
	even

byte_21F996:
	incbin	"src/data/r8/byte_21FD96.bin"
	even

byte_21FA16:
	incbin	"src/data/r8/byte_21FA16.bin"
	even

byte_21FA96:
	incbin	"src/data/r8/byte_21FA96.bin"
	even

byte_21FB16:
	incbin	"src/data/r8/byte_21FB16.bin"
	even

byte_21FB96:
	incbin	"src/data/r8/byte_21FB96.bin"
	even

byte_21FC16:
	incbin	"src/data/r8/byte_21FC16.bin"
	even

byte_21FC96:
	incbin	"src/data/r8/byte_21FC96.bin"

Padding2:
	incbin	"padding/r82d_e_2.bin"

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

WarpGfx:
	incbin	"src/gfx/warp.unc"
	even

Spring45Gfx:
	incbin	"src/gfx/spring_45.nem"
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

LivesIconsGfx:
	incbin	"src/gfx/lives_icons.unc"
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
	incbin	"src/maps/r82d/collision.bin"
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
	incbin	"src/maps/r82d/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r82d/background.bin"
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
	incbin	"src/maps/r82d/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r82d/gfx.nem"
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

DoorGfx:
	incbin	"src/gfx/r8/door.nem"
	even

SpikesV4Gfx:
	incbin	"src/gfx/spikes_v4.nem"
	even

CrusherGfx:
	incbin	"src/gfx/r8/crusher.nem"
	even

CollapseFloorGfx:
	incbin	"src/gfx/r8/collapse_floor.nem"
	even

BigbomGfx:
	incbin	"src/gfx/r8/bigbom.nem"
	even

TrapDoorGfx:
	incbin	"src/gfx/r8/trap_door.nem"
	even

SeesawGfxABD:
	incbin	"src/gfx/r8/seesaw_abd.nem"
	even

SeesawGfxC:
	incbin	"src/gfx/r8/seesaw_c.nem"
	even

SpikeCrusherGfx:
	incbin	"src/gfx/r8/spike_crusher.nem"
	even

TwinWalkerGfx:
	incbin	"src/gfx/r8/twin_walker.nem"
	even

SwitchGfx:
	incbin	"src/gfx/switch.nem"
	even

SpringWheelGfx:
	incbin	"src/gfx/spring_wheel.nem"
	even

MechaBuGfx:
	incbin	"src/gfx/r8/mecha_bu.nem"
	even

TubeCoverGfx:
	incbin	"src/gfx/r8/tube_cover.nem"
	even

AnimalsGfx:
	incbin	"src/gfx/r8/animals.nem"
	even

DangoGfx:
	incbin	"src/gfx/r8/dango.nem"
	even

RobotTransporterGfxA:
	incbin	"src/gfx/robot_transporter_a.nem"
	even

RobotTransporterGfxB:
	incbin	"src/gfx/robot_transporter_b.nem"
	even

unk_23E876:
	incbin	"src/data/r8/unk_23E876.bin"
	even

RobotGeneratorSprites:
	include	"src/sprites/r8/robot_generator_2.asm"
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
	incbin	"padding/r82d_e_3.bin"

; ------------------------------------------------------------------------------
