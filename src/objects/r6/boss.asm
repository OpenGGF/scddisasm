; ------------------------------------------------------------------------------

EggmanObject:
	bsr.w	BossUpdateBottomBound
	bsr.w	EggmanCheckCollision
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	EggmanRoutineTable(pc,d0.w),d0
	jsr	EggmanRoutineTable(pc,d0.w)
	bsr.w	EggmanUpdateBossFlags
	lea	EggmanAnims,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

EggmanRoutineTable:
	dc.w	EggmanWaitForPlayer-*
	dc.w	EggmanInitialize-EggmanRoutineTable
	dc.w	EggmanDescend-EggmanRoutineTable
	dc.w	EggmanHover-EggmanRoutineTable
	dc.w	EggmanAscend-EggmanRoutineTable
	dc.w	EggmanAttack-EggmanRoutineTable
	dc.w	EggmanDefeatFall-EggmanRoutineTable
	dc.w	EggmanDefeatSequence-EggmanRoutineTable
	dc.w	EggmanEscape-EggmanRoutineTable
	dc.w	EggmanEscapeWait-EggmanRoutineTable
	dc.w	EggmanObject_0_Routine14-EggmanRoutineTable

; ------------------------------------------------------------------------------

EggmanCheckCollision:
	btst	#0,obj.var_2c(a0)
	beq.s	EggmanCheckCollisionReturn
	tst.b	obj.var_37(a0)
	beq.s	EggmanCheckCollisionTarget
	subq.b	#1,obj.var_37(a0)
	beq.s	EggmanRestoreCollision

EggmanCheckCollisionReturn:
	rts

; ------------------------------------------------------------------------------

EggmanCheckCollisionTarget:
	movea.w	obj.var_2e(a0),a1
	tst.b	obj.collide_type(a0)
	beq.s	EggmanTakeHit
	tst.b	obj.collide_type(a1)
	beq.s	EggmanTakeHit
	rts

; ------------------------------------------------------------------------------

EggmanTakeHit:
	addq.b	#1,obj.var_39(a0)
	clr.b	obj.collide_type(a0)
	clr.b	$20(a1)
	move.b	#1,obj.anim_id(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.b	#$1E,obj.var_37(a0)
	move.w	#$AC,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	rts

; ------------------------------------------------------------------------------

EggmanRestoreCollision:
	movea.w	obj.var_2e(a0),a1
	move.b	#$3C,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	move.b	#$3D,obj.collide_type(a1)
	move.b	#2,obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

EggmanUpdateBossFlags:
	bsr.w	BossGetPlayerBossBand
	btst	d0,boss_started
	bne.s	EggmanClearActiveFlag
	btst	#7,boss_flags
	bne.s	EggmanUpdateBossFlagsReturn
	bset	#6,boss_flags

EggmanUpdateBossFlagsReturn:
	rts

; ------------------------------------------------------------------------------

EggmanClearActiveFlag:
	bclr	#7,boss_flags
	rts

; ------------------------------------------------------------------------------

EggmanWaitForPlayer:
	lea	player_object,a1
	cmpi.w	#$A80,obj.x(a1)
	bge.s	EggmanBeginEncounter
	addq.l	#4,sp
	rts

; ------------------------------------------------------------------------------

EggmanBeginEncounter:
	move.b	#2,obj.routine(a0)

EggmanInitialize:
	move.b	boss_flags,d0
	andi.b	#$F,d0
	bne.w	EggmanWaitForFade
	movem.l	d7-a7,-(sp)
	move.w	#6,d0
	jsr	LoadFadePalette
	move.w	#6,d0
	jsr	LoadPalette
	movem.l	(sp)+,d7-a7
	moveq	#$13,d0
	jsr	AddGfxQueue
	bsr.w	BossSpawnEggmanChildren
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	move.w	#$3EC,obj.sprite_tile(a0)
	move.l	#EggmanSprites,obj.sprite_data(a0)
	bset	#0,obj.var_2c(a0)
	bsr.w	EggmanRestoreCollision
	andi.b	#$F0,boss_flags
	addq.b	#6,boss_flags
	bset	#4,boss_flags
	move.b	#6,boss_started
	move.w	#$9E0,d0
	move.w	d0,left_bound
	move.w	d0,target_left_bound
	move.w	#$A60,d0
	move.w	d0,right_bound
	move.w	d0,target_right_bound
	rts

; ------------------------------------------------------------------------------

EggmanWaitForFade:
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$78,obj.var_2a(a0)
	beq.s	EggmanEnterBattle
	rts

; ------------------------------------------------------------------------------

EggmanEnterBattle:
	clr.w	obj.var_2a(a0)
	move.b	#4,obj.routine(a0)
	clr.w	obj.x_speed(a0)
	move.w	#$300,obj.y_speed(a0)
	move.w	#$FFFF,obj.var_32(a0)
	move.w	#$67,d0
	movem.l	a0-a2,-(sp)
	jsr	SubCpuCommand
	movem.l	(sp)+,a0-a2
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine14:
	rts

; ------------------------------------------------------------------------------

EggmanDescend:
	bsr.w	BossIntegrateVelocity
	moveq	#0,d0
	move.b	obj.var_2d(a0),d0
	add.w	d0,d0
	move.w	EggmanDescentTargets(pc,d0.w),d0
	cmp.w	obj.y(a0),d0
	ble.s	EggmanLand
	rts

; ------------------------------------------------------------------------------

EggmanLand:
	move.w	d0,obj.y(a0)
	move.b	#6,obj.routine(a0)
	clr.w	obj.var_2a(a0)
	move.b	#1,obj.var_35(a0)
	move.b	#1,obj.var_34(a0)
	move.w	#$B1,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	rts

; ------------------------------------------------------------------------------

EggmanDescentTargets:
	dc.w	$620
	dc.w	$428
	dc.w	$228

; ------------------------------------------------------------------------------

EggmanHover:
	bsr.w	BossGetPlayerVerticalBand
	cmp.b	obj.var_2d(a0),d0
	blt.s	EggmanHoverExit
	bsr.w	EggmanMoveHover
	tst.b	obj.var_39(a0)
	bne.s	EggmanStartRise
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$12C,obj.var_2a(a0)
	bge.s	EggmanStartRise
	rts

; ------------------------------------------------------------------------------

EggmanHoverExit:
	bra.w	EggmanRestartAttackCycle

; ------------------------------------------------------------------------------

EggmanStartRise:
	move.b	#0,obj.var_35(a0)
	move.b	#8,obj.routine(a0)
	clr.w	obj.x_speed(a0)
	move.w	#$FF00,obj.y_speed(a0)
	move.w	#$FFF0,obj.var_32(a0)
	clr.w	obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

EggmanMoveHover:
	cmpi.b	#3,obj.var_2d(a0)
	bne.s	EggmanMoveHoverSine
	move.w	#2,d0
	addq.b	#1,obj.var_3c(a0)
	btst	#0,obj.var_3c(a0)
	bne.s	EggmanMoveHoverStep
	neg.w	d0

EggmanMoveHoverStep:
	add.w	d0,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

EggmanMoveHoverSine:
	move.w	obj.var_3a(a0),d0
	sub.w	d0,obj.y(a0)
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	addq.b	#2,obj.var_3c(a0)
	jsr	SineCosine
	muls.w	#4,d0
	asr.w	#8,d0
	move.w	d0,obj.var_3a(a0)
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

