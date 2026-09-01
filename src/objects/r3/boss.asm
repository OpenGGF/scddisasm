; ------------------------------------------------------------------------------

entry_barrier.retract_timer	equ obj.var_2a	; Delay before retract animation
entry_barrier.flags		equ obj.var_2c	; Bit 1: boss triggered; bit 2: struck
entry_barrier.target_y		equ obj.var_2e	; Raised Y position
entry_barrier.y_speed		equ obj.var_30	; 16.16 vertical speed
entry_barrier.link		equ obj.var_34	; Linked barrier object slot
encounter.flags			equ obj.var_2c	; Shared arena actor state flags
encounter.link			equ obj.var_34	; Linked arena actor object slot
encounter.sequence_timer	equ obj.var_3e	; Explosion sequence frame counter
boss.flash_timer		equ obj.var_2b	; Palette-flash countdown and phase bit
boss.flags			equ obj.var_2c	; Movement/draw and encounter flags
boss.target_y			equ obj.var_2e	; Target or last tracked Y position
boss.y_speed			equ obj.var_30	; 16.16 vertical speed
boss.gear_link			equ obj.var_34	; Linked gear object slot
boss.eggman_link		equ obj.var_36	; Linked Eggman object slot
boss.attack_count		equ obj.var_3a	; Number of arena attacks started
boss.phase			equ obj.var_3b	; Encounter substate and camera-lock phase
boss.timer			equ obj.var_3e	; Hit/recovery and exit timer
boss.rise_counter		equ obj.var_2a	; Defeat-rise sprite delay
boss_child.parent_link		equ obj.var_34	; Parent boss object slot
eggman.target			equ obj.var_2e	; Initial Y, then escape target X
eggman.y_speed			equ obj.var_30	; 16.16 vertical speed
eggman.parent_link		equ obj.var_34	; Parent boss object slot
gear.flags			equ obj.var_2c	; Bit 0: encounter finished
gear.parent_link		equ obj.var_34	; Parent boss object slot
bomb_launcher.fire_timer	equ obj.var_2a	; Frames until the next bomb launch
bomb_launcher.parent_link	equ obj.var_34	; Parent boss object slot
bomb.lifetime			equ obj.var_2a	; Frames before automatic detonation
bomb.x_acceleration		equ obj.var_38	; Horizontal acceleration
bomb.y_acceleration		equ obj.var_3a	; Vertical acceleration
bomb.terminal_y_speed		equ obj.var_3c	; Signed vertical speed limit

; The two barriers link to each other through 16-bit object-slot addresses.
; A collision retracts a barrier; crossing the arena threshold starts the boss.

EntryBarrierObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	EntryBarrier_Routines(pc,d0.w),d0
	jmp	EntryBarrier_Routines(pc,d0.w)

; ------------------------------------------------------------------------------

EntryBarrier_Routines:
	dc.w	EntryBarrier_Init-*
	dc.w	EntryBarrier_Main-EntryBarrier_Routines
	dc.w	EntryBarrier_Retract-EntryBarrier_Routines
	dc.w	EntryBarrier_BossActive-EntryBarrier_Routines

; ------------------------------------------------------------------------------

EntryBarrier_Init:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$30,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#EntryBarrierSprites,obj.sprite_data(a0)
	move.l	#-$28000,entry_barrier.y_speed(a0)
	move.w	obj.y(a0),entry_barrier.target_y(a0)
	addi.w	#-$30,entry_barrier.target_y(a0)
	move.b	#$3E,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	bsr.w	SpawnObject
	bne.s	EntryBarrier_Main
	move.w	a0,entry_barrier.link(a1)
	move.b	#$32,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	subi.w	#$30,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	a1,entry_barrier.link(a0)

EntryBarrier_Main:
	tst.b	obj.collide_type(a0)
	bne.s	.Draw
	move.w	#$AC,d0
	jsr	PlayFmSound
	move.b	#4,obj.routine(a0)
	bset	#2,entry_barrier.flags(a0)
	move.b	#1,obj.anim_id(a0)
	clr.b	obj.collide_status(a0)

.Draw:
	jmp	DrawObject

; ------------------------------------------------------------------------------

EntryBarrier_Retract:
	bsr.w	EntryBarrier_CheckBossTrigger
	addq.b	#1,entry_barrier.retract_timer(a0)
	cmpi.b	#$10,entry_barrier.retract_timer(a0)
	blt.s	.MoveUp
	move.b	#0,obj.anim_id(a0)
	lea	EntryBarrierAnims,a1
	jsr	AnimateObject

.MoveUp:
	move.l	entry_barrier.y_speed(a0),d0
	add.l	d0,obj.y(a0)
	move.w	entry_barrier.target_y(a0),d0
	cmp.w	obj.y(a0),d0
	blt.s	.Draw
	bclr	#2,entry_barrier.flags(a0)
	move.w	d0,obj.y(a0)
	move.b	#6,obj.routine(a0)

