; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R51B)
; ------------------------------------------------------------------------------

	if REGION=USA
		include	"r5/usa_gfx_tail_1b.asm"
	endif

Padding1:
	if REGION=USA
		include	"r5/usa_pre_chunks_1b.asm"
	else
		incbin	"../padding/r51b_e_1.bin"
	endif

StageChunks:
	incbin	"maps/r51b/chunks.bin"

Padding2:
	incbin	"../padding/r51b_e_2.bin"

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
	include	"sprites/r5/flower.asm"
	even

FlowerGfx:
	incbin	"gfx/r5/flower.nem"
	even

TitleCardTextGfx:
	incbin	"gfx/r5/title_card_text.nem"
	even

BossGfx1:
	incbin	"gfx/r5/boss_1_proto.nem"
	even

BossGfx2:
	incbin	"gfx/r5/boss_2_proto.nem"
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
	incbin	"maps/r51b/collision.bin"
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
	incbin	"maps/r51b/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r51b/background.bin"
	even

StageMapNull:
	incbin	"maps/r5_background.bin"
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
	incbin	"maps/r51b/blocks.nem"
	even

StageGfx:
	incbin	"maps/r51b/gfx.nem"
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

BgInsideGfxB:
	incbin	"gfx/r5/bg_inside_b.nem"
	even

BgOutsideGfxB:
	incbin	"gfx/r5/bg_outside_b.nem"
	even

BridgeGfxB:
	incbin	"gfx/r5/bridge_b.nem"
	even

ConveyorCtrlGfxB:
	incbin	"gfx/r5/conveyor_control_b.nem"
	even

PlatformGfxB:
	incbin	"gfx/r5/platform_b.nem"
	even

AnimalsGfx:
	incbin	"gfx/r5/animals.nem"
	even

HologramAnimalsGfx:
	incbin	"gfx/r5/hologram_animals.nem"
	even

HologramGfx:
	incbin	"gfx/hologram.nem"
	even

BreakWallGfxB:
	incbin	"gfx/r5/break_wall_b.nem"
	even

ChainGfx:
	incbin	"gfx/chain.nem"
	even

CollapseFloorGfxB:
	incbin	"gfx/r5/collapse_floor_b.nem"
	even

SpikesHV4Gfx:
	incbin	"gfx/spikes_hv4.nem"
	even

StalactiteGfxB:
	incbin	"gfx/r5/stalactite_b.nem"
	even

RockGfxB:
	incbin	"gfx/r5/rock_b.nem"
	even

KumoKumoGfx:
	incbin	"gfx/r5/kumo_kumo.nem"
	even

KemusiGfx:
	incbin	"gfx/r5/kemusi.nem"
	even

SasoriGfx:
	incbin	"gfx/r5/sasori.nem"
	even

NoroNoroGfx:
	incbin	"gfx/r5/noro_noro.nem"
	even

RobotTransportGfxB:
	incbin	"gfx/robot_transport_b.nem"
	even

SinePlatformGfxB:
	incbin	"gfx/r5/sine_platform_b.nem"
	even

CrackFloorGfxB:
	incbin	"gfx/r5/crack_floor_b.nem"

Padding3:
	incbin	"Level/Wacky Workbench/Data/Padding/3 (Act 1 Present).bin", $2050, $7AE

; ------------------------------------------------------------------------------
