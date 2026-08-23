; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R63C)
; ------------------------------------------------------------------------------

Padding1:
; USA-only R63C legacy animation routines and tables
	if REGION=USA
	; The USA C image retains this 684-byte legacy block before StageChunks.
R63C_USA_AnimateStageGfx:
	move.b $6608(a2), $588f(a2)
L_R63C_20FD5A:
	jmp $20392c.l
L_R63C_20FD60:
	rts
R63C_USA_AnimateStageGfxAlt:
	jsr $206674.l
L_R63C_20FD68:
	lea.l $FFFFF66C.w, a2
L_R63C_20FD6C:
	lea.l $FFFFF666.w, a4
L_R63C_20FD70:
	lea.l R63C_USA_AnimationTableB.l, a1
L_R63C_20FD76:
	move.w #$3f, d6
L_R63C_20FD7A:
	bsr.w R63C_USA_AnimateTilesSimpleAlt
L_R63C_20FD7E:
	bne.b L_R63C_20FDA4
L_R63C_20FD80:
	lea.l $c00004.l, a5
L_R63C_20FD86:
	move.l #$94009380, (a5)
L_R63C_20FD8C:
	move.l #$968c95c0, (a5)
L_R63C_20FD92:
	move.w #$977f, (a5)
L_R63C_20FD96:
	move.w #$5640, (a5)
L_R63C_20FD9A:
	move.w #$81, $FFFFF640.w
L_R63C_20FDA0:
	move.w $FFFFF640.w, (a5)
L_R63C_20FDA4:
	lea.l $20fecc.l, a1
L_R63C_20FDAA:
	move.w #$1f, d6
L_R63C_20FDAE:
	bsr.w R63C_USA_AnimateTilesSimpleAlt
L_R63C_20FDB2:
	bne.b L_R63C_20FDD8
L_R63C_20FDB4:
	lea.l $c00004.l, a5
L_R63C_20FDBA:
	move.l #$94009340, (a5)
L_R63C_20FDC0:
	move.l #$968c95c0, (a5)
L_R63C_20FDC6:
	move.w #$977f, (a5)
L_R63C_20FDCA:
	move.w #$55c0, (a5)
L_R63C_20FDCE:
	move.w #$81, $FFFFF640.w
L_R63C_20FDD4:
	move.w $FFFFF640.w, (a5)
L_R63C_20FDD8:
	lea.l R63C_USA_AnimationTableA.l, a1
L_R63C_20FDDE:
	move.w #$1f, d6
L_R63C_20FDE2:
	bsr.w R63C_USA_AnimateTilesSimple
L_R63C_20FDE6:
	bne.b L_R63C_20FE0C
L_R63C_20FDE8:
	lea.l $c00004.l, a5
L_R63C_20FDEE:
	move.l #$94009340, (a5)
L_R63C_20FDF4:
	move.l #$968c95c0, (a5)
L_R63C_20FDFA:
	move.w #$977f, (a5)
L_R63C_20FDFE:
	move.w #$5540, (a5)
L_R63C_20FE02:
	move.w #$81, $FFFFF640.w
L_R63C_20FE08:
	move.w $FFFFF640.w, (a5)
L_R63C_20FE0C:
	rts
R63C_USA_AnimateTilesSimple:
	subq.b #$1, (a2)
L_R63C_20FE10:
	bpl.b L_R63C_20FE54
L_R63C_20FE12:
	moveq #$0, d0
L_R63C_20FE14:
	move.b (a4), d0
L_R63C_20FE16:
	addq.b #$1, d0
L_R63C_20FE18:
	cmp.b (a1), d0
L_R63C_20FE1A:
	bcs.b L_R63C_20FE1E
L_R63C_20FE1C:
	moveq #$0, d0
L_R63C_20FE1E:
	move.b d0, (a4)
L_R63C_20FE20:
	add.w d0, d0
L_R63C_20FE22:
	move.b $2(a1, d0.w), (a2)
L_R63C_20FE26:
	move.b $3(a1, d0.w), d0
L_R63C_20FE2A:
	ext.w d0
L_R63C_20FE2C:
	add.w d0, d0
L_R63C_20FE2E:
	add.w d0, d0
L_R63C_20FE30:
	moveq #$0, d1
L_R63C_20FE32:
	move.b (a1), d1
L_R63C_20FE34:
	add.w d1, d1
L_R63C_20FE36:
	add.w d1, d0
L_R63C_20FE38:
	movea.l $2(a1, d0.w), a1
L_R63C_20FE3C:
	lea.l $ff1980.l, a3
L_R63C_20FE42:
	move.l (a1)+, (a3)+
L_R63C_20FE44:
	dbra d6, L_R63C_20FE42
L_R63C_20FE48:
	adda.w #$1, a2
L_R63C_20FE4C:
	adda.w #$1, a4
L_R63C_20FE50:
	moveq #$0, d0
L_R63C_20FE52:
	rts
L_R63C_20FE54:
	adda.w #$1, a2
L_R63C_20FE58:
	adda.w #$1, a4
L_R63C_20FE5C:
	moveq #$1, d0
L_R63C_20FE5E:
	rts