.Draw:
	jmp	DrawObject

; ------------------------------------------------------------------------------

EntryBarrier_BossActive:
	bsr.w	EntryBarrier_CheckBossTrigger
	cmpi.w	#$78,encounter.sequence_timer(a0)
	bge.s	.CheckRemoval
	bsr.w	BossArena_UpdateDefeatExplosions
	jsr	DrawObject

.CheckRemoval:
	btst	#1,entry_barrier.flags(a0)
	beq.s	.End
	movea.w	entry_barrier.link(a0),a3
	jsr	DeleteObject
	movea.l	a3,a1
	jmp	DeleteOtherObject

; ------------------------------------------------------------------------------

.End:
	rts

; ------------------------------------------------------------------------------

EntryBarrier_CheckBossTrigger:
	btst	#1,entry_barrier.flags(a0)
	bne.w	.End
	lea	player_object,a1
	cmpi.w	#$480,obj.x(a1)
	blt.s	.End
	cmpi.w	#$51C,obj.y(a1)
	bgt.s	.End
	bset	#1,entry_barrier.flags(a0)
	move.w	#$67,d0
	jsr	SubCpuCommand
	bsr.w	SpawnObject
	bne.s	.End
	move.b	#$3F,obj.id(a1)
	move.b	#6,obj.routine(a1)
	move.w	#$420,obj.x(a1)
	move.w	#$540,obj.y(a1)

.End:
	rts

; ------------------------------------------------------------------------------

BossMachine_UpdateDamageFlash:
	tst.b	boss.flash_timer(a0)
	bne.s	.Flash
	rts

; ------------------------------------------------------------------------------

.Flash:
	bchg	#7,boss.flash_timer(a0)
	bne.s	.UseNormalPalette
	move.w	#5,d0
	ori.b	#1,obj.sprite_frame(a0)
	bra.s	.LoadPalette

; ------------------------------------------------------------------------------

.UseNormalPalette:
	move.w	#6,d0
	andi.b	#$FE,obj.sprite_frame(a0)

.LoadPalette:
	subq.b	#1,boss.flash_timer(a0)
	movem.l	d7/a1-a3,-(sp)
	jsr	LoadPalette
	movem.l	(sp)+,d7/a1-a3
	rts

; ------------------------------------------------------------------------------

BossMachineObject:
	tst.b	boss.phase(a0)
	beq.s	.RunState
	cmpi.w	#$B0,scroll_focus_y
	bge.s	.LockCamera
	addq.w	#6,scroll_focus_y
	cmpi.w	#$B2,scroll_focus_y
	bge.s	.LockCamera
	bra.s	.RunState

; ------------------------------------------------------------------------------

.LockCamera:
	move.w	#$B2,scroll_focus_y

.RunState:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	BossMachine_Routines(pc,d0.w),d0
	jsr	BossMachine_Routines(pc,d0.w)
	btst	#0,boss.flags(a0)
	beq.s	.Draw
	rts

; ------------------------------------------------------------------------------

.Draw:
	bsr.s	BossMachine_UpdateDamageFlash
	jmp	DrawObject

; ------------------------------------------------------------------------------

BossMachine_Routines:
	dc.w	BossMachine_Init-*
	dc.w	BossMachine_TrackPlayer-BossMachine_Routines
	dc.w	BossMachine_Combat-BossMachine_Routines
	dc.w	BossMachine_HitReaction-BossMachine_Routines
	dc.w	BossMachine_DefeatedRise-BossMachine_Routines
	dc.w	BossMachine_WaitForExit-BossMachine_Routines

; ------------------------------------------------------------------------------

BossMachine_Init:
	movem.l	d7/a1-a3,-(sp)
	move.w	#6,d0
	jsr	LoadPalette
	movem.l	(sp)+,d7/a1-a3
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$50,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#BossMachineSprites,obj.sprite_data(a0)
	bsr.w	SpawnObjectAfter
	bne.w	.End
	move.w	a1,boss.eggman_link(a0)
	move.w	a0,boss_child.parent_link(a1)
	move.b	#$33,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$30,obj.y(a1)
	bsr.w	SpawnObjectAfter
	bne.w	.End
	move.w	a0,boss_child.parent_link(a1)
	move.w	a1,boss.gear_link(a0)
	move.b	#$32,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	subi.w	#$40,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	bsr.w	SpawnObjectAfter
	bne.s	.End
	move.w	a0,boss_child.parent_link(a1)
	move.b	#$3D,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)

.End:
	rts

; ------------------------------------------------------------------------------

BossMachine_TrackPlayer:
	movea.w	boss.gear_link(a0),a1
	move.b	#1,$1C(a1)
	lea	player_object,a1
	move.w	#$1C0,d1
	move.w	#$DC,d2
	move.w	obj.y(a1),d0
	cmp.w	d0,d1
	ble.s	.StartFight
	cmp.w	d0,d2
	bgt.s	.ClampTop

