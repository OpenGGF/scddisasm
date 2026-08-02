; ------------------------------------------------------------------------------

PlayerCheckBlock:
	bsr.s	sub_20665A

locret_206658:
	rts

; ------------------------------------------------------------------------------

sub_20665A:
	tst.b	(boss_flags).w
	bne.s	locret_206658
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	addq.w	#2,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d3
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	bsr.s	sub_2066BA
	bne.w	loc_2068AA
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	addq.w	#2,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d3
	jsr	GetBlock
	move.w	(a1),d0
	andi.w	#$7FF,d0
	bsr.s	sub_2066BA
	bne.w	loc_2068AA
	rts

; ------------------------------------------------------------------------------

sub_2066BA:
	moveq	#0,d1
	move.b	(time_zone).l,d1
	andi.b	#$7F,d1
	cmpi.b	#2,d1
	bne.s	loc_2066D2
	add.b	(good_future).l,d1

loc_2066D2:
	add.w	d1,d1
	move.w	PlayerBlocks(pc,d1.w),d1
	lea	PlayerBlocks(pc,d1.w),a1
	moveq	#0,d6
	move.w	(a1)+,d6
	moveq	#0,d1

loc_2066E2:
	cmp.w	(a1,d1.w),d0
	beq.s	loc_2066F2
	addq.w	#2,d1
	dbf	d6,loc_2066E2
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_2066F2:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

PlayerBlocks:
	dc.w	PlayerBlocksB-*
	dc.w	PlayerBlocksA-PlayerBlocks
	dc.w	PlayerBlocksD-PlayerBlocks
	dc.w	PlayerBlocksC-PlayerBlocks

PlayerBlocksA:
	dc.w	$2C
	dc.w	1
	dc.w	2
	dc.w	3
	dc.w	4
	dc.w	5
	dc.w	6
	dc.w	7
	dc.w	8
	dc.w	9
	dc.w	$E
	dc.w	$F
	dc.w	$11
	dc.w	$12
	dc.w	$13
	dc.w	$23
	dc.w	$24
	dc.w	$25
	dc.w	$26
	dc.w	$27
	dc.w	$31
	dc.w	$3D
	dc.w	$3E
	dc.w	$3F
	dc.w	$40
	dc.w	$47
	dc.w	$48
	dc.w	$49
	dc.w	$4A
	dc.w	$190
	dc.w	$193
	dc.w	$194
	dc.w	$195
	dc.w	$196
	dc.w	$197
	dc.w	$198
	dc.w	$199
	dc.w	$19A
	dc.w	$19B
	dc.w	$19D
	dc.w	$19F
	dc.w	$1A6
	dc.w	$1A7
	dc.w	$1A8
	dc.w	$1C0
	dc.w	$1C2
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0

PlayerBlocksB:
	dc.w	$31
	dc.w	1
	dc.w	2
	dc.w	3
	dc.w	4
	dc.w	5
	dc.w	6
	dc.w	7
	dc.w	8
	dc.w	9
	dc.w	$A
	dc.w	$B
	dc.w	$E
	dc.w	$F
	dc.w	$11
	dc.w	$12
	dc.w	$13
	dc.w	$23
	dc.w	$24
	dc.w	$25
	dc.w	$26
	dc.w	$27
	dc.w	$31
	dc.w	$3B
	dc.w	$3C
	dc.w	$3D
	dc.w	$3E
	dc.w	$3F
	dc.w	$40
	dc.w	$47
	dc.w	$48
	dc.w	$49
	dc.w	$4A
	dc.w	$190
	dc.w	$193
	dc.w	$194
	dc.w	$195
	dc.w	$196
	dc.w	$197
	dc.w	$198
	dc.w	$199
	dc.w	$19A
	dc.w	$19B
	dc.w	$19D
	dc.w	$19F
	dc.w	$1A6
	dc.w	$1A7
	dc.w	$1A8
	dc.w	$1E3
	dc.w	$1E4
	dc.w	$1E5

PlayerBlocksC:
	dc.w	$33
	dc.w	1
	dc.w	2
	dc.w	3
	dc.w	4
	dc.w	5
	dc.w	6
	dc.w	7
	dc.w	8
	dc.w	9
	dc.w	$A
	dc.w	$B
	dc.w	$C
	dc.w	$D
	dc.w	$E
	dc.w	$F
	dc.w	$11
	dc.w	$12
	dc.w	$13
	dc.w	$23
	dc.w	$24
	dc.w	$25
	dc.w	$26
	dc.w	$27
	dc.w	$31
	dc.w	$3D
	dc.w	$3E
	dc.w	$3F
	dc.w	$40
	dc.w	$47
	dc.w	$48
	dc.w	$49
	dc.w	$4A
	dc.w	$4B
	dc.w	$190
	dc.w	$193
	dc.w	$194
	dc.w	$195
	dc.w	$196
	dc.w	$197
	dc.w	$198
	dc.w	$199
	dc.w	$19A
	dc.w	$19B
	dc.w	$19D
	dc.w	$19E
	dc.w	$19F
	dc.w	$1A7
	dc.w	$1A8
	dc.w	$1E7
	dc.w	$1E8
	dc.w	$1EA
	dc.w	$1ED
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0

PlayerBlocksD:
	dc.w	$31
	dc.w	1
	dc.w	2
	dc.w	3
	dc.w	4
	dc.w	5
	dc.w	6
	dc.w	7
	dc.w	8
	dc.w	9
	dc.w	$A
	dc.w	$B
	dc.w	$E
	dc.w	$F
	dc.w	$11
	dc.w	$12
	dc.w	$13
	dc.w	$23
	dc.w	$24
	dc.w	$25
	dc.w	$26
	dc.w	$27
	dc.w	$31
	dc.w	$3D
	dc.w	$3E
	dc.w	$3F
	dc.w	$40
	dc.w	$47
	dc.w	$48
	dc.w	$49
	dc.w	$4A
	dc.w	$4B
	dc.w	$190
	dc.w	$193
	dc.w	$194
	dc.w	$195
	dc.w	$196
	dc.w	$197
	dc.w	$198
	dc.w	$199
	dc.w	$19A
	dc.w	$19B
	dc.w	$19D
	dc.w	$19E
	dc.w	$19F
	dc.w	$1A7
	dc.w	$1A8
	dc.w	$1E8
	dc.w	$1E9
	dc.w	$1EB
	dc.w	$1F4

; ------------------------------------------------------------------------------

loc_2068AA:
	move.b	(time_zone).l,d1
	move.l	#$8000,d0
	tst.b	d1
	beq.s	loc_2068CA
	move.l	#$10000,d0
	subq.b	#1,d1
	beq.s	loc_2068CA
	move.l	#$20000,d0

loc_2068CA:
	move.b	#$C0,d1
	tst.b	(r5_conveyor_reverse).l
	beq.s	loc_2068DA
	neg.l	d0
	neg.b	d1

loc_2068DA:
	add.l	d0,obj.x(a0)
	move.b	d1,d0
	jsr	PlayerCheckBlockFront
	tst.w	d1
	bpl.s	locret_2068F8
	tst.b	(r5_conveyor_reverse).l
	beq.s	loc_2068F4
	neg.w	d1

loc_2068F4:
	add.w	d1,obj.x(a0)

locret_2068F8:
	rts
	
; ------------------------------------------------------------------------------