; ------------------------------------------------------------------------------

PlayerCheckBlock:
	cmpi.b	#$2B,obj.anim_id(a0)
	beq.s	locret_2066FA
	bsr.s	sub_2066FC

locret_2066FA:
	rts

; ------------------------------------------------------------------------------

sub_2066FC:
	move.w	obj.x_speed(a0),d1
	move.w	obj.y_speed(a0),d2
	jsr	Atan2
	subi.b	#$20,d0
	andi.b	#$C0,d0
	cmpi.b	#$40,d0
	beq.w	loc_2067E0
	cmpi.b	#$80,d0
	beq.w	loc_206766
	cmpi.b	#$C0,d0
	beq.w	loc_2067A2
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d3
	bsr.w	sub_20681E
	bne.s	locret_206764
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d3
	bra.w	sub_20681E

; ------------------------------------------------------------------------------

locret_206764:
	rts

; ------------------------------------------------------------------------------

loc_206766:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	move.b	obj.height(a0),d0
	ext.w	d0
	sub.w	d0,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d3
	bsr.w	sub_20681E
	bne.s	locret_2067A0
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	move.b	obj.height(a0),d0
	ext.w	d0
	sub.w	d0,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d3
	bra.w	sub_20681E

; ------------------------------------------------------------------------------

locret_2067A0:
	rts

; ------------------------------------------------------------------------------

loc_2067A2:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d3
	move.b	obj.height(a0),d0
	subq.b	#6,d0
	ext.w	d0
	sub.w	d0,d2
	bsr.w	sub_20681E
	bne.s	locret_2067DE
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d3
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	bra.w	sub_20681E

; ------------------------------------------------------------------------------

locret_2067DE:
	rts

; ------------------------------------------------------------------------------

loc_2067E0:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d3
	move.b	obj.height(a0),d0
	subq.b	#6,d0
	ext.w	d0
	sub.w	d0,d2
	bsr.w	sub_20681E
	bne.s	locret_20681C
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d3
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	bra.w	sub_20681E

; ------------------------------------------------------------------------------

locret_20681C:
	rts

; ------------------------------------------------------------------------------

sub_20681E:
	jsr	GetBlock
	move.w	(a1),d0
	move.w	d0,d4
	andi.w	#$7FF,d0
	beq.s	loc_206862
	moveq	#0,d1
	move.b	time_zone,d1
	bclr	#7,d1
	cmpi.b	#2,d1
	bne.s	loc_206846
	add.b	good_future,d1

loc_206846:
	add.w	d1,d1
	move.w	PlayerBlocks(pc,d1.w),d1
	lea	PlayerBlocks(pc,d1.w),a1
	moveq	#0,d6
	move.w	(a1)+,d6
	moveq	#0,d1

loc_206856:
	cmp.w	(a1,d1.w),d0
	beq.s	loc_2068DA
	addq.w	#2,d1
	dbf	d6,loc_206856

loc_206862:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

PlayerBlocks:
	dc.w	PlayerBlocksB-*
	dc.w	PlayerBlocksA-PlayerBlocks
	dc.w	PlayerBlocksD-PlayerBlocks
	dc.w	PlayerBlocksC-PlayerBlocks

PlayerBlocksA:
	dc.w	$F
	dc.w	$13C
	dc.w	$146
	dc.w	$19B
	dc.w	$1AE
	dc.w	$83
	dc.w	$84
	dc.w	$89
	dc.w	$8A
	dc.w	$77
	dc.w	$76
	dc.w	$80
	dc.w	$7F
	dc.w	$7E
	dc.w	$7D
	dc.w	$7C
	dc.w	$82

PlayerBlocksB:
	dc.w	1
	dc.w	$145
	dc.w	$146

PlayerBlocksC:
	dc.w	$F
	dc.w	$13C
	dc.w	$146
	dc.w	0
	dc.w	0
	dc.w	$83
	dc.w	$84
	dc.w	$89
	dc.w	$8A
	dc.w	$77
	dc.w	$76
	dc.w	$80
	dc.w	$7F
	dc.w	$7E
	dc.w	$7D
	dc.w	$7C
	dc.w	$82

PlayerBlocksD:
	dc.w	$F
	dc.w	$13C
	dc.w	$146
	dc.w	$165
	dc.w	$166
	dc.w	$83
	dc.w	$84
	dc.w	$89
	dc.w	$8A
	dc.w	$77
	dc.w	$76
	dc.w	$80
	dc.w	$7F
	dc.w	$7E
	dc.w	$7D
	dc.w	$7C
	dc.w	$82

; ------------------------------------------------------------------------------

loc_2068DA:
	cmpi.b	#4,obj.routine(a0)
	bne.s	loc_2068EC
	subq.b	#2,obj.routine(a0)
	move.w	#120,obj.var_30(a0)

