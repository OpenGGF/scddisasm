; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R82A)
; ------------------------------------------------------------------------------

Padding1:
	if (REGION=USA)&(DEMO<>0)
		include	"Level/USA Legacy R8 Demo Gfx Lists.asm"
	elseif REGION=USA
		dc.w	$0828, $0002, $0029, $670E, $B028, $0030, $6606, $4EB9
		dc.w	$0020
		dc.b	$38
		dc.b	$D0
		dc.w	$4E75, $0200, $0001, $B028, $0030, $6606, $4EB9, $0020
		dc.b	$38
		dc.b	$D0
		dc.w	$4E75, $0012, $00AC, $00DA, $00F8, $0116, $0116, $0116
		dc.w	$0126, $0126, $45FA, $000C, $117C, $000B, $003D, $6000
		dc.w	$002E, $000A, $0000, $0314, $0000, $0214, $0044, $0114
		dc.w	$000C, $030A, $0000, $021E, $01FC, $0114, $000C, $0314
		dc.w	$0000, $010A, $0140, $0314, $0000, $0214, $01F0, $4A28
		dc.w	$003A, $6640, $7000, $1028, $003C, $D000, $D000, $45F2
		dc.w	$0000, $115A, $001A, $115A, $003A, $121A, $101A, $4880
		dc.w	$D068, $0036, $3140, $0008, $08A8, $0000, $0001, $08A8
		dc.w	$0000, $0022, $4A01, $670C, $08E8, $0000, $0001, $08E8
		dc.w	$0000, $0022, $5328, $003A, $6612, $5228, $003C, $1028
		dc.w	$003C, $B028, $003D, $6504, $4228, $003C, $4E75, $45FA
		dc.w	$000C, $117C, $0008, $003D, $6000, $FF94, $001E, $0000
		dc.w	$011E, $0030, $021E, $005C, $011E, $0030, $001E, $0000
		dc.w	$011E, $01D0, $021E, $01A4, $011E, $01D0, $45FA, $000C
		dc.w	$117C, $0004, $003D, $6000, $FF66, $001E, $0000, $011E
		dc.w	$0030, $021E, $005C, $011E, $0030, $45FA, $000C, $117C
		dc.w	$0004, $003D, $6000, $FF48, $001E, $0000, $011E, $01D0
		dc.w	$021E, $01A4, $011E, $01D0, $1028, $0028, $5900, $6402
		dc.w	$7000, $1140, $001A, $4E75, $1028, $0028, $5D00, $6402
		dc.w	$7000, $1140, $001A, $08E8, $0000, $0001, $08E8, $0000
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
		dc.w	$0828, $0002, $0029, $670E, $B028, $0030, $6606, $4EB9
		dc.w	$0020, $38CC, $4E75, $0200, $0001, $B028, $0030, $6606
		dc.w	$4EB9, $0020, $38CC, $4E75, $0012, $00AC, $00DA, $00F8
		dc.w	$0116, $0116, $0116, $0126, $0126, $45FA, $000C, $117C
		dc.w	$000B, $003D, $6000, $002E, $000A, $0000, $0314, $0000
		dc.w	$0214, $0044, $0114, $000C, $030A, $0000, $021E, $01FC
		dc.w	$0114, $000C, $0314, $0000, $010A, $0140, $0314, $0000
		dc.w	$0214, $01F0, $4A28, $003A, $6640, $7000, $1028, $003C
		dc.w	$D000, $D000, $45F2, $0000, $115A, $001A, $115A, $003A
		dc.w	$121A, $101A, $4880, $D068, $0036, $3140, $0008, $08A8
		dc.w	$0000, $0001, $08A8, $0000, $0022, $4A01, $670C, $08E8
		dc.w	$0000, $0001, $08E8, $0000, $0022, $5328, $003A, $6612
		dc.w	$5228, $003C, $1028, $003C, $B028, $003D, $6504, $4228
		dc.w	$003C, $4E75, $45FA, $000C, $117C, $0008, $003D, $6000
		dc.w	$FF94, $001E, $0000, $011E, $0030, $021E, $005C, $011E
		dc.w	$0030, $001E, $0000, $011E, $01D0, $021E, $01A4, $011E
		dc.w	$01D0, $45FA, $000C, $117C, $0004, $003D, $6000, $FF66
		dc.w	$001E, $0000, $011E, $0030, $021E, $005C, $011E, $0030
		dc.w	$45FA, $000C, $117C, $0004, $003D, $6000, $FF48, $001E
		dc.w	$0000, $011E, $01D0, $021E, $01A4, $011E, $01D0, $1028
		dc.w	$0028, $5900, $6402, $7000, $1140, $001A, $4E75, $1028
		dc.w	$0028, $5D00, $6402, $7000, $1140, $001A, $08E8, $0000
		dc.w	$0001, $08E8, $0000, $0022, $4E75, $0008, $002C, $0050
		dc.w	$0098, $0790, $0B00, $00F4, $B00B, $0000, $F4D0, $0B00
		dc.w	$00F4, $F00B, $0000, $F410, $0B00, $00F4, $300B, $0000
		dc.w	$F450, $0B00, $00F4, $0790, $0F00, $0C08, $B00F, $000C
		dc.w	$00D0, $0F00, $0CF8, $F00F, $000C, $F010, $0F00, $0CE8
		dc.w	$300F, $000C, $E050, $0F00, $0CD8, $0E90, $0D00, $1C28
		dc.w	$A00D, $001C, $20B0, $0D00, $1C18, $C00D, $001C, $10D0
		dc.w	$0D00, $1C08, $E00D, $001C, $00F0, $0D00, $1CF8, $000D
		dc.w	$001C, $F010, $0D00, $1CE8, $200D, $001C, $E030, $0D00
		dc.w	$1CD8, $400D, $001C, $D050, $0D00, $1CC8, $600D, $001C
		dc.w	$C000, $0000, $4EF9, $0020, $634A, $0323, $83BE, $0223
		dc.w	$6CB2, $0021, $0000, $0081, $0404, $0026, $002E, $0078
		dc.w	$0026, $0078, $0078, $0078, $0078, $0078, $0078, $0078
		dc.w	$0078, $0078, $0078, $0078, $0078, $00C2, $0078, $00CA
		dc.w	$0000, $0023, $83BE, $0000, $000B, $0023, $C02A, $95E0
		dc.w	$0023, $4346, $5F00, $0023, $0DA2, $6C00, $0023, $39B2
		dc.w	$7A00, $0023, $1E2E, $9E40, $0023, $213A, $A400, $0023
		dc.w	$34BC, $AD00, $0023, $235C, $B500, $0023, $2960, $D000
		dc.w	$0022, $EDE6, $D8C0, $0023, $3732, $DAE0, $0023, $2E48
		dc.w	$F5C0, $000B, $0023, $3B22, $6000, $0023, $3F3E, $6700
		dc.w	$0023, $40E2, $69A0, $0023, $BD3C, $6CC0, $0023, $D60A
		dc.w	$6EC0, $0023, $D71A, $70C0, $0023, $D1F2, $71C0, $0023
		dc.w	$C0FC, $72C0, $0022, $F8FC, $75C0, $0023, $DCB4, $78C0
		dc.w	$0023, $CB56, $7D20, $0023, $D7DA, $8BA0, $0000, $0023
		dc.w	$0098, $7880, $0002, $0022, $FABC, $8780, $0022, $F4F2
		dc.w	$9100, $0020, $BC1C, $7DE0, $0023, $213A, $A400, $0023
		dc.w	$34BC, $AD00, $0023, $235C, $B500, $0023, $2960, $D000
		dc.w	$0022, $EDE6, $D8C0, $0023, $3732, $DAE0, $0023, $2E48
		dc.w	$F5C0, $000B, $0023, $3B22, $6000, $0023, $3F3E, $6700
		dc.w	$0023, $40E2, $69A0, $0023, $B626, $6CC0, $0023, $CDC8
		dc.w	$6EC0, $0023, $D004, $70C0, $0023, $CADC, $71C0, $0023
		dc.w	$B9E6, $72C0, $0022, $F8FC, $75C0, $0023, $D59E, $78C0
		dc.w	$0023, $C440, $7D20, $0023, $D0C4, $8BA0, $0000, $0023
	endif

