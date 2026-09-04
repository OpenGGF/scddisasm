; ------------------------------------------------------------------------------

FreezerObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	FreezerRoutineTable(pc,d0.w),d0
	jsr	FreezerRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Freezer object routine pointers.
FreezerRoutineTable:
	dc.w	FreezerObject_0_Routine0-*
	dc.w	FreezerObject_0_Routine2-FreezerRoutineTable
	dc.w	FreezerObject_0_Routine4-FreezerRoutineTable
	dc.w	FreezerObject_0_Routine6-FreezerRoutineTable
	dc.w	FreezerObject_0_Routine8-FreezerRoutineTable
	dc.w	FreezerObject_0_RoutineA-FreezerRoutineTable
	dc.w	FreezerObject_0_RoutineC-FreezerRoutineTable

; ------------------------------------------------------------------------------

FreezerObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$310,obj.sprite_tile(a0)
	move.l	#FreezerSprites,obj.sprite_data(a0)
	move.b	#$78,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)

FreezerObject_0_Routine2:
	tst.b	obj.var_2a(a0)
	beq.s	FreezerSpawnReturn
	subq.b	#1,obj.var_2a(a0)
	bne.s	FreezerSpawnReturn
	jsr	SpawnObject
	bne.s	FreezerSpawnReturn
	move.l	a0,obj.var_2a(a1)
	move.b	#5,obj.id(a1)
	move.b	#3,obj.sprite_layer(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addi.w	#$24,obj.y(a1)
	move.b	#4,obj.routine(a1)

FreezerSpawnReturn:
	rts

; ------------------------------------------------------------------------------

FreezerObject_0_Routine4:
	bsr.w	FreezerCheckFreezeTrigger
	lea	FreezerAnims,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

FreezerObject_0_Routine6:
	movea.l	obj.var_2a(a0),a1
	move.b	#$78,obj.var_2a(a1)
	jmp	DeleteObject

; ------------------------------------------------------------------------------

FreezerObject_0_Routine8:
	addi.w	#$38,obj.y_speed(a0)
	move.l	obj.y(a0),d3
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d3
	move.l	d3,obj.y(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	FreezerUpdateChildPosition
	move.w	#$92,d0
	jsr	SubCpuCommand
	move.b	#$F,obj.var_30(a0)
	add.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)

FreezerUpdateChildPosition:
	movea.l	obj.var_2a(a0),a1
	move.l	obj.y(a0),obj.y(a1)
	rts

; ------------------------------------------------------------------------------

FreezerObject_0_RoutineA:
	movea.l	obj.var_2a(a0),a1
	tst.b	obj.var_30(a0)
	beq.s	FreezerHurtPlayer
	subq.b	#1,obj.var_30(a0)
	move.b	p1_joy_tap,d0
	andi.b	#$70,d0
	beq.s	FreezerFreezeInputReturn
	bclr	#0,obj.var_2c(a1)
	bclr	#6,obj.var_2c(a1)
	move.w	#$F980,obj.y_speed(a1)
	move.b	#$E,obj.height(a1)
	move.b	#7,obj.width(a1)
	addq.w	#5,obj.y(a1)
	bset	#2,obj.flags(a1)
	bclr	#5,obj.flags(a1)
	move.b	#2,obj.anim_id(a1)
	move.w	#$92,d0
	jsr	PlayFmSound
	bra.s	FreezerStartShatterEffect

; ------------------------------------------------------------------------------

FreezerHurtPlayer:
	movea.l	a0,a3
	movea.l	a0,a2
	movea.l	obj.var_2a(a0),a0
	bclr	#0,obj.var_2c(a0)
	bclr	#6,obj.var_2c(a0)
	jsr	HurtPlayer
	movea.l	a3,a0

FreezerStartShatterEffect:
	addq.b	#2,obj.routine(a0)
	move.b	#$A,obj.sprite_frame(a0)
	move.b	#$14,obj.var_30(a0)
	move.b	#2,obj.var_31(a0)
	bsr.w	FreezerSpawnShards

FreezerFreezeInputReturn:
	rts

; ------------------------------------------------------------------------------

FreezerObject_0_RoutineC:
	subq.b	#1,obj.var_30(a0)
	bne.s	FreezerMoveShard
	cmpi.b	#$B,obj.sprite_frame(a0)
	beq.s	FreezerDeleteShards
	moveq	#0,d0
	move.b	obj.var_31(a0),d0
	add.w	d0,d0
	move.w	FreezerShardPatternTable(pc,d0.w),d0
	lea	FreezerShardPatternTable(pc,d0.w),a3
	moveq	#3,d6
	bsr.w	FreezerSpawnShardPattern

FreezerDeleteShards:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

FreezerMoveShard:
	move.w	obj.x_speed(a0),d0
	add.w	d0,obj.x(a0)
	move.w	obj.y_speed(a0),d0
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

; Shard pattern pointers selected by the current effect variant.
FreezerShardPatternTable:
	dc.w	FreezerShardPatternSet0-*
	dc.w	FreezerShardPatternSet1-FreezerShardPatternTable
	dc.w	FreezerShardPatternSet2-FreezerShardPatternTable

; Four offset/velocity records for the first shard pattern.
FreezerShardPatternSet0:
	dc.b	0, 0, $A, $B, 0, 0, $FF, 0
	dc.b	0, 0, $A, $B, 0, 1, 0, 0
	dc.b	0, 0, $A, $B, 0, 0, 1, 0
	dc.b	0, 0, $A, $B, 0, $FF, 0, 0

