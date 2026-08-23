; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R31A)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		include	"Level/USA Legacy R31A PreTail.asm"
	else
		include	"Level/European Legacy R31A Padding1.asm"
	endif

StageChunks:
	incbin	"Level/Collision Chaos/Data/Chunks (Act 1 Present).bin"
	even

StageCollisionAngles:
	incbin	"Level/_Data/Collision Angles.bin"
	even

StageCollisionColumns:
	incbin	"Level/_Data/Collision Height Map.bin"
	even

StageCollisionRows:
	incbin	"Level/_Data/Collision Width Map.bin"
	even

StageCollision:
	incbin	"Level/Collision Chaos/Data/Collision (Act 1 Present).bin"
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
	incbin	"Level/Collision Chaos/Data/Foreground (Act 1 Present).bin"
	even

StageMapBg:
	incbin	"Level/Collision Chaos/Data/Background (Act 1 Present).bin"
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
	dc.b	0, $F0, 1, $F0, $F
	dcb.b	2,0
	dc.b	$F0, 1, $F0, $F
	dcb.b	2,0
	dc.b	$F0, 1, $F0, $F
	dcb.b	2,0
	dc.b	$F0, 2, $EC, $E
	dcb.b	2,0
	dc.b	$F0, 4, 9, 0, $C, $F8, 0, 3, $EC, $E
	dcb.b	2,0
	dc.b	$F8, 4, 9, 0, $C, $F8, $C
	dcb.b	2,0
	dc.b	$12, $10, 4, $EC, 9
	dcb.b	2,0
	dc.b	$F4, $FC, 1, 0, 6, $EC, $FC, $A, 0, 8, $F4, $FC, 1, 0, $11
	dc.b	$C, 0, 3, $EC, $E, 8, 0, $E8, 4, 9, 8, $C, $F0, $C, 0, 8
	dc.b	$12, $E8, 4, $EC, 9
	dcb.b	2,0
	dc.b	$F4, $FC, 1, 0, 6, $EC, $FC, $A, 0, 8, $F4, $FC, 1, 8, $11
	dc.b	$C, 0, 2, $EC, $F
	dcb.b	2,0
	dc.b	$F8
	dcb.b	2,$C
	dc.b	0, $10, $F8, 0, 2, $EC, $F, 8, 0, $E8
	dcb.b	2,$C
	dc.b	8, $10, $E8
	dcb.b	2,0
	dc.b	$14, 0, $3E, 0, $6C, 0, $9A, 0, $C8, 0, $EC, 1, $C, 1, $5E
	dc.b	1, $AA, 1, $F2, 8, $E8, 1
	dcb.b	2,0
	dcb.b	2,$F8
	dc.b	8, 0, 2
	dcb.b	2,$E8
	dc.b	1, 8
	dcb.b	2,0
	dc.b	$F8
	dcb.b	2,8
	dc.b	2
	dcb.b	2,0
	dc.b	8, $10, 2, $E8, 0, 8, $18, 2, 0, 8, 1, $10, 0, $F8, 8, 1
	dc.b	$18
	dcb.b	3,0
	dc.b	9, $E8, 9, 0, 5, $F4, $F8, $C, 0, $B, $E4, $F8, 4, 0, $F
	dc.b	4, 0, $C, $10, $B, $E4, 0, 4, $10, $F, 4, 8, 9, $10, 5, $F4
	dc.b	$E8, 5, 0, $37, $ED, $F8, 5, 0, $3B, $DD, 8, 5, $10, $37
	dc.b	$ED, 9, $E8, 9, 0, $11, $F3, $F8, $C, 0, $17, $E3, $F8, 4
	dc.b	0, $1B, 3, 0, $C, $10, $17, $E3, 0, 4, $10, $1B, 3, 8, 9
	dc.b	$10, $11, $F3, $E8, 5, 0, $37, $E6, $F8, 5, 0, $3B, $D8, 8
	dc.b	5, $10, $37, $E6, 9, $E8, 9, 0, $1D, $ED, $F8, $C, 0, $23
	dc.b	$E5, $F8
	dcb.b	2,0
	dc.b	$10, 5, 0, $C, $10, $23, $E5
	dcb.b	2,0
	dcb.b	2,$10
	dc.b	5, 8, 9, $10, $1D, $ED, $E8, 5, 0, $37, $E2, $F8, 5, 0, $3B
	dc.b	$D5, 8, 5, $10, $37, $E2, 7, $E8, 3, 0, $27, $D8, $E8, 3
	dc.b	0, $27, $E0, $E8, 3, 0, $27
	dcb.b	2,$E8
	dc.b	6, 0, $2B, $F0, $E8, 6, 0, $31
	dcb.b	2,0
	dc.b	6, $18, $31, $F0, 0, 6, $18, $2B, 0, 6, $F8, 3, $10, $27
	dc.b	$D8, $F8, 3, $10, $27, $E0, $E8, 6, 8, $31, $F0, $E8, 6, 8
	dc.b	$2B
	dcb.b	2,0
	dc.b	6, $10, $2B, $F0, 0, 6, $10, $31
	dcb.b	2,0
	dc.b	$10, $E8, 9, 0, $11, $F3, $F8, $C, 0, $17, $E3, $F8, 4, 0
	dc.b	$1B, 3, 0, $C, $10, $17, $E3, 0, 4, $10, $1B, 3, 8, 9, $10
	dc.b	$11, $F3, $E8, 3, 0, $27, $D8, $E8, 3, 0, $27, $E0, $E8, 3
	dc.b	0, $27
	dcb.b	2,$E8
	dc.b	6, 0, $2B, $F0, $E8, 6, 0, $31
	dcb.b	2,0
	dc.b	6, $18, $31, $F0, 0, 6, $18, $2B, 0, $E8, 5, 0, $37, $E6
	dc.b	$F8, 5, 0, $3B, $D8, 8, 5, 0, $37, $E6, 0, $F, $E8, 9, 0
	dc.b	$1D, $ED, $F8, $C, 0, $23, $E5, $F8
	dcb.b	2,0
	dc.b	$10, 5, 0, $C, $10, $23, $E5
	dcb.b	2,0
	dcb.b	2,$10
	dc.b	5, 8, 9, $10, $1D, $ED, $F8, 3, $10, $27, $D8, $F8, 3, $10
	dc.b	$27, $E0, $E8, 6, 8, $31, $F0, $E8, 6, 8, $2B
	dcb.b	2,0
	dc.b	6, $10, $2B, $F0, 0, 6, $10, $31, 0, $E8, 5, 0, $37, $E2
	dc.b	$F8, 5, 0, $3B, $D5, 8, 5, 0, $37, $E2, $C, $E8, 1
	dcb.b	2,0
	dcb.b	2,$F8
	dc.b	8, 0, 2
	dcb.b	2,$E8
	dc.b	1, 8
	dcb.b	2,0
	dc.b	$F8
	dcb.b	2,8
	dc.b	2
	dcb.b	2,0
	dc.b	8, $10, 2, $E8, 0, 8, $18, 2, 0, 8, 1, $10, 0, $F8, 8, 1
	dc.b	$18
	dcb.b	2,0
	dc.b	$E8, 6, 0, $2B, $EC, $E8, 6, 0, $31, 4, 0, 6, $18, $2B, 4
	dc.b	0, 6, $18, $31
	dcb.b	2,$EC
	dc.b	3, 0, $27, $E4, $F4, 3, $18, $27, $14, 0, $C, $E8, 1
	dcb.b	2,0
	dcb.b	2,$F8
	dc.b	8, 0, 2
	dcb.b	2,$E8
	dc.b	1, 8
	dcb.b	2,0
	dc.b	$F8
	dcb.b	2,8
	dc.b	2
	dcb.b	2,0
	dc.b	8, $10, 2, $E8, 0, 8, $18, 2, 0, 8, 1, $10, 0, $F8, 8, 1
	dc.b	$18
	dcb.b	2,0
	dc.b	$E8, 6, $10, $2B, 4, $E8, 6, $10, $31, $EC, 0, 6, 8, $2B
	dc.b	$EC, 0, 6, 8, $31, 4, $F4, 3, $10, $27, $E4, $EC, 3, 8, $27
	dc.b	$14, 0, $E0
	dcb.b	3,0
	dc.b	$E0
	dcb.b	3,0
	dc.b	$E0, 0

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
	incbin	"data/r3/byte_233A9A.bin"
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

StageBlocks:
	incbin	"Level/Collision Chaos/Data/Blocks (Act 1 Present).nem"
	even

StageGfx:
	incbin	"Level/Collision Chaos/Data/Graphics (Act 1 Present).nem"
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

MetalSonicGfx:
	incbin	"gfx/r3/metal_sonic.nem"
	even

AmyRoseGfx:
	incbin	"gfx/r3/amy_rose.nem"
	even

MetalSonicSprites:
	include	"sprites/r3/metal_sonic.asm"
	even

AmyRoseSprites:
	include	"sprites/r3/amy_rose.asm"
	even

IntroSpikesSprites:
	include	"sprites/r3/intro_spikes.asm"
	even

AmyRoseAnims:
	include	"anims/r3/amy_rose.asm"

