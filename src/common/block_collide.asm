; ------------------------------------------------------------------------------

GetBlock:
	move.w	d2,d0
	lsr.w	#1,d0
	andi.w	#$780,d0
	cmpi.b	#2,zone
	bne.s	loc_200FC6
	andi.w	#$380,d0

loc_200FC6:
	move.w	d3,d1
	lsr.w	#8,d1
	andi.w	#$7F,d1
	add.w	d1,d0
	if STANDALONE=0
		move.l	#StageChunks,d1
	else
		moveq	#0,d1
	endif
	lea	stage_map,a1
	move.b	(a1,d0.w),d1
	beq.s	loc_201026
	bmi.s	loc_20102A
	cmpi.b	#5,zone
	beq.s	loc_200FF6
	cmpi.b	#6,zone
	bne.s	loc_200FFC

loc_200FF6:
	andi.w	#$7FFF,obj.sprite_tile(a0)

loc_200FFC:
	cmpi.b	#4,zone
	bne.s	loc_20100C
	bclr	#6,obj.sprite_flags(a0)

loc_20100C:
	subq.b	#1,d1
	ext.w	d1
	ror.w	#7,d1
	move.w	d2,d0
	add.w	d0,d0
	andi.w	#$1E0,d0
	add.w	d0,d1
	move.w	d3,d0
	lsr.w	#3,d0
	andi.w	#$1E,d0
	add.w	d0,d1

loc_201026:
	if STANDALONE<>0
		jsr	GetWrittenBlock2
	endif
	movea.l	d1,a1
	rts

; ------------------------------------------------------------------------------

loc_20102A:
	andi.w	#$7F,d1
	cmpi.b	#4,zone
	bne.s	loc_201092
	btst	#6,obj.sprite_flags(a0)
	bne.s	loc_201058
	cmpi.b	#$14,d1
	bne.w	loc_20117C
	bset	#6,obj.sprite_flags(a0)
	andi.b	#$7F,obj.sprite_tile(a0)
	bra.w	loc_20117C

; ------------------------------------------------------------------------------

loc_201058:
	cmpi.b	#$15,d1
	bne.s	loc_201066
	move.w	#$60,d1
	bra.w	loc_20117C

; ------------------------------------------------------------------------------

loc_201066:
	cmpi.b	#$1E,d1
	bne.s	loc_201074
	move.w	#$61,d1
	bra.w	loc_20117C

; ------------------------------------------------------------------------------

loc_201074:
	cmpi.b	#$1F,d1
	bne.s	loc_201082
	move.w	#$62,d1
	bra.w	loc_20117C

; ------------------------------------------------------------------------------

loc_201082:
	cmpi.b	#$32,d1
	bne.w	loc_20117C
	move.w	#$63,d1
	bra.w	loc_20117C

; ------------------------------------------------------------------------------

loc_201092:
	cmpi.b	#5,zone
	bne.w	loc_2010F8
	ori.w	#$8000,obj.sprite_tile(a0)
	cmpi.b	#4,d1
	beq.s	loc_2010E2
	cmpi.b	#6,d1
	beq.s	loc_2010E2
	tst.b	stage_layer
	beq.w	loc_20117C
	andi.w	#$7FFF,obj.sprite_tile(a0)
	cmpi.b	#$28,d1
	beq.s	loc_2010F2
	cmpi.b	#$3C,d1
	beq.s	loc_2010F2
	cmpi.b	#$37,d1
	beq.s	loc_2010F2
	cmpi.b	#$2F,d1
	beq.s	loc_2010F2
	cmpi.b	#$16,d1
	beq.s	loc_2010F2
	bra.w	loc_20117C

; ------------------------------------------------------------------------------

loc_2010E2:
	andi.w	#$7FFF,obj.sprite_tile(a0)
	btst	#6,obj.sprite_flags(a0)
	beq.w	loc_20117C

loc_2010F2:
	addq.b	#1,d1
	bra.w	loc_20117C

; ------------------------------------------------------------------------------

loc_2010F8:
	cmpi.b	#6,zone
	bne.s	loc_201168
	cmpi.b	#3,obj.id(a0)
	bcc.w	loc_20117C
	ori.w	#$8000,obj.sprite_tile(a0)
	tst.b	stage_layer
	beq.s	loc_20117C
	andi.w	#$7FFF,obj.sprite_tile(a0)
	cmpi.b	#$46,d1
	bne.s	loc_20112C
	move.w	#$6A,d1
	bra.s	loc_20117C