EggmanAscend:
	bsr.w	BossIntegrateVelocity
	moveq	#0,d0
	move.b	obj.var_2d(a0),d0
	add.w	d0,d0
	move.w	EggmanAscentTargets(pc,d0.w),d0
	cmp.w	obj.y(a0),d0
	bge.s	EggmanReachAscentTarget
	rts

; ------------------------------------------------------------------------------

EggmanReachAscentTarget:
	move.w	d0,obj.y(a0)
	clr.b	obj.var_34(a0)
	move.b	#$A,obj.routine(a0)
	move.b	#$F0,obj.var_38(a0)
	addq.b	#1,obj.var_2d(a0)
	cmpi.b	#3,obj.var_2d(a0)
	beq.s	EggmanResetAttackState
	move.b	#1,obj.var_35(a0)
	move.w	#$A3,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2

EggmanResetAttackState:
	clr.b	obj.var_39(a0)
	move.b	#0,obj.anim_id(a0)
	move.b	#0,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

EggmanAscentTargets:
	dc.w	$428
	dc.w	$228
	dc.w	$130

; ------------------------------------------------------------------------------

EggmanAttack:
	bsr.w	EggmanMoveHover
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$1F2,obj.var_2a(a0)
	beq.s	EggmanAttackSoundCue
	cmpi.w	#$21C,obj.var_2a(a0)
	beq.s	EggmanAttackSetBossFlags
	cmpi.w	#$23A,obj.var_2a(a0)
	beq.s	EggmanAttackClearBossFlag
	cmpi.w	#$258,obj.var_2a(a0)
	beq.s	EggmanAttackEnableEffect
	cmpi.w	#$276,obj.var_2a(a0)
	beq.s	EggmanAttackEnableBossFlag
	cmpi.w	#$348,obj.var_2a(a0)
	beq.w	EggmanAttackNextPhase
	bra.s	EggmanAttackUpdateEffects

; ------------------------------------------------------------------------------

EggmanAttackSoundCue:
	move.w	#$B2,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	bsr.w	BossGetPlayerVerticalBand
	bsr.w	BossSpawnSpikePair
	bra.s	EggmanAttackUpdateEffects

; ------------------------------------------------------------------------------

EggmanAttackSetBossFlags:
	move.b	boss_started,d1
	andi.b	#$1F,d1
	bsr.w	BossGetPlayerVerticalBand
	cmpi.b	#1,d0
	beq.s	EggmanAttackMarkOutcomeOne
	cmpi.b	#2,d0
	beq.s	EggmanAttackMarkOutcomeTwo
	ori.b	#$20,d1
	bra.s	EggmanAttackStoreBossFlags

; ------------------------------------------------------------------------------

EggmanAttackMarkOutcomeOne:
	ori.b	#$40,d1
	bra.s	EggmanAttackStoreBossFlags

; ------------------------------------------------------------------------------

EggmanAttackMarkOutcomeTwo:
	ori.b	#$80,d1

EggmanAttackStoreBossFlags:
	move.b	d1,boss_started
	bra.s	EggmanAttackUpdateEffects

; ------------------------------------------------------------------------------

EggmanAttackClearBossFlag:
	bclr	#5,boss_flags
	bra.s	EggmanAttackUpdateEffects

; ------------------------------------------------------------------------------

EggmanAttackEnableEffect:
	move.b	#1,obj.var_36(a0)
	bra.s	EggmanAttackUpdateEffects

; ------------------------------------------------------------------------------

EggmanAttackEnableBossFlag:
	bset	#5,boss_flags
	clr.b	obj.var_36(a0)

EggmanAttackUpdateEffects:
	cmpi.w	#$168,obj.var_2a(a0)
	bgt.s	EggmanAttackSecondarySpawn
	moveq	#0,d0
	move.w	obj.var_2a(a0),d0
	subi.w	#$168,d0
	bsr.w	BossSpawnFallingProjectile

EggmanAttackSecondarySpawn:
	cmpi.w	#$B4,obj.var_2a(a0)
	blt.s	EggmanAttackCheckFinalCollision
	moveq	#0,d0
	move.w	obj.var_2a(a0),d0
	subi.w	#$B4,d0
	bsr.w	BossSpawnSpikeWave

EggmanAttackCheckFinalCollision:
	cmpi.b	#3,obj.var_2d(a0)
	bne.s	EggmanAttackReturn
	tst.b	obj.collide_type(a0)
	beq.w	EggmanDefeat
	cmpi.w	#$B4,obj.var_2a(a0)
	bgt.s	EggmanAttackReturn
	moveq	#0,d0
	move.w	obj.var_2a(a0),d0
	subq.w	#1,d0
	bsr.w	BossSpawnProjectileWave

EggmanAttackReturn:
	rts

; ------------------------------------------------------------------------------

EggmanAttackNextPhase:
	cmpi.b	#3,obj.var_2d(a0)
	beq.s	EggmanRestartAttackCycle
	clr.w	obj.var_2a(a0)
	move.b	#4,obj.routine(a0)
	clr.w	obj.x_speed(a0)
	move.w	#$300,obj.y_speed(a0)
	move.w	#$FFFF,obj.var_32(a0)
	rts

; ------------------------------------------------------------------------------

EggmanDefeat:
	bclr	#0,obj.var_2c(a0)
	clr.w	obj.var_2a(a0)
	move.b	#$C,obj.routine(a0)
	move.w	#$C7,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	move.w	#$300,obj.x_speed(a0)
	move.w	#$100,obj.y_speed(a0)
	move.w	#$10,obj.var_32(a0)
	bsr.w	BossSpawnExplosion
	move.b	#2,obj.anim_id(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.b	#$FF,obj.var_35(a0)
	move.b	#$FF,obj.var_34(a0)
	rts

; ------------------------------------------------------------------------------

EggmanRestartAttackCycle:
	move.w	#$168,obj.var_2a(a0)
	clr.b	obj.var_34(a0)
	move.b	#$A,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

EggmanDefeatFall:
	bsr.w	EggmanConstrainPlayerDuringDefeat
	cmpi.w	#$2A0,obj.y(a0)
	bge.s	EggmanDefeatLand
	bsr.w	BossIntegrateVelocity
	neg.w	obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

EggmanDefeatLand:
	move.b	#$E,obj.routine(a0)
	move.b	#3,obj.anim_id(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.w	#$2A0,obj.y(a0)
	clr.w	obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

EggmanDefeatSequence:
	cmpi.w	#$78,obj.var_2a(a0)
	bne.s	EggmanDefeatSequenceCheckReset
	andi.b	#$1F,boss_started

EggmanDefeatSequenceCheckReset:
	cmpi.w	#$146,obj.var_2a(a0)
	bgt.s	EggmanDefeatSequenceMovePlayer
	bsr.w	EggmanConstrainPlayerDuringDefeat
	bra.s	EggmanDefeatSequenceUpdateTimer

; ------------------------------------------------------------------------------

EggmanDefeatSequenceMovePlayer:
	bsr.w	EggmanSetPlayerDefeatPosition

EggmanDefeatSequenceUpdateTimer:
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$B4,obj.var_2a(a0)
	beq.w	EggmanDefeatSequenceReleasePlayer
	cmpi.w	#$F0,obj.var_2a(a0)
	blt.s	EggmanDefeatSequenceCheckEvents
	bsr.w	BossSetPaletteCycleSlow
	cmpi.w	#$144,obj.var_2a(a0)
	bgt.s	EggmanDefeatSequenceCheckEvents
	bra.s	EggmanDefeatSequenceFadeToWhite

