; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (R42A)
; ------------------------------------------------------------------------------

Padding1:
	if REGION=USA
		include	"r4/usa_padding_2a.asm"
	else
		; European/Japanese retained code fragment. The first routine starts
		; at a historical continuation point; its preceding tst.b instruction
		; is outside this data block in the original binary.
R42A_NonUSA_CheckAnimalRemoveTail:
		dc.w	$6B2A		; bmi.s R42A_NonUSA_CheckAnimalRemove_Return
		cmpi.b	#2,time_zone
		dc.w	$6C10		; bge.s R42A_NonUSA_CheckAnimalRemove_CheckGlobal
		tst.b	projector_destroyed
		dc.w	$6618		; bne.s R42A_NonUSA_CheckAnimalRemove_Return
		addq.l	#4,sp
		jmp	$207990.L

R42A_NonUSA_CheckAnimalRemove_CheckGlobal:
		tst.b	good_future
		dc.w	$6608		; bne.s R42A_NonUSA_CheckAnimalRemove_Return
		addq.l	#4,sp
		jmp	$203C2A.L

R42A_NonUSA_CheckAnimalRemove_Return:
		rts

		; This legacy copy of AnimateStageGfx is retained at a fixed address
		; and is separate from the six-byte entry wrapper above.
R42A_NonUSA_LegacyAnimateStageGfx:
		tst.b	paused
		dc.w	$6600, $00C0	; bne.w R42A_NonUSA_LegacyAnimateStageGfx_Return
		jsr	$20688C.L
		cmpi.w	#$280,scroll_fg_x
		dc.w	$6400, $00B0	; bcc.w R42A_NonUSA_LegacyAnimateStageGfx_Return
		cmpi.w	#$160,scroll_fg_y
		dc.w	$6400, $00A6	; bcc.w R42A_NonUSA_LegacyAnimateStageGfx_Return
		lea	stage_anim_timers,a2
		lea	stage_anim_frames,a4
		lea	$20FD82.L,a1
		move.w	#$7F,d6
		bsr.w	R42A_NonUSA_AnimateTiles
		dc.w	$6624		; bne.s R42A_NonUSA_LegacyAnimateStageGfx_Second
		lea	VDP_CTRL,a5
		move.l	#$94019300,(a5)
		move.l	#$968C95C0,(a5)
		move.w	#$977F,(a5)
		move.w	#$4500,(a5)
		move.w	#$81,dma_stack
		move.w	dma_stack,(a5)

R42A_NonUSA_LegacyAnimateStageGfx_Second:
		lea	$20FDD4.L,a1
		move.w	#$7F,d6
		bsr.w	R42A_NonUSA_AnimateTiles
		dc.w	$6624		; bne.s R42A_NonUSA_LegacyAnimateStageGfx_Third
		lea	VDP_CTRL,a5
		move.l	#$94019300,(a5)
		move.l	#$968C95C0,(a5)
		move.w	#$977F,(a5)
		move.w	#$4700,(a5)
		move.w	#$81,dma_stack
		move.w	dma_stack,(a5)

R42A_NonUSA_LegacyAnimateStageGfx_Third:
		lea	$20FE26.L,a1
		move.w	#$7F,d6
		bsr.w	R42A_NonUSA_AnimateTiles
		dc.w	$6624		; bne.s R42A_NonUSA_LegacyAnimateStageGfx_Return
		lea	VDP_CTRL,a5
		move.l	#$94019300,(a5)
		move.l	#$968C95C0,(a5)
		move.w	#$977F,(a5)
		move.w	#$4900,(a5)
		move.w	#$81,dma_stack
		move.w	dma_stack,(a5)

R42A_NonUSA_LegacyAnimateStageGfx_Return:
		rts

		; Non-USA R42A animated-art routine. Its fixed branch words are kept
		; explicit because this legacy block is linked at a historical offset.
