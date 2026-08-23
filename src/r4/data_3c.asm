; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R43C)
; ------------------------------------------------------------------------------

R43_USA_ADJUST	EQU	0

Padding1:
	if (REGION=USA)&(DEMO<>0)
		include	"Level/USA Legacy R43 Demo Padding1.asm"
		; The R43 demo overlays the legacy tail with two capsule records.
		org	Padding1
		dc.l	CapsuleGfx
		dc.w	$9020, 0
		dc.l	CapsuleGfx
		dc.w	$9020
		org	Padding1+$2CF0
	else
R43_VARIANT equ 0
		include	"Level/Tidal Tempest/Data/R43CD PreChunk Prefix.asm"
		if REGION=USA
			include	"r4/usa_padding_3.asm"
		endif
		if REGION=USA
			; The USA table continues through the fixed $10000 boundary.
			dc.w	$8BA0, 0, $23
		endif
	endif

StageChunks:
	incbin	"maps/r43c/chunks.bin"
	if (REGION=USA)&(DEMO<>0)
		org	StageChunks+$3600
		include	"Level/USA Legacy R43 Demo Chunks.asm"
		org	StageChunks+filesize("maps/r43c/chunks.bin")
	endif
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
	incbin	"maps/r43c/collision.bin"
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
	incbin	"maps/r43c/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r43c/background.bin"
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

Padding2:
	incbin	"Level/Wacky Workbench/Data/Padding/2 (Act 1 Present).bin", $1162, $49E
	if (REGION=USA)&(DEMO<>0)
R43_LEGACY_SONIC_TAIL EQU 1
		org	Padding2
		include	"Level/_Objects/Sonic/Data/Mappings.asm"
		org	Padding2+$49E
	endif

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

StageBlocks:
	incbin	"maps/r43c/blocks.nem"
	even

StageGfx:
	incbin	"maps/r43c/gfx.nem"
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

TonboGfx:
	incbin	"gfx/r4/tonbo.nem"
	even

DoorGfxC:
	incbin	"gfx/r4/door_c.nem"
	even

DoorGfxD:
	incbin	"gfx/r4/door_d.nem"
	even

SwingGfxC:
	incbin	"gfx/r4/swing_c.nem"
	even

SwingGfxD:
	incbin	"gfx/r4/swing_d.nem"
	even

BlockGfxC:
	incbin	"gfx/r4/block_c.nem"
	even

BlockGfxD:
	incbin	"gfx/r4/block_d.nem"
	even

AnimalsGfx:
	incbin	"gfx/r4/animals.nem"
	even

SwitchGfx:
	incbin	"gfx/switch.nem"
	even

BossChaseGfx:
	incbin	"gfx/r4/boss_chase.nem"
	even

BossBubbleGfx:
	incbin	"gfx/r4/boss_bubble.nem"

Padding3:
	include	"Level/Wacky Workbench/Data/Legacy Padding 3/Suffix 2528.asm"
	if (REGION=USA)&(DEMO<>0)
R43_LEGACY_AMY_TAIL EQU 1
R43LegacyAmyMapBase EQU $23FD1C
		org	Padding3
		include	"Level/Palmtree Panic/Objects/Amy Rose/Data/Mappings.asm"
		include	"Level/Palmtree Panic/Objects/Amy Rose/Data/Animations.asm"
LEGACY_R11A_TABLE_MODE = 1
		include	"Level/Palmtree Panic/Data/Legacy Object Tables (Act 1 Present).asm"
		org	Padding3+$2D6
	endif

; ------------------------------------------------------------------------------