; ------------------------------------------------------------------------------

loc_20112C:
	cmpi.b	#$48,d1
	bne.s	loc_201138
	move.w	#$6B,d1
	bra.s	loc_20117C

; ------------------------------------------------------------------------------

loc_201138:
	cmpi.b	#$4A,d1
	bne.s	loc_201144
	move.w	#$6C,d1
	bra.s	loc_20117C

; ------------------------------------------------------------------------------

loc_201144:
	cmpi.b	#$10,d1
	bne.s	loc_201150
	move.w	#$6D,d1
	bra.s	loc_20117C

; ------------------------------------------------------------------------------

loc_201150:
	cmpi.b	#$63,d1
	bne.s	loc_20115C
	move.w	#$6E,d1
	bra.s	loc_20117C

; ------------------------------------------------------------------------------

loc_20115C:
	cmpi.b	#$43,d1
	bne.s	loc_20117C
	move.w	#$6F,d1
	bra.s	loc_20117C

; ------------------------------------------------------------------------------

loc_201168:
	btst	#6,obj.sprite_flags(a0)
	beq.s	loc_20117C
	addq.w	#1,d1
	cmpi.w	#$29,d1
	bne.s	loc_20117C
	move.w	#$51,d1

loc_20117C:
	subq.b	#1,d1
	ror.w	#7,d1
	move.w	d2,d0
	add.w	d0,d0
	andi.w	#$1E0,d0
	add.w	d0,d1
	move.w	d3,d0
	lsr.w	#3,d0
	andi.w	#$1E,d0
	add.w	d0,d1
	if STANDALONE<>0
		jsr	GetWrittenBlock2
	endif
	movea.l	d1,a1
	rts

; ------------------------------------------------------------------------------

CheckBlockY:
	bsr.w	GetBlock
	cmpi.l	#StageChunks,d1
	beq.s	loc_2011B2
	move.w	(a1),d0
	move.w	d0,d4
	andi.w	#$7FF,d0
	beq.s	loc_2011B2
	btst	d5,d4
	bne.s	loc_2011C0

loc_2011B2:
	add.w	a3,d2
	bsr.w	CheckBlockY2
	sub.w	a3,d2
	addi.w	#$10,d1
	rts

; ------------------------------------------------------------------------------

loc_2011C0:
	movea.l	stage_collision,a2
	move.b	(a2,d0.w),d0
	andi.w	#$FF,d0
	beq.s	loc_2011B2
	lea	StageCollisionAngles,a2
	move.b	(a2,d0.w),(a4)
	lsl.w	#4,d0
	move.w	d3,d1
	btst	#$B,d4
	beq.s	loc_2011E6
	not.w	d1
	neg.b	(a4)

loc_2011E6:
	btst	#$C,d4
	beq.s	loc_2011F6
	addi.b	#$40,(a4)
	neg.b	(a4)
	subi.b	#$40,(a4)

loc_2011F6:
	andi.w	#$F,d1
	add.w	d0,d1
	lea	StageCollisionColumns,a2
	move.b	(a2,d1.w),d0
	ext.w	d0
	eor.w	d6,d4
	btst	#$C,d4
	beq.s	loc_201212
	neg.w	d0

loc_201212:
	tst.w	d0
	beq.s	loc_2011B2
	bmi.s	loc_20122E
	cmpi.b	#$10,d0
	beq.s	loc_20124A

loc_20121E:
	move.w	d2,d1
	andi.w	#$F,d1
	add.w	d1,d0
	move.w	#$F,d1
	sub.w	d0,d1
	rts

; ------------------------------------------------------------------------------

loc_20122E:
	cmpa.w	#$10,a3
	bne.s	loc_20123E
	move.w	#$10,d0
	move.b	#0,(a4)
	bra.s	loc_20121E

; ------------------------------------------------------------------------------

loc_20123E:
	move.w	d2,d1
	andi.w	#$F,d1
	add.w	d1,d0
	bpl.w	loc_2011B2

