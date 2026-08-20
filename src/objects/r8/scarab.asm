; ------------------------------------------------------------------------------

ScarabObject:
	cmpi.b	#2,obj.subtype(a0)
	beq.w	loc_20E19A
	bcs.w	loc_20DE66
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DCA4(pc,d0.w),d0
	jmp	off_20DCA4(pc,d0.w)

; ------------------------------------------------------------------------------

off_20DCA4:
	dc.w	ScarabObject_6_Routine0-*
	dc.w	ScarabObject_6_Routine2-off_20DCA4
	dc.w	ScarabObject_6_Routine4-off_20DCA4

; ------------------------------------------------------------------------------

ScarabObject_6_Routine0:
	addq.b	#2,obj.routine(a0)
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	lea	object_states,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	bclr	#7,d1
	add.w	d1,d0
	lea	2(a1,d0.w),a1
	move.l	a1,obj.var_2a(a0)

ScarabObject_6_Routine2:
	lea	player_object,a1
	bsr.s	sub_20DCE4
	bcs.s	loc_20DD08
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

sub_20DCE4:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$140,d0
	subi.w	#$280,d0
	bcc.s	locret_20DD06
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	subi.w	#-$140,d0
	subi.w	#$280,d0

locret_20DD06:
	rts

; ------------------------------------------------------------------------------

loc_20DD08:
	addq.b	#2,obj.routine(a0)
	movea.l	obj.var_2a(a0),a6
	btst	#0,(a6)
	bne.s	loc_20DD3E
	jsr	SpawnObjectAfter
	bne.w	loc_20E312
	bsr.s	sub_20DD84
	move.w	a1,obj.var_2e(a0)
	move.b	obj.subtype(a0),d0
	andi.b	#1,d0
	move.b	d0,obj.subtype(a1)
	btst	#4,obj.subtype(a0)
	sne.b	d0
	move.b	d0,obj.subtype_2(a1)

loc_20DD3E:
	btst	#1,(a6)
	bne.s	locret_20DD82
	move.b	obj.subtype_2(a0),d6
	bmi.w	loc_20DD9C
	cmpi.b	#7,d6
	bhi.w	loc_20DD9C
	jsr	SpawnObjectAfter
	bne.w	loc_20E312
	bsr.s	sub_20DD84
	move.w	a1,obj.var_30(a0)
	move.b	#2,obj.subtype(a1)
	move.b	d6,obj.subtype_2(a1)
	subq.w	#4,obj.y(a1)
	moveq	#$18,d0
	btst	#4,obj.subtype(a0)
	beq.s	loc_20DD7E
	neg.w	d0

loc_20DD7E:
	sub.w	d0,obj.x(a1)

locret_20DD82:
	rts

; ------------------------------------------------------------------------------

sub_20DD84:
	move.w	a0,obj.var_2a(a1)
	move.b	#$2F,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	rts

; ------------------------------------------------------------------------------

loc_20DD9C:
	bset	#1,(a6)
	rts

; ------------------------------------------------------------------------------

ScarabObject_6_Routine4:
	movea.l	obj.var_2a(a0),a6
	btst	#0,(a6)
	bne.s	loc_20DDDE
	move.w	obj.var_2e(a0),d6
	beq.s	loc_20DDDE
	movea.w	d6,a1
	cmpi.b	#$2F,obj.id(a1)
	beq.s	loc_20DDDE
	bset	#0,(a6)
	clr.w	obj.var_2e(a0)
	move.w	obj.var_30(a0),d6
	beq.s	loc_20DDD0
	movea.w	d6,a1
	clr.w	obj.x_speed(a1)

loc_20DDD0:
	move.w	obj.var_32(a1),d6
	beq.s	loc_20DDDE
	movea.w	d6,a1
	bclr	#0,obj.var_2c(a1)

loc_20DDDE:
	btst	#1,(a6)
	bne.s	loc_20DDFC
	move.w	obj.var_30(a0),d6
	beq.s	loc_20DDFC
	movea.w	d6,a1
	cmpi.b	#$2F,obj.id(a1)
	beq.s	loc_20DDFC
	bset	#1,(a6)
	clr.w	obj.var_30(a0)

