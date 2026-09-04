; ------------------------------------------------------------------------------

ResetObjectStates:
	lea	object_states,a2
	move.w	#$101,(a2)+
	move.w	#$BE,d0

ResetObjectStatesLoop:
	clr.l	(a2)+
	dbf	d0,ResetObjectStatesLoop
	rts

; ------------------------------------------------------------------------------

SpawnStageObjects:
	moveq	#0,d0
	move.b	spawn_routine,d0
	move.w	StageObjectSpawnRoutineTable(pc,d0.w),d0
	jmp	StageObjectSpawnRoutineTable(pc,d0.w)

; ------------------------------------------------------------------------------

; Stage-object spawn states are selected in two-byte increments.
StageObjectSpawnRoutineTable:
	dc.w	StageObjectSpawnInit-*
	dc.w	StageObjectSpawnMain-StageObjectSpawnRoutineTable

; ------------------------------------------------------------------------------

StageObjectSpawnInit:
	; StageObjectMaps records are eight bytes: x, y/flags, id/state,
	; subtype, time-zone mask, and a reserved byte.
	addq.b	#2,spawn_routine
	lea	StageObjectMaps,a0
	movea.l	a0,a1
	adda.w	(a0),a0
	move.l	a0,spawn_chunk_right
	move.l	a0,spawn_chunk_left
	adda.w	2(a1),a1
	move.l	a1,spawn_chunk_right_2
	move.l	a1,spawn_chunk_left_2
	lea	object_states,a2
	move.w	#$101,(a2)
	moveq	#0,d2
	move.w	scroll_fg_x,d6
	subi.w	#$80,d6
	bcc.s	StageObjectSpawnInitRightAlign
	moveq	#0,d6

StageObjectSpawnInitRightAlign:
	andi.w	#$FF80,d6
	movea.l	spawn_chunk_right,a0

StageObjectSpawnInitRightScan:
	cmp.w	(a0),d6
	bls.s	StageObjectSpawnInitLeftAlign
	tst.b	4(a0)
	bpl.s	StageObjectSpawnInitRightCount
	move.b	(a2),d2
	addq.b	#1,(a2)

StageObjectSpawnInitRightCount:
	addq.w	#8,a0
	bra.s	StageObjectSpawnInitRightScan

; ------------------------------------------------------------------------------

StageObjectSpawnInitLeftAlign:
	move.l	a0,spawn_chunk_right
	movea.l	spawn_chunk_left,a0
	subi.w	#$80,d6
	bcs.s	StageObjectSpawnInitComplete

StageObjectSpawnInitLeftScan:
	cmp.w	(a0),d6
	bls.s	StageObjectSpawnInitComplete
	tst.b	4(a0)
	bpl.s	StageObjectSpawnInitLeftCount
	addq.b	#1,1(a2)

StageObjectSpawnInitLeftCount:
	addq.w	#8,a0
	bra.s	StageObjectSpawnInitLeftScan

; ------------------------------------------------------------------------------

StageObjectSpawnInitComplete:
	move.l	a0,spawn_chunk_left
	move.w	#-1,prev_spawn_chunk

StageObjectSpawnMain:
	lea	object_states,a2
	moveq	#0,d2
	move.w	scroll_fg_x,d6
	andi.w	#$FF80,d6
	cmp.w	prev_spawn_chunk,d6
	beq.w	StageObjectSpawnReturn
	bge.s	StageObjectSpawnForward
	nop
	nop
	nop
	nop
	move.w	d6,prev_spawn_chunk
	movea.l	spawn_chunk_left,a0
	subi.w	#$80,d6
	bcs.s	StageObjectSpawnBackwardComplete

StageObjectSpawnBackwardScan:
	cmp.w	-8(a0),d6
	bge.s	StageObjectSpawnBackwardComplete
	subq.w	#8,a0
	tst.b	4(a0)
	bpl.s	StageObjectSpawnBackwardCount
	subq.b	#1,1(a2)
	move.b	1(a2),d2

