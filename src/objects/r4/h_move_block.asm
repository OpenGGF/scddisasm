; ------------------------------------------------------------------------------

HMoveBlockObject:
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.b	d0,d0
	move.w	off_20C200(pc,d0.w),d0
	jmp	off_20C200(pc,d0.w)

; ------------------------------------------------------------------------------

off_20C200:
	dc.w	HMoveBlockObject_0_Routine0-*
	dc.w	HMoveBlockObject_0_Routine0-off_20C200
	dc.w	HMoveBlockObject_0_Routine4-off_20C200
	dc.w	HMoveBlockObject_0_Routine6-off_20C200
	dc.w	HMoveBlockObject_0_Routine8-off_20C200
	dc.w	HMoveBlockObject_0_RoutineA-off_20C200
	dc.w	HMoveBlockObject_0_RoutineC-off_20C200
	dc.w	HMoveBlockObject_0_Routine0-off_20C200
	dc.w	HMoveBlockObject_0_Routine10-off_20C200

; ------------------------------------------------------------------------------

sub_20C212:
	lea	player_object,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

loc_20C224:
	move.w	obj.var_36(a0),d0
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20C242
	rts

; ------------------------------------------------------------------------------

loc_20C242:
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_20C266
	lea	object_states,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)

loc_20C266:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

HMoveBlockObject_0_Routine0:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C284(pc,d0.w),d0
	jsr	off_20C284(pc,d0.w)
	jsr	DrawObject
	bra.w	loc_20C224

; ------------------------------------------------------------------------------

off_20C284:
	dc.w	HMoveBlockObject_1_Routine0-*
	dc.w	HMoveBlockObject_1_Routine2-off_20C284

; ------------------------------------------------------------------------------

HMoveBlockObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#HMoveBlockSprites1,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_32(a0)
	move.b	#$30,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#1,obj.sprite_frame(a0)
	tst.b	obj.var_3c(a0)
	bne.w	HMoveBlockObject_1_Routine2
	move.w	obj.x(a0),obj.var_36(a0)
	tst.b	obj.var_3d(a0)
	bne.w	loc_20C318
	moveq	#1,d1
	moveq	#4,d2

