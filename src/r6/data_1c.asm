; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R61C)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
	; R61C retains the tail of an earlier USA PLC table before its fixed boundary.
	; The table is not part of the live R6 graphics-list graph.
LegacyPLCPrefix:
		dc.w	$7700
		dc.l	$0023B398
		dc.w	$7D00
		dc.l	$0023410C
		dc.w	$8000
		dc.l	$0023B94E
		dc.w	$8200
		dc.l	$0023D932
		dc.w	$9D00
		dc.w	0
		dc.l	$0023D252
		dc.w	$9A00
		dc.w	0
		dc.l	$0023D446
		dc.w	$9A00
		dc.w	0
		dc.l	$00230098
		dc.w	$7880
		dc.w	2
		dc.l	$0022FABC
		dc.w	$8780
		dc.l	$0022F4F2
		dc.w	$9100
		dc.l	$0020BF12
		dc.w	$7DE0

LegacyPLCStd2Tail:
		dc.l	$0023A382
		dc.w	$6D40
		dc.l	$0023AF48
		dc.w	$7340
		dc.l	$0023AF9A
		dc.w	$7400
		dc.l	$0023C448
		dc.w	$7500
		dc.l	$0023C780
		dc.w	$7700
		dc.l	$0023AE68
		dc.w	$7D00
		dc.l	$0023410C
		dc.w	$8000
		dc.l	$0023B41E
		dc.w	$8200
		dc.l	$0023D104
		dc.w	$9D00

LegacyPLCResults:
		dc.w	0
		dc.l	$00230098
		dc.w	$7880

LegacyPLCSignpost:
		dc.w	2
		dc.l	$0022FABC
		dc.w	$8780
		dc.l	$0022F4F2
		dc.w	$9100
		dc.l	$0020BF74
		dc.w	$7DE0
	include	"Level/Wacky Workbench/Data/Legacy PLC Tail (Act 1 Present, USA).asm"
	else
		; European/Japanese legacy graphics-table fragment.
		dc.w	$7700, $0023, $B398, $7D00, $0023, $410C, $8000, $0023
		dc.w	$B94E, $8200, $0023, $D932, $9D00, $0000, $0023, $D252
		dc.w	$9A00, $0000, $0023, $D446, $9A00, $0000, $0023, $0098
		dc.w	$7880, $0002, $0022, $FABC, $8780, $0022, $F4F2, $9100
		dc.w	$0020, $BF98, $7DE0, $EE4A, $9020, $0000, $0023, $0098
		dc.w	$7880, $0000, $0022, $EE4A, $9020, $FA3A, $6800, $0023
		dc.w	$F9B6, $6B80, $0021, $EE4C, $6C80, $0021, $EB76, $6D00
		dc.w	$0021, $EA6C, $6E00, $0021, $EC18, $7000, $0023, $F6F8
		dc.w	$7400, $0021, $F7B6, $7600, $0021, $F362, $7A00, $0021
		dc.w	$F4E0, $7E00, $0021, $FBC6, $8A00, $0023, $4C82, $9E40
		dc.w	$0000, $0021, $FA62, $8A00, $0000, $0021, $FBC6, $8A00
		dc.w	$0002, $0023, $4E42, $8780, $0023, $4878, $9100, $0020
		dc.w	$B14A, $7DE0, $0098, $7880, $0002, $0022, $FABC, $8780
		dc.w	$0022, $F4F2
	endif

StageChunks:
	incbin	"maps/r61c/chunks.bin"

Padding2:
	incbin	"Level/Wacky Workbench/Data/Chunks (Act 1 Present).bin", $E800, $200
	include	"Level/Wacky Workbench/Data/Legacy Padding 2/Suffix 0000.asm"

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
	include	"sprites/r6/flower.asm"
	even

FlowerGfx:
	incbin	"gfx/r6/flower.nem"
	even

TitleCardTextGfx:
	incbin	"gfx/r6/title_card_text.nem"
	even

byte_233B0C:
	incbin	"data/r6/byte_233B0C.bin"
	even

byte_233B8C:
	incbin	"data/r6/byte_233B8C.bin"
	even

byte_233C0C:
	incbin	"data/r6/byte_233C0C.bin"
	even

byte_233D0C:
	incbin	"data/r6/byte_233D0C.bin"
	even

byte_233E0C:
	incbin	"data/r6/byte_233E0C_c.bin"
	even

LaunchGfx:
	incbin	"gfx/r6/launch.nem"
	even

FreezerGfx:
	incbin	"gfx/r6/freezer.nem"
	even

IceBlockGfx:
	incbin	"gfx/r6/ice_block.nem"
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
	incbin	"maps/r61c/collision.bin"
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
	incbin	"maps/r61c/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r61c/background.bin"
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
	incbin	"maps/r61c/blocks.nem"
	even

StageGfx:
	incbin	"maps/r61c/gfx.nem"
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

PistonGfx:
	incbin	"gfx/r6/piston.nem"
	even

PlatformGfxA:
	incbin	"gfx/r6/platform_a.nem"
	even

PlatformGfxB:
	incbin	"gfx/r6/platform_b.nem"
	even

PlatformGfxCD:
	incbin	"gfx/r6/platform_cd.nem"
	even

BouncePlatformGfx:
	incbin	"gfx/r6/bounce_platform.nem"
	even

SwitchGfx:
	incbin	"gfx/switch.nem"
	even

DoorGfx:
	incbin	"gfx/r6/door.nem"
	even

BossDoorGfx:
	incbin	"gfx/r6/boss_door.nem"
	even

CrusherGfxABD:
	incbin	"gfx/r6/crusher_abd.nem"
	even

CrusherGfxC:
	incbin	"gfx/r6/crusher_c.nem"
	even

TubeDoorGfx:
	incbin	"gfx/r6/tube_door.nem"
	even

ElectricOrbA:
	incbin	"gfx/r6/electric_orb_a.nem"
	even

ElectricOrbB:
	incbin	"gfx/r6/electric_orb_b.nem"
	even

ElectricOrbC:
	incbin	"gfx/r6/electric_orb_c.nem"
	even

ElectricOrbD:
	incbin	"gfx/r6/electric_orb_d.nem"
	even

BataPyonGfx:
	incbin	"gfx/r6/bata_pyon.nem"
	even

PohBeeGfx:
	incbin	"gfx/r6/poh_bee.nem"
	even

MinomusiGfx:
	incbin	"gfx/r6/minomusi.nem"
	even

SpikeBombGfx:
	incbin	"gfx/spike_bomb.nem"
	even

SnakeBlocksGfx:
	incbin	"gfx/r6/snake_blocks.nem"
	even

SemiGfx:
	incbin	"gfx/r6/semi.nem"
	even

SeesawGfx:
	incbin	"gfx/r6/seesaw.nem"
	even

EggmanStatueGfx:
	incbin	"gfx/r6/eggman_statue.nem"
	even

SpikeChainGfx:
	incbin	"gfx/spike_chain.nem"
	even

AnimalsGfx:
	incbin	"gfx/r6/animals.nem"

Padding3:
	include	"Level/Wacky Workbench/Data/R61CD Padding 3 Prefix Head.asm"
	include	"Level/Wacky Workbench/Data/R61CD Padding 3 Prefix Tail.asm"
	include	"Level/Wacky Workbench/Data/R61C Padding 3 Bridge.asm"
	include	"Level/Wacky Workbench/Data/R61AC Padding 3 Suffix Prefix.asm"
	include	"Level/Wacky Workbench/Data/R61 Padding 3 Final.asm"

; ------------------------------------------------------------------------------