Padding3:
	dcb.b	1,0
	dc.b	$CF, $D4, $F8, $73, $F5, $73, $CB, 7, $E7, $E9, $FB, $EF, $DE, $FE, $FB, $F7
	dc.b	$BF, $BE, $FE, $9F, $F7, $BA, $9F, $F7, $DD, $4F, $FB, $E7, $EA, $A6, $1F, $BE
	dc.b	$EA, $E8, $FD, $5D, $1F, $AB, $9F, $A3, $F5, $3E, $F, $D4, $F8, $4B, $A9, $FF
	dc.b	$7B, $CF, $87, $EF, $7A, $3F, $57, $47, $EA, $E9, $FB, $D9, $61, $FD, $DC, $3F
	dc.b	$BC, $FD, $1F, $F, $DE, $F3, $E1, $CF, $2E, $AE, $77, $FD
	dcb.b	2,$EF
	dc.b	$BA, $3F, $EF, $8B, $67, $91, $6A, $FE, $E9, $6A, $FE, $EB, $EC, $8D, $7D, $3F
	dc.b	$FB, $1C, $FF, $DD, $E7, $FE, $EE, $AC, $75, $3F, $F7, $9F, $FB, $DD, $54, $EA
	dc.b	$A7, $FF, $BF, $FD, $FF, $ED, $58, $EA, $E9, $FA, $E6, $8D, $71, $D3, $C9, $F6
	dc.b	$46, $BD, $5E, $5D, $35, $79, $74, $2F, $E9, $C7, $F0, $CB, $9F, $FB, $AF, $FD
	dc.b	$E7, $FE, $F7, $F3, $63, $F8, $7E, $58, $7E, $BB, $C9, $FF, $BB, $87, $F7, $5F
	dc.b	$F5, $D1, $FC, $E8, $E7, $1F, $DE, $FE, $1C, $7F, $F, $FF, $D1, $FF, $DF, $EE
	dc.b	$D7, $CB, 8, $F2, $C3, $FB, $B8, $7F, $77, $9E, $9D, $45, $FC, $D8, $D7, $4E
	dc.b	$7F, $E9, $F3, $FF, $4F, $5E, $AF, $F1, $CB, $F5, $D5, $FE, $76, $C8, $E7, $D9
	dc.b	$FA, $EA, $FF, $FB, $F5, $DD, $5F, $BE, $7E, $AF, $DF, $75, $47, $95, $7C, $9F
	dc.b	$F5, $D1, $D5, $FA, $E2, $FF, $EF, $49, $6C, $2E, $9E, $5A, $BA, $7E, $F7, $FC
	dc.b	$7A, $F5, $7F, $4F, $A8, $7F, $4F, $5B, $17, $F3, $A3, $FF, $DF, $AE, $D9, $CF
	dc.b	$1E, $5C, $F4, $FE, $6F, $EB, $8B, $A4, $6B, $FF, $F7, $EB, $A5, $D3, $F7, $DF
	dc.b	$BD, $FD, $73, $7F, $B5, $9F, $F8, $7A, $9F, $F8, $7A, $BF, $7B, $D, $FB, $D8
	dc.b	$6E, $AA, $B7, $3F, $FC, $FA, $3F, $F4, $DF, $FF, $DF, $CE, $8D, $8F, $FA, $ED
	dc.b	$95, $FF, $D9, $EC, $92, $6C, $EF, 0, 1, $AB, $CB, $F7, $80, 2, $E5, $AB
	dc.b	$5C, $B9, $23, $17, $5C, $20, $74, $96, $6E, $DB, $7E, $6F, $78, $CF, $7E, $7B
	dc.b	$C6, $C2, $E5, $81, $72, $EB, $99, $37, $5C, $C3, $B4, $33, $EA, $8D, $42, $5A
	dc.b	$A9, $CA, $5A, $AB, $C3, $5F, $28, $E5, $5E, $F, $C0, $8C, $BF, $36, $F9, $11
	dc.b	$97, 7, $3E, $5A, $F9, $73, $C7, $80, $FC, $D7, $6B, $A, $4C, $17, $E9, $DE
	dc.b	$63, $F8, $7A, $27, $45, 5, $7B, $42, $88, $9B, $AE, $61, $17, $A4, $DF, $F6
	dc.b	$BF, $B7, $94, $C0, $9E, $3A, $FF, $31, $F9, $CA, $5D, $FA, $EA, $EE, $8F, $CC
	dc.b	$76, $75, $F9, $44, $C5, $38, $F5, $57, $3C, $A7, $1E, $5A, $75, $C6, $71, $CB
	dc.b	$57, $E7, $FF, $77, $A, $29, $AB, $F3, $55, $CF, $25, $8F, $D5, $72, $DF, $19
	dc.b	$C7, $D, $FF, $9B, $FD, $FC, $94, 5, $C7, $7F, $3F, $E6, $E9, $77, $85, $77
	dc.b	$49
	dcb.b	2,$4D
	dc.b	$4A, $F7, $32, $30, $48, $70, $C4, $98, $B0, $B8, $12, $52, $E2, $32, $6B, $81
	dc.b	$5C, $48, $1D, 3, $B2, $34, $23, $43, 4, $D8, $6C, $64, $C7, 6, $21, $1D
	dc.b	9, $24, $D0, $60, $9A, $12, $8C
	dcb.b	3,$4C
	dc.b	$EC, $46, $ED, $23, 4, $64, $72, $61, $C, $4D, $43, $96, $9A, $26, $F2
	dcb.b	2,$62
	dc.b	$64, $73, $23, 5, $74, $20, $24, $84, $26, $74, 1, $AE, $8B, $8C, $3A, $12
	dc.b	$50, $C9, 9, 1, $23, $13, $42, 9, $32, $13, $11, $91, $EC, $15, $68, $64
	dc.b	$24, 6, $20, $EA, $6E
	dcb.b	3,$C4
	dc.b	$C8, $48, $46, $49, $84, $19, $30, $23, $93, 3, $76, $26, $11, $A5, $DA, $5B
	dc.b	$CB, $56, 8, $D5, $D7, $46, $7D, $45
	dcb.b	2,$AA
	dc.b	$E8, $21, $85, $4D, $5D, 9, $35, $16, $F6
	dcb.b	2,$52
	dc.b	$D4, $5A, $A4, $80, $12, $55, $96, $4D, $56, $AB, $49, $59, $4D, $49, $58, 7
	dc.b	$59, $31, $34, $DC, $C5, $52, $70, $B5, $9C, $4D, $90, $92, $AB, $13, $A1, $82
	dc.b	$32, $37, $6C, $4E, $26, $53, $11, $C8, $AE, $EB, $2E, $55, $D6, $83, $52, $6A
	dc.b	$AA, $8A
	dcb.b	2,$31
	dc.b	$21, $30, $59, $26, $A2, $DE
	dcb.b	2,$6A
	dc.b	$5A, $8B, $54, $90, $8C
	dcb.b	2,$90
	dc.b	$42, $51, $44
	dcb.b	2,$98
	dc.b	$90, $99, $D5, $94, $D4, $94, $3B, $11, $91, $C9, $71, $9C, $8C, $11, $BC, $E1
	dc.b	$6B, $37, $39, $92, $1A, $1C, $95, $CE, $6E, $95, $38, $30, $D8, $9C, $4D, $A6
	dc.b	$20, $C8, $D8, $CB, $70, $A1, $C3, $12, $62, $D2, $39, $20, $24, $A1, $A6, $44
	dc.b	$C4, $80, $90, $48, $D0, $42, $55, $A1, $A8, $6E
	dcb.b	3,$C6
	dc.b	$59, $46, $41, $D0, $13, $41, $83, $68, $41
	dcb.b	2,$23
	dc.b	$62, $3C, $4C, $11, $96, $40, 3, $91, $D1, $C
	dcb.b	2,$8C
	dc.b	$8D, $C, $51, $21, 1, $24, $21, $B0, $10, $C6, $86, $E8, $46, 4, $19, $21
	dc.b	$A0, $24, 1, $CD, $9C
	dcb.b	2,$C8
	dc.b	$D8, $DA, $46, $1A, $18, $41, $83, $73, $A9, $83, $43, $42, $32, $42, $68, $32
	dc.b	$60, $59, 9, $18, 6, $ED
	dcb.b	2,$23
	dc.b	$63, $43, $12, $60, $E6, $E8, $21, $85, $72, $74, $24, $73, $63, $23, 8, 1
	dc.b	$25, $58, $E4, $D5, $6A, $B4, $8D, $B7, $11, $B0, $E, $72, $62, $68, $31, $54
	dc.b	$91, $87, $63, $23, $A9, $87, $30
	dcb.b	2,$46
	dc.b	$1C, $C0
	dcb.b	2,$23
	dc.b	$43, $23, $A2, 2, $4A, $18, $A3, $13, $12, $13, 3, $92, $3F, $F0, $82, $11
	dc.b	$92, $12, 8, $4A, $18, $93, $13, $12, $13, $39, $B6, $E2, $30, $EC, $46, $47
	dc.b	$23, $12, $30, $47, $43, 6, $FF, $B2, $91, $B9, $C2, $54, $E0, $C0, $39, $30
	dc.b	$96, $A9, $EA, $B6, $A9, $EA, $E3, $FB, $E8, $D7, $FB, $E0, $5E, $55, $F2, $FF
	dc.b	$F7, $FF, $BF, $FD, $FF, $3F, $FE, $C7, $FF, $45, $7F, $FB, $FF, $DF, $F9, $FE
	dc.b	$BB, $F8, $71, $FC, $D1, $FF, $DF, $FE, $C7, $F3, $63, $FF, $BF, $CD, $97, $49
	dc.b	$74, $FD, $EC, $BF, $7D, $FF, $3F, $F9, $FF, $CF, $A6, $2C, $FF, $C3, $8F, $E9
	dc.b	$D3, $FA, $7D, $5C, $FD, $3C, $B5, $7E, $F6, $1B, $F7, $BD, $3F, $7B, $FF, $EF
	dc.b	$DF, $6C, $AE, $C2, $FF, $F4, $BF, $FD, $FC, $38, $FE, $1C, $7F, $CF, $A7, $EF
	dc.b	$7A, $7E, $FA, $5F, $F3, $FD, $EF, $4E, $AE, $7F, $EE, $F3, $FE
	dcb.b	2,$F7
	dc.b	$DD, $25, $FF, $EF, $FF, $74, $97, $EF, $7F, $7C, $25, $FB
	dcb.b	2,$DF
	dc.b	$74, $FF, $F0, $FF, $F7, $FF, $A9, $D5, $4E, $AF, $FF, $7F, $FB, $FF, $DC, $FF
	dc.b	$D3, $7F, $EE, $CB, $FF, $B2, $FF
	dcb.b	2,$EF
	dc.b	$A5, $FB, $EF, $DE, $FE, $FB, $F7, $BD, $3F
	dcb.b	2,$FB
	dc.b	$DF, $FF, $7F, $FA, $5F, $FD, $E9, $FB
	dcb.b	2,$DF
	dc.b	$7F, $F7, $FE, $7C, $FF, $D3, $7F, $EE, $CB, $FF, $B2, $FF, $9F, $FC, $E5, $D0
	dc.b	$7E
	dcb.b	2,$F7
	dc.b	$DF, $ED, $D5, $FE, $32, $E9, $2F, $DE, $FE, $FB, $AB, $FB, $DD, $5F, $FE, $E7
	dc.b	$97, $4F, $DF, $74, $1F, $BE, $97, $EF, $A3, $F8, $71, $FF, $3F, $F9, $B7, $EF
	dc.b	$76, $17, $EF, $A3, $FE, $7F, $F3, $69, $7E
	dcb.b	2,$F7
	dc.b	$DF, $BD, $FD, $F7, $49, $7F, $FB, $F7, $D2, $E9, $FB, $EE, $92, $FF, $F0, $FD
	dc.b	$F4, $BF, $7D, $2F, $DF, $FE, $EE, $14, $97, $34, $95, $33, $3A, $92, $E6, $B5
	dc.b	$66, $8C, $4A, $F6, $42, $49, $1B, $9A, $C4, $C9, $A, $6B, $B, $3B, $56, $76
	dc.b	$30, $69, $34, $29, $DB, $24, $9B, $CE, $C7, 8, $26, $73, $23, $49, $AC, $ED
	dc.b	$95, $9D, $49, $66, $65, $91, $2E, $37, $1B, $E6, $2D, $B3, $C7, $31, $66, $2D
	dc.b	$B9, $4B, $BC, $B2, $2F, $DA, $17, $ED, $56, $67, $19, $89, $2F, $24, $E6, $6E
	dc.b	$D0, $5D, $ED, $DA, $B3, $4C, $3F, $4C, $17, $36, $DD, $C5, $3D, $BD, $7F, $9F
	dc.b	$EB, $C5, $A4, $C2, $E0, $92, $42, $3A, $A3, $9D, $8F, $32, 3, $62, $B1, $E6
	dc.b	$86, $12, $32, $4A, $9B, $A4, $8C, $8E, $8C, $46, $A, $7B, $7A, $F9, $75, $E9
	dc.b	$C4, $FF, $5F, $FB, $E2, $C0, $AE, $24, $9F, $E6, $FF, $51, $A7, $89, $7F, $88
	dc.b	$BF, $C3, $3F, $F2, $14, $E9, $63, $1F, $CC
	dcb.b	2,$FC
	dc.b	$F2, $23, $2C, $B, $B3, $86, $9F, $D5, $97, $F8, $A7, $FE, $12, $FF, $26, $65
	dc.b	$85
	dcb.b	2,$98
	dc.b	$85, $9A, $65, $B, $34, $32, $45, $AA, $2D
	dcb.b	2,$16
	dc.b	$68, $65, $99, $A, $E6, $2C, $8B, $BC, $B3, $27, $EC, $A5, $FB, $50, $59, $8B
	dc.b	$F6, $A5, $92, $7E, $C8, $AE, $2E, $F2, $D0, $9F, $B4, $2E, $62, $E6, $2D, $C5
	dc.b	$B8, $B9, $8B, $98, $17, $31, $73, $16, $E2, $DC, $5C, $C5, $CD, $AA, $C5, $FC
	dc.b	$3E, $B7, $BD, $A0, $F6, $99, $34, $B6, $92, $DF, $23, $B2, $3A, $39, $CC, $92
	dc.b	$F2, $47, $39, $AE, $F7, $42, $39, $A9, $77, $16, $4D, $BF, $73, $D9, $FF, $4F
	dc.b	$5B, $15, $AB, $62, $B4, $33, $ED, $84, $73, $B4, $5C, $53, $2B, $4C, $AE, $8B
	dc.b	$4C, $B3, $16, $82, $E6, $25, $24, $2D, $CE, $C6, $5C, $C1, $D8, $CB, $98, $94
	dc.b	$90, $B7, $3E, $82, $E6, $20
	dcb.b	2,0
	dc.b	$12, 0, $1A, 0, $20, 0, $3A, 0, $54, 0, $6E, 0, $7A, 0, $B4, 0
	dc.b	$EE
	dcb.b	2,1
	dc.b	0, 2, 0, 3, 0, $FF, 5, 4, 5, 6, 7, $FF, 0
	dcb.b	2,4
	dc.b	0
	dcb.b	2,4
	dc.b	0
	dcb.b	2,5
	dc.b	0
	dcb.b	2,5
	dc.b	0
	dcb.b	2,6
	dc.b	0
	dcb.b	2,6
	dc.b	0
	dcb.b	2,7
	dc.b	0
	dcb.b	2,7
	dc.b	0, $FF, 0
	dcb.b	2,4
	dc.b	0, 4
	dcb.b	2,0
	dcb.b	2,5
	dc.b	0, 5
	dcb.b	2,0
	dcb.b	2,6
	dc.b	0, 6
	dcb.b	2,0
	dcb.b	2,7
	dc.b	0, 7
	dcb.b	2,0
	dc.b	$FF, 0, 4
	dcb.b	2,0
	dc.b	4
	dcb.b	2,0
	dc.b	5
	dcb.b	2,0
	dc.b	5
	dcb.b	2,0
	dc.b	6
	dcb.b	2,0
	dc.b	6
	dcb.b	2,0
	dc.b	7
	dcb.b	2,0
	dc.b	7
	dcb.b	2,0
	dc.b	$FF, 0, 8, 9, $A, $B, $C, $B, $A, 9, 8, 0, $FF, 0
	dcb.b	2,8
	dc.b	0
	dcb.b	2,8
	dc.b	0
	dcb.b	2,9
	dc.b	0
	dcb.b	2,9
	dc.b	0
	dcb.b	2,$A
	dc.b	0
	dcb.b	2,$A
	dc.b	0
	dcb.b	2,$B
	dc.b	0
	dcb.b	2,$B
	dc.b	0
	dcb.b	2,$C
	dc.b	0
	dcb.b	2,$C
	dc.b	0
	dcb.b	2,$B
	dc.b	0
	dcb.b	2,$B
	dc.b	0
	dcb.b	2,$A
	dc.b	0
	dcb.b	2,$A
	dc.b	0
	dcb.b	2,9
	dc.b	0
	dcb.b	2,9
	dc.b	0
	dcb.b	2,8
	dc.b	0
	dcb.b	2,8
	dcb.b	2,0
	dc.b	$FF
	dcb.b	2,0
	dcb.b	2,8
	dc.b	0, 8
	dcb.b	2,0
	dcb.b	2,9
	dc.b	0, 9
	dcb.b	2,0
	dcb.b	2,$A
	dc.b	0, $A
	dcb.b	2,0
	dcb.b	2,$B
	dc.b	0, $B
	dcb.b	2,0
	dcb.b	2,$C
	dc.b	0, $C
	dcb.b	2,0
	dcb.b	2,$B
	dc.b	0, $B
	dcb.b	2,0
	dcb.b	2,$A
	dc.b	0, $A
	dcb.b	2,0
	dcb.b	2,9
	dc.b	0, 9
	dcb.b	2,0
	dcb.b	2,8
	dc.b	0, 8
	dcb.b	3,0
	dc.b	$FF
	dcb.b	2,0
	dc.b	8
	dcb.b	2,0
	dc.b	8
	dcb.b	2,0
	dc.b	9
	dcb.b	2,0
	dc.b	9
	dcb.b	2,0
	dc.b	$A
	dcb.b	2,0
	dc.b	$A
	dcb.b	2,0
	dc.b	$B
	dcb.b	2,0
	dc.b	$B
	dcb.b	2,0
	dc.b	$C
	dcb.b	2,0
	dc.b	$C
	dcb.b	2,0
	dc.b	$B
	dcb.b	2,0
	dc.b	$B
	dcb.b	2,0
	dc.b	$A
	dcb.b	2,0
	dc.b	$A
	dcb.b	2,0
	dc.b	9
	dcb.b	2,0
	dc.b	9
	dcb.b	2,0
	dc.b	8
	dcb.b	2,0
	dc.b	8
	dcb.b	3,0
	dc.b	$FF
	dcb.b	2,0
	dc.b	$25, 0, $1A, 0, $2F, 0, $44, 0, $59, 0, $6E, 0, $83, 0, $98, 0
	dc.b	$AE, 0, $C4, 0, $DA, 0, $F0, 1, 6, 4, $E8, $A
	dcb.b	2,0
	dcb.b	2,$E8
	dc.b	$A, 0, 9
	dcb.b	2,0
	dc.b	$A, $10, 0, $E8, 0, $A, $10, 9, 0, 4, $E8, $A, 0, $12
	dcb.b	2,$E8
	dc.b	$A, 0, $1B
	dcb.b	2,0
	dc.b	$A, $10, $12, $E8, 0, $A, $10, $1B, 0, 4, $E8, $A, 8, 9
	dcb.b	2,$E8
	dc.b	$A, 8
	dcb.b	3,0
	dc.b	$A, $18, 9, $E8, 0, $A, $18
	dcb.b	2,0
	dc.b	4, $E8, $A
	dcb.b	2,0
	dcb.b	2,$E8
	dc.b	$A, 0, 9
	dcb.b	2,0
	dc.b	$A, $18, 9, $E8, 0, $A, $18
	dcb.b	2,0
	dc.b	4, $E8, $A, 8, 9
	dcb.b	2,$E8
	dc.b	$A, 8
	dcb.b	3,0
	dc.b	$A, $10, 0, $E8, 0, $A, $10, 9, 0, 4, $E8, $A, 0, $12
	dcb.b	2,$E8
	dc.b	$A, 0, $1B
	dcb.b	2,0
	dc.b	$A, $18, $1B, $E8, 0, $A, $18, $12, 0, 4, $E8, $A, 8, $1B
	dcb.b	2,$E8
	dc.b	$A, 8, $12
	dcb.b	2,0
	dc.b	$A, $10, $12, $E8, 0, $A, $10, $1B
	dcb.b	2,0
	dc.b	4, $F0, 5
	dcb.b	2,0
	dcb.b	2,$F0
	dc.b	5, 8
	dcb.b	3,0
	dc.b	5, $10, 0, $F0, 0, 5, $18
	dcb.b	3,0
	dc.b	4, $F0, 5, 0, 4
	dcb.b	2,$F0
	dc.b	5, 8, 4
	dcb.b	2,0
	dc.b	5, $10, 4, $F0, 0, 5, $18, 4
	dcb.b	2,0
	dc.b	4, $E8, $A, 0, 8
	dcb.b	2,$E8
	dc.b	$A
	dcb.b	2,8
	dcb.b	2,0
	dc.b	$A, $10, 8, $E8, 0, $A, $18, 8
	dcb.b	2,0
	dc.b	4, $F0, 5, 0, $11
	dcb.b	2,$F0
	dc.b	5, 0, $15
	dcb.b	2,0
	dc.b	5, $18, $15, $F0, 0, 5, $18, $11
	dcb.b	2,0
	dc.b	2, $F4, 6, 0, $19, $F0, $F4, 6, 8, $19
	dcb.b	3,0
	dc.b	6, 0, $E, 0, $14, 3, 0, 4, 3, 1, 2, $FC, 0, 3, 0, 1
	dc.b	2, $FC, 0, 3, 6, 5, $FC, 0, $E, 0, $1A, 0, $26, 0, $2C, 0
	dc.b	$42, 0, $58, 0, $5E, 2, $F0, 5
	dcb.b	2,0
	dc.b	$FC, $F8
	dcb.b	2,0
	dc.b	4, $F4, 0, 2, $E0
	dcb.b	2,0
	dc.b	5, $F8, $E8, $E, 0, 6, $F0, 0, 1, $E0, $F, 0, $12, $F0, 4, $D0
	dc.b	6, 0, $22, $F8, $D8
	dcb.b	2,0
	dc.b	$28, $F0, $E0
	dcb.b	2,0
	dc.b	$29, 8, $E8, $E, 0, $2A, $F0, 0, 4, $C0
	dcb.b	2,0
	dc.b	$36, $F8, $C8, 6, 0, $37, $F8, $D8
	dcb.b	2,0
	dc.b	$3D, $F0, $E0, $F, 0, $3E, $F0, 0, 1, $F0, 9, 0, $4E, $F4, 1, $F8
	dc.b	4, 0, $54, $F8, 0, 2
	dcb.b	3,0
	dcb.b	8,1
	dc.b	$FC, 0, $10, 0, 4, 2, $D0, 3
	dcb.b	2,0
	dc.b	$E4, $F0, 1, 0, 4, $E4, 0, 2, $F8, $C, 0, 6, $E8, $F8, 4, 0
	dc.b	$A, 8
	dcb.b	2,0
	dc.b	2, 3, 0, 1, 2, $FC
	dcb.b	2,0
	dc.b	6, 0, $C, 0, $12, 1, $F0, $F
	dcb.b	2,0
	dc.b	$F0, 1, $F4, $A, 0, $10, $F4, 1, $F8, 5, 0, $19, $F8, 0, 4, 0
	dc.b	$C, 3, 0, 5, 6, 3, 4, $FC, 0, 3, 0, 1, 2, 3, 4, $FC
	dcb.b	2,0
	dc.b	$E, 0, $1A, 0, $2A, 0, $40, 0, $56, 0, $6C, 0, $7C, 2, $F8, 5
	dcb.b	2,0
	dc.b	$F0, $F8, 5, 8
	dcb.b	3,0
	dc.b	3, $F0, $D, 0, 4, $F0, 0, 5, 0, $C, $F0, 0, 5, 8, $C, 0
	dc.b	4, $F0, 5, 0, $10
	dcb.b	2,$F0
	dc.b	5, 0, $14
	dcb.b	2,0
	dc.b	5, 0, $18, $F0, 0, 5, $18, $10
	dcb.b	2,0
	dc.b	4, $E8, $A, 0, $1C
	dcb.b	2,$E8
	dc.b	$A, 8, $1C
	dcb.b	2,0
	dc.b	$A, $10, $1C, $E8, 0, $A, $18, $1C
	dcb.b	2,0
	dc.b	4, $E8, $A, 0, $25
	dcb.b	2,$E8
	dc.b	$A, 8, $25
	dcb.b	2,0
	dc.b	$A, $10, $25, $E8, 0, $A, $18, $25
	dcb.b	2,0
	dc.b	3, $F0, $D, 0, $2E, $F0, 0, 5, 0, $36, $F0, 0, 5, 8, $36, 0
	dc.b	4, $F0, 5, 0, $3A
	dcb.b	2,$F0
	dc.b	5, 0, $3E
	dcb.b	2,0
	dc.b	5, 0, $42, $F0, 0, 5, $18, $3A
	dcb.b	8,0
	dcb.b	5,1
	dcb.b	7,2
	dcb.b	$1D,3
	dcb.b	7,2
	dcb.b	5,1
	dcb.b	6,0
	dcb.b	5,$FF
	dcb.b	5,$FE
	dcb.b	7,$FD
	dcb.b	$1D,$FC
	dcb.b	7,$FD
	dcb.b	5,$FE
	dcb.b	5,$FF
	dcb.b	6,0
	dcb.b	5,1
	dcb.b	7,2
	dcb.b	$1D,3
	dcb.b	7,2
	dcb.b	5,1
	dcb.b	6,0
	dcb.b	5,$FF
	dcb.b	5,$FE
	dcb.b	7,$FD
	dcb.b	$1D,$FC
	dcb.b	7,$FD
	dcb.b	5,$FE
	dcb.b	5,$FF
	dc.b	0, 2, 3, 2, 3, $FF, 0, 8, 0, $1E, 0, $2A, 0, $36, 4, $E8
	dc.b	3
	dcb.b	2,0
	dc.b	$F8, $E8, 3, 8
	dcb.b	2,0
	dc.b	8, 1, 0, 4, $F8, 8, 1, 8, 4
	dcb.b	2,0
	dc.b	2, $F8, 1, 0, 6
	dcb.b	2,$F8
	dc.b	1, 8, 6
	dcb.b	2,0
	dc.b	2, $F8, 1, 0, 8
	dcb.b	2,$F8
	dc.b	1
	dcb.b	2,8
	dcb.b	2,0
	dc.b	2, $F8, 1, 0, $A
	dcb.b	2,$F8
	dc.b	1, 8, $A
	dcb.b	3,0
	dc.b	2, 7, 0, 1, 2, 3, $FF, 0, 8, 0, $3C, 0, $70, 0, $7C, $A
	dc.b	$E0, 9
	dcb.b	2,0
	dc.b	$E8, $E0, 9, 0, 6, 0, $E8
	dcb.b	2,0
	dc.b	$C, $E0, $E8
	dcb.b	2,0
	dc.b	$D, $18, $F0, 7, 0, $E, $E0, $10
	dcb.b	2,0
	dc.b	$16, $E0, $10, 9, 0, $17, $E8, $10, 9, 0, $1D, 0, $10
	dcb.b	2,0
	dc.b	$23, $18, $F0, 7, 0, $24, $10, 0, $A, $E0, $D, 0, $2C, $F0, $E8
	dcb.b	2,0
	dc.b	$34, $E8, $F0, 7, 0, $35, $E8, $10
	dcb.b	2,0
	dc.b	$3D, $E8, $10, $D, 0, $3E, $F0, $E8
	dcb.b	2,0
	dc.b	$46, $10, $F0
	dcb.b	2,0
	dc.b	$47, 0, $F0, 7, 0, $48
	dcb.b	2,8
	dcb.b	2,0
	dc.b	$50, 0, $10
	dcb.b	2,0
	dc.b	$51, $10, 0, 2, $E0, $B, 0, $52, $F4, 0, $B, 0, $5E, $F4, 0, $A
	dc.b	$E0, $D, 8, $2C, $F0, $E8, 0, 8, $34, $10, $F0, 7, 8, $35, 8, $10
	dc.b	0, 8, $3D
	dcb.b	2,$10
	dc.b	$D, 8, $3E, $F0, $E8, 0, 8, $46, $E8, $F0, 0, 8, $47, $F8, $F0, 7
	dc.b	8, $48, $E8, 8, 0, 8, $50, $F8, $10, 0, 8, $51, $E8
	dcb.b	2,0
	dc.b	2, 1, 0, 1, 2, 4
	dcb.b	2,3
	dc.b	1, 2, 4, $FF
	dcb.b	2,0
	dc.b	$C, 0, $22, 0, $32, 0, $42, 0, $58, 0, $68, 4, $D4, $B
	dcb.b	2,0
	dc.b	$E8, $D4, $B, 0, $C, 0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48, $F0
	dc.b	0, 3, $D4, $F, 0, $18, $F0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48
	dc.b	$F0, 3, $D4, 3, 0, $28, $FC, $F4, 5, 0, $44, $F8, 4, $C, 0, $48
	dc.b	$F0, 4, $D4, $B, 0, $2C, $E8, $D4, $B, 0, $38, 0, $F4, 5, 0, $44
	dc.b	$F8, 4, $C, 0, $48, $F0, 0, 3, $D4, $F, 8, $18, $F0, $F4, 5, 0
	dc.b	$44, $F8, 4, $C, 0, $48, $F0, 4, $E4, 2
	dcb.b	2,0
	dc.b	$EC, $E4, $F, 0, 3, $F4, 4, 1, 0, $13, $FC, $14, 8, 0, $15, $F4
	dcb.b	2,0
	dc.b	4, 0, $2C, 1
	dcb.b	$1E,0
	dc.b	1
	dcb.b	2,0
	dc.b	1
	dcb.b	2,0
	dc.b	1, $FF, 0, 2, 3, 4, 5, 6, 7, 8, $FF, 0, $12, 0, $50, 0
	dc.b	$8E, 0, $AE, 0, $B4, 0, $BA, 0, $C0, 0, $C6, 0, $CC, $C, $E0, 1
	dcb.b	2,0
	dc.b	$F8, $E0, 1, 8
	dcb.b	2,0
	dc.b	$F0, 8, 0, 2, $E8, $F0, 8, 0, 5, 0, $F8, $D, 0, 8, $E0, $F8
	dc.b	$D, 0, $10, 0, 8, $D, 0, $18, $E0, 8, $D, 8, $18, 0, $18, $C
	dc.b	0, $20, $E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8
	dc.b	$54
	dcb.b	2,0
	dc.b	$C, $E0, 1, 0, $24, $F8, $E0, 1, 8, $24, 0, $F0, 8, 0, $26, $E8
	dc.b	$F0, 8, 0, $29, 0, $F8, $D, 0, $2C, $E0, $F8, $D, 0, $34, 0, 8
	dc.b	$D, 0, $3C, $E0, 8, $D, 8, $3C, 0, $18, $C, 0, $20, $E0, $18, $C
	dc.b	8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
	dcb.b	2,0
	dc.b	6, 8, $D, 0, $44, $E0, 8, $D, 0, $4C, 0, $18, $C, 0, $20, $E0
	dc.b	$18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
	dcb.b	2,0
	dc.b	1, $F8, 5, 0, $5C, $F8, 1, $F8, 5, 0, $60, $F8, 1, $F8, 5, 0
	dc.b	$64, $F8, 1, $F8, 5, 8, $64, $F8, 1, $F8, 5, 8, $60, $F8, 1, $F8
	dc.b	5, 8, $5C, $F8, $BE, $B7, $12, 3, $FF, $9A, $6E, $8C, $AE, $2C, $B0, $24
	dc.b	$2C, $E6, $46, $D2, $C8, $8D, $25, $81, $24, $AE, $A1, $E1, $76, $4D, $71, $64
	dc.b	$E6, $46, $59, $D9, 9, $93, $2B, $8B, $26, $73, $7C, $F0, $92, $CE, $48, $E8
	dc.b	$48, $57, $76, $ED, $BE, $D9, $9F, $A3, $F3, $F4, $97, $EF, $B0, $A7, $FF, $9F
	dc.b	$FB, $DD, $5F, $DE, $EA, $E9, $CE, $FF, $BD, $7E, $7F, $DE, $BF, $3C, $BA, $A5
	dc.b	$D3, $9F, $AB, $9F, $A7, $57, $3F, $4E, $AE, $7E, $9F, $BD, $E9, $FB, $DE, $7C
	dc.b	$3F, $7C, $FD, $5F, $BE, $7E, $A7, $FD, $EB, $F5, $7F, $4F, $AB, $9F, $A7, $EF
	dc.b	$5F, $A7, $EF, $79, $F0, $FD, $F4, $BA, $73, $FF, $4D, $F0, $7F, $DF, $75, $73
	dc.b	$CB, $AB, $F7, $CF, $83, $F3, $BF, $3B, $F3, $F5, $73, $E1, $CF, $D4, $F8, $73
	dc.b	$F5, $73, $CB, 7, $E7, $E9, $FB, $EF, $DE, $FE, $FB, $F7, $BF, $BE, $FE, $9F
	dc.b	$F7, $BA, $9F, $F7, $DD, $4F, $FB, $E7, $EA, $A6, $1F, $BE, $EA, $E8, $FD, $5D
	dc.b	$1F, $AB, $9F, $A3, $F5, $3E, $F, $D4, $F8, $4B, $A9, $FF, $7B, $CF, $87, $EF
	dc.b	$7A, $3F, $57, $47, $EA, $E9, $FB, $D9, $61, $FD, $DC, $3F, $BC, $FD, $1F, $F
	dc.b	$DE, $F3, $E1, $CF, $2E, $AE, $77, $FD
	dcb.b	2,$EF
	dc.b	$BA, $3F, $EF, $8B, $67, $91, $6A, $FE, $E9, $6A, $FE, $EB, $EC, $8D, $7D, $3F
	dc.b	$FB, $1C, $FF, $DD, $E7, $FE, $EE, $AC, $75, $3F, $F7, $9F, $FB, $DD, $54, $EA
	dc.b	$A7, $FF, $BF, $FD, $FF, $ED, $58, $EA, $E9, $FA, $E6, $8D, $71, $D3, $C9, $F6
	dc.b	$46, $BD, $5E, $5D, $35, $79, $74, $2F, $E9, $C7, $F0, $CB, $9F, $FB, $AF, $FD
	dc.b	$E7, $FE, $F7, $F3, $63, $F8, $7E, $58, $7E, $BB, $C9, $FF, $BB, $87, $F7, $5F
	dc.b	$F5, $D1, $FC, $E8, $E7, $1F, $DE, $FE, $1C, $7F, $F, $FF, $D1, $FF, $DF, $EE
	dc.b	$D7, $CB, 8, $F2, $C3, $FB, $B8, $7F, $77, $9E, $9D, $45, $FC, $D8, $D7, $4E
	dc.b	$7F, $E9, $F3, $FF, $4F, $5E, $AF, $F1, $CB, $F5, $D5, $FE, $76, $C8, $E7, $D9
	dc.b	$FA, $EA, $FF, $FB, $F5, $DD, $5F, $BE, $7E, $AF, $DF, $75, $47, $95, $7C, $9F
	dc.b	$F5, $D1, $D5, $FA, $E2, $FF, $EF, $49, $6C, $2E, $9E, $5A, $BA, $7E, $F7, $FC
	dc.b	$7A, $F5, $7F, $4F, $A8, $7F, $4F, $5B, $17, $F3, $A3, $FF, $DF, $AE, $D9, $CF
	dc.b	$1E, $5C, $F4, $FE, $6F, $EB, $8B, $A4, $6B, $FF, $F7, $EB, $A5, $D3, $F7, $DF
	dc.b	$BD, $FD, $73, $7F, $B5, $9F, $F8, $7A, $9F, $F8, $7A, $BF, $7B, $D, $FB, $D8
	dc.b	$6E, $AA, $B7, $3F, $FC, $FA, $3F, $F4, $DF, $FF, $DF, $CE, $8D, $8F, $FA, $ED
	dc.b	$95, $FF, $D9, $EC, $92, $6C, $EF, 0, 1, $AB, $CB, $F7, $80, 2, $E5, $AB
	dc.b	$5C, $B9, $23, $17, $5C, $20, $74, $96, $6E, $DB, $7E, $6F, $78, $CF, $7E, $7B
	dc.b	$C6, $C2, $E5, $81, $72, $EB, $99, $37, $5C, $C3, $B4, $33, $EA, $8D, $42, $5A
	dc.b	$A9, $CA, $5A, $AB, $C3, $5F, $28, $E5, $5E, $F, $C0, $8C, $BF, $36, $F9, $11
	dc.b	$97, 7, $3E, $5A, $F9, $73, $C7, $80, $FC, $D7, $6B, $A, $4C, $17, $E9, $DE
	dc.b	$63, $F8, $7A, $27, $45, 5, $7B, $42, $88, $9B, $AE, $61, $17, $A4, $DF, $F6
	dc.b	$BF, $B7, $94, $C0, $9E, $3A, $FF, $31, $F9, $CA, $5D, $FA, $EA, $EE, $8F, $CC
	dc.b	$76, $75, $F9, $44, $C5, $38, $F5, $57, $3C, $A7, $1E, $5A, $75, $C6, $71, $CB
	dc.b	$57, $E7, $FF, $77, $A, $29, $AB, $F3, $55, $CF, $25, $8F, $D5, $72, $DF, $19
	dc.b	$C7, $D, $FF, $9B, $FD, $FC, $94, 5, $C7, $7F, $3F, $E6, $E9, $77, $85, $77
	dc.b	$49
	dcb.b	2,$4D
	dc.b	$4A, $F7, $32, $30, $48, $70, $C4, $98, $B0, $B8, $12, $52, $E2, $32, $6B, $81
	dc.b	$5C, $48, $1D, 3, $B2, $34, $23, $43, 4, $D8, $6C, $64, $C7, 6, $21, $1D
	dc.b	9, $24, $D0, $60, $9A, $12, $8C
	dcb.b	3,$4C
	dc.b	$EC, $46, $ED, $23, 4, $64, $72, $61, $C, $4D, $43, $96, $9A, $26, $F2
	dcb.b	2,$62
	dc.b	$64, $73, $23, 5, $74, $20, $24, $84, $26, $74, 1, $AE, $8B, $8C, $3A, $12
	dc.b	$50, $C9, 9, 1, $23, $13, $42, 9, $32, $13, $11, $91, $EC, $15, $68, $64
	dc.b	$24, 6, $20, $EA, $6E
	dcb.b	3,$C4
	dc.b	$C8, $48, $46, $49, $84, $19, $30, $23, $93, 3, $76, $26, $11, $A5, $DA, $5B
	dc.b	$CB, $56, 8, $D5, $D7, $46, $7D, $45
	dcb.b	2,$AA
	dc.b	$E8, $21, $85, $4D, $5D, 9, $35, $16, $F6
	dcb.b	2,$52
	dc.b	$D4, $5A, $A4, $80, $12, $55, $96, $4D, $56, $AB, $49, $59, $4D, $49, $58, 7
	dc.b	$59, $31, $34, $DC, $C5, $52, $70, $B5, $9C, $4D, $90, $92, $AB, $13, $A1, $82
	dc.b	$32, $37, $6C, $4E, $26, $53, $11, $C8, $AE, $EB, $2E, $55, $D6, $83, $52, $6A
	dc.b	$AA, $8A
	dcb.b	2,$31
	dc.b	$21, $30, $59, $26, $A2, $DE
	dcb.b	2,$6A
	dc.b	$5A, $8B, $54, $90, $8C
	dcb.b	2,$90
	dc.b	$42, $51, $44
	dcb.b	2,$98
	dc.b	$90, $99, $D5, $94, $D4, $94, $3B, $11, $91, $C9, $71, $9C, $8C, $11, $BC, $E1
	dc.b	$6B, $37, $39, $92, $1A, $1C, $95, $CE, $6E, $95, $38, $30, $D8, $9C, $4D, $A6
	dc.b	$20, $C8, $D8, $CB, $70, $A1, $C3, $12, $62, $D2, $39, $20, $24, $A1, $A6, $44
	dc.b	$C4, $80, $90, $48, $D0, $42, $55, $A1, $A8, $6E
	dcb.b	3,$C6
	dc.b	$59, $46, $41, $D0, $13, $41, $83, $68, $41
	dcb.b	2,$23
	dc.b	$62, $3C, $4C, $11, $96, $40, 3, $91, $D1, $C
	dcb.b	2,$8C
	dc.b	$8D, $C, $51, $21, 1, $24, $21, $B0, $10, $C6, $86, $E8, $46, 4, $19, $21
	dc.b	$A0, $24, 1, $CD, $9C
	dcb.b	2,$C8
	dc.b	$D8, $DA, $46, $1A, $18, $41, $83, $73, $A9, $83, $43, $42, $32, $42, $68, $32
	dc.b	$60, $59, 9, $18, 6, $ED
	dcb.b	2,$23
	dc.b	$63, $43, $12, $60, $E6, $E8, $21, $85, $72, $74, $24, $73, $63, $23, 8, 1
	dc.b	$25, $58, $E4, $D5, $6A, $B4, $8D, $B7, $11, $B0, $E, $72, $62, $68, $31, $54
	dc.b	$91, $87, $63, $23, $A9, $87, $30
	dcb.b	2,$46
	dc.b	$1C, $C0
	dcb.b	2,$23
	dc.b	$43, $23, $A2, 2, $4A, $18, $A3, $13, $12, $13, 3, $92, $3F, $F0, $82, $11
	dc.b	$92, $12, 8, $4A, $18, $93, $13, $12, $13, $39, $B6, $E2, $30, $EC, $46, $47
	dc.b	$23, $12, $30, $47, $43, 6, $FF, $B2, $91, $B9, $C2, $54, $E0, $C0, $39, $30
	dc.b	$96, $A9, $EA, $B6, $A9, $EA, $E3, $FB, $E8, $D7, $FB, $E0, $5E, $55, $F2, $FF
	dc.b	$F7, $FF, $BF, $FD, $FF, $3F, $FE, $C7, $FF, $45, $7F, $FB, $FF, $DF, $F9, $FE
	dc.b	$BB, $F8, $71, $FC, $D1, $FF, $DF, $FE, $C7, $F3, $63, $FF, $BF, $CD, $97, $49
	dc.b	$74, $FD, $EC, $BF, $7D, $FF, $3F, $F9, $FF, $CF, $A6, $2C, $FF, $C3, $8F, $E9
	dc.b	$D3, $FA, $7D, $5C, $FD, $3C, $B5, $7E, $F6, $1B, $F7, $BD, $3F, $7B, $FF, $EF
	dc.b	$DF, $6C, $AE, $C2, $FF, $F4, $BF, $FD, $FC, $38, $FE, $1C, $7F, $CF, $A7, $EF
	dc.b	$7A, $7E, $FA, $5F, $F3, $FD, $EF, $4E, $AE, $7F, $EE, $F3, $FE
	dcb.b	2,$F7
	dc.b	$DD, $25, $FF, $EF, $FF, $74, $97, $EF, $7F, $7C, $25, $FB
	dcb.b	2,$DF
	dc.b	$74, $FF, $F0, $FF, $F7, $FF, $A9, $D5, $4E, $AF, $FF, $7F, $FB, $FF, $DC, $FF
	dc.b	$D3, $7F, $EE, $CB, $FF, $B2, $FF
	dcb.b	2,$EF
	dc.b	$A5, $FB, $EF, $DE, $FE, $FB, $F7, $BD, $3F
	dcb.b	2,$FB
	dc.b	$DF, $FF, $7F, $FA, $5F, $FD, $E9, $FB
	dcb.b	2,$DF
	dc.b	$7F, $F7, $FE, $7C, $FF, $D3, $7F, $EE, $CB, $FF, $B2, $FF, $9F, $FC, $E5, $D0
	dc.b	$7E
	dcb.b	2,$F7
	dc.b	$DF, $ED, $D5, $FE, $32, $E9, $2F, $DE, $FE, $FB, $AB, $FB, $DD, $5F, $FE, $E7
	dc.b	$97, $4F, $DF, $74, $1F, $BE, $97, $EF, $A3, $F8, $71, $FF, $3F, $F9, $B7, $EF
	dc.b	$76, $17, $EF, $A3, $FE, $7F, $F3, $69, $7E
	dcb.b	2,$F7
	dc.b	$DF, $BD, $FD, $F7, $49, $7F, $FB, $F7, $D2, $E9, $FB, $EE, $92, $FF, $F0, $FD
	dc.b	$F4, $BF, $7D, $2F, $DF, $FE, $EE, $14, $97, $34, $95, $33, $3A, $92, $E6, $B5
	dc.b	$66, $8C, $4A, $F6, $42, $49, $1B, $9A, $C4, $C9, $A, $6B, $B, $3B, $56, $76
	dc.b	$30, $69, $34, $29, $DB, $24, $9B, $CE, $C7, 8, $26, $73, $23, $49, $AC, $ED
	dc.b	$95, $9D, $49, $66, $65, $91, $2E, $37, $1B, $E6, $2D, $B3, $C7, $31, $66, $2D
	dc.b	$B9, $4B, $BC, $B2, $2F, $DA, $17, $ED, $56, $67, $19, $89, $2F, $24, $E6, $6E
	dc.b	$D0, $5D, $ED, $DA, $B3, $4C, $3F, $4C, $17, $36, $DD, $C5, $3D, $BD, $7F, $9F
	dc.b	$EB, $C5, $A4, $C2, $E0, $92, $42, $3A, $A3, $9D, $8F, $32, 3, $62, $B1, $E6
	dc.b	$86, $12, $32, $4A, $9B, $A4, $8C, $8E, $8C, $46, $A, $7B, $7A, $F9, $75, $E9
	dc.b	$C4, $FF, $5F, $FB, $E2, $C0, $AE, $24, $9F, $E6, $FF, $51, $A7, $89, $7F, $88
	dc.b	$BF, $C3, $3F, $F2, $14, $E9, $63, $1F, $CC
	dcb.b	2,$FC
	dc.b	$F2, $23, $2C, $B, $B3, $86, $9F, $D5, $97, $F8, $A7, $FE, $12, $FF, $26, $65
	dc.b	$85
	dcb.b	2,$98
	dc.b	$85, $9A, $65, $B, $34, $32, $45, $AA, $2D
	dcb.b	2,$16
	dc.b	$68, $65, $99, $A, $E6, $2C, $8B, $BC, $B3, $27, $EC, $A5, $FB, $50, $59, $8B
	dc.b	$F6, $A5, $92, $7E, $C8, $AE, $2E, $F2, $D0, $9F, $B4, $2E, $62, $E6, $2D, $C5
	dc.b	$B8, $B9, $8B, $98, $17, $31, $73, $16, $E2, $DC, $5C, $C5, $CD, $AA, $C5, $FC
	dc.b	$3E, $B7, $BD, $A0, $F6, $99, $34, $B6, $92, $DF, $23, $B2, $3A, $39, $CC, $92
	dc.b	$F2, $47, $39, $AE, $F7, $42, $39, $A9, $77, $16, $4D, $BF, $73, $D9, $FF, $4F
	dc.b	$5B, $15, $AB, $62, $B4, $33, $ED, $84, $73, $B4, $5C, $53, $2B, $4C, $AE, $8B
	dc.b	$4C, $B3, $16, $82, $E6, $25, $24, $2D, $CE, $C6, $5C, $C1, $D8, $CB, $98, $94
	dc.b	$90, $B7, $3E, $82, $E6, $20
	dcb.b	2,0
	dc.b	$12, 0, $1A, 0, $20, 0, $3A, 0, $54, 0, $6E, 0, $7A, 0, $B4, 0
	dc.b	$EE
	dcb.b	2,1
	dc.b	0, 2, 0, 3, 0, $FF, 5, 4, 5, 6, 7, $FF, 0
	dcb.b	2,4
	dc.b	0
	dcb.b	2,4
	dc.b	0
	dcb.b	2,5
	dc.b	0
	dcb.b	2,5
	dc.b	0
	dcb.b	2,6
	dc.b	0
	dcb.b	2,6
	dc.b	0
	dcb.b	2,7
	dc.b	0
	dcb.b	2,7
	dc.b	0, $FF, 0
	dcb.b	2,4
	dc.b	0, 4
	dcb.b	2,0
	dcb.b	2,5
	dc.b	0, 5
	dcb.b	2,0
	dcb.b	2,6
	dc.b	0, 6
	dcb.b	2,0
	dcb.b	2,7
	dc.b	0, 7
	dcb.b	2,0
	dc.b	$FF, 0, 4
	dcb.b	2,0
	dc.b	4
	dcb.b	2,0
	dc.b	5
	dcb.b	2,0
	dc.b	5
	dcb.b	2,0
	dc.b	6
	dcb.b	2,0
	dc.b	6
	dcb.b	2,0
	dc.b	7
	dcb.b	2,0
	dc.b	7
	dcb.b	2,0
	dc.b	$FF, 0, 8, 9, $A, $B, $C, $B, $A, 9, 8, 0, $FF, 0
	dcb.b	2,8
	dc.b	0
	dcb.b	2,8
	dc.b	0
	dcb.b	2,9
	dc.b	0
	dcb.b	2,9
	dc.b	0
	dcb.b	2,$A
	dc.b	0
	dcb.b	2,$A
	dc.b	0
	dcb.b	2,$B
	dc.b	0
	dcb.b	2,$B
	dc.b	0
	dcb.b	2,$C
	dc.b	0
	dcb.b	2,$C
	dc.b	0
	dcb.b	2,$B
	dc.b	0
	dcb.b	2,$B
	dc.b	0
	dcb.b	2,$A
	dc.b	0
	dcb.b	2,$A
	dc.b	0
	dcb.b	2,9
	dc.b	0
	dcb.b	2,9
	dc.b	0
	dcb.b	2,8
	dc.b	0
	dcb.b	2,8
	dcb.b	2,0
	dc.b	$FF
	dcb.b	2,0
	dcb.b	2,8
	dc.b	0, 8
	dcb.b	2,0
	dcb.b	2,9
	dc.b	0, 9
	dcb.b	2,0
	dcb.b	2,$A
	dc.b	0, $A
	dcb.b	2,0
	dcb.b	2,$B
	dc.b	0, $B
	dcb.b	2,0
	dcb.b	2,$C
	dc.b	0, $C
	dcb.b	2,0
	dcb.b	2,$B
	dc.b	0, $B
	dcb.b	2,0
	dcb.b	2,$A
	dc.b	0, $A
	dcb.b	2,0
	dcb.b	2,9
	dc.b	0, 9
	dcb.b	2,0
	dcb.b	2,8
	dc.b	0, 8
	dcb.b	3,0
	dc.b	$FF
	dcb.b	2,0
	dc.b	8
	dcb.b	2,0
	dc.b	8
	dcb.b	2,0
	dc.b	9
	dcb.b	2,0
	dc.b	9
	dcb.b	2,0
	dc.b	$A
	dcb.b	2,0
	dc.b	$A
	dcb.b	2,0
	dc.b	$B
	dcb.b	2,0
	dc.b	$B
	dcb.b	2,0
	dc.b	$C
	dcb.b	2,0
	dc.b	$C
	dcb.b	2,0
	dc.b	$B
	dcb.b	2,0
	dc.b	$B
	dcb.b	2,0
	dc.b	$A
	dcb.b	2,0
	dc.b	$A
	dcb.b	2,0
	dc.b	9
	dcb.b	2,0
	dc.b	9
	dcb.b	2,0
	dc.b	8
	dcb.b	2,0
	dc.b	8
	dcb.b	3,0
	dc.b	$FF
	dcb.b	2,0
	dc.b	$25, 0, $1A, 0, $2F, 0, $44, 0, $59, 0, $6E, 0, $83, 0, $98, 0
	dc.b	$AE, 0, $C4, 0, $DA, 0, $F0, 1, 6, 4, $E8, $A
	dcb.b	2,0
	dcb.b	2,$E8
	dc.b	$A, 0, 9
	dcb.b	2,0
	dc.b	$A, $10, 0, $E8, 0, $A, $10, 9, 0, 4, $E8, $A, 0, $12
	dcb.b	2,$E8
	dc.b	$A, 0, $1B
	dcb.b	2,0
	dc.b	$A, $10, $12, $E8, 0, $A, $10, $1B, 0, 4, $E8, $A, 8, 9
	dcb.b	2,$E8
	dc.b	$A, 8
	dcb.b	3,0
	dc.b	$A, $18, 9, $E8, 0, $A, $18
	dcb.b	2,0
	dc.b	4, $E8, $A
	dcb.b	2,0
	dcb.b	2,$E8
	dc.b	$A, 0, 9
	dcb.b	2,0
	dc.b	$A, $18, 9, $E8, 0, $A, $18
	dcb.b	2,0
	dc.b	4, $E8, $A, 8, 9
	dcb.b	2,$E8
	dc.b	$A, 8
	dcb.b	3,0
	dc.b	$A, $10, 0, $E8, 0, $A, $10, 9, 0, 4, $E8, $A, 0, $12
	dcb.b	2,$E8
	dc.b	$A, 0, $1B
	dcb.b	2,0
	dc.b	$A, $18, $1B, $E8, 0, $A, $18, $12, 0, 4, $E8, $A, 8, $1B
	dcb.b	2,$E8
	dc.b	$A, 8, $12
	dcb.b	2,0
	dc.b	$A, $10, $12, $E8, 0, $A, $10, $1B
	dcb.b	2,0
	dc.b	4, $F0, 5
	dcb.b	2,0
	dcb.b	2,$F0
	dc.b	5, 8
	dcb.b	3,0
	dc.b	5, $10, 0, $F0, 0, 5, $18
	dcb.b	3,0
	dc.b	4, $F0, 5, 0, 4
	dcb.b	2,$F0
	dc.b	5, 8, 4
	dcb.b	2,0
	dc.b	5, $10, 4, $F0, 0, 5, $18, 4
	dcb.b	2,0
	dc.b	4, $E8, $A, 0, 8
	dcb.b	2,$E8
	dc.b	$A
	dcb.b	2,8
	dcb.b	2,0
	dc.b	$A, $10, 8, $E8, 0, $A, $18, 8
	dcb.b	2,0
	dc.b	4, $F0, 5, 0, $11
	dcb.b	2,$F0
	dc.b	5, 0, $15
	dcb.b	2,0
	dc.b	5, $18, $15, $F0, 0, 5, $18, $11
	dcb.b	2,0
	dc.b	2, $F4, 6, 0, $19, $F0, $F4, 6, 8, $19
	dcb.b	3,0
	dc.b	6, 0, $E, 0, $14, 3, 0, 4, 3, 1, 2, $FC, 0, 3, 0, 1
	dc.b	2, $FC, 0, 3, 6, 5, $FC, 0, $E, 0, $1A, 0, $26, 0, $2C, 0
	dc.b	$42, 0, $58, 0, $5E, 2, $F0, 5
	dcb.b	2,0
	dc.b	$FC, $F8
	dcb.b	2,0
	dc.b	4, $F4, 0, 2, $E0
	dcb.b	2,0
	dc.b	5, $F8, $E8, $E, 0, 6, $F0, 0, 1, $E0, $F, 0, $12, $F0, 4, $D0
	dc.b	6, 0, $22, $F8, $D8
	dcb.b	2,0
	dc.b	$28, $F0, $E0
	dcb.b	2,0
	dc.b	$29, 8, $E8, $E, 0, $2A, $F0, 0, 4, $C0
	dcb.b	2,0
	dc.b	$36, $F8, $C8, 6, 0, $37, $F8, $D8
	dcb.b	2,0
	dc.b	$3D, $F0, $E0, $F, 0, $3E, $F0, 0, 1, $F0, 9, 0, $4E, $F4, 1, $F8
	dc.b	4, 0, $54, $F8, 0, 2
	dcb.b	3,0
	dcb.b	8,1
	dc.b	$FC, 0, $10, 0, 4, 2, $D0, 3
	dcb.b	2,0
	dc.b	$E4, $F0, 1, 0, 4, $E4, 0, 2, $F8, $C, 0, 6, $E8, $F8, 4, 0
	dc.b	$A, 8
	dcb.b	2,0
	dc.b	2, 3, 0, 1, 2, $FC
	dcb.b	2,0
	dc.b	6, 0, $C, 0, $12, 1, $F0, $F
	dcb.b	2,0
	dc.b	$F0, 1, $F4, $A, 0, $10, $F4, 1, $F8, 5, 0, $19, $F8, 0, 4, 0
	dc.b	$C, 3, 0, 5, 6, 3, 4, $FC, 0, 3, 0, 1, 2, 3, 4, $FC
	dcb.b	2,0
	dc.b	$E, 0, $1A, 0, $2A, 0, $40, 0, $56, 0, $6C, 0, $7C, 2, $F8, 5
	dcb.b	2,0
	dc.b	$F0, $F8, 5, 8
	dcb.b	3,0
	dc.b	3, $F0, $D, 0, 4, $F0, 0, 5, 0, $C, $F0, 0, 5, 8, $C, 0
	dc.b	4, $F0, 5, 0, $10
	dcb.b	2,$F0
	dc.b	5, 0, $14
	dcb.b	2,0
	dc.b	5, 0, $18, $F0, 0, 5, $18, $10
	dcb.b	2,0
	dc.b	4, $E8, $A, 0, $1C
	dcb.b	2,$E8
	dc.b	$A, 8, $1C
	dcb.b	2,0
	dc.b	$A, $10, $1C, $E8, 0, $A, $18, $1C
	dcb.b	2,0
	dc.b	4, $E8, $A, 0, $25
	dcb.b	2,$E8
	dc.b	$A, 8, $25
	dcb.b	2,0
	dc.b	$A, $10, $25, $E8, 0, $A, $18, $25
	dcb.b	2,0
	dc.b	3, $F0, $D, 0, $2E, $F0, 0, 5, 0, $36, $F0, 0, 5, 8, $36, 0
	dc.b	4, $F0, 5, 0, $3A
	dcb.b	2,$F0
	dc.b	5, 0, $3E
	dcb.b	2,0
	dc.b	5, 0, $42, $F0, 0, 5, $18, $3A
	dcb.b	8,0
	dcb.b	5,1
	dcb.b	7,2
	dcb.b	$1D,3
	dcb.b	7,2
	dcb.b	5,1
	dcb.b	6,0
	dcb.b	5,$FF
	dcb.b	5,$FE
	dcb.b	7,$FD
	dcb.b	$1D,$FC
	dcb.b	7,$FD
	dcb.b	5,$FE
	dcb.b	5,$FF
	dcb.b	6,0
	dcb.b	5,1
	dcb.b	7,2
	dcb.b	$1D,3
	dcb.b	7,2
	dcb.b	5,1
	dcb.b	6,0
	dcb.b	5,$FF
	dcb.b	5,$FE
	dcb.b	7,$FD
	dcb.b	$1D,$FC
	dcb.b	7,$FD
	dcb.b	5,$FE
	dcb.b	5,$FF
	dc.b	0, 2, 3, 2, 3, $FF, 0, 8, 0, $1E, 0, $2A, 0, $36, 4, $E8
	dc.b	3
	dcb.b	2,0
	dc.b	$F8, $E8, 3, 8
	dcb.b	2,0
	dc.b	8, 1, 0, 4, $F8, 8, 1, 8, 4
	dcb.b	2,0
	dc.b	2, $F8, 1, 0, 6
	dcb.b	2,$F8
	dc.b	1, 8, 6
	dcb.b	2,0
	dc.b	2, $F8, 1, 0, 8
	dcb.b	2,$F8
	dc.b	1
	dcb.b	2,8
	dcb.b	2,0
	dc.b	2, $F8, 1, 0, $A
	dcb.b	2,$F8
	dc.b	1, 8, $A
	dcb.b	3,0
	dc.b	2, 7, 0, 1, 2, 3, $FF, 0, 8, 0, $3C, 0, $70, 0, $7C, $A
	dc.b	$E0, 9
	dcb.b	2,0
	dc.b	$E8, $E0, 9, 0, 6, 0, $E8
	dcb.b	2,0
	dc.b	$C, $E0, $E8
	dcb.b	2,0
	dc.b	$D, $18, $F0, 7, 0, $E, $E0, $10
	dcb.b	2,0
	dc.b	$16, $E0, $10, 9, 0, $17, $E8, $10, 9, 0, $1D, 0, $10
	dcb.b	2,0
	dc.b	$23, $18, $F0, 7, 0, $24, $10, 0, $A, $E0, $D, 0, $2C, $F0, $E8
	dcb.b	2,0
	dc.b	$34, $E8, $F0, 7, 0, $35, $E8, $10
	dcb.b	2,0
	dc.b	$3D, $E8, $10, $D, 0, $3E, $F0, $E8
	dcb.b	2,0
	dc.b	$46, $10, $F0
	dcb.b	2,0
	dc.b	$47, 0, $F0, 7, 0, $48
	dcb.b	2,8
	dcb.b	2,0
	dc.b	$50, 0, $10
	dcb.b	2,0
	dc.b	$51, $10, 0, 2, $E0, $B, 0, $52, $F4, 0, $B, 0, $5E, $F4, 0, $A
	dc.b	$E0, $D, 8, $2C, $F0, $E8, 0, 8, $34, $10, $F0, 7, 8, $35, 8, $10
	dc.b	0, 8, $3D
	dcb.b	2,$10
	dc.b	$D, 8, $3E, $F0, $E8, 0, 8, $46, $E8, $F0, 0, 8, $47, $F8, $F0, 7
	dc.b	8, $48, $E8, 8, 0, 8, $50, $F8, $10, 0, 8, $51, $E8
	dcb.b	2,0
	dc.b	2, 1, 0, 1, 2, 4
	dcb.b	2,3
	dc.b	1, 2, 4, $FF
	dcb.b	2,0
	dc.b	$C, 0, $22, 0, $32, 0, $42, 0, $58, 0, $68, 4, $D4, $B
	dcb.b	2,0
	dc.b	$E8, $D4, $B, 0, $C, 0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48, $F0
	dc.b	0, 3, $D4, $F, 0, $18, $F0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48
	dc.b	$F0, 3, $D4, 3, 0, $28, $FC, $F4, 5, 0, $44, $F8, 4, $C, 0, $48
	dc.b	$F0, 4, $D4, $B, 0, $2C, $E8, $D4, $B, 0, $38, 0, $F4, 5, 0, $44
	dc.b	$F8, 4, $C, 0, $48, $F0, 0, 3, $D4, $F, 8, $18, $F0, $F4, 5, 0
	dc.b	$44, $F8, 4, $C, 0, $48, $F0, 4, $E4, 2
	dcb.b	2,0
	dc.b	$EC, $E4, $F, 0, 3, $F4, 4, 1, 0, $13, $FC, $14, 8, 0, $15, $F4
	dcb.b	2,0
	dc.b	4, 0, $2C, 1
	dcb.b	$1E,0
	dc.b	1
	dcb.b	2,0
	dc.b	1
	dcb.b	2,0
	dc.b	1, $FF, 0, 2, 3, 4, 5, 6, 7, 8, $FF, 0, $12, 0, $50, 0
	dc.b	$8E, 0, $AE, 0, $B4, 0, $BA, 0, $C0, 0, $C6, 0, $CC, $C, $E0, 1
	dcb.b	2,0
	dc.b	$F8, $E0, 1, 8
	dcb.b	2,0
	dc.b	$F0, 8, 0, 2, $E8, $F0, 8, 0, 5, 0, $F8, $D, 0, 8, $E0, $F8
	dc.b	$D, 0, $10, 0, 8, $D, 0, $18, $E0, 8, $D, 8, $18, 0, $18, $C
	dc.b	0, $20, $E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8
	dc.b	$54
	dcb.b	2,0
	dc.b	$C, $E0, 1, 0, $24, $F8, $E0, 1, 8, $24, 0, $F0, 8, 0, $26, $E8
	dc.b	$F0, 8, 0, $29, 0, $F8, $D, 0, $2C, $E0, $F8, $D, 0, $34, 0, 8
	dc.b	$D, 0, $3C, $E0, 8, $D, 8, $3C, 0, $18, $C, 0, $20, $E0, $18, $C
	dc.b	8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
	dcb.b	2,0
	dc.b	6, 8, $D, 0, $44, $E0, 8, $D, 0, $4C, 0, $18, $C, 0, $20, $E0
	dc.b	$18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
	dcb.b	2,0
	dc.b	1, $F8, 5, 0, $5C, $F8, 1, $F8, 5, 0, $60, $F8, 1, $F8, 5, 0
	dc.b	$64, $F8, 1, $F8, 5, 8, $64, $F8, 1, $F8, 5, 8, $60, $F8, 1, $F8
	dc.b	5, 8, $5C, $F8, $2D, $CE, $AE, $DC, $E5, $89, $76, $E7, $19, $39, $76, $E6
	dc.b	$5C, $B3, $97, $6E, $7D, $8E, $59, $CB, $B1, $EC, $72, $CE, $5E, $3B, $1C, $B3
	dc.b	$CF, $B1, $CB, $3C, $FB, $1C, $B5, $FB, $1F, $3E, $C7, $CF, $B3, $9E, $6D, $A5
	dc.b	$5C, $F3, $FE, $49, $73, $FD, $1C, $D8, $FF, $44, $B9, $FE, $1B, $C7, $F0, $7B
	dc.b	$34, $FE, $D8, $FD, $33, $7E, $99, $BF, $4E, $7F, $4E, $7B, $8F, $71, $E4, $79
	dc.b	$1F, $D3, $37, $E9, $98, $46, $9F, $98, $D0, $F5, $57, $73, $43, $62, $CE, $97
	dc.b	$A2, $75, $43, $C2, $65, $26, $A1, $EB, $97, $63, $A3, $B4, $D5, $37, $47, $E6
	dc.b	$F9, $EF, $D3, $9F, $E6, $E9, $85, $BF, $2D, $AB, $9A, $E4, $E9, $1B, $59, $8F
	dc.b	$A7, $5E, $BC, $13, $AF, $F8, $67, 6, $EA, $6F, $D5, $76, $73, $E0, $9B, $AB
	dc.b	$D4, $FC, $E3, $77, $D, $BA, $A9, $C3, $AD, $BA, $A4, $8E, $DD, $6D, $2E, $BE
	dc.b	$1B, $9A, $79, $16, $13, $6C, $F7, $35, $7A, $DF, $FA, $40, 0, $23, $F8, $CB
	dc.b	$F9, $6B, $A6, $B1, $7D, $53, $C4, 1, $AA, $78, $8E, $29, $FB, $71, $B4, $F7
	dc.b	$80, $36, $9E, $F0, $8C, $68, $69, $85, $80, 0, 1, $F9, $FE, $BE, $7E, $1F
	dc.b	$AD, $48, $D9, $8F, $86, $4E, $71, $D2, $36, $63, $E1, $E, $71, $D2, $48, $C7
	dc.b	$C2, $78, $E9, $5F, $A, $E9, $2D, $5B, $E3, $56, $3B, $15, $2E, $50, $D2, $B4
	dc.b	$87, $CE, $8B, $BE, $DB, $51, $69, $D3, $95, $16, $9D, $39, $6A, $9E, $AC, $7F
	dc.b	$69, $E3, $FB, $4F, $1F, $DA, $6B, $2D, $F9, $66, $2E, $D, $2D, $B5, $A9, $1F
	dc.b	$D4, $38, $B3, $E5, $F9, $60
	dcb.b	2,0
	dc.b	$61, $CF, $C3, $AF, $CB, $B3, $C0, $FE, $73, $A5, $7D, $37, $D7, $F3, $F6, $CF
	dc.b	$80, $E7, $A6, $69, $5D, $B4, $FD, $56, $82, $AD, $A0, $BB, $68, $2E, $DA, $A
	dc.b	$E8, $2B, $A0, $AE, $95, $7C, $F4, 2, $38, $7E, $63, $BE, $3A, $F0, $2F, $57
	dc.b	$3D, $E, $E5, $7D, $FE, $51, $45, $FC, $E4, $75, $27, $A4, $FF, $3E, $2B, $DF
	dc.b	$E9, $3F, $CB, $7A, $4F, $F3, $E0, 0, 4, $69, $F9, $AE, $C9, $A1, $CA, $34
	dc.b	$E7, $8C, $D0, $E4, $92, $EC, $78, $CA, $69, 9, $1D
	dcb.b	2,$8C
	dc.b	$F5, $74, $68, $EC, $97, $67, $30, $3C, 6, $83, $B2, $5D, $82, $48, $C9, $89
	dc.b	$EA, $F2, $FD, $46, $8D, $89, $ED, $8C, $4F, $6C, $62, $7B, $63, $F3, $FC, $3B
	dc.b	$6F, $DB, $F9, $B9, $7E, $B7, $19, $72, $8F, $D7
	dcb.b	2,$CB
	dc.b	$F5, $F2, $FE, $C, $BA, $B8, 9, $6B, 2, $FC, $63, $AF, $F3, $1F, $AA, $D3
	dc.b	$C0, 0, $54, 0, $A3, $F7, $FD, $72, $D3, $8D, $F9, $F1, $84, $8D, $13, $3E
	dc.b	$C4, $29, $7E, $C0, $99, $FE, $EB, $F7, $67, $5D, $FF, $83, $1F, $C3, $38, $A4
	dc.b	$65, $F, $D9, $C, $71, $8F, $D4, $9C, $6F, $FA, $AE, $CF, $E2, $EB, $8E, $D3
	dc.b	$8C, $76, $9C, $63, $B4, $E3, $1D, $A7, $18, $ED, $38, $C7, $69, $C6, $3B, $4E
	dc.b	$2C, $BF, $9F, $53, $89, $B4, $29, $C6, $49, $F9, $FC, $74, $E7, $3C, $6B, $AE
	dc.b	$1A, $38, $75, 2, $D1, $8C, $75, $70, $EA, $E1, $FA, $FE, $F, $F9, $F7, $FD
	dc.b	$96, $25, $D3, $86, $E4, $E1, $E, $90, $92, $74, $84, $87, $DD, $D7, $1C, $25
	dc.b	$CA, $31, $AF, $67, $53, $9E, $CE, $AE, $1D
	dcb.b	2,$53
	dc.b	$8C, $93, $F3, $F8, $F3, $DD, $3C, $6B, $AE, $1A, $38, $75, 2, $D1, $8C, $76
	dc.b	$73, $EA, $FD, $F7, $53, $1F, $EA, $16, $FE, $A4, $5B, $F8, $92, $6F, $DA, $4E
	dc.b	$DD, $B7, $6D, $52, $FD, $4D, $8F, $1E, $7E, $56, $3F, $B4, $F1, $FD, $A7, $8F
	dc.b	$ED, $3C, $7F, $5C, $BE, $32, $5C, $7F, $3F, $2D, $DF, $9C, $C6, $5C, $A3, $F3
	dc.b	$1D, $5F, $AE
	dcb.b	2,$FC
	dc.b	$7F, 8, $EF, $AF, $F9, $6C, $3F, $8A, $25, $FC, $2F, $D3, $CB, $F8, $52, $FE
	dc.b	$10, $E9, $FD, $21, $1F, $B5, $1B, $7F, $5F, $6A, $ED, $3F, $D9, 1, $E3, $FB
	dc.b	$31, $2F, $FA, $5F, $FA, $BD, $39, 9, $6C, $39, $4B, $11, $FD, $1D, $43, $5F
	dc.b	$1E, $9C, $BF, $8B, $2F, $FA, $F7, 1, $1F, $D7, $FE, $17, $F1, $F9, $74, $97
	dc.b	$F0, $A5, $FC, $53, $BC, $7F, $5F, $FE, $5B, $E, $EF, $E1, $77, $7F, $1E, $5F
	dc.b	$C5, $E4, $3F, $85, $AC, $F, $E0, $8F, $D3, $7F, 6, $9D, 5, $D3, $3F, $F8
	dc.b	$DF, $5F, $68, $D5, $DC, $9D, $29, $FB, $37, $A1, $4C, $26, $F4, $29, $86, $30
	dc.b	$F4, $29, $69, $BE, $C6, $D3, $FD, $B0, 0, $60, $E1, $EE, $F1, $85, $E9, $F
	dc.b	$2B, $25, $21, $E5, $82
	dcb.b	2,$3C
	dc.b	$B0, $34, $87, $95, $92, $99, $A5, $2B, $B5, $26, $94, $B2, $4B, $A, $43, $C2
	dc.b	$CA, $90, $B4, $8A, $24, $2B, $DA, $1E, $C2, $1C, $42, $57, $A5, $FA, $5E, $D2
	dc.b	$C1, $CE, $16, $8E, $EC, $2D, $14, $46, $5E, $85, $D1, $ED, $16, $C0, $BD, $A5
	dc.b	$48, $B4, $B0, $63, $69, $B9, $B5, $DE, $D5, $B6, $78, $6B, $C3, $B4, $F7, $1E
	dc.b	$EB, $F7, $1E, $40, $F2, 7, $90, $3C, $AF, $DC, $7B, $8F, $71, $EE, 0, $4D
	dc.b	$3B, $85, $F5, $E0, $A0, $42, $8B, $EA, 0, $2E, $BC, $3F, $69, $2C, $29, $37
	dc.b	$96, $A0
	dcb.b	2,$68
	dc.b	$21, $C0, $2A, $55, $17, $7E, $1D, $C8, 0, $EE, $40, $3B, $90, $4F, $B9, 0
	dc.b	$1D, $C8, 0, $EE, $4E, $E3, $DC, $FB, $CA, $77, $1F, $DA, $CB, 3, $43, $4E
	dc.b	$5D, $39, $66, $F3, $E4, $FC, $AB, $BD, $F6, $63, $43, $47, $2F, $84, $51, $B
	dc.b	$B5, $D, $12, $A9, $26, $97, $8C, $F8, $BF, $72, $A, $2D, $30, $A6, $2A, $28
	dc.b	$68, $A, $8B, $A8, $17, $6E, $8D, $FA, $76, 3, $5D, 0, $12, $59, $EB, $3F
	dc.b	$E5, $51, $3E, $D0, $F, $69, $D6, 1, $ED, $3D, $C0, $1E, $D0, 0, $3D, $B7
	dc.b	$D6, $14, 9, $28, $13, $D7, $37, $FD, $35, $BF, $4C, $80, $B, $A8, $19, $A1
	dc.b	$4E, $DC, $1E, $CE, $80, 1, $C8, $F7, $20, $1F, $A7, $41, $3E, $E4, 0, 1
	dc.b	$3E, $40, 7, $E4, 0, 7, $93, $80, 0, $12, $7E, $57, $FF, $35, $80, $16
	dc.b	$AD, $81, $C0, $D8, $DA, $17, $36, $C0, $D8, $BE, $F, $3C, $1E, $78, $A
	dcb.b	2,$D8
	dc.b	$52, $1E, $AE, $A, $B2, $2D, $B2, $5E, $57, $D6, $79, $1D, $74, 3, $90, $5E
	dc.b	$42, $9C, $97, $35, $1C, $82, $89, $EB, $3C, $8E, $B9, $BE, $1D, $98, $76, $2E
	dc.b	$8B, $A0, $CD, $24, $C5, $F3, $60, $5C, $17, $CD, $CA, $16, $2E, $B, $8B, $B8
	dc.b	$93, $DD, $A4, $C0, $B1, $62, $D2, $49, $20, $93, $82, $D2, $40, $5A, $4E, $33
	dc.b	$62, $99, $A0, $28, $50, 0, $50, $49, $F3, $71, $9B, $C9, $C1, $79, $39, $60
	dc.b	$24, $C5, $E4, $E5, 0, $92, $17, $2E, $B, $81, $26, $CD, $8B, $B, $B4, $98
	dc.b	$49, 4, $92, $E8, $B, $97, $28, $5C, $B4, $90, $B0, $28, $2E, $80, $49, $B3
	dc.b	$62, $E2, $EC, $2E, $E2, $4C, $2E, $92, $72, $F2, $61, $27, 0, $BD, $DA, $ED
	dc.b	$76, $BB, $5D, $8A, $49, $80, $CD, $8B, $49, 5, $DC, $66, $C0, $49, 1, $42
	dc.b	$80, $C, $DC, $17, 5, $C0, $BB, $16, $2E, $58, $5D, $E4, $85, 1, $72, $85
	dc.b	$CB, $89, $38, $12, $62, $C5, $CB, $49, $8A, $B, $B1, $42, $80, $14, 5, 6
	dc.b	$69, $24, $29, $9A, $49, $EE, $92, $40, $2E, $C2, $EE, $50, $A1, $70, $33, $62
	dc.b	$D2, $C0, $E1, $BB, $A, $AE, $1C, $ED, $CC, $E9, $18, $5B, $68, $C3, $4C, $37
	dc.b	$5B, $C1, $74, 1, $25, $85, $D0, $B8, $2B, $25, $F0, $A7, $82, $E8, $7C, $21
	dc.b	$4D, $1E, $9E, $14, $F0, $C3, $C2, $DE, $16, 5, $8A, $14, $19, $A9, $43, $49
	dc.b	$F5, $9D, $1B, $9D, $BA, $8D, $25, $B5, $A1, $74, $C3, $C2, $9E, $18, $69, $86
	dc.b	$69, $27, $BA, $1A, $14, $11, $D7, $35, $EA, $ED, $DD, $F, $82, $C2, $BE, $E8
	dc.b	$A7, $87, $7F, $86, $EF, $D, $3C, 0, $15, $FC, $B1, $FE, $34, $2E, $69, $9F
	dc.b	$E6, $FF, $93, $CF, $68, $E2, $7F, $65, $FB, $3C, $63, $94, $B5, $C2, $78, $B7
	dc.b	$29, $FF, $8B, $5C, $71, $38, $CB, $5D, $FF, $83, $1F, $C3, $38, $A4, $65, $E
	dc.b	$90, $C7, $19, $64, $71, $39, $1D, $6C, $98, $B7, $22, $DB, $47, $13, $FB, $2F
	dc.b	$D9, $E3, $1C, $A5, $AE, $13, $C5, $B6, $EC, $9F, $EA, $4F, $EE, $E7, $FB, $AE
	dc.b	$CE, $47, $5F, $64, $F1, $EC, $9E, $5C, $E1, $21, $34, $AF, $65, $D0, 4, $FF
	dc.b	$B0, $CF, $A8, 0, 1, $FC, $FF, $94, $7E, $7C, $BE, $5D, $72, $76, $BB, $80
	dc.b	6, $7E, $5F, $AD, $EB, $3D, $55, $EA, $AF, $50, $2F, $57, 0, $1F, $2F, $D6
	dc.b	$B2, $70, $C7, $29, $75, $E3, $95, $D8, 0, $2B, $C3, $F7, $AD, $B4, $FA, $AB
	dc.b	$D4, $5C, $BC, $DD, 5, $DD, $AF, $D5, $5E, $A7, $67, $97, 4, $62, $E5, $19
	dc.b	$F9, $33, $CF, $16, $79, $3E, $53, $76, $87, $93, $17, $15, $7A, $EE, $C5, $1B
	dc.b	$67, $9B, $96, $3B, $A1, $CB, $39, $79, $33, $C9, $C4, $3D, $50, $4D, $32, $47
	dc.b	$3B, $39, $CA, $4F, $37, $9B, $DD, $9E, $1C, $43, $14, $69, $E2, $3A, $FD, $3F
	dc.b	$98, $3A, $C7, $A7, $95, $58, $F0, $9B, $81, $74, $62, $91, $BB, $AF, $62, $FB
	dc.b	$3C, $D8, $66, $E0, 9, $A6, $25, $1F, $F3, $90, $E5, $8F, $5D, $DE, $3A, $C3
	dc.b	$3C, $9C, 8, $7C, $FF, $F8, $2B, $D5, $C2, $FD, $41, $EA, $E5, $84, $B8, $75
	dc.b	$39, $69, $70, $FC, $FF, $90, $E1, $BB, $F3, $97, $67, $3D, $72, $C8, $A, $B6
	dc.b	$7C, $3D, $3F, $38, 0, $9F, $57, $D, $D3, $EA, $76, $3D, $72, $71, $F, $34
	dc.b	$72, $CF, $D7, $BB, $84, $9E, $AE, $5E, $18, $B9, $48, $71, $D, $77, $2E
	dcb.b	3,0
	dc.b	$2A, $8D, $B6, $31, $8E, $58, $CD, $C5, $DD, $8B, $89, $A0, $7A, $FF, $F0, $7E
	dc.b	$BB, $75, $F2, $7E, $B9, $36, $31, $D6, $21, $EF, $D6, $3A, $D3, $18, $FD, $64
	dc.b	$3C, $7E, $70, $75, $86, $70, $2A, $E0, 1, $6A, $D9, $F0, $A1, $B5, $6C, $F8
	dc.b	$51, $C4, $9E, $5F, $A6, $A7, $E9, $A8, $D, $AB, $67, $C2, $82, $6F, $3A, $56
	dc.b	$86, $90, $D5, $63, $94, $A9, $C, $58, $4D, $32, $9A, $14, $C9, $2A, $85, $18
	dc.b	$E, $4D, $AD, $81, $4A, $A1, $46, $2D, $56, $2D, $56, $AB, $16, 7, $F4, $FF
	dc.b	$B6, $A1, $B5, $6C, $F8, $50, $DA, $B6, $7C, $28, $E2, $4F, $36, $AB, $16, $86
	dc.b	$8A, $26, $FC, $29, $85, $2C, $F8, $50, $4D, $E7, $4A, $D0, $D2, $1A, $AC, $5A
	dc.b	$18, $D2, $6C, $58, $FE, $D7, $F4, $D4
	dcb.b	2,0
	dc.b	$6D, $5B, $3E, $14, $36, $8B, $7E, $5A, $86, $C0, 1, $2B, $56, $CF, $85, $26
	dc.b	$E2, $56, $FC, $B5, $B, $C3, $C9, $CB, $B1, $7A, $B9, $76, 0, $5D, $E1, $CB
	dc.b	$B5, $9A, $D8, $39, $76, $A1, $A0, $AB, $1A, $4D, $8B, $43, $D5, $CB, $B1, $72
	dc.b	$D3, $72, $F2, $74, $7D, $A1, $E5, $B1
	dcb.b	2,$6D
	dc.b	$D, $7C, $63, $8F, $5E, $47, $AB, $AE, $1B, $AF, $A9, $A3, $29, $75, $16, $D8
	dc.b	$B4, $7A, $6D, $FB, $F8, $73, $C9, $E4, $D3, $D7, $7C, $BA, $8F, $8B, $4B, $F6
	dc.b	$69, $D4, $75, $F5, $3C, $34, $6E, $9F, 8, $6F, $20, $78, $1D, $D3, $DC, $77
	dc.b	$47, $D, $DC, $24, $DB, $A4, $C5, $8B, $16, $8D, $D2, $DC, $77, $70, $63, $C2
	dc.b	$7B, $B8, $47, 3, $C2, $FB, $9A, $18, $F0, $96, $E8, $DC, $77, $49, $A3, $73
	dc.b	$1E, $11, $C1, $A1, $8B, $5F, $84, $70, $3C, $1A, $5C, $F, $4E, $FF, $DB, $78
	dc.b	$B1, $C8, $B, $B0, 2, $79, $4F, $2F, $E8, $81, $56, $4C, $DA, $AE, $E, $5B
	dc.b	$62, $C0, $F8, $FE, $CF, $C4, $F, $1C, $DC, $65, $B6, $4E, $C3, $28, $C9, $DA
	dc.b	$F8, $83, $8D, $71, $87, $12, $DF, $6A, $2D, $96, $D7, $68, $D6, $75, $9E, $37
	dc.b	$C3, $66, $71, $B4, $6D, $92, $F4, $38, $74, $59, $6A, $A5, $BF, $2D, $4B, $D
	dc.b	$60, $EB, $3C, $4E, $36, $53, $B5, $B1, $8B, $4B, $A4, $B1, $BB, $EA, $3F, $B3
	dc.b	$3A, $EF, $AC, 0, 5, $F5, $D7, $1F, $D9, $80, 0, $19, $6D, $C4
	dcb.b	2,0
	dc.b	$13, $67, $86, $1C, $61, $CB, $CF, $12, $E0, $1D, $62, $74, $B2, $D9, $7B, $8B
	dc.b	$1C, $A4, $DA, $DB, $5C, $FF, $66, $79, $6A, $8F, $DB, $C6, $A0, $2D, $DB, $69
	dc.b	$31, $FE, $8E, $5C, $AF, $DD, $35, $9B, $22, $D5, $AA, $E0, $EC, $DB, $14, $73
	dc.b	$88, $11, $88, 5, $CF, $11, $2C, $BC, $51, $83, $17, 0, 9, $62, $B, $1D
	dc.b	$6C, $93, $D6
	dcb.b	2,0
	dc.b	$1C, $B1, $DB, $10, $27, $96, $20, 0, $79, $46, $20, $33, $80, 5, $76, $FC
	dc.b	$B5, $3B, $1A, $7B, $AB, $B8, $EE, $E0, $82, $6D, $27, $86, $E0, $DB, $84, $F8
	dc.b	$43, $57, $80, $AE, $EA, $EE, $8E, $17, $6D, $D7, $62, $C3, $75, $F8, $4D, $79
	dc.b	$F0, $3C, $19, $79, $9E, 7, $74, $F7, $1D, $C7, $77, $D, $C2, $37, $16, $97
	dc.b	6, $2D, $C1, $B7, $30, $DC, $5B, $84, $34, $79, $1D, $DF, $AE, $3B, $A7, $BA
	dc.b	$5B, $8B, $6E, $6D, $C5, $8E, $E1, $1C, $B, $70, $63, $C1, $8B, $5F, $84, $70
	dc.b	$86, $8D, $D1, $4F, $CD, $D2, $DD, $9E, $14, 0, $4D, $C0, $12, $4C, $8F, $1C
	dc.b	$F6, $CD, $C3, $E5, $27, 0, $16, $BE, $49, $C6, $6F, $C7, $C4, 0, 6, $F
	dc.b	$BD, $79, $9E, $72, $DD, $3D, $C7, $71, $DD, $C0, $5D, $A5, $C1, $8B, $70, $6D
	dc.b	$C0, $EE, $8E, $10, $D1, $C2, $5C, $21, $84, $B7, $4F, $71, $DD, $1C, $F, 9
	dc.b	$36, $E9, $31, $62, $C3, $71, $DD, $C2, $38, $5F, $9F, 3, $C1, $95, $81, $E0
	dc.b	$77, $4F, $A8, $EE, $8E, $1B, $B8, $49, $37, $75, $4B, $A9, $A4, $DD, $50, $E5
	dc.b	$B, $CB, $62, $90, $9D, $4D, $BB, $A8, $F5, $24, $F7, $34, $31, $E1, $2D, $D1
	dc.b	$D4, $77, $49, $A3, $73, $1E, 5, $F8, $43, $A1, $DB, $A8, $A4, $75, $14, $9A
	dc.b	$42, $78, $7E, $A7, $C3, $F3, $5E, 1, $C0, 0, $67, $96, $D9, 1, $5C, $B1
	dc.b	0, $78, $73, $5E, $74, $EC, $E6, $BC, $F4, $C3, $B2, $9F, $9B, $A5, $76, $CD
	dc.b	$C3, $E5, $27, 0
	dcb.b	2,$E1
	dc.b	$4E, $7E, $14, $F0, $C2, $9E, $14, $E7, $E1, $4E, $CA, $27, $19, $BF, $1F, $10
	dc.b	6, $1D, $94, $F0, $EC, $5D, $17, $73, $96, $EA, $E0, $C7, $4E, $C5, $E6, $BF
	dc.b	$9A, $50, 0, $B, $F9, $A5, $E6, $BD, $9A, $16, $E1, $D4, $C5, $F7, $1D, $F
	dc.b	$56, $EE, $1C, $F8, 9, $6E, $9F, $51, $DD, $1C, $F, 9, $26, $EE, $A9, $B4
	dc.b	$FA, $8F, $63, $94, $3D, $92, $D8, $A4, $7A, $79, $6E, $EB, $E1, $B8, $BC, $B6
	dc.b	$2D, $AD, $A1, $AF, $8C, $71, $EB, $C8, $F5, $75, $C3, $75, $D1, $A3, $29, $60
	dc.b	$5B, $F2, $C5, $A3, $84, $B8, 9, $F0, $AF, $54, $F8, $5F, $B3, $77, $54, $BA
	dc.b	$AF, $D9, $1D, $85, $F, $E6, $E3, $62, $87, $B3, $A6, $FB, $77, $14, $68, $4F
	dc.b	$CB, $33, $B2, $2E, $11, $C4, $E1, $D2, $19, $FF, $2D, $36, $7C, $2D, $18, $14
	dc.b	$64, $F1, $29, $1C, $9D, $2A, $98, $6D, $57, $C1, $76, $2C, $6C, $6D, $F9, $6C
	dc.b	$A2, $C7, $A3, $AF, $43, $8A, $3D, $A1, $F2, $4E, $98, $9D, $BF, $4F, $CB, $25
	dc.b	$C8, $4F, $29, $6A, $6C, $61, $7A, $39, $46, $2A, $5D, $1C, $B1, $46, $75, $B3
	dc.b	$21, $46, $8B, $32, $31, $C9, $5A, $18, $55, $8E, $51, $FB, $39, $E5, $89, $69
	dc.b	$B9, $B7, $19, $21, $B3, $16, $96, $AE, $27, $22, $B6, $56, $92, $DA, $4C, $5A
	dc.b	$CF, $6C, $1C, $B9, $4C, $4B, $21, $C9, $F2, $7D, $9D, $E, $25, $A4, $97, $49
	dc.b	$B2, $5D, $1B, $94, $91, $8E, $32, $E3, $89, $D8, $B1, $47, $4C, $64, $D6, $73
	dc.b	$D0, $F4, $8B, $45, $A4, $DF, $E4, $6C, $D8, $A3, $94, $63, $FC, $37, $2F, $62
	dc.b	$98, $96, $43, $FA, $7C, $2C, $D3, $B4, $5A, $76, $8B, $1E, $93, $E8, $22, $D1
	dc.b	$D2, $7D, $F, $49, $F4, $36, $95, $A5, $6A, $D8, $BC, $74, $C2, $30, $FD, $BE
	dc.b	$1D, $2F, $6C, $25, $63, $D3, $B, $45, $8F, $43, $D0, $DA, $5D, $D, $A2, $D5
	dc.b	$B0, $2F, $C, $FC, $53, $27, $2E, $CE, $58, $A3, $21, $D9, $E1, $21, $D9, $24
	dc.b	$8E, $CF, $26, $47, $49, $B1, $62, $D2, $72, $C8, $D0, $C9, $93, $80, 5, $5E
	dc.b	$32, $2C, $50, $B6, $2B, $6E, $36, $FC, $B7, $4C, $4D, $2C, $6C, $70, $42, $96
	dc.b	$3D, $22, $D2, $FD, $3C, $74, $36, $3F, $A7, $8B, $4A, $C6, $D3, $B4, $DE, $4E
	dc.b	$71, $36, $87, $B7, $E9, $8F, $F1, $CF, $F1, $E2, $CF, $E, $5C, $E3, $E, $5C
	dc.b	$BD, $71, $2E, $5C, $B9, $F1, $93, $39, $6D, $99, $1F, $60, $33, $C6, $6E, $8E
	dc.b	$D0, $E8, $CE, $5C, $BB, $63, $91, $64, $78, $63, $FF, $31, $36, $AB, $66, $ED
	dc.b	$26, $DA, $EE, $71, $BB, $E5, $37, $B7, $EC, $CB, $1B, $6B, $39, $62, $5D, $B
	dc.b	$A6, $B2, $CF, $F, $27, $39, $17, $2D, $E2, $5C, $BE, $51, $C5, $E6, $83, $60
	dc.b	$93, $42, $97, $67, $64, $9B, $96, $BE, $40, 0, $C7, $29, $71, $86, $93, $46
	dc.b	$CE, $C8, $F1, $CB, $8E, $DA, $CA, $62, $C9, $94, $DF, $27, $8C, $A1, $DB, $6C
	dc.b	$66, $85, $8E, $29, 8, $78, $A1, $D9, $E4, $9E, $27, $89, $CB, $14, $C9, $2E
	dc.b	$CE, $52, $69, $E, $DB, $16, $9E, $2C, $52, $58, $C3, $A6, $31, $8A, $14, $3F
	dc.b	$C3, $48, $DB, $14, $84, $CA, $69, $95, $D3, $1C, $92, $48, $CE, $C7, $18, $76
	dc.b	$74, $C6, $58, $CF, $12, $F2, $72
	dcb.b	2,$E5
	dc.b	$8A, $32, $3C, $D3, $8A, $5D, $F2, $7B, $EB, 0, $C, $9D, $3F, $67, $B3, $B6
	dc.b	$B3, $89, $7F, $D9, $CF, $58, 0, $16, $46, $2D, $77, $46, $2D, $F, $B4, $93
	dc.b	$29, $B2
	dcb.b	2,0
	dc.b	$86, $D4, $D1, $A8, $F4, $2C, $9F, $96, $69, $39, $D8, $B6, $25, $27, $C8, 2
	dc.b	$D1, $97, $26, $9A, $3C, $F2, $2C, $EC, $97, $C9, 0, $15, $C9, $19, $32, $4F
	dc.b	$13, $8B, $16, $7F, $D9, $C3, $62, $99, $1D, $99, $D9, $1A, $7E, $37, $C4, $B8
	dc.b	$4F, $F9, $BF, $29, $6D, $89, $DB, $22, $E7, $5A, $14, $69, $EC, $51, $E7, $91
	dc.b	$79, $E3, $54, $CB, $1D, $9B, $13, $B4, $21, $43, $AD, $9C, $B3, $ED, $89, $D9
	dc.b	$A1, $23, $5C, $9E, $7A, $CB, $C3, $97, $3A, $D3, $A5, $D, $9C, $B7, $46, $38
	dc.b	$5D, $64, $D2, $62, $D8, $31, $C1, $A1, $B0, $8C, $1A, $ED, $26, $C2, $1A, $4D
	dc.b	$81, $53, $D0, $AB, $16, $8B, $15, $6E, $86, $D3, $B5, $DB, 8, $69, $36, $10
	dc.b	$D2, $CA, $56, $63, $C6, $2C, $D2, $68, $B2, $D6, $CA, $5A, $59, $43, $15, $E3
	dc.b	$35, $69, $E5, $1A, $2D, $8E, $51, $A2, $DA, $56, $93, $4A, $D2, $69, $31, $C8
	dc.b	$B4, $31, $C8, $B1, $B2, $C5, $96, $3A, $45, $96, $4D, $3C, $A3, 6, $8C, $A3
	dc.b	6, $3A, $2D, $A4, $C7, $45, $B4, $98, $49, $74, $36, $69, $2E, $86, $CD, $9B
	dc.b	$59, $AE, $D6, $69, $31, $6B, $29, $62, $C5, $AC, $A5, $8B, $1C, $8E, $10, $C7
	dc.b	$23, $85, $F0, $6A, $E0, $C0, $B4, $59, $A4, $D1, $66, $2D, $A2, $C9, $8B, $68
	dc.b	$B2, $61, $C, $B6, $38, $34, $32, $D8, $E0, $D3, $6B, $1D, $15, $A1, $AC, $74
	dc.b	$56, $96, $92, $B2, $E8, $74, $95, $97, $42, $C5, $B4, $2D, $C, $5B, $42, $C2
	dc.b	$59, $58, $AC, $B2, $B1, $56, $85, $69, $34, $2B, $16, $5B, $43, $2E, $8C, $B6
	dc.b	$86, $5D, 4, $68, $AC, $74, $65, $6D, $15, $8E, $8D, $B9, $58
	dcb.b	2,$B4
	dc.b	$B3, $16, $A, $5A, $CD, $25, $2D, $6C, $AC, $B7, $6B, $2D, $B4, $AD, $B4, $17
	dc.b	$65, $2D, $66, $C0, $B2, $96, $B3, $60, $26, $A5, $AD, $94, $29, $6B, $64, $1B
	dc.b	6, $B3, $15, $2D, $83, $59, $8A, $89, $D8, $E8, $D3, $B1, $D1, $8D, $8A, $DE
	dc.b	$C5, $42, $96, $B3, $49, $4B, $59, $81, $B1, $D3, $8E, $85, $7B, $F2, $5D, $B
	dc.b	$69, $2B, $1D, $27, $A1, $5D, $27, $A1, $D4, $D6, $D2, $6A, $D6, $D2, $76, $5D
	dc.b	$25, $A2, $D9, $74, $96, $8B, $1A, $2B, $5B, $49, $68, $AD, $6D, $D, $AA, $CA
	dc.b	$DA, $4F, $8E, $83, $45, $6B, $68, $D6, $EF, $56, $B6, $8D, $6D, 5, $D4, $DB
	dc.b	$2C, $1A, $CA, $6D, $97, $53, $2D, $F4, $2D, $84, $5A, $78, $45, $A4, $B3, $52
	dc.b	$D6, $36, $85, $39, $1B, 5, $2D, $66, $C3, $2B, $15, $CB, $E, $26, $CA, $33
	dc.b	$6E, $99, $68, $72, $E9, $96, $85, $84, $9B, $A5, $7A, $5D, $B4, $CB, $49, $E8
	dc.b	$D6, $D1, $AE, $A5, $82, $D5, $95, $AE, $C7, $22, $B7, $62, $BA, $16, $5B, $4B
	dc.b	$42, $CB, $62, $DD, $2E, $DD, $26, $D6, $6C, $18, $DA, $2C, $D8, $31, $B1, $60
	dc.b	$2A, $B2, $52, $DD, $24, $A5, $AC, $C5, $73, $5A, $D8, $E9, $C4, $F4, $3A, $65
	dc.b	$CC, $BD, $F4, $38, $16, $B3, $60, $DD, $30, $6B, $36, $D, $D3, 9, $F1, $2A
	dc.b	$5A, $C6, $9C, $CA, $96, $B3, $61, $A0, $6D, $D, $A6, $DA, $1B, $4E, $C5, $4E
	dc.b	5, $4D, $8A, $97, $3B, $96, $76, $3A, $28, $9E, $85, $6D, $3D, $A, $D8, $29
	dc.b	$B2, $61, $62, $AC, $6C, $98, $58, $AB, $94, $2A, $6C, $70, $28, $54, $D8, $A9
	dc.b	$E8, $57, $65, $2D, $4D, $16, $92, $54, $D0, $D9, 0, $96, $85, $52, $7A, $15
	dc.b	$40, $3A, $1D, $10, $A6, $1C, $2C, $74, $42, $98, $68, $23, $42, $A9, $24, $DC
	dc.b	$77, $24, $91, $4E, $82, $7A, $21, $54, $3F, $A9, $A1, $54, $3D, $E6, $D2, $5C
	dc.b	$D4, $A2, $9D, $26, $8A, $74, 2, $FB, $1D, $47, $56, 9, $A6, $A3, $DA, $74
	dc.b	$3A, $15, $BE, $85, $6C, $74, $4D, $D, $8D, $8E, $89, $A1, $B1, $D0, $AE, $86
	dc.b	$C8, $BA, $15, $D0, $D9, $14, 4, $84, $53, $A1, $48, $45, $3A, 9, $D8, $E9
	dc.b	$B4, $AC, $74, $D8, $1B, $67, $6A, $D9, $30, $B1, $58, $B7, $66, $C, $8A, $50
	dc.b	$E8, $55, $21, $E, $86, $D7, $D0, $DA, $6A, $6C, $70, $54, $2A, $6C, $70, $DC
	dc.b	$8B, $7D, $A, $CD, $4D, $91, $4E, $85, $4D, $91, $4E, $97, $53, $D1, $A, $E9
	dc.b	$82, $35, $BB, $2C, $DA, $6C, $A7, $4E, $99, $E9, $9E, $92, $B1, $D1, $34, $95
	dc.b	$8E, $94, $EF, $BD, $8E, $96, $42, $9A, $29, $56, $4D, $13, $45, $3A, $8E, $97
	dc.b	$54, $84, $53, $A2, $A4, $22, $9D, $2D, $9D, $10, $E8, $6D, $1B, $1D, $D, $80
	dc.b	$84, $B1, $52, $B0, $94, $D5, $86, $E4, $52, $8A, $70, $D1, $17, $B, $15, $9E
	dc.b	$16
	dcb.b	2,$2B
	dc.b	$1B, $15, $28, $5C, $D8, $A9, $43, $80, $1B, $31, $53, $A1, $D9, $8A, $9D, 4
	dc.b	$29, $C0, $A9, $B2, $EE, $2E, $54, $D9, $3A, $B0, $EB, $FC, $DF, $E6, $25, $FA
	dc.b	$91, $F9, $AF, $CB, $30, $AD, 1, $FD, $3C, $50, $7F, $F, $55, $2A, $A0, $E0
	dc.b	$D2, $51, $2A, $42, $EF, $12, $C1, $E9, $1F, $B5, $FD, $BC, $E8, 5, $33, $DD
	dc.b	$F9, $8F, $CE, $57, $1F, $D7, $5F, $94, $BF, $31, $DF, $D7, $FA, $D9, $50, $57
	dc.b	$C3, $D2, $FA, $E7, $49, $7E, $B7, $4D, $D2, $D6, $3A, $B8, $7E, $7F, $F7, $72
	dc.b	$51, $5E, $1F, $9A, $BE, $B9, $AC, $BF, $55, $D5, $CE, $5A, $C7, $67, $3F, $CD
	dcb.b	2,$FE
	dc.b	$6A, 2, $E7, $CF, $CB, $F3, $75, $C7, $F5, $37, $E5, $2D, $3B, $3F, $31, $CF
	dc.b	$F5, $25, $21, $2B, $B4, $92, $36, $3C, $8E, 9, $1B, $46, 9, $74, $92, $3C
	dc.b	$24, $91, $CA, $4F, 8, $42, $91, $81, $48, $49, $A5, $DD, $21, $24, $E9, 9
	dc.b	$2D, $A4, $E8, $79, $43, $A4, $93, $4D, $DC, $FA, $F9, $EE, $D3, $AA, $10, $A0
	dc.b	$2E, $92, $62, $F9, $B0, $C4, $17, $AE, $25, $B, $62, $E, $25, $C4, $38, $86
	dc.b	$76, $93, $B4, $98, $3F, $14, $64, $2C, $92, $41, $27, $87, $2F, $36, $92, 2
	dc.b	$D2, $7A, $B1, $62, $C5, $A1, $8A, $43, $4D, 1, $42, $93, $61, $26, $2D, $54
	dc.b	$9E, $95, $7E, $65, $8B, $16, $78, $42, $80, $E3, $27, 5, $E4, $E5, $A1, $C0
	dc.b	$6C, $65, $8A, 8, $72, $F5, $42, $E5, $C1, $76, $2D, $27, $13, $67, $2C, $50
	dc.b	$A7, $11, $76, $93, $39, $70, $82, $49, $74, $86, $2C, $58, $B3, $97, $28, $5F
	dc.b	$29, $21, $60, $52, $6C, $12, $18, $B0, $96, $90, $D3, $E6, $78, $64, $ED, $7D
	dc.b	$D5, $68, $E0, $78, $5D, $61, $C4, $98, $5D, $16, $1C, $BF, 3, $CD, $94, $A9
	dc.b	$E0, $78, $4D, $C0, $2F, $76, $59, $B5, $DA, $ED, $35, $65, $45, $2A, $C0, $42
	dc.b	$CD, $8B, $52, $10, $5D, $E9, $25, $BD, $25, $46, $72, $F7, $59, $52, $A8, $A
	dc.b	$14, $86, $CD, $25, $43, $41, $2E, $A3, $8F, $59, $EA, $BE, $E7, $1C, $1F, $85
	dc.b	$D4, $55, $8B, $17, $2C, $16, $6F, $C0, $F3
	dcb.b	2,$45
	dc.b	$3C, $F, 9, $B9, $42, $E5, $C4, $9E, $AA, $26, $C5, $8B, $96, $85, $65, $45
	dc.b	$2A, $21, $8A, $14, $9A, $E7, $49, $A0, $29, $14, $92, $DE, $90, $94, $2E, $8E
	dc.b	$93, $58, $4A, $43, $DD, $24, $81, $B3, $49, $51, $A8, $24, $85, $19, $F, $21
	dc.b	$54, $93, $17, $CD, $A6, $93, $70, $5E, $A8, $FB, $16, $2E, $B, $89, $A3, $89
	dc.b	$3D, $DA, $4D, $54, $86
	dcb.b	2,$46
	dc.b	$43, $B4, $B6, $10, $E0, $B4, $90, $23, $49, $C4, $D0, $A3, $14, $CD, 1, $43
	dc.b	$B0, 1, $26, $95, $74, $28, $50, $A3, $A0, $AB, $C9, $C1, $79, $3A, $30, $12
	dc.b	$64, $74, $87, $28, 4, $90, $BA, $38, $2E, 4, $23, $42, $14, $28, $C8, $D3
	dc.b	$40, $D2, $61, $24
	dcb.b	2,9
	dc.b	$74, 8, $E8, $E5, $B, $96, $92, $16, 7, $61, $34, 1, $21, $A6, $85, $19
	dc.b	$1D, 4, $D8, $42, $43, $89, $30, $BE, $D0, $E5, $E1, $19, $A, 7, 0, $BD
	dc.b	$D9, $26, $D7, $6B, $B4, $D1, $B9, $14, $60, $21, $26, $C5, $A4, $82, $EF, $34
	dc.b	$10, $C8, $52, $E8, $21, 1, $42, $82, $10, 2, $85, $1D, $A, $55, $C1, $7A
	dc.b	$A0, $AB, $16, $2E, $58, $24, $DE, $3F, $84, $1C, $A1, $72, $E2, $4F, $54, $13
	dc.b	$62, $C5, $CB, $42, $37, $22, $82, $18, $A1, $49, $A0, $9A, 2, $95, $40, $91
	dc.b	$FB, $29, $A4, $24, $9E, $E9, $24, 1, $26, $C2, $78, $75, $61, $D4, $BB, $B0
	dc.b	$DC, $52, $12, $BB, $49, $3B, $E, $C7, $6D, $1F, $9E, $87, $B3, $69, $F6, $3F
	dc.b	$3D, $1C, $49, $E5, $E1, $F9, $AD, $39, $F5, $F3, $D1, $A, $46, 5, $F, $62
	dc.b	$4D, $3B, $1F, $9E, $85, $D2, $AE, $85, $E7, $A2, $5F, $43, $D8, $85, $AE, $9C
	dc.b	$FB, $39, $E9, $D9, $DF, $1A, $42, $4B, $B1, $F9, $E8, $9D, $95, $D1, $F9, $E8
	dc.b	$E2, $4F, $36, $AB, $16, $86, $8E, $C4, $EF, $E7, $D5, $CF, $BD, $F9, $E8, $70
	dc.b	$29, $9A, $3C, $F4, $4B, $E8, $7B, $21, $AA, $C5, $A1, $8E, $93, $62, $C7, $4E
	dc.b	$CE, $FF, $F, $CD, $68, $52, $12, $BB, $49, $23, $63, $C8, $E0, $91, $B4, $60
	dc.b	$97, $EC, $92, $39, $EC, $7E, $7A, $1D, $1C, $E9, $F9, $AD, $E, $E8, $42, $91
	dc.b	$81, $48, $49, $A5, $DD, $21, $24, $E9, $1A, $4B, $63, $D8, $FC, $F4, $3C, $9E
	dc.b	$A9, $D9, $CF, $C3, $48, $72, $E5, $1E, $1C, $BA, $17, $2E, $71, $67, $2E, $75
	dc.b	$C3, $9C, $9D, $A1, $18, $E4, $79, $B3, $C3, $3E, $8F, $E1, $D8, $74, $2F, $D9
	dc.b	$CF, $B3, $44, $EC, $64, $28, $C5, $CB, $C2, $36, $B3, $FF, $16, $8C, $4E, $39
	dc.b	$73, $3C, $51, $B4, $7F
	dcb.b	2,$CD
	dc.b	$E6, $F1, $FA, $DE, $E, $71, $92, $95, $DF, $35, $7D, $F0, $A5, $77, $DA, $F4
	dc.b	$76, $2B, $16, $72, $F3, $48, $45, $95, $B, $9A, $2D, $E8, 2, $3D, $16, $68
	dc.b	$F4, $50, $28, $D6, $28, $F4, $5A, $5B, $6B, $42, $95, $A2, $1D, $8A, $CF, $79
	dc.b	$C5, $2F, $D2, $99, $EF, $3B, $CF, $4D, $8E, $C7, $C4, $E2, $7F, $68, $75, $6F
	dc.b	$5A, $24, $B7, $97, $C2, $3B, $9B, $F2, $C2, $35, $B7, $E5, $96, $8F, $97, $E9
	dc.b	$82, $EF, $E9, $C8, $AD, $2D, $D7, $F9, $FE, $BC, $DA, $6C, $31, $F, $37, $29
	dc.b	$77, $84, $56, $B5, $1C, $23, $15, $6B, $52, $4C, $26, $85, $EE, $90, $F3, $42
	dc.b	$95, $62, $80, $AD, $2D, $D7, $D5, $D7, $A6, $6F, $FA, $FF, $DF, $73, $C8, $E2
	dc.b	$5C, $FE, $6F, $F5, $1A, $78, $75, $FF, $88, $FF, $86, $9F, $E4, $6A, $55, $5F
	dc.b	$3F, $F, $E6, $7E, $7F, $91, $43, $97, $5F, $7F, $66, $9F, $AB, $3F, $E2, $A7
	dc.b	$F8, $5B, $FC, $98, $51, $64, $B4, $14, $12, $5A, $3E, $D2, $5A, $3A, $17, $5B
	dc.b	$BA, $D5, $64, $B4, $74, $3B, $CA, $EF, $B1, $D8, $FE, $D0, $EF, $3E, $33, $FD
	dc.b	$B8, $3B, $CF, $ED, $CE, $C7, $C4, $E2, $7F, $68, $75, $5F, $FE, $9F, $F1, $FF
	dc.b	$B8, $FF, $BF, $FC, $7F, $E8, 0, $12, 0, $1A, 0, $20, 0, $3A, 0, $54
	dc.b	0, $6E, 0, $7A, 0, $B4, 0, $EE
	dcb.b	2,1
	dc.b	0, 2, 0, 3, 0, $FF, 5, 4, 5, 6, 7, $FF, 0
	dcb.b	2,4
	dc.b	0
	dcb.b	2,4
	dc.b	0
	dcb.b	2,5
	dc.b	0
	dcb.b	2,5
	dc.b	0
	dcb.b	2,6
	dc.b	0
	dcb.b	2,6
	dc.b	0
	dcb.b	2,7
	dc.b	0
	dcb.b	2,7
	dc.b	0, $FF, 0
	dcb.b	2,4
	dc.b	0, 4
	dcb.b	2,0
	dcb.b	2,5
	dc.b	0, 5
	dcb.b	2,0
	dcb.b	2,6
	dc.b	0, 6
	dcb.b	2,0
	dcb.b	2,7
	dc.b	0, 7
	dcb.b	2,0
	dc.b	$FF, 0, 4
	dcb.b	2,0
	dc.b	4
	dcb.b	2,0
	dc.b	5
	dcb.b	2,0
	dc.b	5
	dcb.b	2,0
	dc.b	6
	dcb.b	2,0
	dc.b	6
	dcb.b	2,0
	dc.b	7
	dcb.b	2,0
	dc.b	7
	dcb.b	2,0
	dc.b	$FF, 0, 8, 9, $A, $B, $C, $B, $A, 9, 8, 0, $FF, 0
	dcb.b	2,8
	dc.b	0
	dcb.b	2,8
	dc.b	0
	dcb.b	2,9
	dc.b	0
	dcb.b	2,9
	dc.b	0
	dcb.b	2,$A
	dc.b	0
	dcb.b	2,$A
	dc.b	0
	dcb.b	2,$B
	dc.b	0
	dcb.b	2,$B
	dc.b	0
	dcb.b	2,$C
	dc.b	0
	dcb.b	2,$C
	dc.b	0
	dcb.b	2,$B
	dc.b	0
	dcb.b	2,$B
	dc.b	0
	dcb.b	2,$A
	dc.b	0
	dcb.b	2,$A
	dc.b	0
	dcb.b	2,9
	dc.b	0
	dcb.b	2,9
	dc.b	0
	dcb.b	2,8
	dc.b	0
	dcb.b	2,8
	dcb.b	2,0
	dc.b	$FF
	dcb.b	2,0
	dcb.b	2,8
	dc.b	0, 8
	dcb.b	2,0
	dcb.b	2,9
	dc.b	0, 9
	dcb.b	2,0
	dcb.b	2,$A
	dc.b	0, $A
	dcb.b	2,0
	dcb.b	2,$B
	dc.b	0, $B
	dcb.b	2,0
	dcb.b	2,$C
	dc.b	0, $C
	dcb.b	2,0
	dcb.b	2,$B
	dc.b	0, $B
	dcb.b	2,0
	dcb.b	2,$A
	dc.b	0, $A
	dcb.b	2,0
	dcb.b	2,9
	dc.b	0, 9
	dcb.b	2,0
	dcb.b	2,8
	dc.b	0, 8
	dcb.b	3,0
	dc.b	$FF
	dcb.b	2,0
	dc.b	8
	dcb.b	2,0
	dc.b	8
	dcb.b	2,0
	dc.b	9
	dcb.b	2,0
	dc.b	9
	dcb.b	2,0
	dc.b	$A
	dcb.b	2,0
	dc.b	$A
	dcb.b	2,0
	dc.b	$B
	dcb.b	2,0
	dc.b	$B
	dcb.b	2,0
	dc.b	$C
	dcb.b	2,0
	dc.b	$C
	dcb.b	2,0
	dc.b	$B
	dcb.b	2,0
	dc.b	$B
	dcb.b	2,0
	dc.b	$A
	dcb.b	2,0
	dc.b	$A
	dcb.b	2,0
	dc.b	9
	dcb.b	2,0
	dc.b	9
	dcb.b	2,0
	dc.b	8
	dcb.b	2,0
	dc.b	8
	dcb.b	3,0
	dc.b	$FF
	dcb.b	2,0
	dc.b	$25, 0, $1A, 0, $2F, 0, $44, 0, $59, 0, $6E, 0, $83, 0, $98, 0
	dc.b	$AE, 0, $C4, 0, $DA, 0, $F0, 1, 6, 4, $E8, $A
	dcb.b	2,0
	dcb.b	2,$E8
	dc.b	$A, 0, 9
	dcb.b	2,0
	dc.b	$A, $10, 0, $E8, 0, $A, $10, 9, 0, 4, $E8, $A, 0, $12
	dcb.b	2,$E8
	dc.b	$A, 0, $1B
	dcb.b	2,0
	dc.b	$A, $10, $12, $E8, 0, $A, $10, $1B, 0, 4, $E8, $A, 8, 9
	dcb.b	2,$E8
	dc.b	$A, 8
	dcb.b	3,0
	dc.b	$A, $18, 9, $E8, 0, $A, $18
	dcb.b	2,0
	dc.b	4, $E8, $A
	dcb.b	2,0
	dcb.b	2,$E8
	dc.b	$A, 0, 9
	dcb.b	2,0
	dc.b	$A, $18, 9, $E8, 0, $A, $18
	dcb.b	2,0
	dc.b	4, $E8, $A, 8, 9
	dcb.b	2,$E8
	dc.b	$A, 8
	dcb.b	3,0
	dc.b	$A, $10, 0, $E8, 0, $A, $10, 9, 0, 4, $E8, $A, 0, $12
	dcb.b	2,$E8
	dc.b	$A, 0, $1B
	dcb.b	2,0
	dc.b	$A, $18, $1B, $E8, 0, $A, $18, $12, 0, 4, $E8, $A, 8, $1B
	dcb.b	2,$E8
	dc.b	$A, 8, $12
	dcb.b	2,0
	dc.b	$A, $10, $12, $E8, 0, $A, $10, $1B
	dcb.b	2,0
	dc.b	4, $F0, 5
	dcb.b	2,0
	dcb.b	2,$F0
	dc.b	5, 8
	dcb.b	3,0
	dc.b	5, $10, 0, $F0, 0, 5, $18
	dcb.b	3,0
	dc.b	4, $F0, 5, 0, 4
	dcb.b	2,$F0
	dc.b	5, 8, 4
	dcb.b	2,0
	dc.b	5, $10, 4, $F0, 0, 5, $18, 4
	dcb.b	2,0
	dc.b	4, $E8, $A, 0, 8
	dcb.b	2,$E8
	dc.b	$A
	dcb.b	2,8
	dcb.b	2,0
	dc.b	$A, $10, 8, $E8, 0, $A, $18, 8
	dcb.b	2,0
	dc.b	4, $F0, 5, 0, $11
	dcb.b	2,$F0
	dc.b	5, 0, $15
	dcb.b	2,0
	dc.b	5, $18, $15, $F0, 0, 5, $18, $11
	dcb.b	2,0
	dc.b	2, $F4, 6, 0, $19, $F0, $F4, 6, 8, $19
	dcb.b	3,0
	dc.b	6, 0, $E, 0, $14, 3, 0, 4, 3, 1, 2, $FC, 0, 3, 0, 1
	dc.b	2, $FC, 0, 3, 6, 5, $FC, 0, $E, 0, $1A, 0, $26, 0, $2C, 0
	dc.b	$42, 0, $58, 0, $5E, 2, $F0, 5
	dcb.b	2,0
	dc.b	$FC, $F8
	dcb.b	2,0
	dc.b	4, $F4, 0, 2, $E0
	dcb.b	2,0
	dc.b	5, $F8, $E8, $E, 0, 6, $F0, 0, 1, $E0, $F, 0, $12, $F0, 4, $D0
	dc.b	6, 0, $22, $F8, $D8
	dcb.b	2,0
	dc.b	$28, $F0, $E0
	dcb.b	2,0
	dc.b	$29, 8, $E8, $E, 0, $2A, $F0, 0, 4, $C0
	dcb.b	2,0
	dc.b	$36, $F8, $C8, 6, 0, $37, $F8, $D8
	dcb.b	2,0
	dc.b	$3D, $F0, $E0, $F, 0, $3E, $F0, 0, 1, $F0, 9, 0, $4E, $F4, 1, $F8
	dc.b	4, 0, $54, $F8, 0, 2
	dcb.b	3,0
	dcb.b	8,1
	dc.b	$FC, 0, $10, 0, 4, 2, $D0, 3
	dcb.b	2,0
	dc.b	$E4, $F0, 1, 0, 4, $E4, 0, 2, $F8, $C, 0, 6, $E8, $F8, 4, 0
	dc.b	$A, 8
	dcb.b	2,0
	dc.b	2, 3, 0, 1, 2, $FC
	dcb.b	2,0
	dc.b	6, 0, $C, 0, $12, 1, $F0, $F
	dcb.b	2,0
	dc.b	$F0, 1, $F4, $A, 0, $10, $F4, 1, $F8, 5, 0, $19, $F8, 0, 4, 0
	dc.b	$C, 3, 0, 5, 6, 3, 4, $FC, 0, 3, 0, 1, 2, 3, 4, $FC
	dcb.b	2,0
	dc.b	$E, 0, $1A, 0, $2A, 0, $40, 0, $56, 0, $6C, 0, $7C, 2, $F8, 5
	dcb.b	2,0
	dc.b	$F0, $F8, 5, 8
	dcb.b	3,0
	dc.b	3, $F0, $D, 0, 4, $F0, 0, 5, 0, $C, $F0, 0, 5, 8, $C, 0
	dc.b	4, $F0, 5, 0, $10
	dcb.b	2,$F0
	dc.b	5, 0, $14
	dcb.b	2,0
	dc.b	5, 0, $18, $F0, 0, 5, $18, $10
	dcb.b	2,0
	dc.b	4, $E8, $A, 0, $1C
	dcb.b	2,$E8
	dc.b	$A, 8, $1C
	dcb.b	2,0
	dc.b	$A, $10, $1C, $E8, 0, $A, $18, $1C
	dcb.b	2,0
	dc.b	4, $E8, $A, 0, $25
	dcb.b	2,$E8
	dc.b	$A, 8, $25
	dcb.b	2,0
	dc.b	$A, $10, $25, $E8, 0, $A, $18, $25
	dcb.b	2,0
	dc.b	3, $F0, $D, 0, $2E, $F0, 0, 5, 0, $36, $F0, 0, 5, 8, $36, 0
	dc.b	4, $F0, 5, 0, $3A
	dcb.b	2,$F0
	dc.b	5, 0, $3E
	dcb.b	2,0
	dc.b	5, 0, $42, $F0, 0, 5, $18, $3A
	dcb.b	8,0
	dcb.b	5,1
	dcb.b	7,2
	dcb.b	$1D,3
	dcb.b	7,2
	dcb.b	5,1
	dcb.b	6,0
	dcb.b	5,$FF
	dcb.b	5,$FE
	dcb.b	7,$FD
	dcb.b	$1D,$FC
	dcb.b	7,$FD
	dcb.b	5,$FE
	dcb.b	5,$FF
	dcb.b	6,0
	dcb.b	5,1
	dcb.b	7,2
	dcb.b	$1D,3
	dcb.b	7,2
	dcb.b	5,1
	dcb.b	6,0
	dcb.b	5,$FF
	dcb.b	5,$FE
	dcb.b	7,$FD
	dcb.b	$1D,$FC
	dcb.b	7,$FD
	dcb.b	5,$FE
	dcb.b	5,$FF
	dc.b	0, 2, 3, 2, 3, $FF, 0, 8, 0, $1E, 0, $2A, 0, $36, 4, $E8
	dc.b	3
	dcb.b	2,0
	dc.b	$F8, $E8, 3, 8
	dcb.b	2,0
	dc.b	8, 1, 0, 4, $F8, 8, 1, 8, 4
	dcb.b	2,0
	dc.b	2, $F8, 1, 0, 6
	dcb.b	2,$F8
	dc.b	1, 8, 6
	dcb.b	2,0
	dc.b	2, $F8, 1, 0, 8
	dcb.b	2,$F8
	dc.b	1
	dcb.b	2,8
	dcb.b	2,0
	dc.b	2, $F8, 1, 0, $A
	dcb.b	2,$F8
	dc.b	1, 8, $A
	dcb.b	3,0
	dc.b	2, 7, 0, 1, 2, 3, $FF, 0, 8, 0, $3C, 0, $70, 0, $7C, $A
	dc.b	$E0, 9
	dcb.b	2,0
	dc.b	$E8, $E0, 9, 0, 6, 0, $E8
	dcb.b	2,0
	dc.b	$C, $E0, $E8
	dcb.b	2,0
	dc.b	$D, $18, $F0, 7, 0, $E, $E0, $10
	dcb.b	2,0
	dc.b	$16, $E0, $10, 9, 0, $17, $E8, $10, 9, 0, $1D, 0, $10
	dcb.b	2,0
	dc.b	$23, $18, $F0, 7, 0, $24, $10, 0, $A, $E0, $D, 0, $2C, $F0, $E8
	dcb.b	2,0
	dc.b	$34, $E8, $F0, 7, 0, $35, $E8, $10
	dcb.b	2,0
	dc.b	$3D, $E8, $10, $D, 0, $3E, $F0, $E8
	dcb.b	2,0
	dc.b	$46, $10, $F0
	dcb.b	2,0
	dc.b	$47, 0, $F0, 7, 0, $48
	dcb.b	2,8
	dcb.b	2,0
	dc.b	$50, 0, $10
	dcb.b	2,0
	dc.b	$51, $10, 0, 2, $E0, $B, 0, $52, $F4, 0, $B, 0, $5E, $F4, 0, $A
	dc.b	$E0, $D, 8, $2C, $F0, $E8, 0, 8, $34, $10, $F0, 7, 8, $35, 8, $10
	dc.b	0, 8, $3D
	dcb.b	2,$10
	dc.b	$D, 8, $3E, $F0, $E8, 0, 8, $46, $E8, $F0, 0, 8, $47, $F8, $F0, 7
	dc.b	8, $48, $E8, 8, 0, 8, $50, $F8, $10, 0, 8, $51, $E8
	dcb.b	2,0
	dc.b	2, 1, 0, 1, 2, 4
	dcb.b	2,3
	dc.b	1, 2, 4, $FF
	dcb.b	2,0
	dc.b	$C, 0, $22, 0, $32, 0, $42, 0, $58, 0, $68, 4, $D4, $B
	dcb.b	2,0
	dc.b	$E8, $D4, $B, 0, $C, 0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48, $F0
	dc.b	0, 3, $D4, $F, 0, $18, $F0, $F4, 5, 0, $44, $F8, 4, $C, 0, $48
	dc.b	$F0, 3, $D4, 3, 0, $28, $FC, $F4, 5, 0, $44, $F8, 4, $C, 0, $48
	dc.b	$F0, 4, $D4, $B, 0, $2C, $E8, $D4, $B, 0, $38, 0, $F4, 5, 0, $44
	dc.b	$F8, 4, $C, 0, $48, $F0, 0, 3, $D4, $F, 8, $18, $F0, $F4, 5, 0
	dc.b	$44, $F8, 4, $C, 0, $48, $F0, 4, $E4, 2
	dcb.b	2,0
	dc.b	$EC, $E4, $F, 0, 3, $F4, 4, 1, 0, $13, $FC, $14, 8, 0, $15, $F4
	dcb.b	2,0
	dc.b	4, 0, $2C, 1
	dcb.b	$1E,0
	dc.b	1
	dcb.b	2,0
	dc.b	1
	dcb.b	2,0
	dc.b	1, $FF, 0, 2, 3, 4, 5, 6, 7, 8, $FF, 0, $12, 0, $50, 0
	dc.b	$8E, 0, $AE, 0, $B4, 0, $BA, 0, $C0, 0, $C6, 0, $CC, $C, $E0, 1
	dcb.b	2,0
	dc.b	$F8, $E0, 1, 8
	dcb.b	2,0
	dc.b	$F0, 8, 0, 2, $E8, $F0, 8, 0, 5, 0, $F8, $D, 0, 8, $E0, $F8
	dc.b	$D, 0, $10, 0, 8, $D, 0, $18, $E0, 8, $D, 8, $18, 0, $18, $C
	dc.b	0, $20, $E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8
	dc.b	$54
	dcb.b	2,0
	dc.b	$C, $E0, 1, 0, $24, $F8, $E0, 1, 8, $24, 0, $F0, 8, 0, $26, $E8
	dc.b	$F0, 8, 0, $29, 0, $F8, $D, 0, $2C, $E0, $F8, $D, 0, $34, 0, 8
	dc.b	$D, 0, $3C, $E0, 8, $D, 8, $3C, 0, $18, $C, 0, $20, $E0, $18, $C
	dc.b	8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
	dcb.b	2,0
	dc.b	6, 8, $D, 0, $44, $E0, 8, $D, 0, $4C, 0, $18, $C, 0, $20, $E0
	dc.b	$18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
	dcb.b	2,0
	dc.b	1, $F8, 5, 0, $5C, $F8, 1, $F8, 5, 0, $60, $F8, 1, $F8, 5, 0
	dc.b	$64, $F8, 1, $F8, 5, 8, $64, $F8, 1, $F8, 5, 8, $60, $F8, 1, $F8
	dc.b	5, 8, $5C, $F8, $CC, $ED, $A6, $CD, $3D, $1F, $47, $63, $B5, $71, $3B, $4B
	dc.b	$63, $B4, $D3, $5B, $E9, $56, $29, $A1, $6C, $B, $29, $64, $7C, $1B, $D0, $E2
	dc.b	$EC, $8C, $A7, $7A, $B1, $DB, $4D, $9F, $9D, $F4, $D8, $EF, $C4, $B6, $F7, $DE
	dc.b	$55, $D3, $F5, $E5, $17, $5A, $68, $77, $EB, $4C, $76, $6E, $BD, $A3, $F6, $7C
	dc.b	$EC, $58, $E2, $EB, $89, $57, $63, $AB, $4D, $FA, $D9, $79, $F4, $D4, $57, $7E
	dc.b	$1A, $16, $43, $BC, $E9, $FA, $F3, $86, $CD, $A3, $1D, $9D, $8B, $4D, $95, $F1
	dc.b	$75, $76, $D5, $8B, $A2, $BE, $A3, $BC, $EF, $7D, $EE, $9B, $27, $3A, $6F, $3A
	dc.b	$6B, $D3, $5F, $EB, $76, $5C, $19, $70, $3A, $B1, $57, $68, $6D, $6A, $E8, $59
	dc.b	$36, $2C, $59, $37, $96, $10, $D5, $57, $4D, $ED, $BB, $7A, $C2, $29
	dcb.b	2,$47
	dc.b	$42, $C5, $1D, $B, $43, $16, $D2, $B8, $D5, $4A, $3B
	dcb.b	2,$42
	dc.b	$B2, $A1, $6D, $95, $D1, $5D, $AB, $89, $D6, $C5, $1F, $45, $6F, 2, $8A, $FA
	dc.b	$1D, $B5, $26, $D1, $B2, $70, $76, $D1, $D9, $D4, $B1, $63, $8A, $6F, $85, $2A
	dc.b	$51, $D2, $6D, $36, $2C, $58, $B1, $58, $57, $C7, $69, $A9, $47, $62, $85, $A7
	dc.b	$DD, $A2, $1D, $11, $63, $C4, $7E, $6B, $F2, $CC, $25, $60, $7F, $4E, $F6, $1F
	dc.b	$C3, $EA, $B4, $A8, $E, $6D, $14, $11, $67, $A7, $30, $8C, $D2, $CF, $FB, $5F
	dc.b	$DB, $CE, $C0, $5A, $FD, $3C, $FC, $25, $87, $EB, $AB, $CA, $3C, $FA, $6B, $FD
	dc.b	$6C, $58, $4B, $8F, $5D, $77, $4E, $D1, $FA, $DC, $B4, $8D, $C3, $7E, $DD, $DF
	dc.b	$BB, $8A, 9, $6D, $F9, $AA, $EE, $9D, $23, $F5, $5B, $FB, $23, $70, $FC, $5F
	dc.b	$67, $E6, $FF, $7F, $3A, 1, $4B, $FB, $39, $FF, $37, $2C, $3C, $6B, $CA, $74
	dc.b	$5A, $2D, $E, $6E, $A5, $41, $45, $86, $29, $7B, $C, 1, $49, $60, $54, $B6
	dc.b	0, $E0, $50, $3A, 7, $64, $68, $46, $86, 9, $C1, $59, $4B, $2C, $28, $84
	dc.b	$74, $29, $36, $85, 5, $A1, $24, $C5, $8B, $16, $76, $2A, $ED, $35, 5, $4A
	dc.b	$CD, $84, $31, $69, $2C, $F2, $92, $76, $16, $2C, $59, $1D, $4A, $83, $84, $20
	dc.b	$29, 8, $59, $D0, 6, $C2, $30, $50, $E8, $52, $4A, $50, $A0, $28, $C5, $A1
	dc.b	4, $D9, $B, $15, $2B, $C0, $55, $A1, $90, $A0, $51, $B, $55, $76, $2C, $58
	dc.b	$B2, $14, $2A, $53, $18, $52, $C0, $AC, $D8, $2B, $B1, $61, $19, $3B, $4F, $B0
	dc.b	$ED, $8A, $35, $74, $93, $3E, $C7, $6A, $D1, $D0, $43, $A, $AD, $1D, $A, $6C
	dc.b	$7B, $1A, $86, $87, $63, $B4, $D0, 2, $95, $6A, $4D, $AA, $D5, $69, $D1, $A8
	dc.b	$B4, $34, $60, $1E, $93, $62, $D6, $75, $15, $4B, $45, $2B, $68, $B3, $21, $4A
	dc.b	$D2, $2D, $25, 5, $4A, $BB, $5E, $B1, $63, $61, $1B, $CE, $1A, $CE, $FA, $E8
	dc.b	$83, $64, $DA, $B4, $12, $62, $C5, $B, $A, $4D, $36, $3D, $8B, $45, $A1, $D8
	dc.b	$ED, $34, $2A, $50, $A0, $84, $95, 4, $D8, $B1, $42, $CF, $46, $A2
	dcb.b	2,$D0
	dc.b	$3B, $15, $2B, $3A, $5F, $69, $A8, $2A, $F6, $8A, $56, $CE, $B6, $28, $A8, $B3
	dc.b	$A3, $AD, $9D, $2A, $B0, $A1, $AF, $58, $B3, $58, $42, $95, $65, $3C, $84, $96
	dc.b	$18, $A5, $ED, $35, $9A, 2, $92, $54, $D4, $58, $A0, $28, $26, $A8, $21, $2A
	dc.b	$D0, $D2, $57
	dcb.b	3,$65
	dc.b	$3A, $A3, $50, $74, 5, $A1, $42, $B4, $20, $9A, $95, $62, $B7, $A8, $2A, $75
	dc.b	0, $16, $6B, $24, $52, $A5, $4A, $A2, $89, $24, $20, $29, 8, $AC, 4, $32
	dc.b	$A2, $BA, $15, 2, $14, $A2, $A0, $28, 3, $AB, $3A, $95, $2A, $CA, $D3, $50
	dc.b	$D0, $C2, $14, $2B, $AD, $54
	dcb.b	2,$2A
	dc.b	$15, $28, $5A, $14, $B0, $3A, $84, $D4, 5, $76, $9A, $95, $65, $45, $13, $60
	dc.b	$EA, $E8, $21, $85, $75, $3A, $14, $75, $65, $2A, $10, 2, $95, $65, $9B, $55
	dc.b	$AA, $D3, $56, $E4, $55, $80, $75, $9B, $16, $85, $15, $49, $A8, $76, $52, $B5
	dc.b	$50, $EA, $A, $95, $E, $A0, $15, $2A, $8A, $56, $48, $A, $49, $44, $98, $B1
	dc.b	$42, $C1, $66, $8F, $FC, $20, $85, $4A, $14, $10, $92, $51, $36, $2C, $50, $B3
	dc.b	$AB, $72, $2A, $1D, $8A, $95, $9A, $89, $A8, $2B, $25, $A, $FF, $B2, $9A, $BA
	dc.b	$C2, $55, $61, $40, $59, $B0, $98, 0, $17, $80, 5, $12, $17, $76, $27, $7A
	dc.b	$36, $32, $46, $2F, $55, $13, $65, $F, $74, 4, $81, 4, 6, $15, $14, $26
	dc.b	$35, $37, $6F, $46, $33, $57, $6E, $67, $7B, $76, $36, $86, 3, 0, $16, $31
	dc.b	$87, 4, 2, $17, $77, $28, $FA, $36, $2E, $46, $2A, $88, 4, 3, $15, $10
	dc.b	$26, $39, $36, $2B, $89, 5, $E, $15, $16, $26, $3A, $37, $79, $8B, 5, $11
	dc.b	$8C, $18, $F9, $8D, 8, $F8, $16, $38, $8E, 6, $30, $16, $34, $8F, 4, 5
	dc.b	$17, $78, $FF
	dcb.b	4,$44
	dc.b	$47, $C5, $E7, $38, $4E, $C8, $88, $8F, $29, $93, $91
	dcb.b	3,$11
	dc.b	$E7, $7F, $3E, $B9, $23, $F5, $9E, $5B, $EF, $D7, $F3, $6B, $1F, $DF, $C5, $62
	dc.b	$B1, $FD, $7C, 8, $EE
	dcb.b	2,$32
	dc.b	$3F, $AF, $FC, $C9, $DB, $BA, $A3, $99, $CD, $8B, $A8, $E6, $36, $3B, $53, $A6
	dc.b	$EA, $9E, $B3
	dcb.b	2,$44
	dc.b	$4C, $AB, $95, $64, $65, 2, $3B, $8E, $A1, $FD, $70, $43, $6D, $FC, $7C, $E7
	dc.b	$C7, $E3, $3F, $BF, $8F, $F7, $F1, $A8, $10, $B8, $16, $3F, $F9, $DB, $77, $5B
	dc.b	$DC, $61, $9D, $4B, $31, $B9, $9C, $CE, $A1, $66, $E6, $12, $D7, $8F, $9E, $D4
	dc.b	$E3, $E7, $D6, $77, $BA, $13, $71, $E5, $5C, $AB, $23, $28, $11, $DC, $75, $F
	dc.b	$EB, $82, $1B, $6F, $D3, $8C, $F4, $F8, $AF, $22, $32, $AE, $57, $19, $40, $85
	dc.b	$46, 8, $55, $B7, $1A, $6F, $F8, $D3, $3C, $AB, $95, $64, $65, 2, $3B, $8E
	dc.b	$A1, $FD, $70, $43, $6D, $DA, $7B, $C2, $BC, $88, $CA, $B9, $5C, $65, 2, $15
	dc.b	$18, $21, $56, $DA, $6E, $C3, $DF, $6C, $66, $A1, $EA, $88, $AF
	dcb.b	2,$F0
	dc.b	$F5, $B, $78, $5B, $D6, $6A, $F5, $9F, $8B, $D4, $3C, $2C, $F1, $9A, $87, $84
	dc.b	$78, $7A, $87, $AC, $FC, $4D, $5E, $AF, $57, $85, $78, $59, $AC, $C2, $DE, $A2
	dc.b	$78, $A4, $83, $C8, $4D, $8A, $F7, $37, $7C, $AB, $CA, $B9, $43, $B7, $EA, $E4
	dc.b	$E8, $4B, $59, $58, $E5, $66, $95, $8D, $D8, $F9, $36, $81, $75, $DD, $9C, $5E
	dc.b	$7B, $B4, $7C, $C1, $A3, $E6, $D, $19, $6E, $8A, $5F, $CF, $6F, $E4, $5B, $92
	dc.b	$76, $A4, $7D, $F3, $23, $2A, $1C, $56, $2B, $4B, $2C, $56, $34, $D3, $DE, $1D
	dc.b	$33, $87, $8E, $E3, $F9, $E5, $FC, $F8, $B4, $7C, $7E, $AE, $9F, $AB, $DE, $71
	dc.b	$D5, $D0, $F2, $D6, $A2, $73, $DB, $EB, $5A, $A9, $50, $FF, $38, $FF, $BB, $B9
	dc.b	$BB, 6, $C2, $D0, $2C, $1B, $F, $62, $CD, $87, $C5, 6, $DF, $C9, $83, $1D
	dc.b	$D6, $68, $7D, $6B, $68, $16, $E7, $18
	dcb.b	2,0
	dc.b	$14, $80, 5, $12, $15, $13, $26, $2E, $36, $32, $45, $18, $58, $F8, $66, $3A
	dc.b	$74, 3, $81
	dcb.b	2,4
	dc.b	$16, $34, $82, 4, 5, $16, $35, $27, $7B, $83, 4, 6, $16, $38, $28, $FB
	dc.b	$84, 6, $3C, $85, 5, $15, $16, $33, $86, 4, 7, $87, 6, $2F, $88, 7
	dc.b	$77, $8A, 6, $37, $8B, 4, 2, $14, 8, $25, $16
	dcb.b	2,$36
	dc.b	$8C, $18, $F9, $8D, 3, 0, $15, $14, $26, $39, $8F, 7, $76, $17, $7A, $FF
	dc.b	$3F, $86, $35, $E9, $AE, $6A, $C9, $5A, $6B, $9E, $AD, $35, $CD, $95, $A6, $B9
	dc.b	$B2, $B4, $95, $97, $35, $65, $6C, $D6, $BA, $CE, $AF, $56, $AA, $CF, $B2, $E6
	dc.b	$CB, $2F, $4B, $FA, $19, $A7, $AF, $84, $B6, $3F, $42, $67, $36, $F2, $BE, $71
	dcb.b	2,$3F
	dc.b	$8A, $D2, $FE, $2B, $D5, $BF, $4A, $D7, $BD, $FC
	dcb.b	2,$57
	dc.b	$4B, $D5, $BD, $BA, $5E, $BF, $6A, $E9, $7A, $F1, $F2, $AF, $D9, $35, $F9, $D7
	dc.b	$D6, $9E, $E0, $CC, $CF, $A6, $35, $E9, $BE, $15, $BE, $15, $97, $A, $CA, $D2
	dc.b	$E2, $5E, $F8, $CD, $B5, $9D, $7F, $66, $B3, $CF, $EE, $B3, $ED, $9F, $DC, $BD
	dc.b	$12, $66, $D2, $EC, $49, $2D, $2B, $2E, $C4, $93, $54, $96, $86, $78, $6F, $2B
	dc.b	$E7, $13, $F3, $F8, $AD, $2F, $E2, $BD, $5B, $F4, $AD, $7B, $DF, $C5, $75, $74
	dc.b	$BD, $5B, $DB, $A5, $EB, $F6, $AE, $97, $EA, $DF, $2A, $FD, $91, $97, $E7, $5F
	dc.b	$4A, $9E, $E0, $E4, $DD, $57, $A4
	dcb.b	3,$33
	dc.b	$C4, $65, $14, $BA, $39, $BA, $96, $98, $B6, $93, $8D, $32, $24
	dcb.b	3,$33
	dc.b	$32, $A6, $B, $7A, $63, $FB, $77, $73, $69, $FF, $36, $24, $2D, $42, $90, $24
	dc.b	$81, 0, $A5, $A7, $24, $2E, $48, 5, $70, $B0, $B8, $59, $32, $8A, $64, 8
	dc.b	$16, $49, $63, $FE, $6D, $C0, $A8, $42, $62, 1, $38, $95, $22, $F7, $EE, $36
	dc.b	$74, $EE, $36, $74, $EE, $23, $72
	dcb.b	2,$74
	dc.b	$2F, $D5, $17, $E5, $B7, $2F, $F5, 2, $FE, $54, $93, $9C, $88, $10, $C9, $37
	dc.b	$18, 9, $F0, $41, $C, $CC, $CF, $AD, $AE, $2A, $6D, $28, $A5, $A7, $1C, $94
	dc.b	$D2, $D4, $B9, $36, $CB, $48, $C0, $D3, 2, $31, $42, $E8, $19, $99, $E4, $54
	dc.b	$C1, $6F, $4C, $6D, $8A, $46, $54, $B5, $C0, $B9, $29, $82, $D0, $85, $87, $FE
	dc.b	$FF, $96, $3F, $35, $B0, $B7, $EF, $4C, $CC, $F2, $FE, $6D, $C0, $A8, $42, $62
	dc.b	1, $38, $95, $22, $F7, $EE, $36, $74, $EE, $36, $74, $EE, $23, $72
	dcb.b	2,$74
	dc.b	5, $F9, $A2, $FC, $B6, $F6, 9, $C9, $F, $F5, $CB, $F9, $A4, $60, 0, $33
	dc.b	$80, 5, $F, $15, $14, $25, $10, $36, $2E, $46, $2A, $56, $2B, $66, $34, $74
	dc.b	2, $81, 3, 0, $15, $A, $27, $70, $82, 4, 3, $15, $12, $26, $36, $37
	dc.b	$74, $47, $76, $83, 5, $B, $16, $30, $26, $35, $84, 5, $11, $16, $33, $28
	dc.b	$F4, $85, 7, $6E, $18, $F2, $86, 5, $16, $17, $78, $27, $7B, $87, 4, 6
	dc.b	$17, $6F, $28, $EE, $88, 5, $E, $16, $27, $28, $F5, $89
	dcb.b	2,4
	dc.b	$16, $26, $28, $EF, $37, $75, $8A, 7, $73, $8B, 7, $71, $18, $F3, $8C, 6
	dc.b	$31, $17, $72, $8D, 6, $2F, $8F, 6, $32, $FF, $81, $FE, $CE, $E3, $D6, $E9
	dc.b	$61, $54, $97, $54, $97, $5C, $AB, $95, $56, $94, $2C, $F4, $95, $2C, $8F, $49
	dc.b	$52, $67, 9, $51, $1C, $3B, $A0, $3B, $AD, $E, $23, $C0, $96, $1E, $6B, $F
	dc.b	$D9, $79, $AE, $9D, $30, $BB, $A5, $72
	dcb.b	3,$22
	dc.b	$FD, $9D, $D8, $67, $AB, $F0, $97, $A6, $A7, $91, $C7, $74, $56, $6E, $FC, $F9
	dc.b	$C7, $72, $CD, $DF, $AF, $5E, $E5, $9C
	dcb.b	2,$F9
	dc.b	$6B, $9E, $E8, $EE, $B2, $67, $2C, $D9, $22, $6A, $35, $A6, 7, $C2, $5A, $9A
	dc.b	$92, $27, $81, $A9, $A2, $7A, $98, $61, $17, $59, $66, $10, $46, $74, $6B, 3
	dc.b	$11, $13, $B5, $8C, $44, $FD, $59, $E6, $D2, $F5, $93, $98, $38, $D2, $53, $B0
	dc.b	$65, $D1, $8D, $C1, $CB, $87, $4E, $24, $44, $BB, $8E, $91, $C3, $6A, $6E, $CD
	dc.b	$72, $A7, $E9, $62, $B3, $A7, $8F, $28, $AE, $9E, $3C, $A2, $BA, $7E, $D7, $35
	dc.b	$BD, $7F, $D4, $79, $E1, $E8, $B7, $ED, $A9, $BD, 7, $4A, $20, $6E, $14, $DE
	dc.b	$83, $7D, $38, $6F, $52, $78, $EE, $4A, $6F, $9D, $21, $3C, $C2, $87, $34, $83
	dc.b	$F8, $9E, $1E, $6B, $D, $C2, $FE, $26, $C0, $F8, $5F, $C4, $21, $82, $2D, $32
	dc.b	$E7, $59, $E5, $CE, $1C, $8E, $67, $FE, $F0, $DC, $3F, $78, $D6, $9C, $72, $6C
	dc.b	$5F, $64, $53, $B1, $55, $FC, $31, $E1, $F9, $DF, $D8, $BC, $5E, $EB, $C5, $C2
	dc.b	$F1, $52
	dcb.b	2,$88
	dc.b	$B4, $E4, $21, $C9, $B1, $10, $C6, $D8, $AA, $16, $C5, $57, $62, $AA, $95, $58
	dcb.b	4,$22
	dc.b	$86, $DC, $6A, $92, $EA, $DA, $B9, $56, $C9, $55, $92, $B3, $8D, $47, $1A, $CE
	dc.b	$35, $4A, $35, $4F, $35, 5, $F3, $E, $4F, $BD, $57, $FE, $B0, $38, $4F, $BE
	dc.b	$DF, $9D, $17, $FE, $F3, $FE, $3C, $32, $E6, $29, $E7, $95, $97, $F, $D9, $DC
	dc.b	$B3
	dcb.b	4,$22
	dc.b	$AF, $95, $7E, $DA, $EF, $E6, $43, $F8, $3A, $1E, $B5, $1E, $15, $49, $75, $CA
	dc.b	$B9, $68, $7A, $1E, $87, $A1, $E8, $75, $AC, $EB, $95, $72, $AB, 3, $7C, $B0
	dc.b	$CD, $74, $D9, $79, $C3, $A2, $EA, $DB, $43, $2D, $F, $43, $D2, $35, $C4, $EE
	dc.b	$E7, $97, $11, $E, $7F, $9F, $E2, $90, $FC, $FF, $14, $10, $E0, $E4, $87, $7C
	dc.b	$F7, $77, $91, $3D, $7A, $7F, $E, $1A, $E7, $FD, $39, $7A, $6A, $79, $1C, $77
	dc.b	$1A, $CD, $DF, $9F, $38, $9A, $CD, $DF, $AF, $59, $AC, $E7, $CF, $71, $EB, $9E
	dc.b	$E8, $9E, $19, $CA, $27, $84, $4D, $5B, $60, $7C, $25, $A9, $AB, $6C, $D, $5B
	dc.b	$6A, $61, $72, $75, $96, $61, $72, $9D, $1A, $DB, $2A, $76, $ED, $EA, $F7, $30
	dc.b	$71, $CE, $6E, $DE, $1A, $51, $63
	dcb.b	2,$70
	dc.b	$5F, $4F, $D9, $FF, $4B, 7, $F6, $C1, $9F, $D3, 4, $7F, $65, $A5, $3A, $2E
	dc.b	$A6, $4A, $D9, $2A, $38, $D6, $71, $22, $2A, $61, $71, $BF, $3C, $36, $7F, $96
	dc.b	$6B, $93, $FF, $6B, $15, $9B, $F7, $78, $F2, $8A, $DF, $BB, $C7, $94, $56, $F8
	dc.b	$FE, $D7, $3D, $7F, $A9, $2C, $3D, $16, $9B, $6A, $6C, $83, $A3, $D9, 3, $70
	dc.b	$64, $DE, $83, $7A, $7E, $C7, $7A, $BD, $F7, $23, $FB, $A7, $4A, $7A, $B2, $43
	dc.b	$AD, $CB, $F3, $5D, $C2, $FF, $35, $C1, $5C, $79, $AE, 2, $FC, $B9, $AE, $B
	dc.b	$CA, $CB, $68, $6A, $11, $A9, $B5, $11, $B4, $48, $E8, $64
	dcb.b	3,$44
	dc.b	$55, $B5, $5B, $D1, $A1, $CF, $2D, $E9, $4E, $7F, $9F, $E2, $20, $3C, $C5, $D1
	dc.b	$1C, $44, $CF, $89, $D5, $13, $AC, $CB, $44, 4
	dcb.b	5,$44
	dc.b	$55, $E7, $56, $32, $CD, $C3, $95, $E, $D3, $8C, $48
	dcb.b	2,$88
	dc.b	$89, 8, $8A, $EE, $42, $1C, $9B, $10, $FF, $D6, $5B, $15, $7E, $B2, $D8, $A9
	dc.b	$FC, $9B, $15, $53, $16, $C5, $50, $76, $2A, $BB, $15, $54, $A2
	dcb.b	4,$22
	dc.b	$2A, $86, $82, $B1, $7D, $6A, $81, $C6, $A9, $46, $AB, $3A, $6A, $B, $E6, $1F
	dc.b	$AC, $FC, $EF, $F, $D6, $4E, $A9, $F7, $FE, $75, $5F, $BC, $FF, $89, $11, $17
	dc.b	$EB, $2A, $6F, $6D, $F, $EE, $53, $FA, $35, $D9, $15, 1, $7F, 8, $F, $CE
	dc.b	$AA, 2, $F7, $5E, $2E, $17, $8A, $94, $45, $57, $68, $7F, $15, $EA, $F4, $DA
	dc.b	$6F, $45, $6E, $9F, $F8, $B6, $9F, $77, $ED, $B7, $4D, $AA, $8D, $5B, $29, $EA
	dc.b	$ED, $F, $E0, $D0, $7F, $E, $8E, $ED, $44, $ED, $41, $DA, $EF, $D8, $DD, $FB
	dc.b	$88, $E, $B0, $1D, $60, $3A, $C0, $75, $7B, $AD, $FC, $90, $EF, $EB, $8F, $F4
	dc.b	$FF, $C4, $F4, $DC, $9F, $8E, $1F, $8E, $99, $E1, $AF, $17, $EF, $40, $D7, $8B
	dc.b	$FB, $85, $B1, $18, $FB, $16, $C4, $63, $EC, $3A, $F1, $7F, $A8, $4F, $C7, $F
	dc.b	$C7, $77, $84, $FD, $74, $CC, $3F, $92, $C8, $3B, $C3, $91, $53, 7, $20, $60
	dc.b	$81, $C8, $A4, $53, $90, $39, $53, $A0, $72, $2A, $6F, $DB, $89, $9B, $AB, $23
	dc.b	$4C, $A9, $A7, $40, $E4, 9, $3A, 4, $52, $4F, $32, $A6, $77, $FE, $7F, $F3
	dc.b	$FF, $12, $29, $AB, $DF, $35, $DE, $37, $A4, $3D, $B2, $42, $76, $B3, $25, $26
	dc.b	$F5, $13, $4F, $33, $83, 9, $9D, $30, $B2, $BA, $86, $E, $1D, $E1, $38, $4C
	dc.b	$1C, $8A, $98, $39, $15, $30, $72, $29, $E8, $1C, $9C, $1E, $1C, $8A, $40, $F7
	dc.b	$22, $A6, $F, $45, $77, $87, $AB, $A8, $78, $FE, $48, $7F, $77, $B7, $F, $F4
	dc.b	$FF, $C4, $15, $79, $11, $43, $2B, $B2, $2A, $B2, $22, $2A, $B2, $2A, $65, $6B
	dc.b	$B2, $A6, $4F, $CA, $EB, $5D, $91, $5C
	dcb.b	2,0
	dc.b	$D2, 0, $EC, 0, $FC, 1, $C, 4, $E8, $D, 0, $43, $F0, $F8, $C, 0
	dc.b	$4B, $F0, 0, 8, 0, $4F, $F0, 8, $C, 0, $52, $F0, 0, 2, $E8, 9
	dcb.b	2,0
	dc.b	$F4, $F8, $A, 0, $3A, $F4, 0, 2, $E8, $D, 0, $43, $F0, $F8, $E, 0
	dc.b	$56, $F0, 0, 4, $E8, 9
	dcb.b	2,0
	dc.b	$F4, $F8, 8, 0, 6, $F4, 0, 4, 0, 9, $FC
	dcb.b	2,8
	dc.b	0, $B, $F4, 0, 4, $E8, 9
	dcb.b	2,0
	dc.b	$F4, $F8, 8, 0, $E, $F4, 0, 4, 0, $11, $FC
	dcb.b	2,8
	dc.b	0, $13, $F4, 0, 2, $E8, 9
	dcb.b	2,0
	dc.b	$F4, $F8, $A, 0, $16, $F4, 0, 3, $E8, $E, 0, $6E, $F0, 0, 8, 0
	dc.b	$7A, $F0, 8, 4, 0, $7D, $F0, 2, $E8, $A, 0, $7F, $F8, 0, $D, 0
	dc.b	$88, $F0, 0, 1, $F8, 5, 0, $62, $F8, 1, $F8, 5, 0, $66, $F8, 1
	dc.b	$F8, 5, 0, $6A, $F8, 3, $E8, $A, 0, $1F, $F4, $F0
	dcb.b	2,0
	dc.b	$28, $C, 0, 9, 0, $32, $F4, 2, $E8, $A, 0, $29, $F4, 0, 9, 0
	dc.b	$32, $F4, 0, 5, $F4, 4, 0, $38, $FE, $E8, 9
	dcb.b	2,0
	dc.b	$F4, $F8, 8, 0, $E, $F4, 0, 4, 0, $11, $FC
	dcb.b	2,8
	dc.b	0, $13, $F4, 3, $F8, 4, 0, $38, $FE, $EC, $A, 0, $7F, $F8, 4, $D
	dc.b	0, $88, $F0, 3, $F4, 4, 0, $38, $FE, $E8, $A, 0, $29, $F4, 0, 9
	dc.b	0, $32, $F4, 3, $EC, $A, 0, $7F, $F8, 4, $C, 0, $90, $F0, $C, 8
	dc.b	0, $94, $F0, 0, $24, 0, $C, 0, $16, 0, $20, 0, $2A, 0, $30, 3
	dc.b	$B, 4, $B, 5, $B, 4, $B, $FF
	dcb.b	2,0
	dc.b	3, 1
	dcb.b	2,2
	dc.b	3, 1, 2, $FF, 0, $E, 9, $FF, 0, $B, $13, $C, $13, $FF, 0, 6
	dc.b	9, 7, 9, $FF, 0, $B, $1D, $C, $1D, $B, $1D, $C, $31, $FF, 0, 5
	dc.b	8, $22, $CB, $D5, 5, 8, $22, $D5, $DF, 5, 8, $22, $DF, $E9, 5, 8
	dc.b	$22, $E9, $F3, 5, 8, $1E, $F3, $E0, 8
	dcb.b	2,0
	dcb.b	2,$E8
	dc.b	$E, 0, 3
	dcb.b	2,$E0
	dcb.b	2,8
	dcb.b	2,0
	dc.b	$E8, $E, 8, 3, 0, $18, 8, $10, 0, $E8, 0, $E, $10, 3, $E0, $18
	dc.b	8, $18
	dcb.b	3,0
	dc.b	$E, $18, 3, 0, 8, $54
	dcb.b	2,0
	dc.b	6, 8, $D, 0, $44, $E0, 8, $D, 0, $4C, 0, $18, $C, 0, $20, $E0
	dc.b	$18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
	dcb.b	2,0
	dc.b	1, $F8, 5, 0, $5C, $F8, 1, $F8, 5, 0, $60, $F8, 1, $F8, 5, 0
	dc.b	$64, $F8, 1, $F8, 5, 8, $64, $F8, 1, $F8, 5, 8, $60, $F8, 1, $F8
	dc.b	5, 8, $5C, $F8, 5, 8, $5C, $F8, $56, $11, $57, $12, $58, $12, $59, $13
	dc.b	$5A, $13, $5B, $14, $5C, $15, $5D, $16, $5E, $17, $5F, $18, $60, $19, $61, $1A
	dc.b	$62, $1B, $63, $1C, $63, $1D, $64, $1E, $64, $1F, $64, $20, $65, $21, $65, $22
	dc.b	$65, $23, $66, $24, $66, $25, $66, $26, $66, $27, $66, $28, $66, $29, $66, $2A
	dc.b	$66, $2B, $66, $2C, $66, $2D, $65, $2E, $65, $2F, $65, $30, $64, $31, $64, $32
	dc.b	$64, $33, $63, $34, $62, $35, $62, $36, $61, $37, $60, $38, $5F, $39, $5E, $3A
	dc.b	$5D, $3B, $5C, $3C, $5B, $3C, $5A, $3D, $59, $3D, $58, $3D, $57, $3E, $56, $3E
	dc.b	$55, $3E, $54, $3F, $53, $3F, $52, $3F, $51, $3F, $50, $3F, $4F, $3F, $4E, $3F
	dc.b	$4D, $3F, $4C, $3F, $4B, $3F, $4A, $3F, $49, $3F, $48, $3E, $47, $3E, $46, $3E
	dc.b	$45, $3D, $44, $3D, $43, $3C, $42, $3C, $41, $3B, $40, $3B, $3F, $3A, $3E, $3A
	dc.b	$3D, $39, $3C, $39, $3B, $38, $3A, $38, $39, $37, $38
	dcb.b	2,$37
	dcb.b	3,$36
	dcb.b	2,$35
	dc.b	$34, $35, $33, $34, $32, $34, $31, $33, $30, $33, $2F, $32, $2E, $32, $2D, $31
	dc.b	$2C, $31, $2B, $30, $2A, $30, $29, $2F, $28, $2F, $27, $2E, $26, $2E, $25, $2D
	dc.b	$24, $2D, $23, $2C, $22, $2C, $21, $2B, $20, $2B, $1F, $2A, $1E, $2A, $1D, $29
	dc.b	$1C, $29, $1B, $28, $1A, $28, $19, $27, $18, $27, $17, $26, $16, $26, $15, $25
	dc.b	$14, $25, $13, $24, $12, $24, $11, $23, $10, $23, $F, $22, $E, $22, $D, $21
	dc.b	$C, $21, $B, $20, $A, $20, 9, $1F
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