.ApplyY:
	cmp.w	boss.target_y(a0),d0
	bne.s	.SetMoving
	bclr	#2,boss.flags(a0)
	bra.s	.StoreY

; ------------------------------------------------------------------------------

.SetMoving:
	bset	#2,boss.flags(a0)

.StoreY:
	move.w	d0,boss.target_y(a0)
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

.ClampTop:
	move.w	d2,d0
	bra.s	.ApplyY

; ------------------------------------------------------------------------------

.StartFight:
	move.w	d1,obj.y(a0)
	bclr	#2,boss.flags(a0)
	move.b	#4,obj.routine(a0)
	move.l	#-$28000,boss.y_speed(a0)
	move.w	obj.y(a0),boss.target_y(a0)
	addi.w	#-$48,boss.target_y(a0)
	move.b	#$3F,obj.collide_type(a0)
	move.b	#4,obj.collide_status(a0)
	movea.w	boss.gear_link(a0),a1
	move.b	#0,$1C(a1)
	rts

; ------------------------------------------------------------------------------

BossMachine_CanSpawnExitBarrier:
	cmpi.b	#4,boss.attack_count(a0)
	bge.w	.No
	moveq	#0,d0
	move.b	boss.attack_count(a0),d0
	add.b	d0,d0
	move.w	BossMachine_PlayerYThresholds(pc,d0.w),d0
	move.w	player_object+obj.y,d1
	cmp.w	d0,d1
	bgt.s	.No
	cmpi.w	#$80,d1
	blt.s	.No
	move.w	player_object+obj.x,d1
	cmpi.w	#$340,d1
	blt.s	.No
	cmpi.w	#$3C0,d1
	bgt.s	.No
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

.No:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

; Maximum player Y for each of the four successively higher barriers.
BossMachine_PlayerYThresholds:
	dc.w	$1F0
	dc.w	$1A8
	dc.w	$160
	dc.w	$110

; ------------------------------------------------------------------------------

BossMachine_Combat:
	bsr.s	BossMachine_CanSpawnExitBarrier
	bne.s	.CheckHit
	bsr.w	BossMachine_SpawnExitBarrier

.CheckHit:
	tst.b	obj.collide_type(a0)
	bne.s	.End
	bra.w	BossMachine_HandleHit

; ------------------------------------------------------------------------------

.End:
	rts

; ------------------------------------------------------------------------------

BossMachine_SpawnExitBarrier:
	bsr.w	SpawnObject
	bne.s	.End
	move.b	#$3F,obj.id(a1)
	move.w	#$380,obj.x(a1)
	moveq	#0,d0
	move.b	boss.attack_count(a0),d0
	addq.b	#1,boss.attack_count(a0)
	add.b	d0,d0
	move.w	BossMachine_ExitBarrierYPositions(pc,d0.w),d0
	move.w	d0,obj.y(a1)

.End:
	rts

; ------------------------------------------------------------------------------

; Spawn Y for the four barriers, moving upward through the arena.
BossMachine_ExitBarrierYPositions:
	dc.w	$210
	dc.w	$1C8
	dc.w	$180
	dc.w	$130

; ------------------------------------------------------------------------------

BossMachine_HandleHit:
	moveq	#0,d0
	move.b	boss.phase(a0),d0
	addq.b	#1,boss.phase(a0)
	add.w	d0,d0
	move.w	BossMachine_HitPhases(pc,d0.w),d0
	jmp	BossMachine_HitPhases(pc,d0.w)

; ------------------------------------------------------------------------------

BossMachine_HitPhases:
	dc.w	BossMachine_HitPhase_LoadArt-*
	dc.w	BossMachine_HitPhase_RaiseUpperChild-BossMachine_HitPhases
	dc.w	BossMachine_HitPhase_Defeated-BossMachine_HitPhases

; ------------------------------------------------------------------------------

BossMachine_HitPhase_LoadArt:
	moveq	#4,d0
	jsr	AddGfxQueue
	bra.w	*+4			; Word-sized fall-through into the next hit phase

; ------------------------------------------------------------------------------

BossMachine_HitPhase_RaiseUpperChild:
	movea.w	boss.eggman_link(a0),a1
	move.b	#4,obj.routine(a1)
	move.b	#1,obj.anim_id(a1)
	move.l	#-$58000,obj.var_30(a1)
	bra.w	BossMachine_StartHitReaction

; ------------------------------------------------------------------------------

BossMachine_HitPhase_Defeated:
	move.b	#4,obj.sprite_frame(a0)
	movea.w	boss.eggman_link(a0),a1
	move.b	#6,obj.routine(a1)
	clr.b	obj.var_2a(a1)
	move.w	obj.y(a0),obj.var_2e(a1)
	addi.w	#-$40,obj.var_2e(a1)
	move.b	#2,obj.sprite_frame(a0)
	move.w	#$3FC,obj.sprite_tile(a1)
	move.w	#$300,obj.anim_id(a1)