StageChunks:
	if (REGION=USA)&(DEMO<>0)
		incbin	"maps/r82a/chunks.bin",0,$4000
		include	"Level/USA Legacy R8 Demo Data.asm"
		incbin	"maps/r82a/chunks.bin",$5000
	else
		incbin	"maps/r82a/chunks.bin"
	endif
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
	incbin	"data/r8/byte_2345CA.bin"
	even

byte_21E096:
	incbin	"data/r8/byte_2346CA.bin"
	even

byte_21E196:
	incbin	"data/r8/byte_2347CA.bin"
	even

byte_21E296:
	incbin	"data/r8/byte_2348CA.bin"
	even

byte_21E396:
	incbin	"data/r8/byte_2349CA.bin"
	even

byte_21E496:
	incbin	"data/r8/byte_234ACA.bin"
	even

byte_21E596:
	incbin	"data/r8/byte_234BCA.bin"
	even

byte_21E696:
	incbin	"data/r8/byte_234CCA.bin"
	even

byte_21E896:
	incbin	"data/r8/byte_234ECA.bin"
	even

byte_21EA96:
	incbin	"data/r8/byte_2350CA.bin"
	even

byte_21EC96:
	incbin	"data/r8/byte_2352CA_a.bin"
	even

byte_2354CA:
	incbin	"data/r8/byte_2354CA_a.bin"
	even