loc_20124A:
	sub.w	a3,d2
	bsr.w	CheckBlockY2
	add.w	a3,d2
	subi.w	#$10,d1
	rts

; ------------------------------------------------------------------------------

CheckBlockY2:
	bsr.w	GetBlock
	cmpi.l	#StageChunks,d1
	beq.s	loc_201272
	move.w	(a1),d0
	move.w	d0,d4
	andi.w	#$7FF,d0
	beq.s	loc_201272
	btst	d5,d4
	bne.s	loc_201280

loc_201272:
	move.w	#$F,d1
	move.w	d2,d0
	andi.w	#$F,d0
	sub.w	d0,d1
	rts

; ------------------------------------------------------------------------------

loc_201280:
	movea.l	stage_collision,a2
	move.b	(a2,d0.w),d0
	andi.w	#$FF,d0
	beq.s	loc_201272
	lea	StageCollisionAngles,a2
	move.b	(a2,d0.w),(a4)
	lsl.w	#4,d0
	move.w	d3,d1
	btst	#$B,d4
	beq.s	loc_2012A6
	not.w	d1
	neg.b	(a4)

loc_2012A6:
	btst	#$C,d4
	beq.s	loc_2012B6
	addi.b	#$40,(a4)
	neg.b	(a4)
	subi.b	#$40,(a4)

loc_2012B6:
	andi.w	#$F,d1
	add.w	d0,d1
	lea	StageCollisionColumns,a2
	move.b	(a2,d1.w),d0
	ext.w	d0
	eor.w	d6,d4
	btst	#$C,d4
	beq.s	loc_2012D2
	neg.w	d0

loc_2012D2:
	tst.w	d0
	beq.s	loc_201272
	bmi.s	loc_2012E8

loc_2012D8:
	move.w	d2,d1
	andi.w	#$F,d1
	add.w	d1,d0
	move.w	#$F,d1
	sub.w	d0,d1
	rts

; ------------------------------------------------------------------------------

loc_2012E8:
	cmpa.w	#$10,a3
	bne.s	loc_2012F8
	move.w	#$10,d0
	move.b	#0,(a4)
	bra.s	loc_2012D8

; ------------------------------------------------------------------------------

loc_2012F8:
	move.w	d2,d1
	andi.w	#$F,d1
	add.w	d1,d0
	bpl.w	loc_201272
	not.w	d1
	rts

; ------------------------------------------------------------------------------

CheckBlockX:
	bsr.w	GetBlock
	cmpi.l	#StageChunks,d1
	beq.s	loc_201322
	move.w	(a1),d0
	move.w	d0,d4
	andi.w	#$7FF,d0
	beq.s	loc_201322
	btst	d5,d4
	bne.s	loc_201330

loc_201322:
	add.w	a3,d3
	bsr.w	CheckBlockX2
	sub.w	a3,d3
	addi.w	#$10,d1
	rts

; ------------------------------------------------------------------------------

loc_201330:
	movea.l	stage_collision,a2
	move.b	(a2,d0.w),d0
	andi.w	#$FF,d0
	beq.s	loc_201322
	lea	StageCollisionAngles,a2
	move.b	(a2,d0.w),(a4)
	lsl.w	#4,d0
	move.w	d2,d1
	btst	#$C,d4
	beq.s	loc_20135E
	not.w	d1
	addi.b	#$40,(a4)
	neg.b	(a4)
	subi.b	#$40,(a4)

loc_20135E:
	btst	#$B,d4
	beq.s	loc_201366
	neg.b	(a4)

loc_201366:
	andi.w	#$F,d1
	add.w	d0,d1
	lea	StageCollisionRows,a2
	move.b	(a2,d1.w),d0
	ext.w	d0
	eor.w	d6,d4
	btst	#$B,d4
	beq.s	loc_201382
	neg.w	d0

loc_201382:
	tst.w	d0
	beq.s	loc_201322
	bmi.s	loc_20139E
	cmpi.b	#$10,d0
	beq.s	loc_2013AA
	move.w	d3,d1
	andi.w	#$F,d1
	add.w	d1,d0
	move.w	#$F,d1
	sub.w	d0,d1
	rts

; ------------------------------------------------------------------------------

loc_20139E:
	move.w	d3,d1
	andi.w	#$F,d1
	add.w	d1,d0
	bpl.w	loc_201322