; ------------------------------------------------------------------------------

EggmanDefeatSequenceCheckEvents:
	cmpi.w	#$145,obj.var_2a(a0)
	beq.s	EggmanDefeatSequenceFadeScreen
	cmpi.w	#$146,obj.var_2a(a0)
	beq.s	EggmanDefeatSequenceSpawnCapsule
	cmpi.w	#$17F,obj.var_2a(a0)
	beq.s	EggmanDefeatSequenceFadeObjects
	cmpi.w	#$180,obj.var_2a(a0)
	blt.s	EggmanDefeatSequenceWaitEvent
	cmpi.w	#$1D4,obj.var_2a(a0)
	bgt.s	EggmanDefeatSequenceWaitEvent
	bra.s	EggmanDefeatSequenceFadeFromWhite

; ------------------------------------------------------------------------------

EggmanDefeatSequenceWaitEvent:
	cmpi.w	#$1D5,obj.var_2a(a0)
	beq.w	EggmanDefeatSequenceReward
	rts

; ------------------------------------------------------------------------------

EggmanDefeatSequenceFadeFromWhite:
	movea.l	a0,a3
	movea.l	a0,a4
	adda.w	#obj.var_3e,a4
	adda.w	#obj.var_3f,a3
	jsr	BossFadeStageFromWhite
	rts

; ------------------------------------------------------------------------------

EggmanDefeatSequenceFadeToWhite:
	movea.l	a0,a3
	movea.l	a0,a4
	adda.w	#obj.var_3e,a4
	adda.w	#obj.var_3f,a3
	jsr	BossFadeStageToWhite
	rts

; ------------------------------------------------------------------------------

EggmanDefeatSequenceFadeScreen:
	bsr.w	BossSetPaletteCycleSlow
	movem.l	d0-d7/a0-a6,-(sp)
	jsr	FadeToWhite
	movem.l	(sp)+,d0-d7/a0-a6
	rts

; ------------------------------------------------------------------------------

EggmanDefeatSequenceFadeObjects:
	movem.l	d0-d7/a0-a6,-(sp)
	jsr	BossFadeObjectsFromWhite
	movem.l	(sp)+,d0-d7/a0-a6
	rts

; ------------------------------------------------------------------------------

EggmanDefeatSequenceSpawnCapsule:
	moveq	#$14,d0
	jsr	AddGfxQueue
	move.b	#4,obj.anim_id(a0)
	clr.b	obj.sprite_frame(a0)
	move.w	#$300,obj.sprite_tile(a0)
	move.w	#$B30,obj.x(a0)
	move.w	#$288,obj.y(a0)
	movea.w	obj.var_2e(a0),a1
	addi.w	#$10,obj.y(a1)
	move.b	#1,obj.sprite_layer(a1)
	addq.b	#2,obj.routine(a1)
	rts

; ------------------------------------------------------------------------------

EggmanDefeatSequenceReward:
	bsr.w	BossSetPaletteCycleClear
	clr.w	obj.y_speed(a0)
	clr.w	obj.var_32(a0)
	move.w	#$100,obj.x_speed(a0)
	move.w	#$C,obj.var_30(a0)
	move.b	#$10,obj.routine(a0)
	clr.w	obj.var_2a(a0)
	move.w	word_20294C+4,right_bound
	move.w	word_20294C+4,target_right_bound
	move.w	#$1D,d0
	tst.b	good_future
	beq.s	EggmanDefeatSequenceSendMusic
	move.w	#$1C,d0

EggmanDefeatSequenceSendMusic:
	movem.l	a0-a2,-(sp)
	jsr	SubCpuCommand
	movem.l	(sp)+,a0-a2
	moveq	#100,d0
	jsr	AddPoints
	rts

; ------------------------------------------------------------------------------

EggmanDefeatSequenceReleasePlayer:
	move.b	#$3E,d0
	bsr.w	BossFindObjectById
	bra.s	EggmanDefeatSequenceCheckPlayer

; ------------------------------------------------------------------------------

EggmanDefeatSequenceWaitPlayer:
	bsr.w	BossFindObjectByIdNext

EggmanDefeatSequenceCheckPlayer:
	cmpi.b	#4,obj.routine(a1)
	bne.s	EggmanDefeatSequenceWaitPlayer
	move.b	#8,obj.routine(a1)
	rts

; ------------------------------------------------------------------------------

EggmanEscape:
	bsr.w	EggmanLoadCapsulePalette
	bsr.w	BossIntegrateVelocity
	cmpi.w	#$EF0,obj.x(a0)
	bge.s	EggmanEscapeComplete
	rts

; ------------------------------------------------------------------------------

EggmanEscapeComplete:
	move.b	#$12,obj.routine(a0)
	clr.b	boss_started

EggmanEscapeWait:
	bsr.w	EggmanLoadCapsulePalette
	addq.l	#4,sp
	rts

; ------------------------------------------------------------------------------

EggmanLoadCapsulePalette:
	btst	#1,obj.var_2c(a0)
	bne.s	EggmanLoadCapsulePaletteReturn
	lea	player_object,a1
	cmpi.w	#$C00,obj.x(a1)
	blt.s	EggmanLoadCapsulePaletteReturn
	bset	#1,obj.var_2c(a0)
	jsr	LoadCapsulePalette

EggmanLoadCapsulePaletteReturn:
	rts

; ------------------------------------------------------------------------------

EggmanSetPlayerDefeatPosition:
	lea	player_object,a1
	clr.w	obj.x_speed(a1)
	clr.w	obj.ground_speed(a1)
	move.w	#$AC0,obj.x(a1)
	rts

; ------------------------------------------------------------------------------

EggmanConstrainPlayerDuringDefeat:
	lea	player_object,a1
	btst	#7,obj.flags(a1)
	bne.s	EggmanConstrainPlayerDuringDefeatReturn
	clr.w	obj.x_speed(a1)
	clr.w	obj.ground_speed(a1)
	cmpi.w	#$28C,obj.y(a1)
	ble.s	EggmanConstrainPlayerLowerY
	move.w	#$28C,obj.y(a1)

EggmanConstrainPlayerLowerY:
	cmpi.w	#$AC0,obj.x(a1)
	bge.s	EggmanConstrainPlayerUpperX
	move.w	#$A70,obj.x(a1)
	rts

; ------------------------------------------------------------------------------

EggmanConstrainPlayerUpperX:
	move.w	#$B10,obj.x(a1)

EggmanConstrainPlayerDuringDefeatReturn:
	rts

; ------------------------------------------------------------------------------

BossMachineObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	BossMachineRoutineTable(pc,d0.w),d0
	jsr	BossMachineRoutineTable(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

BossMachineRoutineTable:
	dc.w	BossMachineInit-*
	dc.w	BossMachineFollowParent-BossMachineRoutineTable
	dc.w	BossMachineSolidCollision-BossMachineRoutineTable

; ------------------------------------------------------------------------------

BossMachineInit:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#$40,obj.width_2(a0)
	move.b	#$30,obj.height(a0)
	move.w	#$2300,obj.sprite_tile(a0)
	move.l	#BossMachineSprites,obj.sprite_data(a0)
	rts

; ------------------------------------------------------------------------------

BossMachineFollowParent:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	subi.w	#$10,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

BossMachineSolidCollision:
	move.b	#1,obj.sprite_frame(a0)
	move.b	#$40,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$2393,obj.sprite_tile(a0)
	lea	player_object,a1
	jsr	SolidObject
	rts

; ------------------------------------------------------------------------------

BossSpikesObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	BossSpikesRoutineTable(pc,d0.w),d0
	jsr	BossSpikesRoutineTable(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

BossSpikesRoutineTable:
	dc.w	BossSpikesInit-*
	dc.w	BossSpikesFollowParent-BossSpikesRoutineTable

; ------------------------------------------------------------------------------

BossSpikesInit:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$2300,obj.sprite_tile(a0)
	move.l	#BossSpikesSprites,obj.sprite_data(a0)
	rts

; ------------------------------------------------------------------------------

BossSpikesFollowParent:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	subi.w	#$40,obj.y(a0)
	tst.b	obj.var_34(a1)
	beq.s	BossSpikesHiddenReturn
	bmi.s	BossSpikesDelete
	cmpi.b	#1,obj.var_34(a1)
	beq.s	BossSpikesHit
	bra.s	BossSpikesAnimate

; ------------------------------------------------------------------------------

BossSpikesHiddenReturn:
	rts

; ------------------------------------------------------------------------------

BossSpikesDelete:
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BossSpikesAnimate:
	subq.b	#1,obj.anim_timer(a0)
	beq.s	BossSpikesAdvanceFrame
	rts

; ------------------------------------------------------------------------------

BossSpikesAdvanceFrame:
	lea	BossSpikesAnim,a2
	addq.b	#1,obj.sprite_frame(a0)
	moveq	#0,d0
	move.b	obj.sprite_frame(a0),d0
	tst.b	(a2,d0.w)
	bge.s	BossSpikesSetAnimationTimer
	clr.b	obj.sprite_frame(a0)

BossSpikesSetAnimationTimer:
	move.b	obj.var_1f(a0),d0
	subq.b	#3,d0
	cmpi.b	#1,d0
	bge.s	BossSpikesStoreAnimationTimer
	moveq	#1,d0

BossSpikesStoreAnimationTimer:
	move.b	d0,obj.var_1f(a0)
	move.b	d0,obj.anim_timer(a0)
	rts

; ------------------------------------------------------------------------------

BossSpikesHit:
	move.b	#$14,obj.var_1f(a0)
	move.b	#1,obj.anim_timer(a0)
	addq.b	#1,obj.var_34(a1)
	rts

; ------------------------------------------------------------------------------

BossExhaustObject:
	move.b	#$BE,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	BossExhaustRoutineTable(pc,d0.w),d0
	jsr	BossExhaustRoutineTable(pc,d0.w)
	lea	BossExhaustAnims,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

BossExhaustRoutineTable:
	dc.w	BossExhaustInit-*
	dc.w	BossExhaustFollowParent-BossExhaustRoutineTable

; ------------------------------------------------------------------------------

BossExhaustInit:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$2300,obj.sprite_tile(a0)
	move.l	#BossExhaustSprites,obj.sprite_data(a0)
	rts

; ------------------------------------------------------------------------------

BossExhaustFollowParent:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	addi.w	#$40,obj.y(a0)
	move.b	obj.var_35(a1),obj.anim_id(a0)
	bmi.s	BossExhaustDelete
	rts

; ------------------------------------------------------------------------------

BossExhaustDelete:
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BossSmokeObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	BossSmokeRoutineTable(pc,d0.w),d0
	jmp	BossSmokeRoutineTable(pc,d0.w)

; ------------------------------------------------------------------------------

BossSmokeRoutineTable:
	dc.w	BossSmokeInit-*
	dc.w	BossSmokeFollowParent-BossSmokeRoutineTable
	dc.w	BossSmokeStandalone-BossSmokeRoutineTable

; ------------------------------------------------------------------------------

BossSmokeInit:
	move.b	#4,obj.sprite_flags(a0)
	move.w	#$2300,obj.sprite_tile(a0)
	move.l	#BossSmokeSprites,obj.sprite_data(a0)
	tst.b	obj.anim_id(a0)
	beq.s	BossSmokeInitStandalone
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$C,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#2,obj.routine(a0)
	bra.s	BossSmokeFollowParent

; ------------------------------------------------------------------------------

BossSmokeInitStandalone:
	move.b	#2,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#4,obj.routine(a0)
	bra.s	BossSmokeStandalone

; ------------------------------------------------------------------------------

BossSmokeFollowParent:
	movea.w	obj.var_2e(a0),a1
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$1A4,obj.var_2a(a0)
	beq.s	BossSmokeDeleteAttached
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	subi.w	#$40,obj.y(a0)
	lea	BossSmokeAnims,a1
	jsr	AnimateObject
	cmpi.b	#7,obj.sprite_frame(a0)
	bge.s	BossSmokeStopDrawing
	bsr.w	BossSpawnExplosionDebris
	jmp	DrawObject

; ------------------------------------------------------------------------------

BossSmokeStopDrawing:
	rts

; ------------------------------------------------------------------------------

BossSmokeDeleteAttached:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BossSmokeStandalone:
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$18,obj.var_2a(a0)
	beq.s	BossSmokeDeleteStandalone
	bsr.w	BossIntegratePosition
	lea	BossSmokeAnims,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

BossSmokeDeleteStandalone:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

FallSpikeObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	FallSpikeRoutineTable(pc,d0.w),d0
	jmp	FallSpikeRoutineTable(pc,d0.w)

; ------------------------------------------------------------------------------

FallSpikeRoutineTable:
	dc.w	FallSpikeInit-*
	dc.w	FallSpikeDrop-FallSpikeRoutineTable
	dc.w	FallSpikeWait-FallSpikeRoutineTable

; ------------------------------------------------------------------------------

FallSpikeInit:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#4,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.w	#$2300,obj.sprite_tile(a0)
	move.l	#FallSpikeSprites,obj.sprite_data(a0)
	move.b	#$BF,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)

FallSpikeDrop:
	addi.l	#$38000,obj.y(a0)
	jsr	CheckBlockDown
	subq.w	#3,d1
	bgt.s	FallSpikeDraw
	sub.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)
	clr.b	obj.collide_type(a0)
	clr.b	obj.collide_status(a0)

FallSpikeDraw:
	jmp	DrawObject

; ------------------------------------------------------------------------------

FallSpikeWait:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#5,obj.var_2a(a0)
	bge.s	FallSpikeCheckCycle
	jmp	DrawObject

; ------------------------------------------------------------------------------

FallSpikeCheckCycle:
	cmpi.b	#$A,obj.var_2a(a0)
	beq.s	FallSpikeAdvanceCycle
	rts

; ------------------------------------------------------------------------------

FallSpikeAdvanceCycle:
	addq.b	#1,obj.var_2b(a0)
	cmpi.b	#7,obj.var_2b(a0)
	beq.s	FallSpikeDelete
	clr.b	obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

FallSpikeDelete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

FloorDebrisObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	FloorDebrisRoutineTable(pc,d0.w),d0
	jsr	FloorDebrisRoutineTable(pc,d0.w)
	jsr	DrawObject
	bra.w	BossDeleteFloorDebrisBelowStage

; ------------------------------------------------------------------------------

FloorDebrisRoutineTable:
	dc.w	FloorDebrisInit-*
	dc.w	FloorDebrisFall-FloorDebrisRoutineTable
	dc.w	FloorDebrisSettled-FloorDebrisRoutineTable

; ------------------------------------------------------------------------------

FloorDebrisInit:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$4440,obj.sprite_tile(a0)
	move.l	#DebrisSprites1,obj.sprite_data(a0)
	rts

; ------------------------------------------------------------------------------

FloorDebrisFall:
	lea	DebrisAnims,a1
	jsr	AnimateObject
	bsr.w	BossIntegrateVelocity
	jsr	CheckBlockDown
	subq.w	#1,d1
	bgt.s	FloorDebrisFallReturn
	sub.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)
	bsr.w	BossSpawnFloorDebrisBurst