BossMachine_StartHitReaction:
	move.w	#$AC,d0
	jsr	PlayFmSound
	clr.w	boss.timer(a0)
	move.b	#6,obj.routine(a0)
	move.b	#$10,boss.flash_timer(a0)
	cmpi.b	#1,obj.collide_status(a0)
	beq.s	BossMachine_Defeated
	bra.w	BossMachine_HitReaction

; ------------------------------------------------------------------------------

BossMachine_Defeated:
	moveq	#100,d0
	jsr	AddPoints(pc)
	clr.b	obj.collide_type(a0)
	move.w	obj.y(a0),boss.target_y(a0)
	addi.w	#-$70,boss.target_y(a0)
	move.w	#$14,d0
	tst.b	good_future
	beq.s	.SendCommand
	move.w	#$13,d0

.SendCommand:
	jsr	SubCpuCommand
	bra.w	BossMachine_HitReaction

; ------------------------------------------------------------------------------

BossMachine_TrySpawnFinalBarrier:
	cmpi.b	#3,boss.attack_count(a0)
	bne.s	.End
	bsr.w	BossMachine_CanSpawnExitBarrier
	bne.s	.End
	move.b	#3,boss_flags
	bsr.w	BossMachine_SpawnExitBarrier

.End:
	rts

; ------------------------------------------------------------------------------

BossMachine_HitReaction:
	moveq	#0,d0
	move.b	boss.phase(a0),d0
	subq.w	#1,d0
	add.b	d0,d0
	move.w	BossMachine_HitReactionPhases(pc,d0.w),d0
	jsr	BossMachine_HitReactionPhases(pc,d0.w)
	bra.s	BossMachine_MoveToTarget

; ------------------------------------------------------------------------------

BossMachine_HitReactionPhases:
	dc.w	BossMachine_SpawnLowerHitExplosions-*
	dc.w	BossMachine_SpawnUpperHitExplosions-BossMachine_HitReactionPhases
	dc.w	BossMachine_SpawnDefeatHitExplosions-BossMachine_HitReactionPhases

; ------------------------------------------------------------------------------

BossMachine_MoveToTarget:
	bset	#2,boss.flags(a0)
	bsr.s	BossMachine_TrySpawnFinalBarrier
	move.l	boss.y_speed(a0),d0
	add.l	d0,obj.y(a0)
	move.w	boss.target_y(a0),d0
	cmp.w	obj.y(a0),d0
	blt.s	.End
	bclr	#2,boss.flags(a0)
	move.w	d0,obj.y(a0)
	cmpi.b	#1,obj.collide_status(a0)
	beq.s	.BeginDefeatRise
	clr.b	boss.rise_counter(a0)
	move.b	#$3F,obj.collide_type(a0)
	move.b	#4,obj.routine(a0)
	move.w	obj.y(a0),boss.target_y(a0)
	addi.w	#-$48,boss.target_y(a0)
	bra.s	.End

; ------------------------------------------------------------------------------

.BeginDefeatRise:
	jsr	LoadCapsulePalette(pc)
	clr.b	boss.rise_counter(a0)
	move.b	#8,obj.routine(a0)
	move.w	obj.y(a0),boss.target_y(a0)
	addi.w	#-$10,boss.target_y(a0)

.End:
	rts

; ------------------------------------------------------------------------------

BossMachine_DefeatedRise:
	bsr.w	BossArena_UpdateDefeatExplosions
	bsr.w	BossMachine_TrySpawnFinalBarrier
	addq.b	#1,boss.rise_counter(a0)
	cmpi.b	#4,boss.rise_counter(a0)
	bne.s	.Move
	move.b	#6,obj.sprite_frame(a0)

.Move:
	move.l	boss.y_speed(a0),d0
	add.l	d0,obj.y(a0)
	move.w	boss.target_y(a0),d0
	cmp.w	obj.y(a0),d0
	blt.s	.End
	move.b	#$A,obj.routine(a0)

.End:
	rts

; ------------------------------------------------------------------------------

BossMachine_WaitForExit:
	bsr.w	BossArena_UpdateDefeatExplosions
	bsr.w	BossMachine_TrySpawnFinalBarrier
	btst	#0,boss.flags(a0)
	beq.s	.End
	cmpi.b	#4,boss.attack_count(a0)
	beq.s	BossMachine_ExitEncounter

.End:
	rts

; ------------------------------------------------------------------------------

BossMachine_ExitEncounter:
	movea.w	boss.gear_link(a0),a3
	jsr	DeleteObject
	movea.l	a3,a1
	addq.l	#4,sp
	jmp	DeleteOtherObject

; ------------------------------------------------------------------------------

BossArena_UpdateDefeatExplosions:
	addq.w	#1,encounter.sequence_timer(a0)
	cmpi.w	#$78,encounter.sequence_timer(a0)
	beq.s	.EnableExit
	bcc.s	.End
	lea	BossArena_DefeatExplosionPattern(pc),a2
	bra.w	BossArena_SpawnTimedExplosion

