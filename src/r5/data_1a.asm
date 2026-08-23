; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R51A)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		include	"r5/usa_pre_chunks_1.asm"
	else
		dc.w	$B041, $6D0C, $DAFC, $0020, $4A42, $6A04, $DAFC, $0020
		dc.w	$4269, $0010, $4269, $0012, $4269, $0014, $7C03, $3248
		dc.w	$6038, $4EB9, $0020, $786E, $6660, $1368, $0000, $0000
		dc.w	$1368, $0024, $0024, $3368, $0008, $0008, $3368, $000C
		dc.w	$000C, $1368, $0001, $0001, $1368, $0018, $0018, $2368
		dc.w	$0004, $0004, $3368, $0002, $0002, $137C, $0001, $001A
		dc.w	$137C, $0008, $0017, $137C, $0008, $0019, $137C, $0008
		dc.w	$0016, $301E, $321E, $D169, $0008, $D369, $000C, $235D
		dc.w	$002A, $235D, $002E, $51CE, $FF9A, $06A8, $0000, $4000
		dc.w	$002E, $2028, $002A, $2228, $002E, $D1A8, $0008, $D3A8
		dc.w	$000C, $43F8, $D000, $3029, $000C, $9068, $000C, $0C40
		dc.w	$FF20, $6F06, $4EF9, $0020, $3AA6, $4EF9, $0020, $3B52
		dc.w	$0004, $0019, $04F0, $0580, $00F0, $F005, $8000, $0000
		dc.w	$0580, $00F0, $0005, $8000, $0001, $F805, $8000, $F800
		dc.w	$FFF8, $FFF8, $0010, $0000, $0000, $0010, $0010, $0010
		dc.w	$FFFE, $B750, $FFFA, $0000, $0001, $48B0, $FFFA, $0000
		dc.w	$FFFD, $1C72, $FFFC, $0000, $0002, $E38E, $FFFC, $0000
		dc.w	$FFFC, $25EE, $FFFE, $B750, $FFFD, $1C72, $FFFD, $1C72
		dc.w	$FFFC, $25EE, $0001, $48B0, $FFFD, $1C72, $0002, $E38E
		dc.w	$0003, $DA12, $FFFE, $B750, $0002, $E38E, $FFFD, $1C72
		dc.w	$0003, $DA12, $0001, $48B0, $0002, $E38E, $0002, $E38E
		dc.w	$4A39, $00FF, $156A, $673E, $0C39, $0001, $00FF, $152E
		dc.w	$6606, $4A28, $0028, $672E, $3A28, $0008, $3C28, $000C
		dc.w	$4EB9, $0020, $3B52, $3145, $0008, $3146, $000C, $117C
		dc.w	$0018, $0000, $4A28, $0001, $6A0A, $303C, $009E, $4EB9
		dc.w	$0020, $2598, $588F, $4E75, $4A28, $0028, $6B2A, $0C39
		dc.w	$0002, $00FF, $152E, $6C10, $4A39, $00FF, $156D, $6618
		dc.w	$588F, $4EF9, $0020, $78A4, $4A39, $00FF, $156A, $6608
		dc.w	$588F, $4EF9, $0020, $3B52, $4E75, $4EF9, $0020, $67AC
		dc.w	$0323, $CE0E, $0223, $C088, $0021, $0000, $0081, $0404
		dc.w	$0026, $002E, $008A, $0026, $008A, $008A, $008A, $008A
		dc.w	$008A, $008A, $008A, $008A, $008A, $008A, $008A, $008A
		dc.w	$00DA, $008A, $00E2, $0000, $0023, $CE0E, $0000, $000E
		dc.w	$0023, $8A42, $5000, $0023, $6128, $6C00, $0023, $919C
		dc.w	$7A00, $0021, $DB10, $8800, $0021, $F1B4, $8A00, $0021
		dc.w	$D6D4, $8D40, $0023, $92A8, $9140, $0021, $D98C, $A140
		dc.w	$0023, $74C0, $A400, $0023, $8842, $AD00, $0023, $76E2
		dc.w	$B500, $0023, $7CE6, $D000, $0023, $416C, $D8C0, $0023
		dc.w	$8EF8, $DAE0, $0023, $81CE, $F5C0, $000C, $0021, $D400
		dc.w	$5F00, $0021, $ED3C, $6200, $0021, $D544, $6600, $0021
		dc.w	$D9DE, $6800, $0021, $E3B0, $6C80, $0021, $E092, $6E00
		dc.w	$0021, $E23E, $7000, $0021, $D4AA, $7400, $0021, $EF08
		dc.w	$7600, $0021, $E8E8, $7A00, $0021, $EA66, $7E00, $0021
		dc.w	$E644, $82C0, $0023, $4C82, $9E40, $0000, $0023, $541E
		dc.w	$7880, $0002, $0023, $4E42, $8780, $0023, $4878, $9100
		dc.w	$0020, $B26E, $7DE0, $0023, $4E42, $8780, $0023, $4878
		dc.w	$9100, $0020, $B280, $7DE0, $0023, $6128, $6C00, $0021
		dc.w	$E292, $7A00, $0021, $F0BE, $82C0, $0023, $FB70, $8800
		dc.w	$0023, $F792, $8D40, $0021, $E39E, $9140, $0023, $F964
		dc.w	$A140, $0023, $74C0, $A400, $0023, $8842, $AD00, $0023
		dc.w	$76E2, $B500, $0023, $7CE6, $D000, $0023, $416C, $D8C0
		dc.w	$0021, $DFEE, $DAE0, $0023, $81CE, $F5C0, $0000, $0023
		dc.w	$541E, $7880, $000D, $0023, $F66A, $5F00, $0023, $FC56
		dc.w	$6000, $0023, $FA3A, $6800, $0023, $F9B6, $6B80, $0021
		dc.w	$EE4C, $6C80, $0021, $EB76, $6D00, $0021, $EA6C, $6E00
		dc.w	$0021, $EC18, $7000, $0023, $F6F8, $7400, $0021, $F7B6
		dc.w	$7600, $0021, $F362, $7A00, $0021, $F4E0, $7E00, $0021
		dc.w	$FA62, $8A00, $0023, $4C82, $9E40, $000D, $0023, $F66A
		dc.w	$5F00, $0023, $FC56, $6000, $0023, $FA3A, $6800, $0023
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
	incbin	"maps/r51a/chunks.bin"

