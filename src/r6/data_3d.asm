; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R63D)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		; The USA table keeps the shared graphics tail through the fixed $10000 boundary.
		dc.w	$7000, $1880, $D040, $14B1, $0002, $1031, $0003, $4880, $D040, $D040, $7200, $1211, $D241, $D041, $2271, $0002
		dc.w	$47F9, $00FF, $1980, $26D9, $51CE, $FFFC, $D4FC, $0001, $D8FC, $0001, $7000, $4E75, $D4FC, $0001, $D8FC, $0001
		dc.w	$7001, $4E75, $0400, $0400, $0901, $0402, $0F03, $0023, $3F0C, $0023, $3F8C, $0023, $400C, $0023, $408C, $5312
		dc.w	$6A00, $0034, $1491, $7000, $1014, $5200, $B029, $0001, $6502, $7000, $1880, $D040, $D040, $2271, $0002, $47F9
		dc.w	$00FF, $1980, $26D9, $51CE, $FFFC, $D4FC, $0001, $D8FC, $0001, $7000, $4E75, $D4FC, $0001, $D8FC, $0001, $7001
		dc.w	$4E75, $0403, $0023, $3C0C, $0023, $3D0C, $0023, $3E0C, $0302, $0023, $3B0C, $0023, $3B8C, $0323, $81DC, $0223
		dc.w	$6F30, $0021, $0000, $0081, $0404, $0026, $002E, $008A, $0026, $008A, $008A, $008A, $008A, $008A, $008A, $008A
		dc.w	$008A, $008A, $008A, $008A, $008A, $00E6, $008A, $00EE, $0000, $0023, $81DC, $0000, $000E, $0023, $0DA2, $6C00
		dc.w	$0023, $39BC, $7A00, $0023, $CA20, $8700, $0023, $CC94, $8AE0, $0023, $CFF4, $9100, $0023, $D458, $9500, $0023
		dc.w	$D2B6, $9900, $0023, $DC52, $9A00, $0023, $213A, $A400, $0023, $34BC, $AD00, $0023, $235C, $B500, $0023, $2960
		dc.w	$D000, $0022, $EDE6, $D8C0, $0023, $3732, $DAE0, $0023, $2E48, $F5C0, $000E, $0022, $F8FC, $5780, $0023, $4378
		dc.w	$5C20, $0023, $4220, $6200, $0023, $B174, $6800, $0023, $C8EE, $6B00, $0023, $B2B2, $6D40, $0023, $BE78, $7340
		dc.w	$0023, $BECA, $7400, $0023, $D378, $7500, $0023, $D6B0, $7700, $0023, $BD98, $7D00, $0023, $DB7A, $7F00, $0023
		dc.w	$410C, $8000, $0023, $C34E, $8200, $0023, $C066, $9D00, $0000, $0023, $0098, $7880, $0002, $0022, $FABC, $8780
		dc.w	$0022, $F4F2, $9100
		dc.l	$0020BBBC
		dc.w	$7DE0
		dc.w	$7DE0
		dc.l	$0023D59E
		dc.w	$78C0
		dc.l	$0023C440
		dc.w	$7D20
		dc.l	$0023D0C4
		dc.w	$8BA0
		dc.w	0
		dc.w	$23
	else
		; European/Japanese legacy graphics and routine fragment.
		dc.w	$7000, $1880, $D040, $14B1, $0002, $1031, $0003, $4880, $D040, $D040, $7200, $1211, $D241, $D041, $2271, $0002
		dc.w	$47F9, $00FF, $1980, $26D9, $51CE, $FFFC, $D4FC, $0001, $D8FC, $0001, $7000, $4E75, $D4FC, $0001, $D8FC, $0001
		dc.w	$7001, $4E75, $0400, $0400, $0901, $0402, $0F03, $0023, $3F0C, $0023, $3F8C, $0023, $400C, $0023, $408C, $5312
		dc.w	$6A00, $0034, $1491, $7000, $1014, $5200, $B029, $0001, $6502, $7000, $1880, $D040, $D040, $2271, $0002, $47F9
		dc.w	$00FF, $1980, $26D9, $51CE, $FFFC, $D4FC, $0001, $D8FC, $0001, $7000, $4E75, $D4FC, $0001, $D8FC, $0001, $7001
		dc.w	$4E75, $0403, $0023, $3C0C, $0023, $3D0C, $0023, $3E0C, $0302, $0023, $3B0C, $0023, $3B8C, $0323, $81DC, $0223
		dc.w	$6F30, $0021, $0000, $0081, $0404, $0026, $002E, $008A, $0026, $008A, $008A, $008A, $008A, $008A, $008A, $008A
		dc.w	$008A, $008A, $008A, $008A, $008A, $00E6, $008A, $00EE, $0000, $0023, $81DC, $0000, $000E, $0023, $0DA2, $6C00
		dc.w	$0023, $39BC, $7A00, $0023, $CA20, $8700, $0023, $CC94, $8AE0, $0023, $CFF4, $9100, $0023, $D458, $9500, $0023
		dc.w	$D2B6, $9900, $0023, $DC52, $9A00, $0023, $213A, $A400, $0023, $34BC, $AD00, $0023, $235C, $B500, $0023, $2960
		dc.w	$D000, $0022, $EDE6, $D8C0, $0023, $3732, $DAE0, $0023, $2E48, $F5C0, $000E, $0022, $F8FC, $5780, $0023, $4378
		dc.w	$5C20, $0023, $4220, $6200, $0023, $B174, $6800, $0023, $C8EE, $6B00, $0023, $B2B2, $6D40, $0023, $BE78, $7340
		dc.w	$0023, $BECA, $7400, $0023, $D378, $7500, $0023, $D6B0, $7700, $0023, $BD98, $7D00, $0023, $DB7A, $7F00, $0023
		dc.w	$410C, $8000, $0023, $C34E, $8200, $0023, $C066, $9D00, $0000, $0023, $0098, $7880, $0002, $0022, $FABC, $8780
		dc.w	$0022, $F4F2, $9100, $0020, $BBC2, $7DE0, $7880, $0002, $0022, $FABC, $8780, $0022, $F4F2, $9100, $0020
	endif