FloorDebrisFallReturn:
	rts

; ------------------------------------------------------------------------------

FloorDebrisSettled:
	bsr.w	BossIntegrateVelocity
	rts

; ------------------------------------------------------------------------------

ElectricityObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	ElectricityRoutineTable(pc,d0.w),d0
	jmp	ElectricityRoutineTable(pc,d0.w)

; ------------------------------------------------------------------------------

ElectricityRoutineTable:
	dc.w	ElectricityInit-*
	dc.w	ElectricityAnimate-ElectricityRoutineTable

; ------------------------------------------------------------------------------

ElectricityInit:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$D0,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$4470,obj.sprite_tile(a0)
	move.l	#ElectricitySprites,obj.sprite_data(a0)

ElectricityAnimate:
	addq.b	#1,obj.var_2a(a0)
	moveq	#0,d0
	move.b	obj.var_2a(a0),d0
	subi.b	#$1E,d0
	bcs.s	ElectricityDraw
	divu.w	#3,d0
	cmpi.b	#5,d0
	beq.s	ElectricityDelete
	move.b	d0,obj.sprite_frame(a0)

ElectricityDraw:
	tst.b	obj.subtype(a0)
	beq.s	ElectricityDrawNormal
	bset	#0,obj.sprite_flags(a0)

ElectricityDrawNormal:
	jmp	DrawObject

; ------------------------------------------------------------------------------

ElectricityDelete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

FloorPieceObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	FloorPieceRoutineTable(pc,d0.w),d0
	jsr	FloorPieceRoutineTable(pc,d0.w)
	bsr.w	FloorPieceAdjustPlayerHeight
	jmp	DrawObject

; ------------------------------------------------------------------------------

FloorPieceRoutineTable:
	dc.w	FloorPieceInit-*
	dc.w	FloorPieceAnimate-FloorPieceRoutineTable
	dc.w	FloorPieceResting-FloorPieceRoutineTable

; ------------------------------------------------------------------------------

FloorPieceInit:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$E,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$440,obj.sprite_tile(a0)
	move.l	#FloorPieceSprites,obj.sprite_data(a0)
	moveq	#0,d0
	move.b	obj.subtype_2(a0),d0
	mulu.w	#$10,d0
	lea	FloorPieceMotionTable,a1
	adda.w	d0,a1
	move.l	a1,obj.var_34(a0)
	move.w	#0,obj.y_speed(a0)
	move.w	#$B,obj.var_32(a0)
	rts

; ------------------------------------------------------------------------------

FloorPieceMotionTable:
	dc.w	$690, $400
	dc.w	-$600, $B
	dc.w	$690, $400
	dc.w	-$600, $E
	dc.w	$490, $2E0
	dc.w	-$600, $B
	dc.w	$490, $2E0
	dc.w	-$600, $E
	dc.w	$290, $110
	dc.w	-$600, $B
	dc.w	$290, $110
	dc.w	-$600, $E

; ------------------------------------------------------------------------------

FloorPieceAnimate:
	bsr.w	BossIntegrateVelocity
	movea.l	obj.var_34(a0),a2
	move.w	obj.var_38(a0),d1
	move.w	(a2,d1.w),d0
	cmp.w	obj.y(a0),d0
	ble.s	FloorPieceLand
	move.w	2(a2,d1.w),d0
	cmp.w	obj.y(a0),d0
	bge.s	FloorPieceClampHeight
	rts

; ------------------------------------------------------------------------------

FloorPieceClampHeight:
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

FloorPieceLand:
	clr.w	obj.x_speed(a0)
	clr.w	obj.y_speed(a0)
	move.w	d0,obj.y(a0)
	move.b	#4,obj.routine(a0)
	move.w	#$B4,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	rts

; ------------------------------------------------------------------------------

FloorPieceResting:
	movea.w	obj.var_2e(a0),a1
	tst.b	$36(a1)
	bne.s	FloorPieceStartMotion
	rts

; ------------------------------------------------------------------------------

FloorPieceStartMotion:
	move.b	#2,obj.routine(a0)
	lea	player_object,a1
	move.w	obj.x(a0),d0
	sub.w	obj.x(a1),d0
	bge.s	FloorPieceSelectMotion
	neg.w	d0

FloorPieceSelectMotion:
	clr.w	obj.var_38(a0)
	cmpi.w	#$18,d0
	bge.s	FloorPieceLoadMotion
	move.w	#8,obj.var_38(a0)

FloorPieceLoadMotion:
	movea.l	obj.var_34(a0),a2
	move.w	obj.var_38(a0),d1
	move.w	4(a2,d1.w),d0
	move.w	d0,obj.y_speed(a0)
	move.w	6(a2,d1.w),d0
	move.w	d0,obj.var_32(a0)
	rts

; ------------------------------------------------------------------------------

FloorPieceAdjustPlayerHeight:
	tst.w	obj.y_speed(a0)
	bgt.s	FloorPieceAdjustPlayerUp
	beq.s	FloorPieceAdjustPlayerNeutral

FloorPieceAdjustPlayerUp:
	move.b	#4,obj.var_3c(a0)
	bra.s	FloorPieceApplyHeightOffset

; ------------------------------------------------------------------------------

FloorPieceAdjustPlayerDown:
	move.b	#$FC,obj.var_3c(a0)
	bra.s	FloorPieceApplyHeightOffset

; ------------------------------------------------------------------------------

FloorPieceAdjustPlayerNeutral:
	move.b	#0,obj.var_3c(a0)

FloorPieceApplyHeightOffset:
	move.b	obj.var_3c(a0),d0
	add.b	d0,obj.height(a0)
	lea	player_object,a1
	bsr.w	FloorPieceCheckPlayerCollision
	move.b	obj.var_3c(a0),d0
	sub.b	d0,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

FloorPieceCheckPlayerCollision:
	tst.b	obj.id(a1)
	beq.w	FloorPieceCheckPlayerCollisionReturn
	bsr.w	FloorPieceCheckPlayerOverlap
	bne.s	FloorPieceCheckPlayerCollisionReturn
	move.w	obj.y_speed(a1),obj.var_3a(a0)
	btst	#3,obj.flags(a1)
	beq.s	FloorPieceResolveCollision
	btst	#1,obj.flags(a1)
	bne.s	FloorPieceResolveCollision
	clr.w	obj.y_speed(a1)

FloorPieceResolveCollision:
	jsr	SolidObject
	bne.s	FloorPiecePushPlayer
	move.w	obj.var_3a(a0),obj.y_speed(a1)

FloorPieceCheckPlayerCollisionReturn:
	rts

; ------------------------------------------------------------------------------

