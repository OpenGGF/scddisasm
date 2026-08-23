; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R41A)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		include	"Level/USA Legacy R41 Padding1.asm"
	else
		incbin	"Level/Wacky Workbench/Data/Padding/1 (Act 1 Present, JE).bin", $AC, $10
	endif

StageChunks:
	incbin	"maps/r41a/chunks.bin"
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

WaterSurfaceGfx:
	incbin	"gfx/r4/water_surface.nem"
	even

FlowerAnims:
	include	"anims/flower.asm"
	even

FlowerSprites:
	include	"sprites/r4/flower.asm"
	even

FlowerGfx:
	incbin	"gfx/r4/flower.nem"
	even

TitleCardTextGfx:
	incbin	"gfx/r4/title_card_text.nem"
	even

BubbleNumbersGfx:
	incbin	"gfx/r4/bubble_numbers.nem"
	even

BubbleSprites:
	include	"sprites/r4/bubbles.asm"
	even

SpikeBallGfx:
	incbin	"gfx/r4/spike_ball.nem"
	even

ChainGfx:
	incbin	"gfx/chain.nem"
	even

TurbineGfxA:
	incbin	"gfx/r4/turbine_a.nem"
	even

CollapseFloorGfxA:
	incbin	"gfx/r4/collapse_floor_a.nem"
	even

ElectricBeamGfxA:
	incbin	"gfx/r4/electric_beam_a.nem"
	even

ShootGfx:
	incbin	"gfx/r4/shoot.nem"
	even

TonboGfx:
	incbin	"gfx/r4/tonbo.nem"
	even

TagaTagaGfx:
	incbin	"gfx/r4/taga_taga.nem"
	even

YagoGfx:
	incbin	"gfx/r4/yago.nem"
	even

AmenboGfx:
	incbin	"gfx/r4/amenbo.nem"
	even

WoodBlockGfx:
	incbin	"gfx/r4/wood_block.nem"
	even

AnimalsGfx:
	incbin	"gfx/r4/animals.nem"
	even

RobotTransportGfxA:
	incbin	"gfx/robot_transport_a.nem"

Padding2:
	incbin	"Level/Wacky Workbench/Data/Padding/2 (Act 1 Present).bin", $1312, $2EE

PlayerGfx:
	incbin	"gfx/r4/player.unc"
	even

PlayerSprites:
	include	"sprites/r4/player.asm"
	even

PlayerGfxScript:
	include	"sprites/r4/player_gfx.asm"
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

byte_238A42:
	incbin	"data/r4/byte_238A42_1a.bin"
	even

byte_238C42:
	incbin	"data/r4/byte_238C42_1a.bin"
	even

byte_238E42:
	incbin	"data/r4/byte_238E42_1a.bin"
	even

byte_239042:
	incbin	"data/r4/byte_239042_1a.bin"
	even

byte_239242:
	incbin	"data/r4/byte_239242_1a.bin"
	even

byte_239442:
	incbin	"data/r4/byte_239442_1a.bin"
	even

byte_239642:
	incbin	"data/r4/byte_239642_1a.bin"
	even

byte_239842:
	incbin	"data/r4/byte_239842_1a.bin"
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
	incbin	"maps/r41a/collision.bin"
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
	incbin	"maps/r41a/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r41a/background.bin"
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
	incbin	"maps/r41a/blocks.nem"
	even

StageGfx:
	incbin	"maps/r41a/gfx.nem"
	even

BreakPoleGfxAB:
	incbin	"gfx/r4/break_pole_ab.nem"
	even

SpikesV4Gfx:
	incbin	"gfx/spikes_v4.nem"
	even

BlockGfxA:
	incbin	"gfx/r4/block_a.nem"
	even

SwitchGfx:
	incbin	"gfx/switch.nem"
	even

SlopeElevatorGfxA:
	incbin	"gfx/r4/slope_elevator_a.nem"
	even

SwingGfxAB:
	incbin	"gfx/r4/swing_ab.nem"
	even

PrizePointsGfx:
	incbin	"gfx/r4/prize_points.nem"
	even

DoorGfxA:
	incbin	"gfx/r4/door_a.nem"
	even

GeyserGfx:
	incbin	"gfx/r4/geyser.nem"

Padding3:
	incbin	"Level/Palmtree Panic/Data/Padding/2 (Act 1 Present).bin", $2A, $164

; ------------------------------------------------------------------------------