StageChunks:
	incbin	"maps/r63d/chunks.bin"
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
	incbin	"Level/Wacky Workbench/Data/Padding/2 (Act 1 Present).bin", $938, $CC8

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
	incbin	"data/r6/byte_233E0C.bin"
	even

byte_233F0C:
	incbin	"data/r6/byte_233F0C.bin"
	even

byte_233F8C:
	incbin	"data/r6/byte_233F8C.bin"
	even

byte_23400C:
	incbin	"data/r6/byte_23400C.bin"
	even

byte_23408C:
	incbin	"data/r6/byte_23408C.bin"
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
	incbin	"maps/r63d/collision.bin"
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
	incbin	"maps/r63d/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r63d/background.bin"
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
	incbin	"maps/r63d/blocks.nem"
	even

StageGfx:
	incbin	"maps/r63d/gfx.nem"
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
	even

HologramAnimalsGfx:
	incbin	"gfx/r6/hologram_animals.nem"
	even

RobotTransportGfxA:
	incbin	"gfx/robot_transport_a.nem"
	even

RobotTransportGfxB:
	incbin	"gfx/robot_transport_b.nem"
	even

HologramGfx:
	incbin	"gfx/hologram.nem"
	even

BossMachineGfx:
	incbin	"gfx/r6/boss_machine.nem"
	even

EggmanGfx:
	incbin	"gfx/r6/eggman.nem"
	even

EggmanEscapeGfx:
	incbin	"gfx/r6/eggman_escape.nem"
	even

BossDestroyGfx:
	incbin	"gfx/r6/boss_destroy.nem"
	even

BossFloorGfxD:
	incbin	"gfx/r6/boss_floor_d.nem"
	even

BossPiecesGfxD:
	incbin	"gfx/r6/boss_pieces_d.nem"

Padding3:
	include	"Level/Wacky Workbench/Data/R63D Compressed Tail.asm"

; ------------------------------------------------------------------------------