; ------------------------------------------------------------------------------

.EnableExit:
	bset	#0,encounter.flags(a0)
	movea.w	encounter.link(a0),a1
	bset	#0,encounter.flags(a1)

.End:
	rts

; ------------------------------------------------------------------------------

; Both barriers and the boss use this sequence. Each pattern begins with an
; interval and position count, followed by signed X/Y offsets selected
; cyclically from the arena actor's sequence timer.
BossArena_DefeatExplosionPattern:
	dc.w	4, $A
	dc.w	-$30, -$10
	dc.w	$30, $10
	dc.w	-$10, -$10
	dc.w	$10, $10
	dc.w	-$20, 0
	dc.w	$30, -$10
	dc.w	-$30, $10
	dc.w	-$10, $10
	dc.w	$10, -$10
	dc.w	$20, 0

; ------------------------------------------------------------------------------

BossMachine_SpawnLowerHitExplosions:
	addq.w	#1,boss.timer(a0)
	cmpi.w	#4,boss.timer(a0)
	bcc.s	.End
	lea	BossMachine_LowerHitExplosionPattern(pc),a2
	bra.w	BossArena_SpawnTimedExplosion

; ------------------------------------------------------------------------------

.End:
	rts

; ------------------------------------------------------------------------------

BossMachine_LowerHitExplosionPattern:
	dc.w	1, 3
	dc.w	0, 0
	dc.w	-$20, 0
	dc.w	$20, 0

; ------------------------------------------------------------------------------

BossMachine_SpawnUpperHitExplosions:
	addq.w	#1,boss.timer(a0)
	cmpi.w	#4,boss.timer(a0)
	bcc.s	.End
	lea	BossMachine_UpperHitExplosionPattern(pc),a2
	bra.w	BossArena_SpawnTimedExplosion

; ------------------------------------------------------------------------------

.End:
	rts

; ------------------------------------------------------------------------------

BossMachine_UpperHitExplosionPattern:
	dc.w	1, 3
	dc.w	0, -$38
	dc.w	-$20, -$38
	dc.w	$20, -$38

; ------------------------------------------------------------------------------

BossMachine_SpawnDefeatHitExplosions:
	addq.w	#1,boss.timer(a0)
	cmpi.w	#3,boss.timer(a0)
	bcc.s	.End
	lea	BossMachine_DefeatHitExplosionPattern(pc),a2
	bra.w	BossArena_SpawnTimedExplosion

; ------------------------------------------------------------------------------

.End:
	rts

; ------------------------------------------------------------------------------

BossMachine_DefeatHitExplosionPattern:
	dc.w	1, 2
	dc.w	-$10, -$38
	dc.w	$10, -$38

; ------------------------------------------------------------------------------

BossArena_SpawnTimedExplosion:
	moveq	#0,d2
	moveq	#0,d0
	move.w	encounter.sequence_timer(a0),d2
	move.w	(a2)+,d0
	divu.w	d0,d2
	move.l	d2,d0
	swap	d0
	tst.w	d0
	bne.s	.End
	andi.l	#$FFFF,d2
	moveq	#0,d0
	move.w	(a2)+,d0
	divu.w	d0,d2
	swap	d2
	add.w	d2,d2
	add.w	d2,d2
	bsr.w	SpawnObject
	bne.s	.End
	adda.w	d2,a2
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	(a2)+,d0
	add.w	d0,obj.x(a1)
	move.w	(a2),d0
	add.w	d0,obj.y(a1)
	move.b	#$3E,obj.id(a1)
	move.b	#$A,obj.routine(a1)
	move.w	#$9E,d0
	jsr	PlayFmSound

.End:
	rts

; ------------------------------------------------------------------------------

EggmanObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	Eggman_Routines(pc,d0.w),d0
	jsr	Eggman_Routines(pc,d0.w)
	tst.b	obj.sprite_flags(a0)
	bpl.s	.Draw
	lea	EggmanAnims,a1
	jsr	AnimateObject

.Draw:
	jmp	DrawObject

; ------------------------------------------------------------------------------

Eggman_Routines:
	dc.w	Eggman_Init-*
	dc.w	Eggman_FollowBoss-Eggman_Routines
	dc.w	Eggman_ReboundToBoss-Eggman_Routines
	dc.w	Eggman_EscapeUp-Eggman_Routines
	dc.w	Eggman_EscapeRight-Eggman_Routines

; ------------------------------------------------------------------------------

Eggman_Init:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#6,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#EggmanSprites,obj.sprite_data(a0)
	move.w	obj.y(a0),eggman.target(a0)

Eggman_FollowBoss:
	movea.w	eggman.parent_link(a0),a1
	move.w	obj.y(a1),obj.y(a0)
	rts

; ------------------------------------------------------------------------------

