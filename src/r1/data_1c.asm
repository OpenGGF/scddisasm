; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R11C)
; ------------------------------------------------------------------------------

Padding1:
	incbin	"padding/r11c_e_1.bin"

StageChunks:
	incbin	"src/maps/r11c/chunks.bin"
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
	incbin	"src/data/r11c/byte_21D7A6.bin"
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

Padding2:
	incbin	"padding/r11c_e_2.bin"

PlayerGfx:
	incbin	"src/gfx/r1/player.unc"
	even

PlayerSprites:
	include	"src/sprites/r1/player.asm"
	even

PlayerGfxScript:
	include	"src/sprites/r1/player_gfx.asm"
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

LogShadowDecayGfx:
	incbin	"src/gfx/r1/log_shadow_decay.nem"
	even

LogShadowGfx:
	incbin	"src/gfx/r1/log_shadow.nem"
	even

FlowerAnims:
	include	"src/anims/flower.asm"
	even

FlowerSprites:
	include	"src/sprites/r1/flower.asm"
	even

FlowerGfx:
	incbin	"src/gfx/r1/flower.nem"
	even

TitleCardTextGfx:
	incbin	"src/gfx/r1/title_card_text.nem"
	even

PlatformGfx:
	incbin	"src/gfx/r1/platform.nem"
	even

BoulderGfx:
	incbin	"src/gfx/r1/boulder.nem"
	even

FloatBlockGfx:
	incbin	"src/gfx/r1/float_block.nem"
	even

SpringWheelGfx:
	incbin	"src/gfx/spring_wheel.nem"
	even

SpinDiscGfx:
	incbin	"src/gfx/r1/spin_disc.nem"
	even

TunnelSplashGfx:
	incbin	"src/gfx/r1/tunnel_splash.nem"
	even

WaterfallGfx:
	incbin	"src/gfx/r1/waterfall.nem"
	even

DoorGfx:
	incbin	"src/gfx/r1/door.nem"
	even

SplashGfx:
	incbin	"src/gfx/splash.nem"
	even

AntonGfx:
	incbin	"src/gfx/r1/anton.nem"
	even

MosquiGfx:
	incbin	"src/gfx/r1/mosqui.nem"
	even

PataBataGfx:
	incbin	"src/gfx/r1/pata_bata.nem"
	even

TagaTagaGfx:
	incbin	"src/gfx/r1/taga_taga.nem"
	even

TamabbohGfx:
	incbin	"src/gfx/r1/tamabboh.nem"
	even

SpringboardGfx:
	incbin	"src/gfx/r1/springboard.nem"
	even

SwitchGfx:
	incbin	"src/gfx/r1/switch.nem"
	even

SpikesGfx:
	incbin	"src/gfx/r1/spikes.nem"
	even

SwingGfx:
	incbin	"src/gfx/r1/swing.nem"
	even

AnimalGfx:
	incbin	"src/gfx/r1/animals.nem"
	even

DiscDrillGfx:
	incbin	"src/gfx/r1/disc_drill.nem"
	even

RobotGeneratorDecayGfx:
	incbin	"src/gfx/r1/robot_generator_decay.nem"
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
	incbin	"src/maps/r11c/collision.bin"
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
	incbin	"src/maps/r11c/foreground.bin"
	even

StageMapBg:
	incbin	"src/maps/r11c/background.bin"
	even

StageMapNull:
	incbin	"src/data/r11c/StageMapNull.bin"
	even

StageMapUnk1:
	incbin	"src/data/r11c/StageMapUnk1.bin"
	even

StageMapUnk3:
	incbin	"src/data/r11c/StageMapUnk3.bin"
	even

StageMapUnk4:
	incbin	"src/data/r11c/StageMapUnk4.bin"
	even

StageMapUnk2:
	incbin	"src/data/r11c/StageMapUnk2.bin"
	even

StageMapUnk5:
	incbin	"src/data/r11c/StageMapUnk5.bin"
	even

SceneryGfxCD:
	incbin	"src/gfx/r1/scenery_c_d.nem"
	even

StageBlocks:
	incbin	"src/maps/r11c/blocks.nem"
	even

StageGfx:
	incbin	"src/maps/r11c/gfx.nem"

Padding3:
	incbin	"padding/r11c_e_3.bin"

; ------------------------------------------------------------------------------