FloorPiecePushPlayer:
	move.l	obj.y(a0),obj.y(a1)
	move.b	obj.height(a1),d0
	ext.w	d0
	addi.w	#$10,d0
	sub.w	d0,obj.y(a1)
	tst.w	obj.y_speed(a0)
	bge.s	FloorPieceStopPlayer
	move.w	obj.y_speed(a0),obj.y_speed(a1)
	rts

; ------------------------------------------------------------------------------

FloorPieceStopPlayer:
	clr.w	obj.y_speed(a1)
	rts

; ------------------------------------------------------------------------------

FloorPieceCheckPlayerOverlap:
	move.w	obj.x(a0),d1
	sub.w	obj.x(a1),d1
	bge.s	FloorPieceCheckVerticalOverlap
	neg.w	d1

FloorPieceCheckVerticalOverlap:
	cmpi.w	#$16,d1
	bgt.s	FloorPieceComparePlayerY
	cmpi.w	#$108,obj.y(a1)
	ble.s	FloorPieceBouncePlayer
	tst.w	obj.y_speed(a0)
	ble.s	FloorPieceComparePlayerY
	move.w	obj.y(a1),d1
	move.b	obj.height(a1),d0
	ext.w	d0
	sub.w	d0,d1
	sub.w	obj.y(a0),d1
	bmi.s	FloorPieceComparePlayerY
	cmpi.w	#$20,d1
	bgt.s	FloorPieceComparePlayerY
	bra.s	BossHurtPlayer

; ------------------------------------------------------------------------------

FloorPieceComparePlayerY:
	move.w	obj.y(a1),d0
	cmp.w	obj.y(a0),d0
	bge.s	FloorPiecePlayerAbove
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

FloorPiecePlayerAbove:
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

FloorPieceBouncePlayer:
	bsr.w	BossHurtPlayer
	move.w	#$200,obj.y_speed(a1)
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

BossHurtPlayer:
	btst	#7,obj.flags(a1)
	bne.s	BossHurtPlayerReturn
	movem.l	a0-a1,-(sp)
	movea.l	a0,a2
	movea.l	a1,a0
	movea.l	a2,a1
	jsr	CheckHurtPlayer
	movem.l	(sp)+,a0-a1
	cmpi.b	#$18,obj.anim_id(a1)
	bne.s	BossHurtPlayerReturn
	bset	#7,obj.flags(a1)

BossHurtPlayerReturn:
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

ConductorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	ConductorRoutineTable(pc,d0.w),d0
	jsr	ConductorRoutineTable(pc,d0.w)
	tst.b	obj.subtype(a0)
	bmi.s	ConductorDraw
	btst	#0,obj.subtype(a0)
	beq.w	*+4

ConductorSolidCollision:
	move.w	obj.var_36(a0),d0
	add.w	d0,obj.x(a0)
	move.w	obj.var_38(a0),d0
	add.w	d0,obj.y(a0)
	lea	player_object,a1
	jsr	SolidObject
	move.w	obj.var_36(a0),d0
	sub.w	d0,obj.x(a0)
	move.w	obj.var_38(a0),d0
	sub.w	d0,obj.y(a0)

ConductorDraw:
	jmp	DrawObject

; ------------------------------------------------------------------------------

ConductorRoutineTable:
	dc.w	ConductorInit-*
	dc.w	ConductorTrackPlayer-ConductorRoutineTable
	dc.w	ConductorClampPlayerRight-ConductorRoutineTable
	dc.w	ConductorClampPlayerLeft-ConductorRoutineTable
	dc.w	ConductorMoveVertical-ConductorRoutineTable
	dc.w	ConductorCheckPlayerDamage-ConductorRoutineTable

; ------------------------------------------------------------------------------

ConductorInit:
	move.b	#4,obj.sprite_flags(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.w	#$4458,obj.sprite_tile(a0)
	move.b	obj.subtype(a0),d0
	andi.b	#$F,d0
	move.b	d0,obj.sprite_frame(a0)
	tst.b	obj.subtype(a0)
	bmi.s	ConductorInitAlternate
	move.l	#ConductorSprites1,obj.sprite_data(a0)
	btst	#0,obj.subtype(a0)
	beq.s	ConductorInitLower
	move.w	#-$200,obj.y_speed(a0)
	move.b	#4,obj.routine(a0)
	move.w	#$A000,obj.var_34(a0)
	move.w	#$14,obj.var_36(a0)
	move.w	#-$1A,obj.var_38(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$50,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

ConductorInitLower:
	move.b	#8,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$200,obj.y_speed(a0)
	move.b	#2,obj.routine(a0)
	move.w	#$4000,obj.var_34(a0)
	move.w	#-$14,obj.var_36(a0)
	move.w	#-$A,obj.var_38(a0)
	rts

; ------------------------------------------------------------------------------

ConductorInitAlternate:
	move.b	#8,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.l	#ConductorSprites2,obj.sprite_data(a0)
	move.b	#$A,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

ConductorTrackPlayer:
	lea	player_object,a1
	bclr	#7,boss_flags
	bclr	#5,boss_flags
	cmpi.w	#$930,obj.x(a1)
	blt.s	ConductorCheckBossFlag6
	bset	#6,boss_flags

ConductorCheckBossFlag6:
	cmpi.w	#$9B0,obj.x(a1)
	blt.s	ConductorCheckBossFlag5
	bset	#5,boss_flags

ConductorCheckBossFlag5:
	cmpi.w	#$A60,obj.x(a1)
	bge.s	ConductorFinishTracking
	rts

; ------------------------------------------------------------------------------

ConductorFinishTracking:
	move.b	#8,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

ConductorMoveVertical:
	bsr.w	BossIntegratePosition
	move.w	obj.y_speed(a0),d0
	add.w	d0,obj.var_2a(a0)
	move.w	obj.var_34(a0),d0
	bmi.s	ConductorCheckVerticalReverse
	cmp.w	obj.var_2a(a0),d0
	ble.s	ConductorReverseVertical
	rts

; ------------------------------------------------------------------------------

ConductorReverseVertical:
	move.b	#6,obj.routine(a0)
	bra.s	ConductorSetCollisionSize

; ------------------------------------------------------------------------------

ConductorCheckVerticalReverse:
	cmp.w	obj.var_2a(a0),d0
	bge.s	ConductorSwitchToAlternate
	rts

; ------------------------------------------------------------------------------

ConductorSwitchToAlternate:
	move.b	#$A,obj.routine(a0)

ConductorSetCollisionSize:
	btst	#0,obj.subtype(a0)
	beq.w	ConductorSetLargeCollision
	move.b	#9,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

ConductorSetLargeCollision:
	move.b	#9,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

ConductorClampPlayerLeft:
	lea	player_object,a1
	bsr.w	ConductorClampLeftBound
	bra.s	ConductorCheckPlayerDamage

; ------------------------------------------------------------------------------

ConductorClampLeftBound:
	tst.b	obj.id(a1)
	beq.s	ConductorClampLeftBoundReturn
	cmpi.w	#$A00,obj.x(a1)
	bge.s	ConductorClampLeftBoundReturn
	move.w	#$A00,obj.x(a1)

ConductorClampLeftBoundReturn:
	rts

; ------------------------------------------------------------------------------

ConductorClampPlayerRight:
	lea	player_object,a1
	bsr.w	ConductorClampRightBound
	bra.s	ConductorCheckPlayerDamage

; ------------------------------------------------------------------------------

