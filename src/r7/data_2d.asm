; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R72D)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r72d_e_1.bin"

StageChunks:
	incbin	"src/maps/r72d/chunks.bin"

Padding2:
	incbin	"padding/r72d_e_2.bin"

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
	incbin	"src/data/r72d/LauncherGfx.bin"
	even

LauncherSparksGfx:
	incbin	"src/data/r72d/LauncherSparksGfx.bin"
	even

LightEdgesGfx:
	incbin	"src/data/r72d/LightEdgesGfx.bin"
	even

PathSwapPanelGfx:
	incbin	"src/data/r72d/PathSwapPanelGfx.bin"
	even

MeshGfxA:
	incbin	"src/data/r72d/MeshGfxA.bin"
	even

MeshGfxB:
	incbin	"src/data/r72d/MeshGfxB.bin"
	even

MeshGfxC:
	incbin	"src/data/r72d/MeshGfxC.bin"
	even

MeshGfxD:
	incbin	"src/data/r72d/MeshGfxD.bin"
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
	incbin	"src/maps/r72d/collision.bin"
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
	incbin	"src/maps/r72d/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r72d/background.bin"
	even

StageMapNull:
	incbin	"src/data/r72d/StageMapNull.bin"
	even

StageMapUnk1:
	incbin	"src/data/r72d/StageMapUnk1.bin"
	even

StageMapUnk3:
	incbin	"src/data/r72d/StageMapUnk3.bin"
	even

StageMapUnk4:
	incbin	"src/data/r72d/StageMapUnk4.bin"
	even

StageMapUnk2:
	incbin	"src/data/r72d/StageMapUnk2.bin"
	even

StageMapUnk5:
	incbin	"src/data/r72d/StageMapUnk5.bin"
	even

StageBlocks:
	incbin	"src/maps/r72d/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r72d/gfx.nem"
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
	incbin	"src/data/r72d/SwingGfx.bin"
	even

LightsGfxA:
	incbin	"src/data/r72d/LightsGfxA.bin"
	even

LightsGfxC:
	incbin	"src/data/r72d/LightsGfxC.bin"
	even

LightsGfxD:
	incbin	"src/data/r72d/LightsGfxD.bin"
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
	incbin	"src/data/r72d/KanabunGfx.bin"
	even

SpikeLauncherGfx:
	incbin	"src/data/r72d/SpikeLauncherGfx.bin"
	even

BlockGfxA:
	incbin	"src/data/r72d/BlockGfxA.bin"
	even

BlockGfxB:
	incbin	"src/data/r72d/BlockGfxB.bin"
	even

BlockGfxC:
	incbin	"src/data/r72d/BlockGfxC.bin"
	even

BlockGfxD:
	incbin	"src/data/r72d/BlockGfxD.bin"
	even

SpikeBallGfx:
	incbin	"src/data/r72d/SpikeBallGfx.bin"
	even

HotaruGfx:
	incbin	"src/data/r72d/HotaruGfx.bin"
	even

KabasiraGfx:
	incbin	"src/data/r72d/KabasiraGfx.bin"

Padding3:
	incbin	"padding/r72d_e_3.bin"

; ------------------------------------------------------------------------------
