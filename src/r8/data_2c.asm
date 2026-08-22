; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R82C)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		incbin	"../padding/r82c_e_1.bin",0,$6E
		include	"Level/USA Legacy Stage Tail B.asm"
		incbin	"../padding/r82c_e_1.bin",$6E,$16
	else
		incbin	"../padding/r82c_e_1.bin"
	endif

StageChunks:
	incbin	"maps/r82c/chunks.bin"
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
	incbin	"data/r8/byte_2345CA_c.bin"
	even

byte_21E096:
	incbin	"data/r8/byte_2346CA_c.bin"
	even

byte_21E196:
	incbin	"data/r8/byte_2347CA_c.bin"
	even

byte_21E296:
	incbin	"data/r8/byte_2348CA_c.bin"
	even

byte_21E396:
	incbin	"data/r8/byte_2349CA_c.bin"
	even

byte_21E496:
	incbin	"data/r8/byte_234ACA_c.bin"
	even

byte_21E596:
	incbin	"data/r8/byte_234BCA_c.bin"
	even

byte_21E696:
	incbin	"data/r8/byte_234CCA_c.bin"
	even

byte_21E896:
	incbin	"data/r8/byte_234ECA_c.bin"
	even

byte_21EA96:
	incbin	"data/r8/byte_2350CA_c.bin"
	even

byte_21EC96:
	incbin	"data/r8/byte_21EC96_c.bin"
	even

byte_21EE96:
	incbin	"data/r8/byte_21FA16.bin"
	even

byte_21EF16:
	incbin	"data/r8/byte_21FA96.bin"
	even

byte_21EF96:
	incbin	"data/r8/byte_21FB16.bin"
	even

byte_21F016:
	incbin	"data/r8/byte_21FB96.bin"
	even

byte_21F096:
	incbin	"data/r8/byte_21FC16.bin"
	even

byte_21F116:
	incbin	"data/r8/byte_21FC96.bin"
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

Padding2:
	incbin	"../padding/r82c_e_2.bin"

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

RevolveDoorGfx:
	incbin	"gfx/r8/revolve_door.nem"
	even

BossDoorGfx:
	incbin	"gfx/r8/boss_door.nem"
	even

BossPanelsGfx1:
	incbin	"gfx/r8/boss_panels_1.nem"
	even

BossPanelsGfx2:
	incbin	"gfx/r8/boss_panels_2.nem"
	even

BossPanelsGfx3:
	incbin	"gfx/r8/boss_panels_3.nem"
	even

BossMachineGfx:
	incbin	"gfx/r8/boss_machine.nem"
	even

BossPanelSprites:
	dc.w	BossPanelSprites1-BossPanelSprites
	dc.w	BossPanelSprites2-BossPanelSprites
	dc.w	BossPanelSprites3-BossPanelSprites
	dc.w	BossPanelSprites4-BossPanelSprites
	dc.w	BossPanelSprites5-BossPanelSprites
	dc.w	BossPanelSprites6-BossPanelSprites

EggMobileSprites:
	include	"sprites/r8/eggmobile.asm"
	even

SparksSprites:
	include	"sprites/r8/sparks.asm"
	even

EggmanSprites:
	include	"sprites/r8/eggman.asm"
	even

BossPanelSprites1:
	include	"sprites/r8/boss_panel_1.asm"
	even

BossPanelSprites2:
	include	"sprites/r8/boss_panel_2.asm"
	even

BossPanelSprites3:
	include	"sprites/r8/boss_panel_3.asm"
	even

BossPanelSprites4:
	include	"sprites/r8/boss_panel_4.asm"
	even

BossPanelSprites5:
	include	"sprites/r8/boss_panel_5.asm"
	even

BossPanelSprites6:
	include	"sprites/r8/boss_panel_6.asm"
	even

AmyRoseGfx:
	incbin	"gfx/r8/amy_rose.nem"
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
	incbin	"maps/r82c/collision.bin"
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
	incbin	"maps/r82c/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r82c/background.bin"
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
	incbin	"maps/r82c/blocks.nem"
	even

StageGfx:
	incbin	"maps/r82c/gfx.nem"
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

Padding3:
	incbin	"../padding/r82c_e_3.bin"

; ------------------------------------------------------------------------------