Eggman_ReboundToBoss:
	move.l	eggman.y_speed(a0),d0
	add.l	d0,obj.y(a0)
	addi.l	#$3000,eggman.y_speed(a0)
	movea.w	eggman.parent_link(a0),a1
	move.w	obj.y(a1),d0
	cmp.w	obj.y(a0),d0
	bgt.s	.End
	move.w	d0,obj.y(a0)
	move.b	#2,obj.routine(a0)
	cmpi.b	#2,boss.phase(a1)
	beq.s	.PrepareFinalPhase
	move.w	#1,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

.PrepareFinalPhase:
	move.b	#2,obj.sprite_frame(a1)
	move.w	#$3FC,obj.sprite_tile(a0)
	move.w	#$300,obj.anim_id(a0)

.End:
	rts

; ------------------------------------------------------------------------------

Eggman_EscapeUp:
	addi.l	#-$40000,obj.y(a0)
	move.w	eggman.target(a0),d0
	cmp.w	obj.y(a0),d0
	blt.s	.End
	move.w	#$400,obj.anim_id(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	d0,obj.y(a0)
	move.b	#8,obj.routine(a0)
	move.w	obj.x(a0),eggman.target(a0)
	addi.w	#$230,eggman.target(a0)

.End:
	rts

; ------------------------------------------------------------------------------

Eggman_EscapeRight:
	addi.l	#$40000,obj.x(a0)
	move.w	eggman.target(a0),d0
	cmp.w	obj.x(a0),d0
	bgt.s	.End
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

.End:
	rts

; ------------------------------------------------------------------------------

GearObject:
	tst.b	obj.routine(a0)
	bne.s	.FollowBoss
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#GearSprites,obj.sprite_data(a0)

.FollowBoss:
	btst	#0,gear.flags(a0)
	bne.s	.End
	movea.w	gear.parent_link(a0),a1
	move.w	obj.y(a1),obj.y(a0)
	btst	#2,boss.flags(a1)
	beq.s	.Draw
	lea	GearAnims,a1
	jsr	AnimateObject

.Draw:
	jmp	DrawObject

; ------------------------------------------------------------------------------

.End:
	rts

; ------------------------------------------------------------------------------

