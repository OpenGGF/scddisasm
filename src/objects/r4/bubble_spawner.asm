; ------------------------------------------------------------------------------

BubbleSpawnerObject:
	lea	player_object,a6
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20A564(pc,d0.w),d1
	jmp	off_20A564(pc,d1.w)

; ------------------------------------------------------------------------------

off_20A564:
	dc.w	BubbleSpawnerObject_0_Routine0-*
	dc.w	BubbleSpawnerObject_0_Routine2-off_20A564
	dc.w	BubbleSpawnerObject_0_Routine4-off_20A564
	dc.w	BubbleSpawnerObject_0_Routine6-off_20A564
	dc.w	BubbleSpawnerObject_0_Routine8-off_20A564
	dc.w	BubbleSpawnerObject_0_RoutineA-off_20A564

; ------------------------------------------------------------------------------

BubbleSpawnerObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.l	#BubbleSprites,obj.sprite_data(a0)
	move.w	#$848A,obj.sprite_tile(a0)
	move.b	#$84,obj.sprite_flags(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	obj.subtype(a0),d0
	bpl.s	loc_20A5B4
	addq.b	#8,obj.routine(a0)
	andi.w	#$7F,d0
	move.b	d0,obj.var_32(a0)
	move.b	d0,obj.var_33(a0)
	move.b	#6,obj.anim_id(a0)
	bra.w	BubbleSpawnerObject_0_RoutineA

; ------------------------------------------------------------------------------

loc_20A5B4:
	move.b	d0,obj.anim_id(a0)
	move.w	obj.x(a0),obj.var_30(a0)
	move.w	#-$88,obj.y_speed(a0)
	jsr	Random
	move.b	d0,obj.angle(a0)

BubbleSpawnerObject_0_Routine2:
	lea	BubbleSpawnAnims,a1
	jsr	AnimateObject
	cmpi.b	#6,obj.sprite_frame(a0)
	bne.s	BubbleSpawnerObject_0_Routine4
	move.b	#1,obj.var_2e(a0)

BubbleSpawnerObject_0_Routine4:
	move.w	water_y,d0
	cmp.w	obj.y(a0),d0
	bcs.s	loc_20A600

loc_20A5F2:
	move.b	#6,obj.routine(a0)
	addq.b	#3,obj.anim_id(a0)
	bra.w	BubbleSpawnerObject_0_Routine6

; ------------------------------------------------------------------------------

loc_20A600:
	move.b	obj.angle(a0),d0
	addq.b	#1,obj.angle(a0)
	andi.w	#$7F,d0
	lea	WobbleTable,a1
	move.b	(a1,d0.w),d0
	ext.w	d0
	add.w	obj.var_30(a0),d0
	move.w	d0,obj.x(a0)
	tst.b	obj.var_2e(a0)
	beq.s	loc_20A688
	bsr.w	sub_20A81E
	beq.s	loc_20A688
	bsr.w	PlayerResetDrown
	move.w	#$AD,d0
	jsr	PlayFmSound
	clr.w	obj.x_speed(a6)
	clr.w	obj.y_speed(a6)
	clr.w	obj.ground_speed(a6)
	move.b	#$15,obj.anim_id(a6)
	move.w	#$23,obj.var_3e(a6)
	move.b	#0,obj.var_3c(a6)
	bclr	#5,obj.flags(a6)
	bclr	#4,obj.flags(a6)
	btst	#2,obj.flags(a6)
	beq.w	loc_20A5F2
	bclr	#2,obj.flags(a6)
	move.b	#$13,obj.height(a6)
	move.b	#9,obj.width(a6)
	subq.w	#5,obj.y(a6)
	bra.w	loc_20A5F2

; ------------------------------------------------------------------------------

loc_20A688:
	bsr.w	MoveObject
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20A698
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20A698:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BubbleSpawnerObject_0_Routine6:
	lea	BubbleSpawnAnims,a1
	jsr	AnimateObject
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20A6B6
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20A6B6:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BubbleSpawnerObject_0_Routine8:
	bra.w	DeleteObject

; ------------------------------------------------------------------------------

