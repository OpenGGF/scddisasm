; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R83D)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		incbin	"../padding/r83d_e_1.bin",0,$4F
		dc.b	$BA
		incbin	"../padding/r83d_e_1.bin",$50,$F3
		dc.b	$E8
		incbin	"../padding/r83d_e_1.bin",$144,$B
		include	"Level/USA Legacy R8 Animation Records.asm"
		include	"Level/USA Legacy Stage Tail B.asm"
		incbin	"../padding/r83d_e_1.bin",$1B4,$16
	else
		incbin	"../padding/r83d_e_1.bin"
	endif

StageChunks:
	incbin	"maps/r83d/chunks.bin"
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

PlayerGfxScript:
	include	"sprites/r8/player_gfx.asm"

Padding2:
	incbin	"../padding/r83d_e_2.bin"

PlayerGfx:
	incbin	"gfx/r8/player.unc"
	even

PlayerSprites:
	include	"sprites/r8/player.asm"
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
	incbin	"maps/r83d/collision.bin"
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
	incbin	"maps/r83d/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r83d/background.bin"
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
	incbin	"maps/r83d/blocks.nem"
	even

StageGfx:
	incbin	"maps/r83d/gfx.nem"
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

byte_23C27A:
	incbin	"data/r8/byte_2345CA.bin"
	even

byte_23C37A:
	incbin	"data/r8/byte_2346CA.bin"
	even

byte_23C47A:
	incbin	"data/r8/byte_2347CA.bin"
	even

byte_23C57A:
	incbin	"data/r8/byte_2348CA.bin"
	even

byte_23C67A:
	incbin	"data/r8/byte_2349CA.bin"
	even

byte_23C77A:
	incbin	"data/r8/byte_234ACA.bin"
	even

byte_23C87A:
	incbin	"data/r8/byte_234BCA.bin"
	even

byte_23C97A:
	incbin	"data/r8/byte_234CCA.bin"
	even

byte_23CB7A:
	incbin	"data/r8/byte_234ECA.bin"
	even

byte_23CD7A:
	incbin	"data/r8/byte_2350CA.bin"
	even

byte_23CF7A:
	incbin	"data/r8/byte_21F096_d.bin"
	even

byte_23D97A:
	incbin	"data/r8/byte_235CCA.bin"
	even

byte_23D9FA:
	incbin	"data/r8/byte_235D4A.bin"
	even

byte_23DA7A:
	incbin	"data/r8/byte_235DCA.bin"
	even

byte_23DAFA:
	incbin	"data/r8/byte_235E4A.bin"
	even

byte_23DB7A:
	incbin	"data/r8/byte_235ECA.bin"
	even

byte_23DBFA:
	incbin	"data/r8/byte_235F4A.bin"
	even

byte_23DC7A:
	incbin	"data/r8/byte_21FD96.bin"
	even

byte_23DCFA:
	incbin	"data/r8/byte_21FA16.bin"
	even

byte_23DD7A:
	incbin	"data/r8/byte_21FA96.bin"
	even

byte_23DDFA:
	incbin	"data/r8/byte_21FB16.bin"
	even

byte_23DE7A:
	incbin	"data/r8/byte_21FB96.bin"
	even

byte_23DEFA:
	incbin	"data/r8/byte_21FC16.bin"
	even

byte_23DF7A:
	incbin	"data/r8/byte_21FC96.bin"
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

SwitchGfx:
	incbin	"gfx/switch.nem"
	even

SpikePoleGfx:
	incbin	"gfx/r8/spike_pole.nem"
	even

BumperGfx:
	incbin	"gfx/r3/bumper.nem"
	even

BlockGfx:
	incbin	"gfx/r8/block.nem"
	even

RotatePlatformGfx:
	incbin	"gfx/r8/rotate_platform.nem"
	even

BuzzsawGfxABD:
	incbin	"gfx/r8/buzzsaw_abd.nem"
	even

BuzzsawGfxC:
	incbin	"gfx/r8/buzzsaw_c.nem"
	even

SpikeCrusherGfx:
	incbin	"gfx/r8/spike_crusher.nem"
	even

SpringWheelGfx:
	incbin	"gfx/spring_wheel.nem"
	even

MechaBuGfx:
	incbin	"gfx/r8/mecha_bu.nem"
	even

HotaruGfx:
	incbin	"gfx/r8/hotaru.nem"
	even

AnimalsGfx:
	incbin	"gfx/r8/animals.nem"
	even

HotaruSprites:
	include	"sprites/r8/hotaru.asm"
	even

SpikeCrusherSprites:
	include	"sprites/r8/spike_crusher.asm"
	even

BuzzsawSprites:
	include	"sprites/r8/buzzsaw_cd.asm"

Padding3:
	incbin	"../padding/r83d_e_3.bin"

; ------------------------------------------------------------------------------