R42A_NonUSA_AnimateTiles:
		subq.b	#$1,(a2)
		dc.w	$6A42		; bpl.s R42A_NonUSA_AnimateTiles_NoUpdate
		moveq	#$0,d0
		move.b	(a4),d0
		addq.b	#$1,d0
		dc.w	$B011		; cmp.b (a1),d0
		dc.w	$6502		; bcs.s R42A_NonUSA_AnimateTiles_IndexZero
		moveq	#$0,d0

R42A_NonUSA_AnimateTiles_IndexZero:
		move.b	d0,(a4)
		add.w	d0,d0
		move.b	$2(a1,d0.w),(a2)
		move.b	$3(a1,d0.w),d0
		ext.w	d0
		add.w	d0,d0
		add.w	d0,d0
		moveq	#$0,d1
		move.b	(a1),d1
		add.w	d1,d1
		add.w	d1,d0
		movea.l	$2(a1,d0.w),a1
		lea.l	$FF1980.l,a3

R42A_NonUSA_AnimateTiles_Copy:
		move.l	(a1)+,(a3)+
		dbra	d6,R42A_NonUSA_AnimateTiles_Copy
		adda.w	#$1,a2
		adda.w	#$1,a4
		moveq	#$0,d0
		rts

R42A_NonUSA_AnimateTiles_NoUpdate:
		adda.w	#$1,a2
		adda.w	#$1,a4
		moveq	#$1,d0
		rts

		dc.w	$1800, $3C00, $0801, $0802, $0803, $0804, $0805, $0606, $0607, $3C00, $0801, $0802
		dc.w	$0803, $0804, $0805, $0606, $0607, $3C00, $0800, $0800, $0800, $0800, $0800, $0600, $0600, $0023, $8A42, $0023
		dc.w	$8C42, $0023, $8E42, $0023, $9042, $0023, $9242, $0023, $9442, $0023, $9642, $0023, $9842, $1800, $3C00, $0801
		dc.w	$0802, $0803, $0804, $0805, $0606, $0607, $3C00, $0800, $0800, $0800, $0800, $0800, $0600, $0600, $3C00, $0801
		dc.w	$0802, $0803, $0804, $0805, $0606, $0607, $0023, $8A42, $0023, $8C42, $0023, $8E42, $0023, $9042, $0023, $9242
		dc.w	$0023, $9442, $0023, $9642, $0023, $9842, $1800, $3C00, $0800, $0800, $0800, $0800, $0800, $0600, $0600, $3C00
		dc.w	$0801, $0802, $0803, $0804, $0805, $0606, $0607, $3C00, $0801, $0802, $0803, $0804, $0805, $0606, $0607, $0023
		dc.w	$8A42, $0023, $8C42, $0023, $8E42, $0023, $9042, $0023, $9242, $0023, $9442, $0023, $9642, $0023, $9842, $0323
		dc.w	$D160, $0223, $C174, $0021, $0000, $0081, $0404, $0026, $0034, $0098, $0026, $00EE, $0144, $014C, $0098, $0098
		dc.w	$0098, $0098, $0098, $0098, $0098, $0098, $0098, $0090, $0098, $0154, $0001, $0023, $D160, $0000, $0023, $896E
		dc.w	$D960, $000E, $0021, $DB38, $5000, $0023, $6128, $6C00, $0021, $E292, $7A00, $0021, $F0BE, $82C0, $0023, $FB70
		dc.w	$8800, $0023, $F792, $8D40, $0021, $E39E, $9140, $0023, $F964, $A140, $0023, $74C0, $A400, $0023, $8842, $AD00
		dc.w	$0023, $76E2, $B500, $0023, $7CE6, $D000, $0023, $416C, $D8C0, $0021, $DFEE, $DAE0, $0023, $81CE, $F5C0, $0000
		dc.w	$0023, $541E, $7880, $000D, $0023, $F66A, $5F00, $0023, $FC56, $6000, $0023, $FA3A, $6800, $0023, $F9B6, $6B80
		dc.w	$0021, $EE4C, $6C80, $0021, $EB76, $6D00, $0021, $EA6C, $6E00, $0021, $EC18, $7000, $0023, $F6F8, $7400, $0021
		dc.w	$F7B6, $7600, $0021, $F362, $7A00, $0021, $F4E0, $7E00, $0021, $FA62, $8A00, $0023, $4C82, $9E40, $000D, $0023
		dc.w	$F66A, $5F00, $0023, $FC56, $6000, $0023, $FA3A, $6800, $0023, $F9B6, $6B80, $0021, $EE4C, $6C80, $0021, $EB76
		dc.w	$6D00, $0021, $EA6C, $6E00, $0021, $EC18, $7000, $0023, $F6F8, $7400, $0021, $F7B6, $7600, $0021, $F362, $7A00
		dc.w	$0021, $F4E0, $7E00, $0021, $FBC6, $8A00, $0023, $4C82, $9E40, $0000, $0021, $FA62, $8A00, $0000, $0021, $FBC6
		dc.w	$8A00, $0002, $0023, $4E42, $8780, $0023, $4878, $9100, $0020, $B14A, $7DE0, $0098, $7880, $0002, $0022, $FABC
		dc.w	$8780, $0022, $F4F2
	endif

