; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R82B)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		dc.w	$0022, $4E75, $0008, $002C, $0050, $0098, $0790, $0B00
		dc.w	$00F4, $B00B, $0000, $F4D0, $0B00, $00F4, $F00B, $0000
		dc.w	$F410, $0B00, $00F4, $300B, $0000, $F450, $0B00, $00F4
		dc.w	$0790, $0F00, $0C08, $B00F, $000C, $00D0, $0F00, $0CF8
		dc.w	$F00F, $000C, $F010, $0F00, $0CE8, $300F, $000C, $E050
		dc.w	$0F00, $0CD8, $0E90, $0D00, $1C28, $A00D, $001C, $20B0
		dc.w	$0D00, $1C18, $C00D, $001C, $10D0, $0D00, $1C08, $E00D
		dc.w	$001C, $00F0, $0D00, $1CF8, $000D, $001C, $F010, $0D00
		dc.w	$1CE8, $200D, $001C, $E030, $0D00, $1CD8, $400D, $001C
		dc.w	$D050, $0D00, $1CC8, $600D, $001C, $C000, $0000, $4EF9
		dc.w	$0020
		dc.b	$63
		dc.b	$3C
		dc.w	$0323, $83BE, $0223, $6CB2, $0021, $0000, $0081, $0404
		dc.w	$0026, $002E, $0078, $0026, $0078, $0078, $0078, $0078
		dc.w	$0078, $0078, $0078, $0078, $0078, $0078, $0078, $0078
		dc.w	$00C2, $0078, $00CA, $0000, $0023, $83BE, $0000, $000B
		dc.w	$0023, $C02A, $95E0, $0023, $4346, $5F00, $0023, $0DA2
		dc.w	$6C00, $0023, $39B2, $7A00, $0023, $1E2E, $9E40, $0023
		dc.w	$213A, $A400, $0023, $34BC, $AD00, $0023, $235C, $B500
		dc.w	$0023, $2960, $D000, $0022, $EDE6, $D8C0, $0023, $3732
		dc.w	$DAE0, $0023, $2E48, $F5C0, $000B, $0023, $3B22, $6000
		dc.w	$0023, $3F3E, $6700, $0023, $40E2, $69A0, $0023, $BD3C
		dc.w	$6CC0, $0023, $D60A, $6EC0, $0023, $D71A, $70C0, $0023
		dc.w	$D1F2, $71C0, $0023, $C0FC, $72C0, $0022, $F8FC, $75C0
		dc.w	$0023, $DCB4, $78C0, $0023, $CB56, $7D20, $0023, $D7DA
		dc.w	$8BA0, $0000, $0023, $0098, $7880, $0002, $0022, $FABC
		dc.w	$8780, $0022, $F4F2, $9100, $0020
		dc.b	$BC
		include	"Level/USA Legacy R8 Animation Records.asm"
		include	"Level/USA Legacy Stage Tail B.asm"
		dc.w	$0023, $D59E, $78C0, $0023, $C440, $7D20, $0023, $D0C4
		dc.w	$8BA0, $0000, $0023
	else
		dc.w	$0022, $4E75, $0008, $002C, $0050, $0098, $0790, $0B00
		dc.w	$00F4, $B00B, $0000, $F4D0, $0B00, $00F4, $F00B, $0000
		dc.w	$F410, $0B00, $00F4, $300B, $0000, $F450, $0B00, $00F4
		dc.w	$0790, $0F00, $0C08, $B00F, $000C, $00D0, $0F00, $0CF8
		dc.w	$F00F, $000C, $F010, $0F00, $0CE8, $300F, $000C, $E050
		dc.w	$0F00, $0CD8, $0E90, $0D00, $1C28, $A00D, $001C, $20B0
		dc.w	$0D00, $1C18, $C00D, $001C, $10D0, $0D00, $1C08, $E00D
		dc.w	$001C, $00F0, $0D00, $1CF8, $000D, $001C, $F010, $0D00
		dc.w	$1CE8, $200D, $001C, $E030, $0D00, $1CD8, $400D, $001C
		dc.w	$D050, $0D00, $1CC8, $600D, $001C, $C000, $0000, $4EF9
		dc.w	$0020, $634A, $0323, $83BE, $0223, $6CB2, $0021, $0000
		dc.w	$0081, $0404, $0026, $002E, $0078, $0026, $0078, $0078
		dc.w	$0078, $0078, $0078, $0078, $0078, $0078, $0078, $0078
		dc.w	$0078, $0078, $00C2, $0078, $00CA, $0000, $0023, $83BE
		dc.w	$0000, $000B, $0023, $C02A, $95E0, $0023, $4346, $5F00
		dc.w	$0023, $0DA2, $6C00, $0023, $39B2, $7A00, $0023, $1E2E
		dc.w	$9E40, $0023, $213A, $A400, $0023, $34BC, $AD00, $0023
		dc.w	$235C, $B500, $0023, $2960, $D000, $0022, $EDE6, $D8C0
		dc.w	$0023, $3732, $DAE0, $0023, $2E48, $F5C0, $000B, $0023
		dc.w	$3B22, $6000, $0023, $3F3E, $6700, $0023, $40E2, $69A0
		dc.w	$0023, $BD3C, $6CC0, $0023, $D60A, $6EC0, $0023, $D71A
		dc.w	$70C0, $0023, $D1F2, $71C0, $0023, $C0FC, $72C0, $0022
		dc.w	$F8FC, $75C0, $0023, $DCB4, $78C0, $0023, $CB56, $7D20
		dc.w	$0023, $D7DA, $8BA0, $0000, $0023, $0098, $7880, $0002
		dc.w	$0022, $FABC, $8780, $0022, $F4F2, $9100, $0020, $BC1C
		dc.w	$7DE0, $0023, $213A, $A400, $0023, $34BC, $AD00, $0023
		dc.w	$235C, $B500, $0023, $2960, $D000, $0022, $EDE6, $D8C0
		dc.w	$0023, $3732, $DAE0, $0023, $2E48, $F5C0, $000B, $0023
		dc.w	$3B22, $6000, $0023, $3F3E, $6700, $0023, $40E2, $69A0
		dc.w	$0023, $B626, $6CC0, $0023, $CDC8, $6EC0, $0023, $D004
		dc.w	$70C0, $0023, $CADC, $71C0, $0023, $B9E6, $72C0, $0022
		dc.w	$F8FC, $75C0, $0023, $D59E, $78C0, $0023, $C440, $7D20
		dc.w	$0023, $D0C4, $8BA0, $0000, $0023
	endif