; Four offset/velocity records for the second shard pattern.
FreezerShardPatternSet1:
	dc.b	0, 0, $A, $B, 0, $FF, $FF, 0
	dc.b	0, 0, $A, $B, 0, 1, $FF, 0
	dc.b	0, 0, $A, $B, 0, 0, 1, 0
	dc.b	0, 0, 1, $B, 0, $FF, 0, 0

; Four offset/velocity records for the third shard pattern.
FreezerShardPatternSet2:
	dc.b	0, 0, $A, $B, 0, $FF, $FF, 0
	dc.b	0, 0, $A, $B, 0, 1, $FF, 0
	dc.b	0, 0, $A, $B, 0, 1, 1, 0
	dc.b	0, 0, $A, $B, 0, $FF, 1, 0

; ------------------------------------------------------------------------------

FreezerSpawnShards:
	moveq	#5,d6
	lea	FreezerShardSpawnRecords,a3

FreezerSpawnShardPattern:
	moveq	#0,d1

FreezerSpawnShardLoop:
	jsr	SpawnObject
	bne.s	FreezerSpawnShardsReturn
	move.b	#5,obj.id(a1)
	move.b	#$C,obj.routine(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	#$2E1,obj.sprite_tile(a1)
	move.l	#FreezerSprites,obj.sprite_data(a1)
	move.b	(a3,d1.w),d2
	ext.w	d2
	add.w	d2,obj.x(a1)
	move.b	1(a3,d1.w),d2
	ext.w	d2
	add.w	d2,obj.y(a1)
	move.b	2(a3,d1.w),obj.var_30(a1)
	move.b	3(a3,d1.w),obj.sprite_frame(a1)
	move.b	4(a3,d1.w),d2
	or.b	d2,obj.sprite_flags(a1)
	move.b	5(a3,d1.w),d2
	ext.w	d2
	move.w	d2,obj.x_speed(a1)
	move.b	6(a3,d1.w),d2
	ext.w	d2
	move.w	d2,obj.y_speed(a1)
	move.b	7(a3,d1.w),obj.var_31(a1)
	addq.w	#8,d1
	dbf	d6,FreezerSpawnShardLoop

FreezerSpawnShardsReturn:
	rts

; ------------------------------------------------------------------------------

; Spawn records: x/y offset, timer, frame, flags, velocity, and variant.
FreezerShardSpawnRecords:
	dc.b	$F0, $F4, $A, 9, 0, $FF, $FF, 0
	dc.b	$F0, $C, $A, 9, 2, $FF, 1, 0
	dc.b	$10, $F4, $A, 9, 1, 1, $FF, 0
	dc.b	$10, $C, $A, 9, 3, 1, 1, 0
	dc.b	0, $F0, $F, $A, 1, 0, $FF, 1
	dc.b	0, $10, $F, $A, 3, 0, 1, 1

; ------------------------------------------------------------------------------

FreezerSpawnFrozenPlayer:
	movea.l	a1,a2
	jsr	SpawnObject
	bne.s	FreezerSpawnFrozenReturn
	bset	#0,obj.var_2c(a2)
	bset	#6,obj.var_2c(a2)
	move.l	a2,obj.var_2a(a1)
	move.b	#5,obj.id(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	obj.x(a2),obj.x(a1)
	move.w	obj.y(a2),obj.y(a1)
	move.w	#$2E1,obj.sprite_tile(a1)
	move.l	#FreezerSprites,obj.sprite_data(a1)
	move.b	#$18,obj.width(a1)
	move.b	#$18,obj.width_2(a1)
	move.b	#$18,obj.height(a1)
	move.b	#8,obj.sprite_frame(a1)
	move.b	#8,obj.routine(a1)

FreezerSpawnFrozenReturn:
	rts

; ------------------------------------------------------------------------------

FreezerCheckFreezeTrigger:
	cmpi.b	#1,obj.anim_id(a0)
	bne.s	FreezerFreezeCheckReturn
	lea	player_object,a1
	cmpi.b	#$2B,obj.anim_id(a1)
	beq.s	FreezerFreezeCheckReturn
	bsr.s	FreezerCheckPlayerOverlap
	bne.s	FreezerSpawnFrozenPlayer

FreezerFreezeCheckReturn:
	rts

; ------------------------------------------------------------------------------

FreezerCheckPlayerOverlap:
	tst.b	invincible
	bne.s	FreezerNoPlayerOverlap
	tst.b	warping
	bne.s	FreezerNoPlayerOverlap
	cmpi.b	#4,obj.routine(a1)
	bcc.s	FreezerNoPlayerOverlap
	tst.b	obj.var_2c(a1)
	bne.s	FreezerNoPlayerOverlap
	move.b	obj.width(a1),d1
	ext.w	d1
	addi.w	#$10,d1
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	add.w	d1,d0
	bmi.s	FreezerNoPlayerOverlap
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	FreezerNoPlayerOverlap
	move.b	obj.height(a1),d1
	ext.w	d1
	addi.w	#$20,d1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	add.w	d1,d0
	bmi.s	FreezerNoPlayerOverlap
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	FreezerNoPlayerOverlap
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

FreezerNoPlayerOverlap:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

FreezerAnims:
	include	"anims/r6/freezer.asm"
	even

FreezerSprites:
	include	"sprites/r6/freezer.asm"
	even

; ------------------------------------------------------------------------------
