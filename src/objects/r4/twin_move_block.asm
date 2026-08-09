; ------------------------------------------------------------------------------

TwinMoveBlockObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D808(pc,d0.w),d0
	jsr	off_20D808(pc,d0.w)
	jsr	DrawObject
	tst.b	obj.var_3c(a0)
	beq.s	loc_20D7FC
	movea.w	obj.var_34(a0),a1
	cmpi.b	#$48,0(a1)
	bne.s	loc_20D802
	rts

; ------------------------------------------------------------------------------

loc_20D7FC:
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_20D802:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20D808:
	dc.w	TwinMoveBlockObject_0_Routine0-*
	dc.w	TwinMoveBlockObject_0_Routine2-off_20D808

; ------------------------------------------------------------------------------

sub_20D80C:
	lea	(player_object).w,a1
	jsr	SolidObject
	rts

; ------------------------------------------------------------------------------

TwinMoveBlockObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#TwinMoveBlockSprites,obj.sprite_data(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.s	locret_20D872
	jsr	SpawnObject
	bne.s	locret_20D872
	move.b	#$48,obj.id(a1)
	move.w	obj.x(a0),d0
	addi.w	#$20,d0
	move.w	d0,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#1,obj.var_3c(a1)
	move.w	a0,obj.var_34(a1)

locret_20D872:
	rts

; ------------------------------------------------------------------------------

TwinMoveBlockObject_0_Routine2:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_20D87E
	bsr.w	sub_20D80C

loc_20D87E:
	tst.b	obj.var_3a(a0)
	bne.s	loc_20D8B8
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	asl.w	#2,d0
	lea	byte_20D8E6(pc,d0.w),a1
	move.b	(a1)+,obj.var_3a(a0)
	move.b	(a1)+,d0
	move.w	(a1)+,d1
	tst.b	obj.var_3c(a0)
	beq.s	loc2_20D8A2
	neg.b	d0
	neg.w	d1

loc2_20D8A2:
	ext.w	d0
	move.w	d0,obj.var_3e(a0)
	move.w	d1,obj.y_speed(a0)

loc_20D8AC:
	tst.w	obj.y_speed(a0)
	bmi.s	locret_20D8B6
	bsr.w	sub_20D80C

locret_20D8B6:
	rts

; ------------------------------------------------------------------------------

loc_20D8B8:
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	move.w	obj.var_3e(a0),d0
	add.w	d0,obj.y_speed(a0)
	subq.b	#1,obj.var_3a(a0)
	bne.s	loc_20D8AC
	addq.b	#1,obj.var_3b(a0)
	cmpi.b	#4,obj.var_3b(a0)
	bne.s	loc_20D8AC
	move.b	#0,obj.var_3b(a0)
	bra.s	loc_20D8AC

; ------------------------------------------------------------------------------

byte_20D8E6:
	dc.b	$80, $FC
	dc.b	2, 0
	dc.b	$80, $FC
	dc.b	0, 0
	dc.b	$80, 4
	dc.b	$FE, 0
	dc.b	$80, 4
	dc.b	0, 0

TwinMoveBlockSprites:
	include	"src/sprites/r4/twin_move_block.asm"
	even

; ------------------------------------------------------------------------------