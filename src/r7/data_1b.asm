; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R71B)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r71b_e_1.bin"

StageChunks:
	incbin	"src/maps/r71b/chunks.bin"

Padding2:
	incbin	"padding/r71b_e_2.bin"

PlayerGfx:
	incbin	"src/gfx/player.unc"
	even

PlayerSprites:
	include	"src/sprites/player.asm"
	even

PlayerGfxScript:
	include	"src/sprites/player_gfx.asm"
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

FlowerAnims:
	include	"src/anims/flower.asm"
	even

FlowerSprites:
	include	"src/sprites/r7/flower.asm"
	even

FlowerGfx:
	incbin	"src/gfx/r7/flower.nem"
	even

TitleCardTextGfx:
	incbin	"src/gfx/r7/title_card_text.nem"
	even

LauncherGfx:
	incbin	"src/gfx/r7/launcher.nem"
	even

LauncherSparksGfx:
	incbin	"src/gfx/r7/launcher_sparks.nem"
	even

LightEdgesGfx:
	incbin	"src/gfx/r7/light_edges.nem"
	even

PathSwapPanelGfx:
	incbin	"src/gfx/r7/path_swap_panel.nem"
	even

MeshGfxA:
	incbin	"src/gfx/r7/mesh_a.nem"
	even

MeshGfxB:
	incbin	"src/gfx/r7/mesh_b.nem"
	even

MeshGfxC:
	incbin	"src/gfx/r7/mesh_c.nem"
	even

MeshGfxD:
	incbin	"src/gfx/r7/mesh_d.nem"
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
	incbin	"src/maps/r71b/collision.bin"
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
	incbin	"src/maps/r71b/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r71b/background.bin"
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
	incbin	"src/maps/r71b/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r71b/gfx.nem"
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

SwingGfx:
	incbin	"src/gfx/r7/swing.nem"
	even

LightsGfxA:
	incbin	"src/gfx/r7/lights_a.nem"
	even

LightsGfxC:
	incbin	"src/gfx/r7/lights_c_d.nem"
	even

LightsGfxD:
	incbin	"src/gfx/r7/lights_c_d.nem"
	even

AnimalGfx:
	incbin	"src/gfx/r7/animals.nem"
	even

ProjectorAnimalGfx:
	incbin	"src/gfx/r7/projector_animals.nem"
	even

ProjectorGfx:
	incbin	"src/gfx/r7/projector.nem"
	even

RobotGeneratorGfx:
	incbin	"src/gfx/r7/robot_generator.nem"
	even

RobotGeneratorDecayGfx:
	incbin	"src/gfx/r7/robot_generator_decay.nem"
	even

KanabunGfx:
	incbin	"src/gfx/r7/kanabun.nem"
	even

SpikeLauncherGfx:
	incbin	"src/gfx/r7/spike_launcher.nem"
	even

BlockGfxA:
	incbin	"src/gfx/r7/block_a.nem"
	even

BlockGfxB:
	incbin	"src/gfx/r7/block_b.nem"
	even

BlockGfxC:
	incbin	"src/gfx/r7/block_c.nem"
	even

BlockGfxD:
	incbin	"src/gfx/r7/block_d.nem"
	even

SpikeBallGfx:
	incbin	"src/gfx/r7/spike_ball.nem"
	even

HotaruGfx:
	incbin	"src/gfx/r7/hotaru.nem"
	even

KabasiraGfx:
	incbin	"src/gfx/r7/kabasira.nem"
	even

DangoGfx:
	incbin	"src/gfx/r7/dango.nem"

Padding3:
	incbin	"padding/r71b_e_3.bin"

; ------------------------------------------------------------------------------