R63C_USA_AnimationTableA:
	dc.w	$0400,$0400,$0901,$0402,$0F03,$0023,$3F0C,$0023,$3F8C,$0023,$400C,$0023,$408C
R63C_USA_AnimateTilesSimpleAlt:
	subq.b #$1, (a2)
L_R63C_20FE7C:
	bpl.w L_R63C_20FEB2
L_R63C_20FE80:
	move.b (a1), (a2)
L_R63C_20FE82:
	moveq #$0, d0
L_R63C_20FE84:
	move.b (a4), d0
L_R63C_20FE86:
	addq.b #$1, d0
L_R63C_20FE88:
	cmp.b $1(a1), d0
L_R63C_20FE8C:
	bcs.b L_R63C_20FE90
L_R63C_20FE8E:
	moveq #$0, d0
L_R63C_20FE90:
	move.b d0, (a4)
L_R63C_20FE92:
	add.w d0, d0
L_R63C_20FE94:
	add.w d0, d0
L_R63C_20FE96:
	movea.l $2(a1, d0.w), a1
L_R63C_20FE9A:
	lea.l $ff1980.l, a3
L_R63C_20FEA0:
	move.l (a1)+, (a3)+
L_R63C_20FEA2:
	dbra d6, L_R63C_20FEA0
L_R63C_20FEA6:
	adda.w #$1, a2
L_R63C_20FEAA:
	adda.w #$1, a4
L_R63C_20FEAE:
	moveq #$0, d0
L_R63C_20FEB0:
	rts
L_R63C_20FEB2:
	adda.w #$1, a2
L_R63C_20FEB6:
	adda.w #$1, a4
L_R63C_20FEBA:
	moveq #$1, d0
L_R63C_20FEBC:
	rts
R63C_USA_AnimationTableB:
	dc.w	$0403,$0023,$3C0C,$0023,$3D0C,$0023,$3E0C,$0302,$0023,$3B0C,$0023,$3B8C,$0323,$81DC,$0223,$6F30
	dc.w	$0021,$0000,$0081,$0404,$0026,$002E,$008A,$0026,$008A,$008A,$008A,$008A,$008A,$008A,$008A,$008A
	dc.w	$008A,$008A,$008A,$008A,$00E6,$008A,$00EE,$0000,$0023,$81DC,$0000,$000E,$0023,$0DA2,$6C00,$0023
	dc.w	$39BC,$7A00,$0023,$CA20,$8700,$0023,$CC94,$8AE0,$0023,$CFF4,$9100,$0023,$D458,$9500,$0023,$D2B6
	dc.w	$9900,$0023,$DC52,$9A00,$0023,$213A,$A400,$0023,$34BC,$AD00,$0023,$235C,$B500,$0023,$2960,$D000
	dc.w	$0022,$EDE6,$D8C0,$0023,$3732,$DAE0,$0023,$2E48,$F5C0,$000E,$0022,$F8FC,$5780,$0023,$4378,$5C20
	dc.w	$0023,$4220,$6200,$0023,$B174,$6800,$0023,$C8EE,$6B00,$0023,$B2B2,$6D40,$0023,$BE78,$7340,$0023
	dc.w	$BECA,$7400,$0023,$D378,$7500,$0023,$D6B0,$7700,$0023,$BD98,$7D00,$0023,$DB7A,$7F00,$0023,$410C
	dc.w	$8000,$0023,$C34E,$8200,$0023,$C066,$9D00,$0000,$0023,$0098,$7880,$0002,$0022,$FABC,$8780,$0022
	dc.w	$F4F2,$9100,$0020,$BBBC,$7DE0,$7DE0,$0023,$D59E,$78C0,$0023,$C440,$7D20,$0023,$D0C4,$8BA0,$0000
	dc.w	$0023
	else
	incbin	"../padding/r63c_e_1.bin"
	endif

StageChunks:
	if REGION=USA
		; The USA chunk stream retains three legacy animation entries.
		incbin	"maps/r63c/chunks.bin",0,$B946
		dc.w	$600A,$2005
		incbin	"maps/r63c/chunks.bin",$B94A,$1C
		dc.w	$4014,$000F
		incbin	"maps/r63c/chunks.bin",$B96A,$1C
		dc.w	$601E,$600A
		incbin	"maps/r63c/chunks.bin",$B98A,$3276
	else
		incbin	"maps/r63c/chunks.bin"
	endif

Padding2:
	incbin	"Level/Wacky Workbench/Data/Padding/2 (Act 1 Present).bin", $200, $1400

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
	incbin	"maps/r63c/collision.bin"
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
	incbin	"maps/r63c/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r63c/background.bin"
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
	incbin	"maps/r63c/blocks.nem"
	even

StageGfx:
	incbin	"maps/r63c/gfx.nem"
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

BossFloorGfxC:
	incbin	"gfx/r6/boss_floor_c.nem"
	even

BossPiecesGfxC:
	incbin	"gfx/r6/boss_pieces_c.nem"

Padding3:
	incbin	"Level/Wacky Workbench/Data/Padding/3 (Act 1 Present).bin", $259A, $264

; ------------------------------------------------------------------------------
