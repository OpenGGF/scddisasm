; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R42C)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		include	"r4/usa_padding_2c.asm"
	else
		; European/Japanese legacy graphics-table fragment.
		dc.w	$0023, $6128, $6C00, $0021, $E292, $7A00, $0021, $F0BE
		dc.w	$82C0, $0023, $FB70, $8800, $0023, $F792, $8D40, $0021
		dc.w	$E39E, $9140, $0023, $F964, $A140, $0023, $74C0, $A400
		dc.w	$0023, $8842, $AD00, $0023, $76E2, $B500, $0023, $7CE6
		dc.w	$D000, $0023, $416C, $D8C0, $0021, $DFEE, $DAE0, $0023
		dc.w	$81CE, $F5C0, $0000, $0023, $541E, $7880, $000D, $0023
		dc.w	$F66A, $5F00, $0023, $FC56, $6000, $0023, $FA3A, $6800
		dc.w	$0023, $F9B6, $6B80, $0021, $EE4C, $6C80, $0021, $EB76
		dc.w	$6D00, $0021, $EA6C, $6E00, $0021, $EC18, $7000, $0023
		dc.w	$F6F8, $7400, $0021, $F7B6, $7600, $0021, $F362, $7A00
		dc.w	$0021, $F4E0, $7E00, $0021, $FA62, $8A00, $0023, $4C82
		dc.w	$9E40, $000D, $0023, $F66A, $5F00, $0023, $FC56, $6000
		dc.w	$0023, $FA3A, $6800, $0023, $F9B6, $6B80, $0021, $EE4C
		dc.w	$6C80, $0021, $EB76, $6D00, $0021, $EA6C, $6E00, $0021
		dc.w	$EC18, $7000, $0023, $F6F8, $7400, $0021, $F7B6, $7600
		dc.w	$0021, $F362, $7A00, $0021, $F4E0, $7E00, $0021, $FBC6
		dc.w	$8A00, $0023, $4C82, $9E40, $0000, $0021, $FA62, $8A00
		dc.w	$0000, $0021, $FBC6, $8A00, $0002, $0023, $4E42, $8780
		dc.w	$0023, $4878, $9100, $0020, $B14A, $7DE0, $0098, $7880
		dc.w	$0002, $0022, $FABC, $8780, $0022, $F4F2
	endif

StageChunks:
	incbin	"maps/r42c/chunks.bin"
	even

BreakPoleGfxC:
	incbin	"gfx/r4/break_pole_c.nem"
	even

SpikesV4Gfx:
	incbin	"gfx/spikes_v4.nem"
	even

UnusedPlatformGfxC:
	incbin	"gfx/r4/unused_platform_c.nem"
	even

BlockGfxC:
	incbin	"gfx/r4/block_c.nem"
	even

SwitchGfx:
	incbin	"gfx/switch.nem"
	even

SwingGfxC:
	incbin	"gfx/r4/swing_c.nem"
	even

PrizePointsGfx:
	incbin	"gfx/r4/prize_points.nem"
	even

DoorGfxC:
	incbin	"gfx/r4/door_c.nem"
	even

RotateBlockGfx:
	incbin	"gfx/r4/rotate_block.nem"
	even

GeyserGfx:
	incbin	"gfx/r4/geyser.nem"
	even

UnusedPlatformGfxBCD:
	incbin	"gfx/r4/unused_platform_bcd.nem"
	even

SlopeElevatorGfxC:
	incbin	"gfx/r4/slope_elevator_c.nem"
	even

SpikeBallGfx:
	incbin	"gfx/r4/spike_ball.nem"
	even

ChainGfx:
	incbin	"gfx/chain.nem"
	even

TurbineGfxC:
	incbin	"gfx/r4/turbine_c.nem"
	even

CollapseFloorGfxC:
	incbin	"gfx/r4/collapse_floor_c.nem"
	even

ElectricBeamGfxC:
	incbin	"gfx/r4/electric_beam_c.nem"
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

FloatElevatorGfxC:
	incbin	"gfx/r4/float_elevator_c.nem"
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

Padding2:
	incbin	"Level/Wacky Workbench/Data/Padding/2 (Act 1 Present).bin", $11D6, $42A

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
	incbin	"maps/r42c/collision.bin"
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
	incbin	"maps/r42c/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r42c/background.bin"
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
	incbin	"maps/r42c/blocks.nem"
	even

StageGfx:
	incbin	"maps/r42c/gfx.nem"

Padding3:
	dc.w	$080D, $004C, $0018, $0C00, $20E0, $180C, $0820, $0020
	dc.w	$0700, $54F0, $2007, $0854, $0000, $01F8, $0500, $5CF8
	dc.w	$01F8, $0500, $60F8, $01F8, $0500, $64F8, $01F8, $0508
	dc.w	$64F8, $01F8, $0508, $60F8, $01F8, $0508, $5CF8
	include	"r4/nonusa_padding_2b_3.asm"

; ------------------------------------------------------------------------------
