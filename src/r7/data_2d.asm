; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R72D)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		include	"Level/USA Legacy Stage Prefix C.asm"
		include	"Level/USA Legacy Stage Tail B.asm"
		incbin	"../padding/r72d_e_1.bin",$62,$16
	else
		incbin	"../padding/r72d_e_1.bin"
	endif

StageChunks:
	incbin	"maps/r72d/chunks.bin"

Padding2:
	incbin	"../padding/r72d_e_2.bin"

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
	include	"sprites/r7/flower.asm"
	even

FlowerGfx:
	incbin	"gfx/r7/flower.nem"
	even

TitleCardTextGfx:
	incbin	"gfx/r7/title_card_text.nem"
	even

LaunchGfx:
	incbin	"gfx/r7/launch.nem"
	even

SparksGfx:
	incbin	"gfx/r7/sparks.nem"
	even

LightEdgesGfx:
	incbin	"gfx/r7/light_edges.nem"
	even

PathSwapGfx:
	incbin	"gfx/r7/path_swap.nem"
	even

MeshGfxA:
	incbin	"gfx/r7/mesh_a.nem"
	even

MeshGfxB:
	incbin	"gfx/r7/mesh_b.nem"
	even

MeshGfxC:
	incbin	"gfx/r7/mesh_c.nem"
	even

MeshGfxD:
	incbin	"gfx/r7/mesh_d.nem"
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
	incbin	"maps/r72d/collision.bin"
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
	incbin	"maps/r72d/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r72d/background.bin"
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
	incbin	"maps/r72d/blocks.nem"
	even

StageGfx:
	incbin	"maps/r72d/gfx.nem"
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

SwingGfx:
	incbin	"gfx/r7/swing.nem"
	even

LightsGfxA:
	incbin	"gfx/r7/lights_a.nem"
	even

LightsGfxC:
	incbin	"gfx/r7/lights_c.nem"
	even

LightsGfxD:
	incbin	"gfx/r7/lights_d.nem"
	even

AnimalsGfx:
	incbin	"gfx/r7/animals.nem"
	even

HologramAnimalsGfx:
	incbin	"gfx/r7/hologram_animals.nem"
	even

HologramGfx:
	incbin	"gfx/hologram.nem"
	even

RobotTransportGfxB:
	incbin	"gfx/robot_transport_b.nem"
	even

RobotTransportGfxA:
	incbin	"gfx/robot_transport_a.nem"
	even

KanabunGfx:
	incbin	"gfx/r7/kanabun.nem"
	even

SpikeLaunchGfx:
	incbin	"gfx/r7/spike_launch.nem"
	even

BlockGfxA:
	incbin	"gfx/r7/block_a.nem"
	even

BlockGfxB:
	incbin	"gfx/r7/block_b.nem"
	even

BlockGfxC:
	incbin	"gfx/r7/block_c.nem"
	even

BlockGfxD:
	incbin	"gfx/r7/block_d.nem"
	even

SpikeBallGfx:
	incbin	"gfx/r7/spike_ball.nem"
	even

HotaruGfx:
	incbin	"gfx/r7/hotaru.nem"
	even

KabasiraGfx:
	incbin	"gfx/r7/kabasira.nem"

Padding3:
	incbin	"../padding/r72d_e_3.bin"

; ------------------------------------------------------------------------------
