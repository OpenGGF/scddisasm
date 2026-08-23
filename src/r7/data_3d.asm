; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R73D)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		include	"Level/USA Legacy R73D PreChunk Data.asm"
	else
		incbin	"../padding/r73d_e_1.bin"
	endif

StageChunks:
	incbin	"maps/r73d/chunks.bin"
	even

AmyRoseGfx:
	incbin	"gfx/r7/amy_rose.nem"
	even

AmyRoseSprites:
	include	"sprites/r7/amy_rose.asm"
	even

AmyRoseAnims:
	include	"anims/r7/amy_rose.asm"
	even

BlockGfxD:
	incbin	"gfx/r7/block_d.nem"
	even

LampGfxD:
	incbin	"gfx/r7/lamp_d.nem"
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
	incbin	"../padding/r73d_e_2.bin"

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
	include	"sprites/r7/flower.asm"
	even

FlowerGfx:
	incbin	"gfx/r7/flower.nem"
	even

TitleCardTextGfx:
	incbin	"gfx/r7/title_card_text.nem"
	even

LaunchGfx:
	incbin	"gfx/r7/launch.nem"
	even

SparksGfx:
	incbin	"gfx/r7/sparks.nem"
	even

LightEdgesGfx:
	incbin	"gfx/r7/light_edges.nem"
	even

PathSwapGfx:
	incbin	"gfx/r7/path_swap.nem"
	even

MeshGfxA:
	incbin	"gfx/r7/mesh_a.nem"
	even

MeshGfxB:
	incbin	"gfx/r7/mesh_b.nem"
	even

MeshGfxC:
	incbin	"gfx/r7/mesh_c.nem"
	even

MeshGfxD:
	incbin	"gfx/r7/mesh_d.nem"
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
	incbin	"maps/r73d/collision.bin"
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
	incbin	"maps/r73d/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r73d/background.bin"
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
	incbin	"maps/r73d/blocks.nem"
	even

StageGfx:
	incbin	"maps/r73d/gfx.nem"
	even

SwingGfx:
	incbin	"gfx/r7/swing.nem"
	even

LightsGfxA:
	incbin	"gfx/r7/lights_a.nem"
	even

LightsGfxC:
	incbin	"gfx/r7/lights_c.nem"
	even

LightsGfxD:
	incbin	"gfx/r7/lights_d.nem"
	even

AnimalsGfx:
	incbin	"gfx/r7/animals.nem"
	even

HologramAnimalsGfx:
	incbin	"gfx/r7/hologram_animals.nem"
	even

HologramGfx:
	incbin	"gfx/hologram.nem"
	even

RobotTransportGfxB:
	incbin	"gfx/robot_transport_b.nem"
	even

RobotTransportGfxA:
	incbin	"gfx/robot_transport_a.nem"
	even

KanabunGfx:
	incbin	"gfx/r7/kanabun.nem"
	even

SpikeLaunchGfx:
	incbin	"gfx/r7/spike_launch.nem"
	even

BlockGfxA:
	incbin	"gfx/r7/block_a.nem"
	even

BlockGfxB:
	incbin	"gfx/r7/block_b.nem"
	even

BlockGfxC:
	incbin	"gfx/r7/block_c.nem"
	even

BlockGfxD2:
	incbin	"gfx/r7/block_d.nem"
	even

SpikeBallGfx:
	incbin	"gfx/r7/spike_ball.nem"
	even

HotaruGfx:
	incbin	"gfx/r7/hotaru.nem"
	even

KabasiraGfx:
	incbin	"gfx/r7/kabasira.nem"
	even

DangoGfx:
	incbin	"gfx/r7/dango.nem"
	even

EggmanGfx:
	incbin	"gfx/r7/eggman.nem"
	even

MetalSonicGfx:
	incbin	"gfx/r7/metal_sonic.nem"
	even

SpikesV4Gfx:
	incbin	"gfx/spikes_v4.nem"

