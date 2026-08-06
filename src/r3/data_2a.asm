; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R32A)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r32a_e_1.bin"

StageChunks:
	incbin	"src/maps/r32a/chunks.bin"

Padding2:
	incbin	"padding/r32a_e_2.bin"

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
	include	"src/sprites/r3/flower.asm"
	even

FlowerGfx:
	incbin	"src/gfx/r3/flower.nem"
	even

TitleCardTextGfx:
	incbin	"src/gfx/r3/title_card_text.nem"
	even

byte_233A9A:
	incbin	"src/data/r3/byte_233A9A_2a.bin"
	even

byte_23439A:
	incbin	"src/data/r3/byte_23439A_2a.bin"
	even

byte_2344DA:
	incbin	"src/data/r3/byte_2344DA_2a.bin"
	even

byte_23459A:
	incbin	"src/data/r3/byte_23459A_2a.bin"
	even

byte_2346DA:
	incbin	"src/data/r3/byte_2346DA_2a.bin"
	even

FlipperGfx:
	incbin	"src/gfx/r3/flipper.nem"
	even

BumperGfx:
	incbin	"src/gfx/bumper.nem"
	even

MetalPlatformGfx:
	incbin	"src/gfx/r3/metal_platform.nem"
	even

SpikesGfx:
	incbin	"src/gfx/r3/spikes.nem"
	even

BlockGfx:
	incbin	"src/gfx/r3/block.nem"
	even

RetractBlockGfx:
	incbin	"src/gfx/r3/retract_block.nem"
	even

OneWayBarrierGfx:
	incbin	"src/gfx/r3/one_way_barrier.nem"
	even

FireShooterGfx:
	incbin	"src/gfx/r3/fire_shooter.nem"
	even

RotatePlatformGfx:
	incbin	"src/gfx/r3/rotate_platform.nem"
	even

KamaKamaGfx:
	incbin	"src/gfx/r3/kama_kama.nem"
	even

SpikesGfx2:
	incbin	"src/gfx/r3/spikes_2.nem"
	even

KamaKamaSprites1:
	include	"src/sprites/r3/kama_kama_1.asm"
	even

KamaKamaSprites2:
	include	"src/sprites/r3/kama_kama_2.asm"
	even

GaGfx:
	incbin	"src/gfx/r3/ga.nem"
	even

TentouGfx:
	incbin	"src/gfx/r3/tentou.nem"
	even

TentouBombGfx:
	incbin	"src/gfx/bomb.nem"
	even

TeleporterGfx:
	incbin	"src/gfx/r3/teleporter.nem"
	even

PointsPocketGfx:
	incbin	"src/gfx/r3/points_pocket_a.nem"
	even

BossBarrierGfx2:
	incbin	"src/gfx/r3/boss_barrier.nem"
	even

BouncePlatformGfx:
	incbin	"src/gfx/r3/bounce_platform_a_b.nem"
	even

GlassShatterGfx:
	incbin	"src/gfx/r3/glass_shatter_a.nem"
	even

SpikeBallGfx:
	incbin	"src/gfx/spike_ball.nem"
	even

RobotGeneratorDecayGfx:
	incbin	"src/gfx/r3/robot_generator_decay.nem"
	even

AnimalGfx:
	incbin	"src/gfx/r3/animals.nem"
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
	incbin	"src/maps/r32a/collision.bin"
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
	incbin	"src/maps/r32a/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r32a/background.bin"
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
	incbin	"src/maps/r32a/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r32a/gfx.nem"
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

Padding3:
	incbin	"padding/r32a_e_3.bin"

; ------------------------------------------------------------------------------