loc_2068EC:
	move.b	#0,r3_no_bumper
	move.l	d1,-(sp)
	move.w	off_206930(pc,d1.w),d0
	jsr	off_206930(pc,d0.w)
	move.l	(sp)+,d1
	cmpi.w	#3,d1
	bcs.s	loc_206920
	move.w	#$BE,d0
	cmpi.b	#4,d1
	beq.s	loc_20691A
	cmpi.b	#6,d1
	beq.s	loc_20691A
	move.w	#$B5,d0

loc_20691A:
	jsr	PlayFmSound

loc_206920:
	tst.b	r3_no_bumper
	beq.s	loc_20692C
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20692C:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

off_206930:
	dc.w	PlayerCheckBlock_2_Routine0-*
	dc.w	PlayerCheckBlock_2_Routine0-off_206930
	dc.w	PlayerCheckBlock_2_Routine4-off_206930
	dc.w	PlayerCheckBlock_2_Routine4-off_206930
	dc.w	PlayerCheckBlock_2_Routine8-off_206930
	dc.w	PlayerCheckBlock_2_RoutineA-off_206930
	dc.w	PlayerCheckBlock_2_RoutineC-off_206930
	dc.w	PlayerCheckBlock_2_RoutineC-off_206930
	dc.w	PlayerCheckBlock_2_Routine10-off_206930
	dc.w	PlayerCheckBlock_2_Routine12-off_206930
	dc.w	PlayerCheckBlock_2_Routine12-off_206930
	dc.w	PlayerCheckBlock_2_Routine12-off_206930
	dc.w	PlayerCheckBlock_2_Routine18-off_206930
	dc.w	PlayerCheckBlock_2_RoutineA-off_206930
	dc.w	PlayerCheckBlock_2_RoutineA-off_206930
	dc.w	PlayerCheckBlock_2_Routine1E-off_206930

; ------------------------------------------------------------------------------

PlayerCheckBlock_2_Routine0:
	andi.w	#$FFF0,d2
	tst.b	d1
	bne.s	loc_20695C
	addi.w	#$10,d2

loc_20695C:
	andi.w	#$FFF0,d3
	btst	#$B,d4
	bne.s	loc_20696A
	addi.w	#$10,d3

loc_20696A:
	move.w	d3,d1
	movem.l	d1-d2,-(sp)
	sub.w	obj.x(a0),d1
	sub.w	obj.y(a0),d2
	jsr	Atan2
	jsr	SineCosine
	muls.w	#-$700,d1
	asr.l	#8,d1
	move.w	d1,obj.x_speed(a0)
	muls.w	#-$700,d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a0)
	bset	#1,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	clr.b	obj.var_3c(a0)
	movem.l	(sp)+,d1-d2
	move.w	d2,d4
	move.w	d1,d5
	jsr	SpawnObject
	bne.s	loc_2069CC
	move.b	#$29,obj.id(a1)
	move.w	d5,obj.x(a1)
	move.w	d4,obj.y(a1)

loc_2069CC:
	move.w	#0,d3
	jsr	PlaceBlock
	subi.w	#$10,d5
	jsr	PlaceBlock
	subi.w	#$10,d4
	jsr	PlaceBlock
	addi.w	#$10,d5
	jsr	PlaceBlock
	move.w	#$92,d0
	jsr	SubCpuCommand
	rts

; ------------------------------------------------------------------------------

PlayerCheckBlock_2_Routine4:
	andi.w	#$FFF0,d2
	addq.w	#8,d2
	andi.w	#$FFF0,d3
	addq.w	#8,d3
	move.w	d3,d1
	sub.w	obj.x(a0),d1
	sub.w	obj.y(a0),d2
	jsr	Atan2
	jsr	SineCosine
	muls.w	#-$700,d1
	asr.l	#8,d1
	asr.l	#1,d1
	move.w	d1,obj.x_speed(a0)
	muls.w	#-$700,d0
	asr.l	#8,d0
	asr.l	#1,d0
	move.w	d0,obj.y_speed(a0)

loc_206A3A:
	bset	#1,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	clr.b	obj.var_3c(a0)
	rts

; ------------------------------------------------------------------------------

PlayerCheckBlock_2_RoutineA:
	move.w	#$700,d0
	tst.w	obj.y_speed(a0)
	bmi.s	loc_206A5E
	neg.w	d0

loc_206A5E:
	move.w	d0,obj.y_speed(a0)
	bra.s	loc_206A3A

; ------------------------------------------------------------------------------

PlayerCheckBlock_2_RoutineC:
	move.w	#$700,d0
	tst.w	obj.x_speed(a0)
	bmi.s	loc_206A70
	neg.w	d0

loc_206A70:
	move.w	d0,obj.x_speed(a0)
	bra.s	loc_206A3A