loc_20C2D8:
	jsr	SpawnObject
	bne.s	loc_20C312
	move.b	#$24,obj.id(a1)
	move.b	#1,obj.subtype(a1)
	move.b	d1,obj.var_3d(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.b	d1,d0
	asl.b	#5,d0
	addi.b	#$10,d0
	move.b	d0,obj.var_3a(a1)
	moveq	#0,d0
	move.b	d1,d0
	mulu.w	#$60,d0
	add.w	obj.y(a0),d0
	move.w	d0,obj.y(a1)

loc_20C312:
	addq.b	#1,d1
	dbf	d2,loc_20C2D8

loc_20C318:
	jsr	SpawnObject
	bne.s	HMoveBlockObject_1_Routine2
	move.b	#$24,obj.id(a1)
	move.b	#1,obj.subtype(a1)
	move.b	#1,obj.var_3c(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.x(a0),d0
	addi.w	#$E0,d0
	move.w	d0,obj.x(a1)
	move.b	obj.var_3a(a0),obj.var_3a(a1)

HMoveBlockObject_1_Routine2:
	move.w	obj.x(a0),-(sp)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	jsr	SineCosine
	asr.w	#3,d0
	addq.b	#1,obj.var_3a(a0)
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.x(a0)
	move.w	(sp)+,d1
	sub.w	d1,d0
	asl.w	#8,d0
	move.w	d0,obj.x_speed(a0)
	bra.w	sub_20C212

; ------------------------------------------------------------------------------

HMoveBlockSprites1:
	include	"src/sprites/r4/h_move_block_1.asm"
	even

; ------------------------------------------------------------------------------

HMoveBlockObject_0_Routine4:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C3BE(pc,d0.w),d0
	jsr	off_20C3BE(pc,d0.w)
	jsr	DrawObject
	bra.w	loc_20C224

; ------------------------------------------------------------------------------

off_20C3BE:
	dc.w	HMoveBlockObject_3_Routine0-*
	dc.w	HMoveBlockObject_3_Routine2-off_20C3BE

; ------------------------------------------------------------------------------

HMoveBlockObject_3_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#HMoveBlockSprites2,obj.sprite_data(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.s	HMoveBlockObject_3_Routine2
	move.w	obj.x(a0),d0
	move.w	d0,obj.var_36(a0)
	move.w	obj.x(a0),d0
	subi.w	#$20,d0
	move.w	d0,obj.var_32(a0)
	jsr	SpawnObject
	bne.s	HMoveBlockObject_3_Routine2
	move.b	#$24,obj.id(a1)
	move.b	#2,obj.subtype(a1)
	move.b	#1,obj.var_3c(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.x(a0),d0
	addi.w	#$40,d0
	move.w	d0,obj.x(a1)
	addi.w	#$20,d0
	move.w	d0,obj.var_32(a1)
	move.b	obj.var_3a(a0),d0
	subi.b	#$80,d0
	move.b	d0,obj.var_3a(a1)

HMoveBlockObject_3_Routine2:
	move.w	obj.x(a0),-(sp)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	jsr	SineCosine
	asr.w	#3,d0
	addq.b	#1,obj.var_3a(a0)
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.x(a0)
	move.w	(sp)+,d1
	sub.w	d1,d0
	asl.w	#8,d0
	move.w	d0,obj.x_speed(a0)
	bra.w	sub_20C212

; ------------------------------------------------------------------------------

HMoveBlockSprites2:
	include	"src/sprites/r4/h_move_block_2.asm"
	even

; ------------------------------------------------------------------------------

HMoveBlockObject_0_Routine6:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C49E(pc,d0.w),d0
	jsr	off_20C49E(pc,d0.w)
	jsr	DrawObject
	bra.w	loc_20C224

; ------------------------------------------------------------------------------

off_20C49E:
	dc.w	HMoveBlockObject_4_Routine0-*
	dc.w	HMoveBlockObject_4_Routine2-off_20C49E

; ------------------------------------------------------------------------------

HMoveBlockObject_4_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#HMoveBlockSprites3,obj.sprite_data(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.s	loc_20C50C
	move.w	obj.x(a0),obj.var_36(a0)
	moveq	#1,d1
	moveq	#4,d2

loc_20C4DC:
	jsr	SpawnObject
	bne.s	loc_20C506
	move.b	#$24,obj.id(a1)
	move.b	#3,obj.subtype(a1)
	move.b	d1,obj.var_3c(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

loc_20C506:
	addq.b	#1,d1
	dbf	d2,loc_20C4DC

loc_20C50C:
	moveq	#0,d1
	move.b	obj.var_3c(a0),d0
	add.b	d0,d0
	add.b	d0,d0
	add.b	obj.var_3c(a0),d0
	add.b	obj.var_3c(a0),d0
	lea	word_20C53C(pc,d0.w),a2
	move.w	(a2)+,d0
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a0)
	move.w	(a2)+,d0
	add.w	obj.y(a0),d0
	move.w	d0,obj.y(a0)
	move.w	(a2)+,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

word_20C53C:
	dc.w	0, 0, -$80
	dc.w	-$90, 0, -$80
	dc.w	$90, 0, -$80
	dc.w	0, $40, $80
	dc.w	-$90, $40, $80
	dc.w	$90, $40, $80

; ------------------------------------------------------------------------------

HMoveBlockObject_4_Routine2:
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.x(a0)
	bsr.s	sub_20C592
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20C590
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20C586
	neg.w	d0

loc_20C586:
	cmpi.w	#$40,d0
	bcc.s	locret_20C590
	bsr.w	sub_20C212

locret_20C590:
	rts

; ------------------------------------------------------------------------------

sub_20C592:
	tst.w	obj.x_speed(a0)
	bpl.w	loc_20C5B8
	move.w	obj.var_36(a0),d0
	sub.w	obj.x(a0),d0
	bcs.s	locret_20C5B6
	cmpi.w	#$E0,d0
	bcs.s	locret_20C5B6
	move.w	obj.var_36(a0),d0
	addi.w	#$E0,d0
	move.w	d0,obj.x(a0)

locret_20C5B6:
	rts

; ------------------------------------------------------------------------------

loc_20C5B8:
	move.w	obj.x(a0),d0
	sub.w	obj.var_36(a0),d0
	bcs.s	locret_20C5D4
	cmpi.w	#$E0,d0
	bcs.s	locret_20C5D4
	move.w	obj.var_36(a0),d0
	subi.w	#$E0,d0
	move.w	d0,obj.x(a0)

locret_20C5D4:
	rts

; ------------------------------------------------------------------------------

HMoveBlockSprites3:
	include	"src/sprites/r4/h_move_block_3.asm"
	even

; ------------------------------------------------------------------------------

HMoveBlockObject_0_Routine8:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C606(pc,d0.w),d0
	jsr	off_20C606(pc,d0.w)
	jsr	DrawObject
	bra.w	loc_20C224

; ------------------------------------------------------------------------------

off_20C606:
	dc.w	HMoveBlockObject_5_Routine0-*
	dc.w	HMoveBlockObject_5_Routine2-off_20C606

; ------------------------------------------------------------------------------

HMoveBlockObject_5_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#HMoveBlockSprites4,obj.sprite_data(a0)
	move.b	#$40,obj.width_2(a0)
	move.b	#$40,obj.height(a0)
	tst.b	obj.var_3d(a0)
	beq.s	loc_20C648
	move.l	#HMoveBlockSprites1,obj.sprite_data(a0)
	move.b	#$10,obj.height(a0)

loc_20C648:
	tst.b	obj.var_3c(a0)
	bne.s	loc_20C698
	move.w	obj.x(a0),obj.var_36(a0)
	jsr	SpawnObject
	bne.s	loc_20C698
	move.b	#$24,obj.id(a1)
	move.b	#4,obj.subtype(a1)
	move.b	#1,obj.var_3c(a1)
	move.b	obj.var_3d(a0),obj.var_3d(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.var_36(a0),d0
	addi.w	#$80,d0
	move.w	d0,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.var_36(a0),d0
	subi.w	#$80,d0
	move.w	d0,obj.x(a0)

loc_20C698:
	move.w	#-$200,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

HMoveBlockObject_5_Routine2:
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.x(a0)
	bsr.w	sub_20C212
	move.w	obj.var_36(a0),d0
	sub.w	obj.x(a0),d0
	bcs.s	locret_20C6C2
	cmpi.w	#$100,d0
	bne.s	locret_20C6C2
	bsr.s	sub_20C6C4

locret_20C6C2:
	rts

; ------------------------------------------------------------------------------

sub_20C6C4:
	move.w	obj.var_36(a0),d1
	addi.w	#$100,d1
	move.w	d1,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

HMoveBlockSprites4:
	include	"src/sprites/r4/h_move_block_4.asm"
	even

; ------------------------------------------------------------------------------

HMoveBlockObject_0_RoutineA:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C6EE(pc,d0.w),d0
	jsr	off_20C6EE(pc,d0.w)
	jsr	DrawObject
	bra.w	loc_20C224

; ------------------------------------------------------------------------------

off_20C6EE:
	dc.w	HMoveBlockObject_6_Routine0-*
	dc.w	HMoveBlockObject_6_Routine2-off_20C6EE
	dc.w	HMoveBlockObject_6_Routine4-off_20C6EE

; ------------------------------------------------------------------------------

HMoveBlockObject_6_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#HMoveBlockSprites5,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.s	loc_20C762
	moveq	#1,d1
	moveq	#3,d2

loc_20C72E:
	jsr	SpawnObject
	bne.s	loc_20C75C
	move.b	#$24,obj.id(a1)
	move.b	#5,obj.subtype(a1)
	move.b	d1,obj.var_3c(a1)
	move.w	obj.x(a0),obj.x(a1)
	moveq	#0,d0
	move.b	d1,d0
	mulu.w	#$40,d0
	add.w	obj.y(a0),d0
	move.w	d0,obj.y(a1)

loc_20C75C:
	addq.b	#1,d1
	dbf	d2,loc_20C72E

loc_20C762:
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	add.b	d0,d0
	lea	byte_20C77A(pc,d0.w),a1
	move.b	(a1)+,d0
	add.w	d0,obj.x(a0)
	move.b	(a1)+,obj.var_3b(a0)
	rts

; ------------------------------------------------------------------------------

byte_20C77A:
	dc.b	0, 0
	dc.b	$40, 1
	dc.b	$80, 2
	dc.b	$C0, 3
	dc.b	$80, 4
	dc.b	$40, 5
	dc.b	0, 0

; ------------------------------------------------------------------------------

HMoveBlockObject_6_Routine2:
	tst.b	obj.var_3a(a0)
	bne.s	loc_20C7AE
	lea	byte_20C7DA,a1
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	add.b	d0,d0
	add.b	d0,d0
	lea	(a1,d0.w),a1
	move.b	(a1)+,obj.var_3a(a0)
	move.b	(a1)+,d0
	move.w	(a1)+,obj.var_30(a0)

loc_20C7AC:
	bra.s	HMoveBlockObject_6_Routine4

; ------------------------------------------------------------------------------

loc_20C7AE:
	move.w	obj.var_30(a0),d0
	move.w	d0,obj.x_speed(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.x(a0)
	subq.b	#1,obj.var_3a(a0)
	bne.s	loc_20C7AC
	addq.b	#1,obj.var_3b(a0)
	cmpi.b	#6,obj.var_3b(a0)
	bne.s	HMoveBlockObject_6_Routine2
	clr.b	obj.var_3b(a0)
	bra.s	HMoveBlockObject_6_Routine2

; ------------------------------------------------------------------------------

HMoveBlockObject_6_Routine4:
	bra.w	sub_20C212

; ------------------------------------------------------------------------------

byte_20C7DA:
	dc.b	$80, 0
	dc.w	$80
	dc.b	$80, 0
	dc.w	$80
	dc.b	$80, 0
	dc.w	$80
	dc.b	$80, 0
	dc.w	-$80
	dc.b	$80, 0
	dc.w	-$80
	dc.b	$80, 0
	dc.w	-$80

HMoveBlockSprites5:
	include	"src/sprites/r4/h_move_block_5.asm"
	even

; ------------------------------------------------------------------------------

HMoveBlockObject_0_RoutineC:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C822(pc,d0.w),d0
	jsr	off_20C822(pc,d0.w)
	jsr	DrawObject
	bra.w	loc_20C224

; ------------------------------------------------------------------------------

off_20C822:
	dc.w	HMoveBlockObject_7_Routine0-*
	dc.w	HMoveBlockObject_7_Routine2-off_20C822

; ------------------------------------------------------------------------------

HMoveBlockObject_7_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#HMoveBlockSprites6,obj.sprite_data(a0)
	move.b	#$10,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.s	loc_20C8A0
	move.w	obj.x(a0),d0
	move.w	d0,obj.var_36(a0)
	moveq	#1,d1
	moveq	#2,d2

loc_20C85C:
	jsr	SpawnObject
	bne.s	loc_20C89A
	move.b	#$24,obj.id(a1)
	move.b	#6,obj.subtype(a1)
	move.b	d1,obj.var_3c(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.b	d1,d0
	asl.b	#4,d0
	ext.w	d0
	neg.w	d0
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a1)
	moveq	#0,d0
	move.b	d1,d0
	mulu.w	#$20,d0
	add.w	obj.y(a0),d0
	move.w	d0,obj.y(a1)

loc_20C89A:
	addq.b	#1,d1
	dbf	d2,loc_20C85C

loc_20C8A0:
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	move.b	d0,obj.sprite_frame(a0)
	addq.b	#1,d0
	move.b	d0,obj.var_3b(a0)
	move.b	obj.var_3c(a0),d0
	moveq	#0,d1

loc_20C8B6:
	addi.b	#$10,d1
	dbf	d0,loc_20C8B6
	move.b	d1,obj.width_2(a0)
	andi.w	#$FF,d1
	move.w	obj.x(a0),d0
	add.w	d1,d0
	move.w	d0,obj.var_32(a0)
	move.b	#$80,obj.var_3a(a0)

HMoveBlockObject_7_Routine2:
	move.w	obj.x(a0),-(sp)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	jsr	SineCosine
	moveq	#0,d2
	moveq	#0,d3
	move.b	obj.var_3b(a0),d2
	beq.s	loc_20C8F6

loc_20C8F0:
	add.w	d0,d3
	subq.b	#1,d2
	bne.s	loc_20C8F0

loc_20C8F6:
	asr.w	#4,d3
	move.w	d3,d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.x(a0)
	move.w	(sp)+,d1
	sub.w	d1,d0
	asl.w	#8,d0
	move.w	d0,obj.x_speed(a0)
	addq.b	#1,obj.var_3a(a0)
	bra.w	sub_20C212

; ------------------------------------------------------------------------------

HMoveBlockSprites6:
	include	"src/sprites/r4/h_move_block_6.asm"
	even

; ------------------------------------------------------------------------------

HMoveBlockObject_0_Routine10:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C96C(pc,d0.w),d0
	jsr	off_20C96C(pc,d0.w)
	jsr	DrawObject
	bra.w	loc_20C224

; ------------------------------------------------------------------------------

off_20C96C:
	dc.w	HMoveBlockObject_9_Routine0-*
	dc.w	HMoveBlockObject_9_Routine2-off_20C96C

; ------------------------------------------------------------------------------

HMoveBlockObject_9_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#HMoveBlockSprites1,obj.sprite_data(a0)
	move.b	#$40,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.w	loc_20CA12
	move.w	obj.x(a0),obj.var_36(a0)
	jsr	SpawnObject
	bne.s	loc_20C9D4
	move.b	#$24,obj.id(a1)
	move.b	#4,obj.subtype(a1)
	move.b	#8,obj.var_3d(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),d0
	subi.w	#$60,d0
	move.w	d0,obj.y(a1)

loc_20C9D4:
	jsr	SpawnObject
	bne.s	loc_20CA12
	move.b	#$24,obj.id(a1)
	move.b	#8,obj.subtype(a1)
	move.b	#1,obj.var_3c(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.var_36(a0),d0
	subi.w	#$80,d0
	move.w	d0,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.var_36(a0),d0
	addi.w	#$80,d0
	move.w	d0,obj.x(a0)

loc_20CA12:
	move.w	#$200,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

HMoveBlockObject_9_Routine2:
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.x(a0)
	bsr.w	sub_20C212
	move.w	obj.x(a0),d0
	sub.w	obj.var_36(a0),d0
	bcs.s	locret_20CA3C
	cmpi.w	#$100,d0
	bne.s	locret_20CA3C
	bsr.s	sub_20CA3E

locret_20CA3C:
	rts

; ------------------------------------------------------------------------------

sub_20CA3E:
	move.w	obj.var_36(a0),d1
	subi.w	#$100,d1
	move.w	d1,obj.x(a0)
	rts

; ------------------------------------------------------------------------------