ConductorClampRightBound:
	tst.b	obj.id(a1)
	beq.s	ConductorClampRightBoundReturn
	cmpi.w	#$B80,obj.x(a1)
	ble.s	ConductorClampRightBoundReturn
	move.w	#$B80,obj.x(a1)

ConductorClampRightBoundReturn:
	rts

; ------------------------------------------------------------------------------

ConductorCheckPlayerDamage:
	moveq	#0,d0
	move.b	obj.subtype_2(a0),d0
	btst	d0,boss_started
	bne.s	ConductorCheckPlayerDistance
	rts

; ------------------------------------------------------------------------------

ConductorCheckPlayerDistance:
	lea	player_object,a1
	tst.b	obj.id(a1)
	beq.s	ConductorCheckPlayerDamageReturn
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	bge.s	ConductorCheckPlayerDistanceAbs
	neg.w	d0

ConductorCheckPlayerDistanceAbs:
	cmpi.w	#8,d0
	bge.s	ConductorCheckPlayerDamageReturn
	tst.w	obj.var_30(a1)
	bne.s	ConductorCheckPlayerDamageReturn
	cmpi.b	#6,obj.routine(a1)
	beq.s	ConductorCheckPlayerDamageReturn
	btst	#7,obj.flags(a1)
	bne.s	ConductorCheckPlayerDamageReturn
	bsr.w	BossHurtPlayer

ConductorCheckPlayerDamageReturn:
	rts

; ------------------------------------------------------------------------------

BossIntegrateVelocity:
	move.w	obj.var_30(a0),d0
	add.w	d0,obj.x_speed(a0)
	move.w	obj.var_32(a0),d0
	add.w	d0,obj.y_speed(a0)

BossIntegratePosition:
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	lsl.l	#8,d0
	add.l	d0,obj.x(a0)
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	lsl.l	#8,d0
	add.l	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

BossFindObjectById:
	lea	hud_score_object,a1
	moveq	#$7D,d1

BossFindObjectByIdCheck:
	cmp.b	obj.id(a1),d0
	bne.s	BossFindObjectByIdNext
	rts

; ------------------------------------------------------------------------------

BossFindObjectByIdNext:
	adda.w	#obj.struct_len,a1
	dbf	d1,BossFindObjectByIdCheck
	moveq	#$FFFFFFFF,d1
	rts

; ------------------------------------------------------------------------------

	lea	player_object,a1

; ------------------------------------------------------------------------------

BossSpikeSpawnXTable:
	dc.w	$A98
	dc.w	$AE8
	dc.w	$A48
	dc.w	$B38
	dc.w	$A30
	dc.w	$A78
	dc.w	$AF0
	dc.w	$B50
	dc.w	$B10
	dc.w	$B58
	dc.w	$A70
	dc.w	$A28

BossEggmanTargetYTable:
	dc.w	$58C
	dc.w	$38C
	dc.w	$18C

; ------------------------------------------------------------------------------

BossGetEggmanTargetY:
	moveq	#0,d0
	move.b	obj.var_2d(a0),d0
	subq.w	#1,d0
	add.w	d0,d0
	move.w	BossEggmanTargetYTable(pc,d0.w),d0
	rts

; ------------------------------------------------------------------------------

BossSpawnProjectileWave:
	divu.w	#$23,d0
	move.w	d0,d2
	swap	d0
	tst.w	d0
	bne.s	BossSpawnProjectileWaveReturn
	jsr	SpawnObject
	bne.s	BossSpawnProjectileWaveReturn
	movea.l	a1,a2
	move.w	a0,obj.var_2e(a2)
	move.b	#$38,obj.id(a2)
	bsr.s	BossGetEggmanTargetY
	move.w	d0,obj.y(a2)
	andi.l	#$FFFF,d2
	bne.s	BossSpawnProjectileSetSide
	lea	player_object,a1
	move.b	#0,obj.var_3d(a0)
	cmpi.w	#$AC0,obj.x(a1)
	bge.s	BossSpawnProjectileSetSide
	move.b	#1,obj.var_3d(a0)

BossSpawnProjectileSetSide:
	moveq	#0,d1
	move.w	#$20,d1
	tst.b	obj.var_3d(a0)
	beq.s	BossSpawnProjectileLeftSide
	move.w	#$A20,d0
	bra.s	BossSpawnProjectileStoreX

; ------------------------------------------------------------------------------

BossSpawnProjectileLeftSide:
	neg.w	d1
	move.w	#$B60,d0

BossSpawnProjectileStoreX:
	muls.w	d1,d2
	add.w	d2,d0
	move.w	d0,obj.x(a2)

BossSpawnProjectileWaveReturn:
	rts

; ------------------------------------------------------------------------------

BossSpawnSpikeWave:
	divu.w	#$14,d0
	move.w	d0,d2
	swap	d0
	tst.w	d0
	bne.s	BossSpawnSpikeWaveReturn
	cmpi.w	#4,d2
	bge.s	BossSpawnSpikeWaveReturn
	jsr	SpawnObject
	bne.s	BossSpawnSpikeWaveReturn
	move.b	d2,obj.subtype(a1)
	move.w	a0,obj.var_2e(a1)
	move.b	#$3D,obj.id(a1)
	bsr.w	BossGetEggmanTargetY
	move.w	d0,obj.y(a1)
	moveq	#0,d1
	move.b	obj.var_2d(a0),d1
	subq.w	#1,d1
	move.b	d1,obj.subtype_2(a1)
	mulu.w	#8,d1
	add.w	d2,d2
	add.w	d2,d1
	lea	BossSpikeSpawnXTable,a2
	move.w	(a2,d1.w),d0
	move.w	d0,obj.x(a1)

BossSpawnSpikeWaveReturn:
	rts

; ------------------------------------------------------------------------------

BossSpawnFallingProjectile:
	divu.w	#$10,d0
	swap	d0
	tst.w	d0
	bne.s	BossSpawnFallingProjectileReturn
	jsr	SpawnObject
	bne.s	BossSpawnFallingProjectileReturn
	move.w	a0,obj.var_2e(a1)
	move.b	#$39,obj.id(a1)
	bsr.w	BossGetEggmanTargetY
	move.w	d0,obj.y(a1)
	jsr	Random
	andi.l	#$FFFF,d0
	ext.l	d0
	move.l	d0,d1
	divs.w	#$50,d0
	swap	d0
	addi.w	#$AC0,d0
	move.w	d0,obj.x(a1)
	move.l	d1,d0
	divs.w	#$280,d0
	swap	d0
	move.w	d0,obj.x_speed(a1)
	move.w	#$100,obj.y_speed(a1)
	move.w	#8,obj.var_32(a1)
	move.w	d1,d0
	andi.w	#$F,d0
	add.w	d0,obj.var_32(a1)

BossSpawnFallingProjectileReturn:
	rts

; ------------------------------------------------------------------------------


BossSpawnFloorDebrisBurst:
	lea	BossFloorDebrisMotionTable,a2
	moveq	#3,d2
	movea.l	a0,a1
	bra.s	BossInitFloorDebrisPiece

; ------------------------------------------------------------------------------

