; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R53C)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		include	"r5/usa_pre_chunks_3c.asm"
	else
		; European/Japanese legacy graphics-table fragment.
		dc.w	$9100, $0020, $B26E, $7DE0, $0023, $4E42, $8780, $0023
		dc.w	$4878, $9100, $0020, $B280, $7DE0, $0023, $6128, $6C00
		dc.w	$0021, $E292, $7A00, $0021, $F0BE, $82C0, $0023, $FB70
		dc.w	$8800, $0023, $F792, $8D40, $0021, $E39E, $9140, $0023
		dc.w	$F964, $A140, $0023, $74C0, $A400, $0023, $8842, $AD00
		dc.w	$0023, $76E2, $B500, $0023, $7CE6, $D000, $0023, $416C
		dc.w	$D8C0, $0021, $DFEE, $DAE0, $0023, $81CE, $F5C0, $0000
		dc.w	$0023, $541E, $7880, $000D, $0023, $F66A, $5F00, $0023
		dc.w	$FC56, $6000, $0023, $FA3A, $6800, $0023, $F9B6, $6B80
		dc.w	$0021, $EE4C, $6C80, $0021, $EB76, $6D00, $0021, $EA6C
		dc.w	$6E00, $0021, $EC18, $7000, $0023, $F6F8, $7400, $0021
		dc.w	$F7B6, $7600, $0021, $F362, $7A00, $0021, $F4E0, $7E00
		dc.w	$0021, $FA62, $8A00, $0023, $4C82, $9E40, $000D, $0023
		dc.w	$F66A, $5F00, $0023, $FC56, $6000, $0023, $FA3A, $6800
		dc.w	$0023, $F9B6, $6B80, $0021, $EE4C, $6C80, $0021, $EB76
		dc.w	$6D00, $0021, $EA6C, $6E00, $0021, $EC18, $7000, $0023
		dc.w	$F6F8, $7400, $0021, $F7B6, $7600, $0021, $F362, $7A00
		dc.w	$0021, $F4E0, $7E00, $0021, $FBC6, $8A00, $0023, $4C82
		dc.w	$9E40, $0000, $0021, $FA62, $8A00, $0000, $0021, $FBC6
		dc.w	$8A00, $0002, $0023, $4E42, $8780, $0023, $4878, $9100
		dc.w	$0020, $B14A, $7DE0, $0098, $7880, $0002, $0022, $FABC
		dc.w	$8780, $0022, $F4F2
	endif

StageChunks:
	incbin	"maps/r53c/chunks.bin"

Padding2:
	include	"Level/Quartz Quadrant/Data/R52 Padding 2.asm"

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
	incbin	"gfx/r5/boss_1.nem"
	even

BossGfx2:
	incbin	"gfx/r5/boss_2.nem"
	even

BossSpikesGfxC:
	incbin	"gfx/r5/boss_spikes_c.nem"
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
	incbin	"maps/r53c/collision.bin"
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
	incbin	"maps/r53c/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r53c/background.bin"
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
	incbin	"maps/r53c/blocks.nem"
	even

StageGfx:
	incbin	"maps/r53c/gfx.nem"
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

BgInsideGfxC:
	incbin	"gfx/r5/bg_inside_c.nem"
	even

BgOutsideGfxC:
	incbin	"gfx/r5/bg_outside_c.nem"
	even

BridgeGfxC:
	incbin	"gfx/r5/bridge_c.nem"
	even

ConveyorCtrlGfxC:
	incbin	"gfx/r5/conveyor_control_c.nem"
	even

PlatformGfxC:
	incbin	"gfx/r5/platform_c.nem"
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

BreakWallGfxC:
	incbin	"gfx/r5/break_wall_c.nem"
	even

ChainGfx:
	incbin	"gfx/chain.nem"
	even

CollapseFloorGfxC:
	incbin	"gfx/r5/collapse_floor_c.nem"

Padding3:
	incbin	"../padding/r53c_e_3.bin",0,$20A2
	include	"Level/Shared Padding3 Rotation Vectors.asm"

; ------------------------------------------------------------------------------