Padding3:
	dc.w	$0183, $0622, $CBF6, $49EF, $91ED, $392E, $9FF3, $2FF8
	dc.w	$EAD9, $3230, $F217, $CC2F, $09FB, $C6A5, $2FFE, $7D57
	dc.w	$E67A, $A6E7, $3DF6, $43DF, $64BE, $98D0, $C62F, $1A6D
	dc.w	$5A0D, $9242, $436A, $C485, $E308, $733F, $CB03, $0F16
	dc.w	$C187, $6AB7, $E111, $4BF9, $8FA9, $BF89, $EDF9, $AAD9
	dc.w	$374B, $C38C, $4A1A, $A492, $9C85, $9A24, $560D, $52B2
	dc.w	$2839, $5915, $3164, $5AB2, $2E4B, $3ECA, $BF33, $E237
	dc.w	$39EE, $73DC, $F232, $439D, $F4A3, $9627, $2BA4, $92E9
	dc.w	$A4F9, $473E, $61F0, $7EE3, $F764, $4E5E, $353F, $CD4C
	dc.w	$D3C4, $1D78, $A3C8, $E0D2, $5475, $C987, $4915, $3CF0
	dc.w	$F1ED, $E7F0, $5900, $8018, $8003, $0214, $0924, $0735
	dc.w	$1947, $7B54, $0665, $1673, $0081, $0408, $1638, $8205
	dc.w	$1A58, $FB77, $7A83, $040A, $8405, $1886, $0517, $151B
	dc.w	$763A, $8706, $3916, $3C88, $0301, $8918, $F98A, $163B
	dc.w	$8B08, $F818, $FAFF, $FFDA, $FF1C, $FDBE, $AED8, $B6C0
	dc.w	$9B80, $1F57, $6C5B, $6000, $1B57, $6C5B, $6001, $370F
	dc.w	$ABB6, $2DBC, $E3FA, $D1FE, $6FF8, $FFCF, $D3EA, $ED8B
	dc.w	$6C3F, $417E, $62C7, $251C, $962C, $58B9, $92E6, $4B96
	dc.w	$2C58, $E4A3, $92C5, $8E7F, $4DFB, $EC7A, $FF10, $7D5D
	dc.w	$B16D, $BF5D, $7FC7, $FE7E, $9F57, $6C5B, $61FA, $1FB8
	dc.w	$7BB9, $62C7, $251C, $962C, $58B9, $92E6, $4B96, $2C58
	dc.w	$E4A3, $933F, $C6FC, $F2F5, $E83E, $AED8, $B6DF, $AEBF
	dc.w	$C2BF, $A7CA, $FBF7, $ABB6, $2DB0, $F7B6, $0013, $ABB6
	dc.w	$2DB0, $000D, $ABB6, $2DB0, $03E8, $09D5, $DB16, $DBFF
	dc.w	$5A7A, $5FDA, $FC64, $76DC, $76F0, $BF43, $DCC4, $F0BF
	dc.w	$12F1, $314A, $9E26, $A6A6, $2A6A, $69AA, $7850, $F530
	dc.w	$A143, $4280, $F0A1, $44C2, $8513, $01E9, $542A, $54AA
	dc.w	$6953, $C7B8, $9A85, $C28E, $661F, $C8E5, $72BF, $4EBF
	dc.w	$AF3F, $C77F, $172F, $1CE7, $CCF9, $C7E2, $979C, $76B9
	dc.w	$E3B7, $8EFD, $FE28, $002D, $F000, $000F, $C4DA, $3E5B
	dc.w	$8F97, $89E3, $E557, $DAFE, $0FD6, $7EB3, $F5EF, $E000
	dc.w	$000D, $F000, $B000, $18F0, $F405, $0044, $F804, $0C00
	dc.w	$48F0, $03D4, $0300, $28FC, $F405, $0044, $F804, $0C00
	dc.w	$48F0, $04D4, $0B00, $2CE8, $D40B, $0038, $00F4, $0500
	dc.w	$44F8, $040C, $0048, $F000, $03D4, $0F08, $18F0, $F405
	dc.w	$0044, $F804, $0C00, $48F0, $04E4, $0200, $00EC, $E40F
	dc.w	$0003, $F404, $0100, $13FC, $1408, $0015, $F400, $0004
	dc.w	$002C, $0100, $0000, $0000, $0000, $0000, $0000, $0000
	dc.w	$0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	dc.w	$0001, $0000, $0100, $0001
	dc.w	$FF00, $0203, $0405, $0607, $08FF, $0012, $0050, $008E
	dc.w	$00AE, $00B4, $00BA, $00C0, $00C6, $00CC, $0CE0, $0100
	dc.w	$00F8, $E001, $0800, $00F0, $0800, $02E8, $F008, $0005
	dc.w	$00F8, $0D00, $08E0, $F80D, $0010, $0008, $0D00, $18E0
	dc.w	$080D, $0818, $0018, $0C00, $20E0, $180C, $0820, $0020
	dc.w	$0700, $54F0, $2007, $0854, $0000, $0CE0, $0100, $24F8
	dc.w	$E001, $0824, $00F0, $0800, $26E8, $F008, $0029, $00F8
	dc.w	$0D00, $2CE0, $F80D, $0034, $0008, $0D00, $3CE0, $080D
	dc.w	$083C, $0018, $0C00, $20E0, $180C, $0820, $0020, $0700
	dc.w	$54F0, $2007, $0854, $0000, $0608, $0D00, $44E0, $080D
	dc.w	$004C, $0018, $0C00, $20E0, $180C, $0820, $0020, $0700
	dc.w	$54F0, $2007, $0854, $0000, $01F8, $0500, $5CF8, $01F8
	dc.w	$0500, $60F8, $01F8, $0500, $64F8, $01F8, $0508, $64F8
	dc.w	$01F8, $0508, $60F8, $01F8, $0508, $5CF8, $0508, $5CF8
	dc.w	$5611, $5712, $5812, $5913, $5A13, $5B14, $5C15, $5D16
	dc.w	$5E17, $5F18, $6019, $611A, $621B, $631C, $631D, $641E
	dc.w	$641F, $6420, $6521, $6522, $6523, $6624, $6625, $6626
	dc.w	$6627, $6628, $6629, $662A, $662B, $662C, $662D, $652E
	dc.w	$652F, $6530, $6431, $6432, $6433, $6334, $6235, $6236
	dc.w	$6137, $6038, $5F39, $5E3A, $5D3B, $5C3C, $5B3C, $5A3D
	dc.w	$593D, $583D, $573E, $563E, $553E, $543F, $533F, $523F
	dc.w	$513F, $503F, $4F3F, $4E3F, $4D3F, $4C3F, $4B3F, $4A3F
	dc.w	$493F, $483E, $473E, $463E, $453D, $443D, $433C, $423C
	dc.w	$413B, $403B, $3F3A, $3E3A, $3D39, $3C39, $3B38, $3A38
	dc.w	$3937, $3837, $3736, $3636, $3535, $3435, $3334, $3234
	dc.w	$3133, $3033, $2F32, $2E32, $2D31, $2C31, $2B30, $2A30
	dc.w	$292F, $282F, $272E, $262E, $252D, $242D, $232C, $222C
	dc.w	$212B, $202B, $1F2A, $1E2A, $1D29, $1C29, $1B28, $1A28
	dc.w	$1927, $1827, $1726, $1626, $1525, $1425, $1324, $1224
	dc.w	$1123, $1023, $0F22, $0E22, $0D21, $0C21, $0B20, $0A20
	dc.w	$091F

; ------------------------------------------------------------------------------