BossSpawnFloorDebrisPiece:
	jsr	SpawnObject
	bne.s	BossSpawnFloorDebrisReturn
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.routine(a0),obj.routine(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	move.b	obj.width_2(a0),obj.width_2(a1)
	move.b	obj.height(a0),obj.height(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)


BossInitFloorDebrisPiece:
	move.l	#DebrisSprites2,obj.sprite_data(a1)
	move.b	d2,obj.sprite_frame(a1)
	move.w	(a2)+,obj.x_speed(a1)
	move.w	(a2)+,obj.y_speed(a1)
	move.w	(a2)+,obj.var_30(a1)
	move.w	(a2)+,obj.var_32(a1)
	dbf	d2,BossSpawnFloorDebrisPiece

BossSpawnFloorDebrisReturn:
	rts

; ------------------------------------------------------------------------------

BossFloorDebrisMotionTable:
	dc.w	$200, -$1C0, 0, $30
	dc.w	-$200, -$1C0, 0, $30
	dc.w	$100, -$280, 0, $30
	dc.w	-$100, -$280, 0, $30

; ------------------------------------------------------------------------------

BossSpawnSpikePair:
	add.w	d0,d0
	move.w	BossSpikeYTable(pc,d0.w),d3
	move.w	#$A10,d2
	moveq	#0,d4
	bsr.w	BossSpawnSpike
	move.w	#$B70,d2
	moveq	#1,d4

; ------------------------------------------------------------------------------

BossSpawnSpike:
	jsr	SpawnObject
	bne.s	BossSpawnSpikeReturn
	move.b	#$40,obj.id(a1)
	move.w	d2,obj.x(a1)
	move.w	d3,obj.y(a1)
	move.b	d4,obj.subtype(a1)

BossSpawnSpikeReturn:
	rts

; ------------------------------------------------------------------------------

BossSpikeYTable:
	dc.w	$688
	dc.w	$488
	dc.w	$288

; ------------------------------------------------------------------------------

BossSpawnExplosion:
	jsr	SpawnObject
	bne.s	BossSpawnExplosionReturn
	move.w	#$9E,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	move.b	#$3F,obj.id(a1)
	move.b	#1,obj.anim_id(a1)
	move.w	a0,obj.var_2e(a1)

BossSpawnExplosionReturn:
	rts

; ------------------------------------------------------------------------------

BossSpawnExplosionDebris:
	jsr	SpawnObject
	bne.s	BossSpawnExplosionDebrisReturn
	move.w	#$9E,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	move.b	#$3F,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subq.w	#8,obj.y(a1)
	jsr	Random
	move.l	d0,d1
	andi.l	#$FFFF,d0
	ext.l	d0
	swap	d1
	andi.l	#$7FFF,d1
	neg.l	d1
	divs.w	#$400,d0
	swap	d0
	move.w	d0,obj.x_speed(a1)
	divs.w	#$400,d1
	swap	d1
	move.w	d1,obj.y_speed(a1)

BossSpawnExplosionDebrisReturn:
	rts

; ------------------------------------------------------------------------------

BossSpawnEggmanChildren:
	jsr	SpawnObject
	bne.s	BossSpawnEggmanChildrenReturn
	move.w	a0,obj.var_2e(a1)
	move.b	#$35,obj.id(a1)
	move.w	a1,obj.var_2e(a0)
	jsr	SpawnObject
	bne.s	BossSpawnEggmanChildrenReturn
	move.w	a0,obj.var_2e(a1)
	move.b	#$36,obj.id(a1)
	jsr	SpawnObject
	bne.s	BossSpawnEggmanChildrenReturn
	move.w	a0,obj.var_2e(a1)
	move.b	#$37,obj.id(a1)

BossSpawnEggmanChildrenReturn:
	rts

; ------------------------------------------------------------------------------

BossDeleteFloorDebrisBelowStage:
	cmpi.w	#$6F0,obj.y(a0)
	bgt.s	BossDeleteFloorDebris
	rts

; ------------------------------------------------------------------------------

BossDeleteFloorDebris:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BossGetPlayerVerticalBand:
	lea	player_object,a1
	cmpi.w	#$298,obj.y(a1)
	ble.s	BossGetPlayerVerticalBandLow
	cmpi.w	#$498,obj.y(a1)
	ble.s	BossGetPlayerVerticalBandMiddle
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

BossGetPlayerVerticalBandMiddle:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

BossGetPlayerVerticalBandLow:
	moveq	#2,d0
	rts

; ------------------------------------------------------------------------------

BossGetPlayerBossBand:
	lea	player_object,a1
	cmpi.w	#$360,obj.y(a1)
	ble.s	BossGetPlayerBossBandHigh
	cmpi.w	#$560,obj.y(a1)
	ble.s	BossGetPlayerBossBandMiddle
	moveq	#5,d0
	rts

; ------------------------------------------------------------------------------

BossGetPlayerBossBandMiddle:
	moveq	#6,d0
	rts

; ------------------------------------------------------------------------------

BossGetPlayerBossBandHigh:
	moveq	#7,d0
	rts

; ------------------------------------------------------------------------------

BossUpdateBottomBound:
	tst.b	obj.var_38(a0)
	beq.s	BossUpdateBottomBoundReturn
	subq.b	#1,obj.var_38(a0)
	move.w	#$FFFE,d0
	btst	#0,obj.var_38(a0)
	beq.s	BossUpdateBottomBoundDirection
	neg.w	d0
	move.w	#$FFFC,d0

BossUpdateBottomBoundDirection:
	add.w	d0,bottom_bound
	add.w	d0,target_bottom_bound

BossUpdateBottomBoundReturn:
	rts

; ------------------------------------------------------------------------------

BossSetPaletteCycleSlow:
	move.b	#$80,d1
	bra.s	BossFillPaletteCycleTimers

; ------------------------------------------------------------------------------

BossSetPaletteCycleClear:
	move.b	#0,d1

BossFillPaletteCycleTimers:
	lea	palette_cycle_timers,a5
	moveq	#5,d0

BossFillPaletteCycleTimerLoop:
	move.b	d1,(a5)+
	dbf	d0,BossFillPaletteCycleTimerLoop
	rts

; ------------------------------------------------------------------------------

EggmanAnims:
	include	"anims/r6/eggman.asm"
	even

EggmanSprites:
	include	"sprites/r6/eggman.asm"
	even

BossMachineSprites:
	include	"sprites/r6/boss_machine.asm"
	even

BossSpikesAnim:
	include	"anims/r6/boss_spikes.asm"
	even

BossSpikesSprites:
	include	"sprites/r6/boss_spikes.asm"
	even

BossExhaustAnims:
	include	"anims/r6/boss_exhaust.asm"
	even

BossExhaustSprites:
	include	"sprites/r6/boss_exhaust.asm"
	even

FallSpikeSprites:
	include	"sprites/r6/fall_spike.asm"
	even

BossSmokeAnims:
	include	"anims/r6/boss_smoke.asm"
	even

BossSmokeSprites:
	include	"sprites/r6/boss_smoke.asm"
	even

ConductorSprites2:
	include	"sprites/r6/conductor_2.asm"
	even

ConductorSprites1:
	include	"sprites/r6/conductor_1.asm"
	even

DebrisAnims:
	include	"anims/r6/debris.asm"
	even

DebrisSprites1:
	include	"sprites/r6/debris_1.asm"
	even

DebrisSprites2:
	include	"sprites/r6/debris_2.asm"
	even

FloorPieceSprites:
	include	"sprites/r6/floor_piece.asm"
	even

ElectricityAnims:
	; This is unused, see note inside file for more information
	include	"anims/r6/electricity.asm"
	even

ElectricitySprites:
	include	"sprites/r6/electricity.asm"
	even

; ------------------------------------------------------------------------------