BombLauncherObject:
	movea.w	bomb_launcher.parent_link(a0),a2
	move.w	obj.y(a2),obj.y(a0)
	addi.w	#$20,obj.y(a0)
	tst.b	boss.phase(a2)
	bne.s	.Delete
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	BombLauncher_Routines(pc,d0.w),d0
	jsr	BombLauncher_Routines(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

.Delete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BombLauncher_Routines:
	dc.w	BombLauncher_Init-*
	dc.w	BombLauncher_WaitToFire-BombLauncher_Routines
	dc.w	BombLauncher_AnimateFiring-BombLauncher_Routines

; ------------------------------------------------------------------------------

BombLauncher_Init:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$47C,obj.sprite_tile(a0)
	move.l	#BombLaunchSprites,obj.sprite_data(a0)
	movea.w	bomb_launcher.parent_link(a0),a2

BombLauncher_WaitToFire:
	cmpi.w	#$400,player_object+obj.y
	bge.s	.WaitEnd
	tst.b	boss.attack_count(a2)
	bne.s	.WaitEnd
	addq.w	#1,bomb_launcher.fire_timer(a0)
	cmpi.w	#$78,bomb_launcher.fire_timer(a0)
	bge.s	.Launch

.WaitEnd:
	rts

; ------------------------------------------------------------------------------

.Launch:
	clr.w	bomb_launcher.fire_timer(a0)
	move.b	#4,obj.routine(a0)
	bsr.w	SpawnObject
	bne.w	.LaunchEnd
	move.b	#$3E,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addq.w	#8,obj.y(a1)
	jsr	Random
	andi.l	#$7FFF,d0
	ext.l	d0
	move.l	d0,d2
	divs.w	#$400,d0
	swap	d0
	move.w	#$C,d1
	tst.b	obj.anim_index(a0)
	bne.s	.SetVelocity
	neg.w	d0
	neg.w	d1

.SetVelocity:
	add.w	d1,obj.x(a1)
	move.w	d0,obj.x_speed(a1)
	move.w	#$300,obj.y_speed(a1)

.LaunchEnd:
	rts

; ------------------------------------------------------------------------------

BombLauncher_AnimateFiring:
	subq.b	#1,obj.anim_timer(a0)
	bgt.s	.End
	moveq	#0,d0
	move.b	obj.anim_index(a0),d0
	addq.b	#1,d0
	cmpi.b	#4,d0
	beq.s	.ReturnToWaiting
	cmpi.b	#8,d0
	beq.s	.RestartSequence
	move.b	#2,obj.anim_timer(a0)

.SetFrame:
	move.b	d0,obj.anim_index(a0)
	move.b	BombLauncher_FiringFrames(pc,d0.w),d0
	move.b	d0,obj.sprite_frame(a0)

.End:
	rts

; ------------------------------------------------------------------------------

.RestartSequence:
	moveq	#0,d0

.ReturnToWaiting:
	move.b	#2,obj.routine(a0)
	bra.s	.SetFrame

; ------------------------------------------------------------------------------

; Closed frames alternate with two stages for each launcher side. Index 4 is
; retained between launches so the second half is selected on the next shot.
BombLauncher_FiringFrames:
	dc.b	0, 1, 0, 2
	dc.b	0, 3, 0, 4

; ------------------------------------------------------------------------------

BombObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	Bomb_Routines(pc,d0.w),d0
	jmp	Bomb_Routines(pc,d0.w)

; ------------------------------------------------------------------------------

Bomb_Routines:
	dc.w	Bomb_Init-*
	dc.w	Bomb_Active-Bomb_Routines
	dc.w	Bomb_Explosion-Bomb_Routines
	dc.w	Bomb_Delete-Bomb_Routines
	dc.w	Bomb_Detonate-Bomb_Routines
	dc.w	Bomb_BeginSilentExplosion-Bomb_Routines

; ------------------------------------------------------------------------------

Bomb_Init:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$47C,obj.sprite_tile(a0)
	move.l	#BombSprites,obj.sprite_data(a0)
	move.b	#$D7,obj.collide_type(a0)
	move.w	#0,bomb.x_acceleration(a0)
	move.w	#$20,bomb.y_acceleration(a0)
	move.w	#$600,bomb.terminal_y_speed(a0)

Bomb_Active:
	tst.b	obj.collide_status(a0)
	bne.w	Bomb_HitPlayer
	addq.w	#1,bomb.lifetime(a0)
	cmpi.w	#$F0,bomb.lifetime(a0)
	bge.w	Bomb_Detonate
	addq.b	#1,obj.anim_timer(a0)
	btst	#1,obj.anim_timer(a0)
	beq.s	.Move
	eori.b	#1,obj.sprite_frame(a0)

.Move:
	bsr.w	Bomb_ApplyAcceleratedMotion
	tst.w	obj.y_speed(a0)
	bmi.s	.CheckCeiling
	bsr.w	CheckBlockDown
	tst.w	d1
	bgt.w	.CheckHorizontal
	add.w	d1,obj.y(a0)
	move.w	obj.y_speed(a0),d1
	neg.w	d1
	move.w	d1,obj.y_speed(a0)
	bra.w	.CheckHorizontal

; ------------------------------------------------------------------------------

.CheckCeiling:
	bsr.w	CheckBlockUp
	tst.w	d1
	bgt.w	.CheckHorizontal
	sub.w	d1,obj.y(a0)
	move.w	obj.y_speed(a0),d1
	neg.w	d1
	move.w	d1,obj.y_speed(a0)

.CheckHorizontal:
	tst.w	obj.x_speed(a0)
	bmi.s	.CheckLeft
	moveq	#0,d3
	move.b	obj.width(a0),d3
	bsr.w	CheckBlockRight
	tst.w	d1
	bgt.w	.Draw
	add.w	d1,obj.x(a0)
	move.w	obj.x_speed(a0),d0
	neg.w	d0
	move.w	d0,obj.x_speed(a0)
	bra.w	.Draw

; ------------------------------------------------------------------------------

.CheckLeft:
	moveq	#0,d3
	move.b	obj.width(a0),d3
	bsr.w	CheckBlockLeft
	tst.w	d1
	bgt.w	.Draw
	sub.w	d1,obj.x(a0)
	move.w	obj.x_speed(a0),d0
	neg.w	d0
	move.w	d0,obj.x_speed(a0)

.Draw:
	jmp	DrawObject

; ------------------------------------------------------------------------------

Bomb_HitPlayer:
	lea	player_object,a1
	clr.b	obj.collide_status(a0)
	move.w	obj.x(a0),d1
	move.w	obj.y(a0),d2
	sub.w	obj.x(a1),d1
	sub.w	obj.y(a1),d2
	jsr	Atan2
	jsr	SineCosine
	muls.w	#-$700,d1
	asr.l	#8,d1
	move.w	d1,obj.x_speed(a1)
	muls.w	#-$700,d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a1)
	bset	#1,obj.flags(a1)
	bclr	#4,obj.flags(a1)
	bclr	#5,obj.flags(a1)
	clr.b	obj.var_3c(a1)
	move.b	#1,obj.anim_id(a0)
	lea	object_states,a2
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	.ClearPlayerFlag
	cmpi.b	#$8A,2(a2,d0.w)
	bcc.s	.ClearPlayerFlag
	addq.b	#1,2(a2,d0.w)

.ClearPlayerFlag:
	bclr	#3,obj.flags(a1)

Bomb_Detonate:
	move.w	#$9E,d0
	jsr	PlayFmSound
	move.w	#$100,obj.anim_id(a0)
	move.b	#4,obj.routine(a0)
	bra.s	Bomb_ConvertToExplosion

; ------------------------------------------------------------------------------

Bomb_BeginSilentExplosion:
	move.w	#1,obj.anim_id(a0)
	move.b	#4,obj.routine(a0)

Bomb_ConvertToExplosion:
	clr.b	obj.collide_type(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$680,obj.sprite_tile(a0)
	move.l	#ExplosionSprites,obj.sprite_data(a0)

Bomb_Explosion:
	lea	ExplosionAnims,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

Bomb_Delete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

Bomb_ApplyAcceleratedMotion:
	move.w	bomb.y_acceleration(a0),d0
	add.w	d0,obj.y_speed(a0)
	move.w	bomb.x_acceleration(a0),d0
	add.w	d0,obj.x_speed(a0)
	tst.w	bomb.y_acceleration(a0)
	beq.s	Bomb_ApplyPosition
	bmi.s	.ClampUpwardSpeed
	move.w	bomb.terminal_y_speed(a0),d0
	cmp.w	obj.y_speed(a0),d0
	bgt.s	Bomb_ApplyPosition
	move.w	d0,obj.y_speed(a0)
	bra.s	Bomb_ApplyPosition

; ------------------------------------------------------------------------------

.ClampUpwardSpeed:
	move.w	bomb.terminal_y_speed(a0),d0
	cmp.w	obj.y_speed(a0),d0
	blt.s	Bomb_ApplyPosition
	move.w	d0,obj.y_speed(a0)
	bra.s	Bomb_ApplyPosition

; ------------------------------------------------------------------------------

; Unreachable executable leftover: duplicates the acceleration updates above.
BombMotion_UnreachableDuplicateAcceleration:
	move.w	bomb.x_acceleration(a0),d0
	add.w	d0,obj.x_speed(a0)
	move.w	bomb.y_acceleration(a0),d0
	add.w	d0,obj.y_speed(a0)

Bomb_ApplyPosition:
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

EggmanAnims:
	include	"anims/r3/eggman.asm"
	even

EggmanSprites:
	include	"sprites/r3/eggman.asm"
	even

EntryBarrierAnims:
	include	"anims/r3/entry_barrier.asm"
	even

EntryBarrierSprites:
	include	"sprites/r3/entry_barrier.asm"
	even

BossMachineSprites:
	include	"sprites/r3/boss_machine.asm"
	even

GearAnims:
	include	"anims/r3/gear.asm"
	even

GearSprites:
	include	"sprites/r3/gear.asm"
	even

BombLaunchSprites:
	include	"sprites/r3/bomb_launch.asm"
	even

BombSprites:
	include	"sprites/r3/bomb.asm"
	even

; ------------------------------------------------------------------------------

ExitBarrierObject:
	cmpi.b	#4,obj.routine(a0)
	beq.w	ExitBarrierObject_0_Routine4
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EA12(pc,d0.w),d0
	jmp	off_20EA12(pc,d0.w)

; ------------------------------------------------------------------------------

off_20EA12:
	dc.w	ExitBarrierObject_0_Routine0-*
	dc.w	ExitBarrierObject_0_Routine2-off_20EA12
	dc.w	ExitBarrierObject_0_Routine4-off_20EA12
	dc.w	ExitBarrierObject_0_Routine6-off_20EA12

; ------------------------------------------------------------------------------

ExitBarrierObject_0_Routine6:
	move.b	#5,obj.var_2a(a0)
	clr.b	obj.routine(a0)
	bra.s	loc_20EA2C

; ------------------------------------------------------------------------------

ExitBarrierObject_0_Routine0:
	move.b	#7,obj.var_2a(a0)

loc_20EA2C:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$474,obj.sprite_tile(a0)
	move.l	#ExitBarrierSprites,obj.sprite_data(a0)
	move.b	#$48,obj.width_2(a0)
	move.b	#$10,obj.height(a0)

ExitBarrierObject_0_Routine2:
	lea	ExitBarrierAnims(pc),a1
	jsr	AnimateObject
	move.b	obj.sprite_frame(a0),d0
	cmp.b	obj.var_2a(a0),d0
	beq.s	loc_20EA6C
	bra.s	ExitBarrierObject_0_Routine4

; ------------------------------------------------------------------------------

loc_20EA6C:
	addq.b	#2,obj.routine(a0)

ExitBarrierObject_0_Routine4:
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20EA80
	lea	player_object,a1
	jsr	TopSolidObject

loc_20EA80:
	jmp	DrawObject

; ------------------------------------------------------------------------------

ExitBarrierAnims:
	include	"anims/r3/exit_barrier.asm"
	even

ExitBarrierSprites:
	include	"sprites/r3/exit_barrier.asm"
	even

; ------------------------------------------------------------------------------

DrainObject:
	tst.b	obj.subtype(a0)
	bmi.w	DrainSwitchObject
	beq.w	DrainLightObject
	bra.w	DrainBlockObject

; ------------------------------------------------------------------------------
