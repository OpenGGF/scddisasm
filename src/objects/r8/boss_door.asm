; ------------------------------------------------------------------------------

BossDoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B700(pc,d0.w),d0
	jsr	off_20B700(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20B700:
	dc.w	BossDoorObject_0_Routine0-*
	dc.w	BossDoorObject_0_Routine2-off_20B700
	dc.w	BossDoorObject_0_Routine4-off_20B700

; ------------------------------------------------------------------------------

BossDoorObject_0_Routine0:
	move.w	obj.x(a0),obj.var_2a(a0)
	movea.l	a0,a1
	move.b	#1,obj.subtype(a0)
	bset	#0,obj.sprite_flags(a0)
	bsr.s	sub_20B728
	bsr.w	SpawnObject
	beq.s	sub_20B728
	jmp	DespawnObject

; ------------------------------------------------------------------------------

sub_20B728:
	move.b	#$3D,obj.id(a1)
	move.w	obj.var_2a(a0),obj.var_2a(a1)
	move.w	obj.var_2a(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	moveq	#8,d0
	tst.b	obj.subtype(a1)
	beq.s	loc_20B74A
	neg.w	d0

loc_20B74A:
	add.w	d0,obj.x(a1)
	addq.b	#2,obj.routine(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.b	#2,obj.sprite_layer(a1)
	move.l	#BossDoorSprites,obj.sprite_data(a1)
	move.w	#$8797,obj.sprite_tile(a1)
	rts

; ------------------------------------------------------------------------------

BossDoorObject_0_Routine2:
	tst.b	boss_started
	bpl.s	locret_20B77E
	clr.b	boss_door_flag
	addq.b	#2,obj.routine(a0)

locret_20B77E:
	rts

; ------------------------------------------------------------------------------

BossDoorObject_0_Routine4:
	move.w	obj.x(a0),d1
	subq.w	#8,d1
	move.w	d1,d5
	andi.w	#$F,d1
	bne.s	loc_20B7C2
	addq.b	#1,obj.var_2c(a0)
	cmpi.b	#$11,obj.var_2c(a0)
	bcs.s	loc_20B7A0
	jmp	DespawnObject

; ------------------------------------------------------------------------------

loc_20B7A0:
	moveq	#0,d3
	move.w	obj.y(a0),d4
	subi.w	#$60,d4
	movem.l	d0-d7/a0-a6,-(sp)
	moveq	#$B,d6

loc_20B7B0:
	jsr	PlaceBlock
	addi.w	#$10,d4
	dbf	d6,loc_20B7B0
	movem.l	(sp)+,d0-d7/a0-a6

loc_20B7C2:
	addq.w	#2,obj.x(a0)
	tst.b	obj.subtype(a0)
	beq.s	locret_20B7D0
	subq.w	#4,obj.x(a0)

locret_20B7D0:
	rts

; ------------------------------------------------------------------------------