StageChunks:
	incbin	"maps/r42a/chunks.bin"
	even

SpikeBallGfx:
	incbin	"gfx/r4/spike_ball.nem"
	even

ChainGfx:
	incbin	"gfx/chain.nem"
	even

TurbineGfxA:
	incbin	"gfx/r4/turbine_a.nem"
	even

CollapseFloorGfxA:
	incbin	"gfx/r4/collapse_floor_a.nem"
	even

ElectricBeamGfxA:
	incbin	"gfx/r4/electric_beam_a.nem"
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

AmenboGfx:
	incbin	"gfx/r4/amenbo.nem"
	even

WoodBlockGfx:
	incbin	"gfx/r4/wood_block.nem"
	even

AnimalsGfx:
	incbin	"gfx/r4/animals.nem"
	even

RobotTransportGfxA:
	incbin	"gfx/robot_transport_a.nem"

Padding2:
	include	"Level/Tidal Tempest/Data/R42A Padding2 Packed Prefix.asm"
	include	"Level/Tidal Tempest/Data/R42B Stage Data Tail.asm"

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
	incbin	"maps/r42a/collision.bin"
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
	incbin	"maps/r42a/foreground.bin"
	even

StageMapBg:
	incbin	"maps/r42a/background.bin"
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
	incbin	"maps/r42a/blocks.nem"
	even

StageGfx:
	incbin	"maps/r42a/gfx.nem"
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

BreakPoleGfxAB:
	incbin	"gfx/r4/break_pole_ab.nem"
	even

SpikesV4Gfx:
	incbin	"gfx/spikes_v4.nem"
	even

BlockGfxA:
	incbin	"gfx/r4/block_a.nem"
	even

SwitchGfx:
	incbin	"gfx/switch.nem"
	even

SlopeElevatorGfxA:
	incbin	"gfx/r4/slope_elevator_a.nem"
	even

SwingGfxAB:
	incbin	"gfx/r4/swing_ab.nem"
	even

PrizePointsGfx:
	incbin	"gfx/r4/prize_points.nem"
	even

DoorGfxA:
	incbin	"gfx/r4/door_a.nem"

Padding3:
	dc.w	$803C, $8004, $0815, $1A24, $0A36, $3B44, $0B56, $3A65
	dc.w	$1972, $0081, $0302, $8208, $F883, $0518, $8406, $3C85
	dc.w	$051B, $8703, $0318, $F988, $063D, $8908, $FA8E, $051C
	dc.w	$8F04, $09FF, $0000, $0000, $032F
	include	"r4/nonusa_padding_2b_3.asm"

; ------------------------------------------------------------------------------
