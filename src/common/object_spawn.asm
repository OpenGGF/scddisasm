; ------------------------------------------------------------------------------

ResetObjectStates:
	lea	object_states,a2
	move.w	#$101,(a2)+
	move.w	#$BE,d0

loc_207114:
	clr.l	(a2)+
	dbf	d0,loc_207114
	rts

; ------------------------------------------------------------------------------

SpawnStageObjects:
	moveq	#0,d0
	move.b	spawn_routine,d0
	move.w	off_20712A(pc,d0.w),d0
	jmp	off_20712A(pc,d0.w)

; ------------------------------------------------------------------------------

off_20712A:
	dc.w	StageObjectSpawnInit-*
	dc.w	StageObjectSpawnMain-off_20712A

; ------------------------------------------------------------------------------

StageObjectSpawnInit:
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
	bcc.s	loc_207168
	moveq	#0,d6

loc_207168:
	andi.w	#$FF80,d6
	movea.l	spawn_chunk_right,a0

loc_207170:
	cmp.w	(a0),d6
	bls.s	loc_207182
	tst.b	4(a0)
	bpl.s	loc_20717E
	move.b	(a2),d2
	addq.b	#1,(a2)

loc_20717E:
	addq.w	#8,a0
	bra.s	loc_207170

; ------------------------------------------------------------------------------

loc_207182:
	move.l	a0,spawn_chunk_right
	movea.l	spawn_chunk_left,a0
	subi.w	#$80,d6
	bcs.s	loc_2071A2

loc_207190:
	cmp.w	(a0),d6
	bls.s	loc_2071A2
	tst.b	4(a0)
	bpl.s	loc_20719E
	addq.b	#1,1(a2)

loc_20719E:
	addq.w	#8,a0
	bra.s	loc_207190

; ------------------------------------------------------------------------------

loc_2071A2:
	move.l	a0,spawn_chunk_left
	move.w	#-1,prev_spawn_chunk

StageObjectSpawnMain:
	lea	object_states,a2
	moveq	#0,d2
	move.w	scroll_fg_x,d6
	andi.w	#$FF80,d6
	cmp.w	prev_spawn_chunk,d6
	beq.w	locret_20728C
	bge.s	loc_207232
	nop
	nop
	nop
	nop
	move.w	d6,prev_spawn_chunk
	movea.l	spawn_chunk_left,a0
	subi.w	#$80,d6
	bcs.s	loc_20720E

loc_2071DC:
	cmp.w	-8(a0),d6
	bge.s	loc_20720E
	subq.w	#8,a0
	tst.b	4(a0)
	bpl.s	loc_2071F2
	subq.b	#1,1(a2)
	move.b	1(a2),d2

loc_2071F2:
	bsr.w	SpawnStageObject
	bne.s	loc_2071FC
	subq.w	#8,a0
	bra.s	loc_2071DC

; ------------------------------------------------------------------------------

loc_2071FC:
	tst.b	4(a0)
	bpl.s	loc_20720C
	addq.b	#1,1(a2)
	bclr	#7,2(a2,d3.w)

loc_20720C:
	addq.w	#8,a0

loc_20720E:
	move.l	a0,spawn_chunk_left
	movea.l	spawn_chunk_right,a0
	addi.w	#$300,d6

loc_20721A:
	cmp.w	-8(a0),d6
	bgt.s	loc_20722C
	tst.b	-4(a0)
	bpl.s	loc_207228
	subq.b	#1,(a2)

loc_207228:
	subq.w	#8,a0
	bra.s	loc_20721A

; ------------------------------------------------------------------------------

loc_20722C:
	move.l	a0,spawn_chunk_right
	rts

; ------------------------------------------------------------------------------

loc_207232:
	nop
	nop
	nop
	nop
	move.w	d6,prev_spawn_chunk
	movea.l	spawn_chunk_right,a0
	addi.w	#$280,d6

loc_207246:
	cmp.w	(a0),d6
	bls.s	loc_207268
	tst.b	4(a0)
	bpl.s	loc_207254
	move.b	(a2),d2
	addq.b	#1,(a2)

loc_207254:
	bsr.w	SpawnStageObject
	beq.s	loc_207246
	tst.b	4(a0)
	bpl.s	loc_207268
	subq.b	#1,(a2)
	bclr	#7,2(a2,d3.w)

loc_207268:
	move.l	a0,spawn_chunk_right
	movea.l	spawn_chunk_left,a0
	subi.w	#$300,d6
	bcs.s	loc_207288

loc_207276:
	cmp.w	(a0),d6
	bls.s	loc_207288
	tst.b	4(a0)
	bpl.s	loc_207284
	addq.b	#1,1(a2)

loc_207284:
	addq.w	#8,a0
	bra.s	loc_207276

; ------------------------------------------------------------------------------

loc_207288:
	move.l	a0,spawn_chunk_left

locret_20728C:
	rts

; ------------------------------------------------------------------------------

CheckObjectTimeZone:
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
	beq.s	loc_2072C2
	tst.b	4(a0)
	bpl.s	loc_2072C8
	bset	#7,2(a2,d3.w)
	beq.s	loc_2072C8

loc_2072C2:
	addq.w	#8,a0
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_2072C8:
	bsr.w	SpawnObject
	bne.s	locret_207316
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
	bpl.s	loc_2072F8
	andi.b	#$7F,d0
	move.b	d2,obj.state_id(a1)

loc_2072F8:
	move.b	d0,obj.id(a1)
	cmpi.b	#$31,d0
	bne.s	loc_20730A
	nop
	nop
	nop
	nop

loc_20730A:
	move.b	(a0)+,obj.subtype(a1)
	move.b	(a0)+,d0
	move.b	(a0)+,obj.subtype_2(a1)
	moveq	#0,d0

locret_207316:
	rts

; ------------------------------------------------------------------------------

SpawnObject:
	lea	object_spawn_pool,a1
	move.w	#$5F,d0

loc_207320:
	tst.b	(a1)
	beq.s	locret_20732C
	lea	obj.struct_len(a1),a1
	dbf	d0,loc_207320

locret_20732C:
	rts

; ------------------------------------------------------------------------------

SpawnObjectAfter:
	movea.l	a0,a1
	lea	obj.struct_len(a1),a1
	move.w	#object_pool_end,d0
	sub.w	a0,d0
	lsr.w	#6,d0
	subq.w	#2,d0
	bcs.s	locret_20734C

loc_207340:
	tst.b	(a1)
	beq.s	locret_20734C
	lea	obj.struct_len(a1),a1
	dbf	d0,loc_207340

locret_20734C:
	rts

; ------------------------------------------------------------------------------

CheckObjectDespawn:
	move.w	obj.x(a0),d0

CheckObjectDespawn2:
	tst.b	obj.sprite_flags(a0)
	bmi.s	loc_2073BC
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bls.s	loc_2073BC

DespawnObject:
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_2073B2
	lea	object_states,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	bclr	#7,d1
	beq.s	loc_2073AA
	move.b	warp_direction,d2
	ext.w	d2
	neg.w	d2
	add.w	d2,d1
	bpl.s	loc_2073A2
	moveq	#0,d1
	bra.s	loc_2073AA

; ------------------------------------------------------------------------------

loc_2073A2:
	cmpi.w	#3,d1
	bcs.s	loc_2073AA
	moveq	#2,d1

loc_2073AA:
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)

loc_2073B2:
	jsr	DeleteObject
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_2073BC:
	btst	#7,time_zone
	bne.s	DespawnObject
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------