byte_2356CA:
	incbin	"data/r8/byte_2356CA_a.bin"
	even

byte_2358CA:
	incbin	"data/r8/byte_2358CA_a.bin"
	even

byte_235ACA:
	incbin	"data/r8/byte_235ACA_a.bin"
	even

byte_21F696:
	incbin	"data/r8/byte_235CCA.bin"
	even

byte_21F716:
	incbin	"data/r8/byte_235D4A.bin"
	even

byte_21F796:
	incbin	"data/r8/byte_235DCA.bin"
	even

byte_21F816:
	incbin	"data/r8/byte_235E4A.bin"
	even

byte_21F896:
	incbin	"data/r8/byte_235ECA.bin"
	even

byte_21F916:
	incbin	"data/r8/byte_235F4A.bin"
	even

byte_21F996:
	incbin	"data/r8/byte_21FD96.bin"
	even

byte_21FA16:
	incbin	"data/r8/byte_21FA16.bin"
	even

byte_21FA96:
	incbin	"data/r8/byte_21FA96.bin"
	even

byte_21FB16:
	incbin	"data/r8/byte_21FB16.bin"
	even

byte_21FB96:
	incbin	"data/r8/byte_21FB96.bin"
	even

byte_21FC16:
	incbin	"data/r8/byte_21FC16.bin"
	even

byte_21FC96:
	incbin	"data/r8/byte_21FC96.bin"

Padding2:
	if (REGION=USA)&(DEMO<>0)
		include	"Level/USA Legacy Demo Mapping Tail.asm"
	else
		; This tile data is already split into the source-owned 128-byte tables.
		incbin	"data/r8/byte_235F4A.bin"
		incbin	"data/r8/byte_21FD96.bin"
		incbin	"data/r8/byte_21FA16.bin"
		incbin	"data/r8/byte_21FA96.bin"
		incbin	"data/r8/byte_21FB16.bin"
		incbin	"data/r8/byte_21FB96.bin", 0, $6A
	endif

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
	incbin	"maps/r82a/collision.bin"
	even

StageMaps:
	dc.w	StageMapFg-*
	dc.w	StageMapBg-StageMaps

StageMapFg:
	incbin	"maps/r82a/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r82a/background.bin"
	even

StageBlocks:
	incbin	"maps/r82a/blocks.nem"
	even

StageGfx:
	incbin	"maps/r82a/gfx.nem"
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

RevolveDoorGfx:
	incbin	"gfx/r8/revolve_door.nem"

Padding3:
	include	"Level/Metallic Madness/Data/R82A Padding 3 Base.asm"
	if (REGION=USA)&(DEMO<>0)
		include	"Level/USA Legacy Demo Padding3 Tail.asm"
	else
		include	"Level/Metallic Madness/Data/R82A Padding 3 Retail Tail.asm"
	endif

; ------------------------------------------------------------------------------