Padding2:
	incbin	"../padding/r51a_e_2.bin"

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
	incbin	"gfx/r5/boss_1_proto.nem"
	even

BossGfx2:
	incbin	"gfx/r5/boss_2_proto.nem"
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
	incbin	"maps/r51a/collision.bin"
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
	incbin	"maps/r51a/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r51a/background.bin"
	even

StageMapNull:
	incbin	"maps/r51a/background_2.bin"
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
	incbin	"maps/r51a/blocks.nem"
	even

StageGfx:
	incbin	"maps/r51a/gfx.nem"
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

BgInsideGfxA:
	incbin	"gfx/r5/bg_inside_a.nem"
	even

BgOutsideGfxA:
	incbin	"gfx/r5/bg_outside_a.nem"
	even

BridgeGfxA:
	incbin	"gfx/r5/bridge_a.nem"
	even

ConveyorCtrlGfxA:
	incbin	"gfx/r5/conveyor_control_a.nem"
	even

PlatformGfxA:
	incbin	"gfx/r5/platform_a.nem"
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

BreakWallGfxA:
	incbin	"gfx/r5/break_wall_a.nem"
	even

ChainGfx:
	incbin	"gfx/chain.nem"
	even

CollapseFloorGfxA:
	incbin	"gfx/r5/collapse_floor_a.nem"
	even

SpikesHV4Gfx:
	incbin	"gfx/spikes_hv4.nem"
	even

StalactiteGfxAC:
	incbin	"gfx/r5/stalactite_ac.nem"
	even

RockGfxA:
	incbin	"gfx/r5/rock_a.nem"
	even

KumoKumoGfx:
	incbin	"gfx/r5/kumo_kumo.nem"
	even

KemusiGfx:
	incbin	"gfx/r5/kemusi.nem"
	even

SasoriGfx:
	incbin	"gfx/r5/sasori.nem"
	even

NoroNoroGfx:
	incbin	"gfx/r5/noro_noro.nem"
	even

RobotTransportGfxA:
	incbin	"gfx/robot_transport_a.nem"
	even

SinePlatformGfxA:
	incbin	"gfx/r5/sine_platform_a.nem"
	even

CrackFloorGfxA:
	incbin	"gfx/r5/crack_floor_a.nem"

Padding3:
	incbin	"../padding/r51a_e_3.bin"

; ------------------------------------------------------------------------------