loc_20DDFC:
	btst	#0,(a6)
	sne.b	d0
	lsl.w	#8,d0
	btst	#1,(a6)
	sne.b	d0
	cmpi.w	#-1,d0
	beq.w	loc_20E318
	cmpi.w	#0,d0
	bne.s	loc_20DE58
	move.w	obj.var_2e(a0),d0
	sne.b	d0
	move.w	obj.var_30(a0),d1
	sne.b	d1
	eor.b	d0,d1
	beq.s	loc_20DE58
	tst.b	d0
	beq.s	loc_20DE4A
	movea.w	obj.var_2e(a0),a1
	move.w	obj.var_32(a1),d0
	beq.s	loc_20DE3E
	movea.w	d0,a2
	bclr	#0,obj.var_2c(a2)

loc_20DE3E:
	jsr	DeleteOtherObject
	clr.w	obj.var_2e(a0)
	bra.s	loc_20DE58

; ------------------------------------------------------------------------------

loc_20DE4A:
	movea.w	obj.var_30(a0),a1
	jsr	DeleteOtherObject
	clr.w	obj.var_30(a0)

loc_20DE58:
	move.w	obj.var_2e(a0),d0
	or.w	obj.var_30(a0),d0
	beq.w	loc_20E312
	rts

; ------------------------------------------------------------------------------