; ------------------------------------------------------------------------------

PlayerCheckBlock_2_Routine1E:
	andi.w	#$FFF0,d2
	addq.w	#8,d2
	andi.w	#$FFF0,d3
	addq.w	#8,d3
	move.w	d3,d1
	sub.w	obj.x(a0),d1
	sub.w	obj.y(a0),d2
	jsr	Atan2
	jsr	SineCosine
	muls.w	#-$700,d1
	asr.l	#8,d1
	move.w	d1,obj.x_speed(a0)
	muls.w	#-$700,d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a0)
	bra.s	loc_206A3A

; ------------------------------------------------------------------------------

PlayerCheckBlock_2_Routine18:
	move.w	d3,d1
	andi.w	#$F,d1
	cmpi.b	#8,d1
	bcc.s	loc_206AC2
	btst	#$B,d4
	bne.s	PlayerCheckBlock_2_RoutineC
	bra.s	PlayerCheckBlock_2_RoutineA

; ------------------------------------------------------------------------------

loc_206AC2:
	btst	#$B,d4
	bne.s	PlayerCheckBlock_2_RoutineA
	bra.s	PlayerCheckBlock_2_RoutineC

; ------------------------------------------------------------------------------

PlayerCheckBlock_2_Routine12:
	subi.w	#$12,d1
	bmi.s	loc_206AFC
	move.w	PlayerBumperCollide(pc,d1.w),d0
	lea	PlayerBumperCollide(pc,d0.w),a1
	andi.w	#$F,d2
	andi.w	#$F,d3
	btst	#$B,d4
	bne.s	loc_206AEC
	neg.b	d3
	addi.b	#$F,d3

loc_206AEC:
	cmp.b	(a1,d3.w),d2
	bcc.s	loc_206AFC
	move.b	#1,r3_no_bumper
	rts

; ------------------------------------------------------------------------------

loc_206AFC:
	move.w	obj.x_speed(a0),d1
	move.w	obj.y_speed(a0),d2
	jsr	Atan2
	addi.b	#-$80,d0
	neg.b	d0
	subi.b	#$20,d0
	btst	#$B,d4
	beq.s	loc_206B1E
	addi.b	#$40,d0

loc_206B1E:
	jsr	SineCosine
	muls.w	#$F900,d1
	asr.l	#8,d1
	move.w	d1,obj.x_speed(a0)
	muls.w	#$F900,d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a0)
	bra.w	loc_206A3A

; ------------------------------------------------------------------------------

PlayerBumperCollide:
	dc.w	PlayerBumperCollide1-*
	dc.w	PlayerBumperCollide2-PlayerBumperCollide
	dc.w	PlayerBumperCollide3-PlayerBumperCollide

PlayerBumperCollide1:
	dc.b	1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6

PlayerBumperCollide2:
	dc.b	6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 9, $A, $A, $A, $B, $B

PlayerBumperCollide3:
	dc.b	$B, $C, $C, $C, $D, $D, $D, $E, $E, $E, $F, $F, $F, $10, $10, $10

; ------------------------------------------------------------------------------

PlayerCheckBlock_2_Routine10:
	move.w	d3,d1
	andi.w	#$F,d1
	cmpi.b	#8,d1
	bcc.s	loc_206B8A
	btst	#$B,d4
	bne.w	PlayerCheckBlock_2_RoutineC
	bra.w	PlayerCheckBlock_2_Routine12

; ------------------------------------------------------------------------------

loc_206B8A:
	btst	#$B,d4
	bne.w	PlayerCheckBlock_2_RoutineA
	bra.w	PlayerCheckBlock_2_Routine12

; ------------------------------------------------------------------------------

PlayerCheckBlock_2_Routine8:
	move.w	d3,d1
	andi.w	#$F,d1
	cmpi.b	#8,d1
	bcc.s	loc_206BAE
	btst	#$B,d4
	bne.w	PlayerCheckBlock_2_RoutineA
	bra.w	PlayerCheckBlock_2_Routine1E

; ------------------------------------------------------------------------------

loc_206BAE:
	btst	#$B,d4
	bne.w	PlayerCheckBlock_2_Routine1E
	bra.w	PlayerCheckBlock_2_RoutineA

; ------------------------------------------------------------------------------

	move.w	d2,d1
	andi.w	#$F,d1
	cmpi.b	#8,d1
	bcc.s	loc_206BD2
	btst	#$C,d4
	bne.w	PlayerCheckBlock_2_RoutineC
	bra.w	PlayerCheckBlock_2_Routine1E

; ------------------------------------------------------------------------------

loc_206BD2:
	btst	#$C,d4
	bne.w	PlayerCheckBlock_2_Routine1E
	bra.w	PlayerCheckBlock_2_RoutineC

; ------------------------------------------------------------------------------