StageChunks:
	incbin	"maps/r82b/chunks.bin"
	even

LaserAnims:
	include	"anims/r8/laser.asm"
	even

FlowerAnims:
	include	"anims/flower.asm"
	even

FlowerSprites:
	include	"sprites/r8/flower.asm"
	even

FlowerGfx:
	incbin	"gfx/r8/flower.nem"
	even

LaserGfx:
	incbin	"gfx/r8/laser.nem"
	even

TitleCardTextGfx:
	incbin	"gfx/r8/title_card_text.nem"
	even

byte_21DF96:
	incbin	"data/r8/byte_21DF96_2b.bin"
	even

byte_21FC16:
	incbin	"data/r8/byte_21FA16.bin"
	even

byte_21FC96:
	incbin	"data/r8/byte_21FA96.bin"
	even

byte_21FD16:
	incbin	"data/r8/byte_21FB16.bin"
	even

byte_21FD96:
	incbin	"data/r8/byte_21FB96.bin"
	even

byte_21FE16:
	incbin	"data/r8/byte_21FC16.bin"
	even

byte_21FE96:
	incbin	"data/r8/byte_21FE96_2b.bin"
	even

PlayerGfx:
	incbin	"gfx/r8/player.unc"
	even

PlayerSprites:
	include	"sprites/r8/player.asm"
	even

PlayerGfxScript:
	include	"sprites/r8/player_gfx.asm"
	even

PointsGfx:
	incbin	"gfx/points.nem"
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

RevolveDoorGfx:
	incbin	"gfx/r8/revolve_door.nem"
	even

BossDoorGfx:
	incbin	"gfx/r8/boss_door.nem"
	even

BossPanelsGfx1:
	incbin	"gfx/r8/boss_panels_1.nem"
	even

BossPanelsGfx2:
	incbin	"gfx/r8/boss_panels_2.nem"
	even

