; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R32A)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		include	"Level/USA Legacy R32A Padding1.asm"
	else
		include	"Level/Collision Chaos/Data/R32A Retained Pre-Chunk Data (JE).asm"
	endif

StageChunks:
	incbin	"maps/r32a/chunks.bin"

Padding2:
	include	"Level/Collision Chaos/Data/R32A Padding 2.asm"

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
	include	"sprites/r3/flower.asm"
	even

FlowerGfx:
	incbin	"gfx/r3/flower.nem"
	even

TitleCardTextGfx:
	incbin	"gfx/r3/title_card_text.nem"
	even

byte_233A9A:
	incbin	"data/r3/byte_233A9A_2a.bin"
	even

CCAnimatedTilesPresentFrame1Primary:
	; Raw 4bpp tiles; the updater DMAs the first 320 bytes.
	incbin	"data/r3/byte_23439A_2a.bin"
	even

CCAnimatedTilesPresentFrame1Secondary:
	; Raw 4bpp tiles; the updater DMAs all 192 bytes.
	incbin	"data/r3/byte_2344DA_2a.bin"
	even

CCAnimatedTilesPresentFrame0Primary:
	; Raw 4bpp tiles; the updater DMAs the first 320 bytes.
	incbin	"data/r3/byte_23459A_2a.bin"
	even

CCAnimatedTilesPresentFrame0Secondary:
	; Raw 4bpp tiles; the updater DMAs all 192 bytes.
	incbin	"data/r3/byte_2346DA_2a.bin"
	even

FlipperGfx:
	incbin	"gfx/r3/flipper.nem"
	even

BumperGfx:
	incbin	"gfx/r3/bumper.nem"
	even

MetalPlatformGfx:
	incbin	"gfx/r3/metal_platform.nem"
	even

SpikesHV4Gfx:
	incbin	"gfx/spikes_hv4.nem"
	even

BlockGfx:
	incbin	"gfx/r3/block.nem"
	even

RetractBlockGfx:
	incbin	"gfx/r3/retract_block.nem"
	even

OneWayBarrierGfx:
	incbin	"gfx/r3/one_way_barrier.nem"
	even

FireShootGfx:
	incbin	"gfx/r3/fire_shoot.nem"
	even

RotatePlatformGfx:
	incbin	"gfx/r3/rotate_platform.nem"
	even

KamaKamaGfx:
	incbin	"gfx/r3/kama_kama.nem"
	even

SpikesHV2Gfx:
	incbin	"gfx/spikes_hv2.nem"
	even

KamaKamaSprites1:
	include	"sprites/r3/kama_kama_1.asm"
	even

KamaKamaSprites2:
	include	"sprites/r3/kama_kama_2.asm"
	even

GaGfx:
	incbin	"gfx/r3/ga.nem"
	even

TentouGfx:
	incbin	"gfx/r3/tentou.nem"
	even

SpikeBombGfx:
	incbin	"gfx/spike_bomb.nem"
	even

TeleporterGfx:
	incbin	"gfx/r3/teleporter.nem"
	even

PocketGfxA:
	incbin	"gfx/r3/pocket_a.nem"
	even

BossBarrierGfx:
	incbin	"gfx/r3/boss_barrier.nem"
	even

BouncePlatformGfxAB:
	incbin	"gfx/r3/bounce_platform_ab.nem"
	even

GlassBreakGfxA:
	incbin	"gfx/r3/glass_break_a.nem"
	even

SpikeChainGfx:
	incbin	"gfx/spike_chain.nem"
	even

RobotTransportGfxA:
	incbin	"gfx/robot_transport_a.nem"
	even

AnimalsGfx:
	incbin	"gfx/r3/animals.nem"
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
	incbin	"maps/r32a/collision.bin"
	even

StageMaps:
	include	"Level/Collision Chaos/Layout Pointer Table (Act 2 Variant).asm"

StageMapFg:
	incbin	"maps/r32a/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r32a/background.bin"
	even

StageMapNull:
	incbin	"maps/empty.bin"
	even

StageMapGHZ2:
	incbin	"maps/ghz2_foreground.bin"
	even

StageMapGHZ2Null:
	incbin	"maps/empty.bin"
	even

StageMapGHZ3:
	incbin	"maps/ghz3_foreground.bin"
	even

StageMapSharedNull:
	incbin	"maps/empty.bin"
	even

StageMapFinalRowNull:
	incbin	"maps/empty.bin"
	even

StageBlocks:
	incbin	"maps/r32a/blocks.nem"
	even

StageGfx:
	incbin	"maps/r32a/gfx.nem"
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

Padding3:
	include	"Level/Collision Chaos/Data/R32A Padding 3.asm"

; ------------------------------------------------------------------------------
