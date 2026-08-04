; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R32D)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r32d_e_1.bin"

StageChunks:
	incbin	"src/maps/r32d/chunks.bin"
	even

MetalPlatformGfx:
	incbin	"src/data/r32d/MetalPlatformGfx.bin"
	even

SpikesGfx:
	incbin	"src/gfx/r3/spikes.nem"
	even

BlockGfx:
	incbin	"src/data/r32d/BlockGfx.bin"
	even

RetractBlockGfx:
	incbin	"src/data/r32d/RetractBlockGfx.bin"
	even

OneWayBarrierGfx:
	incbin	"src/data/r32d/OneWayBarrierGfx.bin"
	even

FireShooterGfx:
	incbin	"src/data/r32d/FireShooterGfx.bin"
	even

RotatePlatformGfx:
	incbin	"src/data/r32d/RotatePlatformGfx.bin"
	even

KamaKamaGfx:
	incbin	"src/data/r32d/KamaKamaGfx.bin"
	even

SpikesGfx2:
	incbin	"src/data/r32d/SpikesGfx2.bin"
	even

KamaKamaSprites1:
	include	"src/data/r32d/KamaKamaSprites1.asm"
	even

KamaKamaSprites2:
	include	"src/data/r32d/KamaKamaSprites2.asm"

Padding2:
	incbin	"padding/r32d_e_2.bin"

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
	incbin	"src/data/r32d/byte_233A9A.bin"
	even

byte_233BDA:
	incbin	"src/data/r32d/byte_233BDA.bin"
	even

byte_233CDA:
	incbin	"src/data/r32d/byte_233CDA.bin"
	even

byte_233E1A:
	incbin	"src/data/r32d/byte_233E1A.bin"
	even

FlipperGfx:
	incbin	"src/data/r32d/FlipperGfx.bin"
	even

BumperGfx:
	incbin	"src/data/r32d/BumperGfx.bin"
	even

GaGfx:
	incbin	"src/data/r32d/GaGfx.bin"
	even

TentouGfx:
	incbin	"src/data/r32d/TentouGfx.bin"
	even

TentouBombGfx:
	incbin	"src/data/r32d/TentouBombGfx.bin"
	even

TeleporterGfx:
	incbin	"src/data/r32d/TeleporterGfx.bin"
	even

PointsPocketGfx:
	incbin	"src/data/r32d/PointsPocketGfx.bin"
	even

BossBarrierGfx:
	incbin	"src/data/r32d/BossBarrierGfx.bin"
	even

BossDrainBlockGfx:
	incbin	"src/data/r32d/BossDrainBlockGfx.bin"
	even

BouncePlatformGfx:
	incbin	"src/data/r32d/BouncePlatformGfx.bin"
	even

GlassShatterGfx:
	incbin	"src/data/r32d/GlassShatterGfx.bin"
	even

SpikeBallGfx:
	incbin	"src/data/r32d/SpikeBallGfx.bin"
	even

BossBarrierGfx2:
	incbin	"src/data/r32d/BossBarrierGfx2.bin"
	even

Art_Boss:
	incbin	"src/data/r32d/Art_Boss.bin"
	even

EggmanEscapeGfx:
	incbin	"src/data/r32d/EggmanEscapeGfx.bin"
	even

AnimalGfx:
	incbin	"src/gfx/r3/animals.nem"
	even

BossBombLauncherGfx:
	incbin	"src/data/r32d/BossBombLauncherGfx.bin"
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
	incbin	"src/maps/r32d/collision.bin"
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
	incbin	"src/maps/r32d/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r32d/background.bin"
	even

StageMapNull:
	incbin	"src/data/r32d/StageMapNull.bin"
	even

StageMapUnk1:
	incbin	"src/data/r32d/StageMapUnk1.bin"
	even

StageMapUnk3:
	incbin	"src/data/r32d/StageMapUnk3.bin"
	even

StageMapUnk4:
	incbin	"src/data/r32d/StageMapUnk4.bin"
	even

StageMapUnk2:
	incbin	"src/data/r32d/StageMapUnk2.bin"
	even

StageMapUnk5:
	incbin	"src/data/r32d/StageMapUnk5.bin"
	even

StageBlocks:
	incbin	"src/maps/r32d/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r32d/gfx.nem"
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
	incbin	"src/data/r32d/byte_21D7A6.bin"
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
	incbin	"padding/r32d_e_3.bin"

; ------------------------------------------------------------------------------