loc_2013AA:
	sub.w	a3,d3
	bsr.w	CheckBlockX2
	add.w	a3,d3
	subi.w	#$10,d1
	rts

; ------------------------------------------------------------------------------

CheckBlockX2:
	bsr.w	GetBlock
	cmpi.l	#StageChunks,d1
	beq.s	loc_2013D2
	move.w	(a1),d0
	move.w	d0,d4
	andi.w	#$7FF,d0
	beq.s	loc_2013D2
	btst	d5,d4
	bne.s	loc_2013E0

loc_2013D2:
	move.w	#$F,d1
	move.w	d3,d0
	andi.w	#$F,d0
	sub.w	d0,d1
	rts

; ------------------------------------------------------------------------------

loc_2013E0:
	movea.l	stage_collision,a2
	move.b	(a2,d0.w),d0
	andi.w	#$FF,d0
	beq.s	loc_2013D2
	lea	StageCollisionAngles,a2
	move.b	(a2,d0.w),(a4)
	lsl.w	#4,d0
	move.w	d2,d1
	btst	#$C,d4
	beq.s	loc_20140E
	not.w	d1
	addi.b	#$40,(a4)
	neg.b	(a4)
	subi.b	#$40,(a4)

loc_20140E:
	btst	#$B,d4
	beq.s	loc_201416
	neg.b	(a4)

loc_201416:
	andi.w	#$F,d1
	add.w	d0,d1
	lea	StageCollisionRows,a2
	move.b	(a2,d1.w),d0
	ext.w	d0
	eor.w	d6,d4
	btst	#$B,d4
	beq.s	loc_201432
	neg.w	d0

loc_201432:
	tst.w	d0
	beq.s	loc_2013D2
	bmi.s	loc_201448
	move.w	d3,d1
	andi.w	#$F,d1
	add.w	d1,d0
	move.w	#$F,d1
	sub.w	d0,d1
	rts

; ------------------------------------------------------------------------------

loc_201448:
	move.w	d3,d1
	andi.w	#$F,d1
	add.w	d1,d0
	bpl.w	loc_2013D2
	not.w	d1
	rts

; ------------------------------------------------------------------------------

ConvertStageCollision:
	rts

; ------------------------------------------------------------------------------

	lea	StageCollisionColumns,a1
	lea	StageCollisionColumns,a2
	move.w	#$FF,d3

loc_20146A:
	moveq	#$10,d5
	move.w	#$F,d2

loc_201470:
	moveq	#0,d4
	move.w	#$F,d1

loc_201476:
	move.w	(a1)+,d0
	lsr.l	d5,d0
	addx.w	d4,d4
	dbf	d1,loc_201476
	move.w	d4,(a2)+
	suba.w	#$20,a1
	subq.w	#1,d5
	dbf	d2,loc_201470
	adda.w	#$20,a1
	dbf	d3,loc_20146A
	lea	StageCollisionColumns,a1
	lea	StageCollisionRows,a2
	bsr.s	sub_2014AE
	lea	StageCollisionColumns,a1
	lea	StageCollisionColumns,a2

; ------------------------------------------------------------------------------

sub_2014AE:
	move.w	#$FFF,d3

loc_2014B2:
	moveq	#0,d2
	move.w	#$F,d1
	move.w	(a1)+,d0
	beq.s	loc_2014E0
	bmi.s	loc_2014CA

loc_2014BE:
	lsr.w	#1,d0
	bcc.s	loc_2014C4
	addq.b	#1,d2

loc_2014C4:
	dbf	d1,loc_2014BE
	bra.s	loc_2014E2

; ------------------------------------------------------------------------------

loc_2014CA:
	cmpi.w	#$FFFF,d0
	beq.s	loc_2014DC

loc_2014D0:
	lsl.w	#1,d0
	bcc.s	loc_2014D6
	subq.b	#1,d2

loc_2014D6:
	dbf	d1,loc_2014D0
	bra.s	loc_2014E2

; ------------------------------------------------------------------------------

loc_2014DC:
	move.w	#$10,d0

loc_2014E0:
	move.w	d0,d2

loc_2014E2:
	move.b	d2,(a2)+
	dbf	d3,loc_2014B2
	rts

; ------------------------------------------------------------------------------