StageObjectSpawnBackwardCount:
	bsr.w	SpawnStageObject
	bne.s	StageObjectSpawnBackwardSpawned
	subq.w	#8,a0
	bra.s	StageObjectSpawnBackwardScan

; ------------------------------------------------------------------------------

StageObjectSpawnBackwardSpawned:
	tst.b	4(a0)
	bpl.s	StageObjectSpawnBackwardAdvance
	addq.b	#1,1(a2)
	bclr	#7,2(a2,d3.w)

StageObjectSpawnBackwardAdvance:
	addq.w	#8,a0

StageObjectSpawnBackwardComplete:
	move.l	a0,spawn_chunk_left
	movea.l	spawn_chunk_right,a0
	addi.w	#$300,d6

StageObjectSpawnForwardCleanupScan:
	cmp.w	-8(a0),d6
	bgt.s	StageObjectSpawnForwardCleanupComplete
	tst.b	-4(a0)
	bpl.s	StageObjectSpawnForwardCleanupCount
	subq.b	#1,(a2)

StageObjectSpawnForwardCleanupCount:
	subq.w	#8,a0
	bra.s	StageObjectSpawnForwardCleanupScan

; ------------------------------------------------------------------------------

StageObjectSpawnForwardCleanupComplete:
	move.l	a0,spawn_chunk_right
	rts

; ------------------------------------------------------------------------------

StageObjectSpawnForward:
	nop
	nop
	nop
	nop
	move.w	d6,prev_spawn_chunk
	movea.l	spawn_chunk_right,a0
	addi.w	#$280,d6

StageObjectSpawnForwardScan:
	cmp.w	(a0),d6
	bls.s	StageObjectSpawnForwardAdvance
	tst.b	4(a0)
	bpl.s	StageObjectSpawnForwardCount
	move.b	(a2),d2
	addq.b	#1,(a2)

StageObjectSpawnForwardCount:
	bsr.w	SpawnStageObject
	beq.s	StageObjectSpawnForwardScan
	tst.b	4(a0)
	bpl.s	StageObjectSpawnForwardAdvance
	subq.b	#1,(a2)
	bclr	#7,2(a2,d3.w)

StageObjectSpawnForwardAdvance:
	move.l	a0,spawn_chunk_right
	movea.l	spawn_chunk_left,a0
	subi.w	#$300,d6
	bcs.s	StageObjectSpawnBackwardCleanupComplete

StageObjectSpawnBackwardCleanupScan:
	cmp.w	(a0),d6
	bls.s	StageObjectSpawnBackwardCleanupComplete
	tst.b	4(a0)
	bpl.s	StageObjectSpawnBackwardCleanupCount
	addq.b	#1,1(a2)

StageObjectSpawnBackwardCleanupCount:
	addq.w	#8,a0
	bra.s	StageObjectSpawnBackwardCleanupScan

; ------------------------------------------------------------------------------

StageObjectSpawnBackwardCleanupComplete:
	move.l	a0,spawn_chunk_left

StageObjectSpawnReturn:
	rts

; ------------------------------------------------------------------------------

CheckObjectTimeZone:
	; d3 selects the three-byte state slot; d1 selects its time-zone bit.
	moveq	#0,d0
	move.b	time_zone,d0
	bclr	#7,d0
	move.w	d2,d3
	add.w	d3,d3
	add.w	d2,d3
	add.w	d0,d3
	move.b	6(a0),d1
	rol.b	#3,d1
	andi.b	#7,d1
	btst	d0,d1
	rts

; ------------------------------------------------------------------------------

SpawnStageObject:
	bsr.s	CheckObjectTimeZone
	beq.s	StageObjectSpawnSkipTimeZone
	tst.b	4(a0)
	bpl.s	StageObjectSpawnLoadRecord
	bset	#7,2(a2,d3.w)
	beq.s	StageObjectSpawnLoadRecord

StageObjectSpawnSkipTimeZone:
	addq.w	#8,a0
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