loc_20DE66:
	cmpi.b	#1,obj.subtype_2(a0)
	beq.w	loc_20E174
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$2F,obj.id(a1)
	bne.w	loc_20E318
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DEAE(pc,d0.w),d0
	jsr	off_20DEAE(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_2a(a0),-(sp)
	jsr	CheckObjectDespawn
	movea.w	(sp)+,a1
	tst.w	(a0)
	bne.s	locret_20DEAC
	clr.w	obj.var_2e(a1)

locret_20DEAC:
	rts

; ------------------------------------------------------------------------------

off_20DEAE:
	dc.w	ScarabObject_1_Routine0-*
	dc.w	ScarabObject_1_Routine2-off_20DEAE

; ------------------------------------------------------------------------------

ScarabObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#$20,obj.width(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$B,obj.height(a0)
	move.b	#$F0,obj.collide_type(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.w	#$243F,obj.sprite_tile(a0)
	move.l	#ScarabSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_2c(a0)
	move.w	#$3C,obj.var_34(a0)
	jsr	CheckBlockDown
	add.w	d1,obj.y(a0)
	jsr	SpawnObjectAfter
	bne.w	loc_20E312
	move.b	#$2F,obj.id(a1)
	move.b	#1,obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.width(a0),obj.width(a1)
	move.b	obj.width_2(a0),obj.width_2(a1)
	move.b	obj.height(a0),obj.height(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.w	a1,obj.var_3c(a0)
	move.w	a0,obj.var_2a(a1)
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20DF6A
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.sprite_flags(a1)
	bset	#0,obj.flags(a0)
	bset	#0,obj.flags(a1)

loc_20DF6A:
	lea	ScarabAnims1(pc),a1
	move.l	#$6000,d0
	tst.b	obj.subtype(a0)
	beq.s	loc_20DF84
	lea	ScarabAnims2(pc),a1
	move.l	#$3000,d0

loc_20DF84:
	move.l	a1,obj.var_38(a0)
	move.l	d0,obj.var_2e(a0)

ScarabObject_1_Routine2:
	move.w	obj.y(a0),-(sp)
	move.w	obj.x(a0),-(sp)
	tst.w	obj.var_34(a0)
	bmi.s	loc_20DFCE
	move.l	obj.var_2e(a0),d6
	add.l	d6,obj.x(a0)
	move.w	obj.x(a0),d0
	sub.w	obj.var_2c(a0),d0
	bpl.s	loc_20DFAE
	neg.w	d0

loc_20DFAE:
	cmpi.w	#$40,d0
	blt.s	loc_20DFB6
	bsr.s	sub_20E032

loc_20DFB6:
	jsr	CheckBlockDown
	move.w	d1,d0
	addq.w	#7,d0
	subi.w	#$E,d0
	bcs.s	loc_20DFCA
	bsr.s	sub_20E032
	bra.s	loc_20DFCE

; ------------------------------------------------------------------------------

loc_20DFCA:
	add.w	d1,obj.y(a0)

loc_20DFCE:
	move.w	(sp)+,d6
	move.w	(sp)+,d5
	sub.w	obj.x(a0),d6
	sub.w	obj.y(a0),d5
	movea.w	obj.var_2a(a0),a1
	move.w	obj.var_30(a1),d4
	beq.s	loc_20DFF8
	movea.w	d4,a1
	sub.w	d6,obj.x(a1)
	sub.w	d5,obj.y(a1)
	move.w	d6,d0
	neg.w	d0
	asl.w	#8,d0
	move.w	d0,obj.x_speed(a1)

loc_20DFF8:
	move.w	obj.var_32(a0),d4
	beq.s	loc_20E008
	movea.w	d4,a1
	sub.w	d6,obj.x(a1)
	sub.w	d5,obj.y(a1)

loc_20E008:
	moveq	#0,d0
	move.b	obj.routine_2(a0),d0
	move.w	off_20E040(pc,d0.w),d0
	jsr	off_20E040(pc,d0.w)
	movea.w	obj.var_3c(a0),a1
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.sprite_frame(a0),d0
	addq.b	#3,d0
	move.b	d0,obj.sprite_frame(a1)
	rts

; ------------------------------------------------------------------------------

sub_20E032:
	move.l	obj.var_2e(a0),d6
	sub.l	d6,obj.x(a0)
	neg.l	obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

off_20E040:
	dc.w	ScarabObject_2_Routine0-*
	dc.w	ScarabObject_2_Routine2-off_20E040
	dc.w	ScarabObject_2_Routine4-off_20E040

; ------------------------------------------------------------------------------

ScarabObject_2_Routine0:
	tst.b	obj.collide_status(a0)
	beq.s	loc_20E076
	lea	player_object,a1
	cmpi.b	#4,obj.routine(a1)
	beq.s	loc_20E072
	cmpi.b	#6,obj.routine(a1)
	beq.s	loc_20E072
	tst.w	obj.var_30(a1)
	bne.s	loc_20E072
	movea.w	obj.var_2a(a0),a1
	tst.w	obj.var_30(a1)
	bne.s	loc_20E072
	bra.s	loc_20E096

; ------------------------------------------------------------------------------

loc_20E072:
	clr.b	obj.collide_status(a0)

loc_20E076:
	subq.w	#1,obj.var_34(a0)
	bpl.s	loc_20E08C
	cmpi.w	#-30,obj.var_34(a0)
	bgt.s	locret_20E08A
	move.w	#60,obj.var_34(a0)

locret_20E08A:
	rts

; ------------------------------------------------------------------------------

loc_20E08C:
	movea.l	obj.var_38(a0),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

loc_20E096:
	lea	player_object,a1
	move.w	a1,obj.var_32(a0)
	bset	#0,obj.var_2c(a1)
	bset	#2,obj.flags(a1)
	move.b	#2,obj.anim_id(a1)
	move.b	#$E,obj.height(a1)
	move.b	#7,obj.width(a1)
	move.w	obj.y(a0),d0
	subq.w	#3,d0
	move.w	d0,obj.y(a1)
	moveq	#-$18,d0
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20E0D0
	neg.w	d0

loc_20E0D0:
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a1)
	addq.b	#2,obj.routine_2(a0)
	move.w	#120,obj.var_36(a0)

loc_20E0E2:
	move.w	#$F000,obj.collide_type(a0)
	rts

; ------------------------------------------------------------------------------

ScarabObject_2_Routine2:
	subq.w	#1,obj.var_36(a0)
	beq.s	loc_20E0F4
	bsr.s	loc_20E0E2
	bra.s	loc_20E076

; ------------------------------------------------------------------------------

loc_20E0F4:
	movea.w	obj.var_32(a0),a1
	clr.w	obj.var_32(a0)
	bclr	#0,obj.var_2c(a1)
	move.w	#0,obj.y_speed(a1)
	move.w	#-$A00,d0
	tst.b	obj.subtype(a0)
	beq.s	loc_20E116
	move.w	#-$500,d0

loc_20E116:
	move.w	d0,obj.x_speed(a1)
	bset	#0,obj.flags(a1)
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20E130
	neg.w	obj.x_speed(a1)
	bclr	#0,obj.flags(a1)

loc_20E130:
	move.w	#$F,obj.var_3e(a1)
	move.w	obj.x_speed(a1),obj.ground_speed(a1)
	clr.b	obj.angle(a1)
	bclr	#5,obj.flags(a1)
	addq.b	#2,obj.routine_2(a0)
	move.w	#0,obj.collide_type(a0)
	move.b	#2,obj.sprite_frame(a0)
	move.w	#30,obj.var_36(a0)
	rts

; ------------------------------------------------------------------------------

ScarabObject_2_Routine4:
	subq.w	#1,obj.var_36(a0)
	beq.s	loc_20E166
	rts

; ------------------------------------------------------------------------------

loc_20E166:
	clr.b	obj.routine_2(a0)
	move.b	#$FF,obj.prev_anim_id(a0)
	bra.w	loc_20E0E2

; ------------------------------------------------------------------------------

loc_20E174:
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$2F,obj.id(a1)
	bne.w	loc_20E318
	tst.b	obj.routine(a0)
	beq.s	loc_20E18E
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20E18E:
	addq.b	#2,obj.routine(a0)
	move.b	#3,obj.sprite_layer(a0)
	rts

; ------------------------------------------------------------------------------

loc_20E19A:
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$2F,obj.id(a1)
	bne.w	loc_20E318
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E1B6(pc,d0.w),d1
	jmp	off_20E1B6(pc,d1.w)

; ------------------------------------------------------------------------------

off_20E1B6:
	dc.w	ScarabObject_0_Routine0-*
	dc.w	ScarabObject_0_Routine2-off_20E1B6
	dc.w	ScarabObject_0_Routine4-off_20E1B6
	dc.w	ScarabObject_0_Routine6-off_20E1B6
	dc.w	ScarabObject_0_Routine8-off_20E1B6

; ------------------------------------------------------------------------------

ScarabObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#$E,obj.height(a0)
	move.b	#$E,obj.width(a0)
	move.l	#MonitorTimeSprites,obj.sprite_data(a0)
	move.w	#$5A8,obj.sprite_tile(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.b	#$F,obj.width_2(a0)
	move.b	#$C6,obj.collide_type(a0)
	move.b	obj.subtype_2(a0),obj.anim_id(a0)
	jsr	CheckBlockDown
	add.w	d1,obj.y(a0)

ScarabObject_0_Routine2:
	tst.b	obj.sprite_flags(a0)
	bpl.w	ScarabObject_0_Routine8
	move.b	obj.routine_2(a0),d0
	beq.s	loc_20E236
	jsr	MoveObjectFall
	jsr	CheckBlockDown
	tst.w	d1
	bpl.w	ScarabObject_0_Routine6
	add.w	d1,obj.y(a0)
	clr.w	obj.y_speed(a0)
	clr.b	obj.routine_2(a0)
	bra.w	ScarabObject_0_Routine6

; ------------------------------------------------------------------------------

loc_20E236:
	tst.b	obj.sprite_flags(a0)
	bpl.s	ScarabObject_0_Routine6
	lea	player_object,a1
	bsr.w	sub_20E2F6

ScarabObject_0_Routine6:
	tst.w	time_stop
	bne.s	ScarabObject_0_Routine8
	lea	MonitorTimeAnims,a1
	jsr	AnimateObject

ScarabObject_0_Routine8:
	jsr	DrawObject
	move.w	obj.var_2a(a0),-(sp)
	jsr	CheckObjectDespawn
	movea.w	(sp)+,a1
	tst.w	(a0)
	bne.s	locret_20E272
	clr.w	obj.var_30(a1)

locret_20E272:
	rts

; ------------------------------------------------------------------------------

ScarabObject_0_Routine4:
	movea.w	obj.var_2a(a0),a1
	move.w	obj.var_2e(a1),d6
	beq.s	loc_20E286
	movea.w	d6,a6
	move.b	#1,obj.collide_status(a6)

loc_20E286:
	lea	player_object,a1
	bsr.w	sub_20E2F6
	beq.s	loc_20E296
	jsr	GetOffObject

loc_20E296:
	move.w	#$96,d0
	jsr	PlayFmSound
	addq.b	#4,obj.routine(a0)
	move.b	#0,obj.collide_type(a0)
	jsr	SpawnObject
	bne.s	loc_20E2CA
	move.b	#$1A,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.anim_id(a0),obj.anim_id(a1)

loc_20E2CA:
	jsr	SpawnObject
	bne.s	loc_20E2F0
	move.b	#$18,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#1,obj.routine_2(a1)
	move.b	#1,obj.subtype(a1)

loc_20E2F0:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

sub_20E2F6:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	move.b	#$19,obj.id(a0)
	jsr	SolidObject
	move.b	#$2F,obj.id(a0)
	rts

; ------------------------------------------------------------------------------

loc_20E312:
	jmp	DespawnObject

; ------------------------------------------------------------------------------

loc_20E318:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

ScarabAnims1:
	include	"src/anims/r8/scarab_1.asm"
	even

ScarabAnims2:
	include	"src/anims/r8/scarab_2.asm"
	even

ScarabSprites:
	include	"src/sprites/r8/scarab.asm"
	even

; ------------------------------------------------------------------------------