BossPanelsGfx3:
	incbin	"gfx/r8/boss_panels_3.nem"
	even

BossMachineGfx:
	incbin	"gfx/r8/boss_machine.nem"
	even

BossPanelSprites:
	dc.w	BossPanelSprites1-BossPanelSprites
	dc.w	BossPanelSprites2-BossPanelSprites
	dc.w	BossPanelSprites3-BossPanelSprites
	dc.w	BossPanelSprites4-BossPanelSprites
	dc.w	BossPanelSprites5-BossPanelSprites
	dc.w	BossPanelSprites6-BossPanelSprites

EggMobileSprites:
	include	"sprites/r8/eggmobile.asm"
	even

SparksSprites:
	include	"sprites/r8/sparks.asm"
	even

EggmanSprites:
	include	"sprites/r8/eggman.asm"
	even

BossPanelSprites1:
	include	"sprites/r8/boss_panel_1.asm"
	even

BossPanelSprites2:
	include	"sprites/r8/boss_panel_2.asm"
	even

BossPanelSprites3:
	include	"sprites/r8/boss_panel_3.asm"
	even

BossPanelSprites4:
	include	"sprites/r8/boss_panel_4.asm"
	even

BossPanelSprites5:
	include	"sprites/r8/boss_panel_5.asm"
	even

BossPanelSprites6:
	include	"sprites/r8/boss_panel_6.asm"
	even

AmyRoseGfx:
	incbin	"gfx/r8/amy_rose.nem"
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
	incbin	"maps/r82b/collision.bin"
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
	incbin	"maps/r82b/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r82b/background.bin"
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
	incbin	"maps/r82b/blocks.nem"
	even

StageGfx:
	incbin	"maps/r82b/gfx.nem"
	even

PowerupAnims:
	include	"anims/powerup.asm"
	even

PowerupSprites:
	include	"sprites/powerup.asm"
	even

TunnelSplashSprites:
TunnelSplashAnims:
HDoorSprites:
HDoorAnims:
SplashSprites:
SplashAnims:

ExplosionAnims:
	include	"anims/explosion.asm"
	even

ExplosionSprites:
	include	"sprites/explosion.asm"
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

CapsuleSprites:
CapsuleAnims:

DoorGfx:
	incbin	"gfx/r8/door.nem"
	even

SpikesV4Gfx:
	incbin	"gfx/spikes_v4.nem"
	even

CrusherGfx:
	incbin	"gfx/r8/crusher.nem"
	even

CollapseFloorGfx:
	incbin	"gfx/r8/collapse_floor.nem"
	even

BigbomGfx:
	incbin	"gfx/r8/bigbom.nem"
	even

TrapDoorGfx:
	incbin	"gfx/r8/trap_door.nem"
	even

SeesawGfxABD:
	incbin	"gfx/r8/seesaw_abd.nem"
	even

SeesawGfxC:
	incbin	"gfx/r8/seesaw_c.nem"
	even

SpikeCrusherGfx:
	incbin	"gfx/r8/spike_crusher.nem"
	even

TwinWalkerGfx:
	incbin	"gfx/r8/twin_walker.nem"
	even

SwitchGfx:
	incbin	"gfx/switch.nem"
	even

SpringWheelGfx:
	incbin	"gfx/spring_wheel.nem"
	even

MechaBuGfx:
	incbin	"gfx/r8/mecha_bu.nem"
	even

TubeCoverGfx:
	incbin	"gfx/r8/tube_cover.nem"
	even

AnimalsGfx:
	incbin	"gfx/r8/animals.nem"
	even

DangoGfx:
	incbin	"gfx/r8/dango.nem"
	even

RobotTransportGfxA:
	incbin	"gfx/robot_transport_a.nem"
	even

RobotTransportGfxB:
	incbin	"gfx/robot_transport_b.nem"
	even

SpinPlatform1Data:
	incbin	"data/r8/spin_platform_1.bin"
	even

RobotTransportSprites:
	include	"sprites/robot_transport.asm"
	even

LaserSprites:
	include	"sprites/r8/laser.asm"
	even
LaserSprites1		equ .Sprites1
LaserSprites2		equ .Sprites2

Padding3:
	incbin	"../padding/r82b_e_3.bin"

; ------------------------------------------------------------------------------