StageObjectSpawnLoadRecord:
	bsr.w	SpawnObject
	bne.s	StageObjectSpawnComplete
	move.w	(a0)+,obj.x(a1)
	move.w	(a0)+,d0
	move.w	d0,d1
	andi.w	#$FFF,d0
	move.w	d0,obj.y(a1)
	rol.w	#2,d1
	andi.b	#3,d1
	move.b	d1,obj.sprite_flags(a1)
	move.b	d1,obj.flags(a1)
	move.b	(a0)+,d0
	bpl.s	StageObjectSpawnLoadObjectId
	andi.b	#$7F,d0
	move.b	d2,obj.state_id(a1)

StageObjectSpawnLoadObjectId:
	move.b	d0,obj.id(a1)
	cmpi.b	#$31,d0
	bne.s	StageObjectSpawnLoadSubtypes
	nop
	nop
	nop
	nop

StageObjectSpawnLoadSubtypes:
	move.b	(a0)+,obj.subtype(a1)
	move.b	(a0)+,d0
	move.b	(a0)+,obj.subtype_2(a1)
	moveq	#0,d0

StageObjectSpawnComplete:
	rts

; ------------------------------------------------------------------------------

SpawnObject:
	; Return a free slot in object_spawn_pool, or leave a nonzero status.
	lea	object_spawn_pool,a1
	move.w	#$5F,d0

SpawnObjectSearchLoop:
	tst.b	(a1)
	beq.s	SpawnObjectSearchReturn
	lea	obj.struct_len(a1),a1
	dbf	d0,SpawnObjectSearchLoop

SpawnObjectSearchReturn:
	rts

; ------------------------------------------------------------------------------

SpawnObjectAfter:
	; Search only the slots after the caller's current object.
	movea.l	a0,a1
	lea	obj.struct_len(a1),a1
	move.w	#object_pool_end,d0
	sub.w	a0,d0
	lsr.w	#6,d0
	subq.w	#2,d0
	bcs.s	SpawnObjectAfterSearchReturn

SpawnObjectAfterSearchLoop:
	tst.b	(a1)
	beq.s	SpawnObjectAfterSearchReturn
	lea	obj.struct_len(a1),a1
	dbf	d0,SpawnObjectAfterSearchLoop

SpawnObjectAfterSearchReturn:
	rts

; ------------------------------------------------------------------------------

CheckObjectDespawn:
	; Full entry loads x; the range-only entry below expects d0 already set.
	move.w	obj.x(a0),d0

CheckObjectDespawn2:
	tst.b	obj.sprite_flags(a0)
	bmi.s	CheckObjectDespawnInRange
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bls.s	CheckObjectDespawnInRange

DespawnObject:
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	DespawnObjectDelete
	lea	object_states,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	bclr	#7,d1
	beq.s	DespawnObjectClearState
	move.b	warp_direction,d2
	ext.w	d2
	neg.w	d2
	add.w	d2,d1
	bpl.s	DespawnObjectClampTimeZone
	moveq	#0,d1
	bra.s	DespawnObjectClearState

; ------------------------------------------------------------------------------

DespawnObjectClampTimeZone:
	cmpi.w	#3,d1
	bcs.s	DespawnObjectClearState
	moveq	#2,d1

DespawnObjectClearState:
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)

DespawnObjectDelete:
	if def(R8_VARIANT)
		if (R8_VARIANT<>5)|(DEMO=0)|(REGION=USA)
			jsr	DeleteObject
			moveq	#1,d0
			rts
		else
			jmp	DeleteObject
		endif
	else
		jsr	DeleteObject
		moveq	#1,d0
		rts
	endif

; ------------------------------------------------------------------------------

CheckObjectDespawnInRange:
	btst	#7,time_zone
	bne.s	DespawnObject
	if def(R8_VARIANT)
		if (R8_VARIANT<>5)|(DEMO=0)|(REGION=USA)
			moveq	#0,d0
		endif
	else
		moveq	#0,d0
	endif
	rts

; ------------------------------------------------------------------------------