BubbleSpawnerObject_0_RoutineA:
	tst.w	obj.var_36(a0)
	bne.s	loc_20A722
	move.w	water_y,d0
	cmp.w	obj.y(a0),d0
	bcc.w	loc_20A7D4
	tst.b	obj.sprite_flags(a0)
	bpl.w	loc_20A7D4
	subq.w	#1,obj.var_38(a0)
	bpl.w	loc_20A7C8
	move.w	#1,obj.var_36(a0)

loc_20A6E8:
	jsr	Random
	move.w	d0,d1
	andi.w	#7,d0
	cmpi.w	#6,d0
	bcc.s	loc_20A6E8
	move.b	d0,obj.var_34(a0)
	andi.w	#$C,d1
	lea	unk_20A80C,a1
	adda.w	d1,a1
	move.l	a1,obj.var_3c(a0)
	subq.b	#1,obj.var_32(a0)
	bpl.s	loc_20A720
	move.b	obj.var_33(a0),obj.var_32(a0)
	bset	#7,obj.var_36(a0)

loc_20A720:
	bra.s	loc_20A72A

; ------------------------------------------------------------------------------

loc_20A722:
	subq.w	#1,obj.var_38(a0)
	bpl.w	loc_20A7C8

loc_20A72A:
	jsr	Random
	andi.w	#$1F,d0
	move.w	d0,obj.var_38(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20A7AC
	bsr.w	SpawnObject
	bne.s	loc_20A7AC
	move.b	#$20,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	jsr	Random
	andi.w	#$F,d0
	subq.w	#8,d0
	add.w	d0,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	moveq	#0,d0
	move.b	obj.var_34(a0),d0
	movea.l	obj.var_3c(a0),a2
	move.b	(a2,d0.w),obj.subtype(a1)
	btst	#7,obj.var_36(a0)
	beq.s	loc_20A7AC
	jsr	Random
	andi.w	#3,d0
	bne.s	loc_20A798
	bset	#6,obj.var_36(a0)
	bne.s	loc_20A7AC
	move.b	#2,obj.subtype(a1)

loc_20A798:
	tst.b	obj.var_34(a0)
	bne.s	loc_20A7AC
	bset	#6,obj.var_36(a0)
	bne.s	loc_20A7AC
	move.b	#2,obj.subtype(a1)

loc_20A7AC:
	subq.b	#1,obj.var_34(a0)
	bpl.s	loc_20A7C8
	jsr	Random
	andi.w	#$7F,d0
	addi.w	#$80,d0
	add.w	d0,obj.var_38(a0)
	clr.w	obj.var_36(a0)

loc_20A7C8:
	lea	BubbleSpawnAnims,a1
	jsr	AnimateObject

loc_20A7D4:
	tst.b	obj.sprite_flags(a0)
	bmi.s	loc_20A7F8
	move.w	obj.x(a0),d0
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.w	DeleteObject

loc_20A7F8:
	move.w	water_y,d0
	cmp.w	obj.y(a0),d0
	bcs.w	DrawObject
	bclr	#7,obj.sprite_flags(a0)
	rts

; ------------------------------------------------------------------------------

unk_20A80C:
	dc.b	0
	dc.b	1
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	0
	dc.b	1
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	0

; ------------------------------------------------------------------------------

sub_20A81E:
	if REGION=USA
	cmpi.b	#$17,obj.anim_id(a6)
	beq.s	loc_20A854
	endif
	tst.b	obj.var_2c(a6)
	bmi.s	loc_20A854
	move.w	obj.x(a6),d0
	move.w	obj.x(a0),d1
	subi.w	#$10,d1
	cmp.w	d0,d1
	bcc.s	loc_20A854
	addi.w	#$20,d1
	cmp.w	d0,d1
	bcs.s	loc_20A854
	move.w	obj.y(a6),d0
	move.w	obj.y(a0),d1
	cmp.w	d0,d1
	bcc.s	loc_20A854
	addi.w	#$10,d1
	cmp.w	d0,d1
	bcs.s	loc_20A854
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_20A854:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

BubbleSpawnAnims:
	include	"anims/r4/bubble_spawn.asm"
	even

; ------------------------------------------------------------------------------
