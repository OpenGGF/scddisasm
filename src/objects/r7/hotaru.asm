; ------------------------------------------------------------------------------

HotaruObject:
	cmpi.b	#$FF,obj.subtype_2(a0)
	beq.w	loc_20DDD8
	cmpi.b	#$FE,obj.subtype_2(a0)
	beq.w	loc_20E172
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DC72(pc,d0.w),d0
	jmp	off_20DC72(pc,d0.w)

; ------------------------------------------------------------------------------

off_20DC72:
	dc.w	HotaruObject_2_Routine0-*
	dc.w	HotaruObject_2_Routine2-off_20DC72
	dc.w	HotaruObject_2_Routine4-off_20DC72
	dc.w	HotaruObject_2_Routine6-off_20DC72

; ------------------------------------------------------------------------------

HotaruObject_2_Routine0:
	addq.b	#2,obj.routine(a0)
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	lea	object_states,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	add.w	d1,d0
	lea	2(a1,d0.w),a1
	move.l	a1,obj.var_2a(a0)
	lea	word_20E33A,a1
	move.b	obj.subtype(a0),d0
	andi.w	#$C,d0
	adda.w	d0,a1
	move.l	a1,obj.var_2e(a0)
	btst	#0,obj.subtype(a0)
	sne	d0
	move.b	d0,obj.subtype(a0)
	move.w	#$845D,d0
	cmpi.b	#2,act
	bne.s	loc_20DCD4
	move.w	#$8320,d0

loc_20DCD4:
	move.w	d0,obj.sprite_tile(a0)

HotaruObject_2_Routine2:
	move.w	#$FF10,d1
	move.w	#$1E0,d2
	move.w	#$FF10,d3
	move.w	#$1E0,d4
	lea	player_object,a1
	bsr.w	sub_20E202
	bcc.s	loc_20DCF6
	addq.b	#2,obj.routine(a0)

loc_20DCF6:
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

HotaruObject_2_Routine4:
	addq.b	#2,obj.routine(a0)
	movea.l	obj.var_2a(a0),a6
	btst	#0,(a6)
	bne.s	loc_20DD2A
	jsr	SpawnObjectAfter
	bne.w	loc_20E1F6
	move.w	a1,obj.var_32(a0)
	bsr.s	sub_20DD52
	movea.l	obj.var_2e(a0),a2
	move.w	(a2)+,d0
	move.w	(a2),d1
	add.w	d0,obj.x(a1)
	add.w	d1,obj.y(a1)

loc_20DD2A:
	btst	#1,(a6)
	bne.s	locret_20DD50
	jsr	SpawnObjectAfter
	bne.w	loc_20E1F6
	move.w	a1,obj.var_34(a0)
	bsr.s	sub_20DD52
	movea.l	obj.var_2e(a0),a2
	move.w	(a2)+,d0
	move.w	(a2),d1
	sub.w	d0,obj.x(a1)
	sub.w	d1,obj.y(a1)

locret_20DD50:
	rts

; ------------------------------------------------------------------------------

sub_20DD52:
	move.w	a0,obj.var_2a(a1)
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.b	obj.state_id(a0),obj.var_36(a1)
	rts

; ------------------------------------------------------------------------------

HotaruObject_2_Routine6:
	movea.l	obj.var_2a(a0),a6
	btst	#0,(a6)
	bne.s	loc_20DDA6
	move.w	obj.var_32(a0),d6
	beq.s	loc_20DDA6
	movea.w	d6,a1
	move.b	0(a1),d6
	cmp.b	obj.id(a0),d6
	beq.s	loc_20DDA6
	bset	#0,(a6)
	clr.w	obj.var_32(a0)

loc_20DDA6:
	btst	#1,(a6)
	bne.s	loc_20DDC6
	move.w	obj.var_34(a0),d6
	beq.s	loc_20DDC6
	movea.w	d6,a1
	move.b	0(a1),d6
	cmp.b	obj.id(a0),d6
	beq.s	loc_20DDC6
	bset	#1,(a6)
	clr.w	obj.var_34(a0)

loc_20DDC6:
	cmpi.b	#$83,(a6)
	beq.w	HotaruObject_1_Routine4
	tst.l	obj.var_32(a0)
	beq.w	loc_20E1F6
	rts

; ------------------------------------------------------------------------------

loc_20DDD8:
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$23,0(a1)
	bne.w	HotaruObject_1_Routine4
	move.b	$23(a1),d0
	cmp.b	obj.var_36(a0),d0
	bne.w	HotaruObject_1_Routine4
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DE06(pc,d0.w),d0
	jmp	off_20DE06(pc,d0.w)

; ------------------------------------------------------------------------------

off_20DE06:
	dc.w	HotaruObject_0_Routine0-*
	dc.w	HotaruObject_0_Routine2-off_20DE06
	dc.w	HotaruObject_0_Routine4-off_20DE06
	dc.w	HotaruObject_0_Routine6-off_20DE06
	dc.w	HotaruObject_0_Routine8-off_20DE06
	dc.w	HotaruObject_0_RoutineA-off_20DE06
	dc.w	HotaruObject_0_RoutineC-off_20DE06
	dc.w	HotaruObject_0_RoutineE-off_20DE06
	dc.w	HotaruObject_0_RoutineC-off_20DE06
	dc.w	HotaruObject_0_Routine12-off_20DE06
	dc.w	HotaruObject_0_Routine14-off_20DE06

; ------------------------------------------------------------------------------

HotaruObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$14,obj.width(a0)
	move.b	#$14,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$32,obj.collide_type(a0)
	move.w	obj.x(a0),obj.var_2c(a0)
	tst.b	obj.subtype(a0)
	bne.s	loc_20DE60
	lea	HotaruSprites1(pc),a1
	lea	HotaruAnims1(pc),a2
	move.l	#-$10000,d0
	bra.s	loc_20DE6E

; ------------------------------------------------------------------------------

loc_20DE60:
	lea	HotaruSprites2(pc),a1
	lea	HotaruAnims2(pc),a2
	move.l	#-$8000,d0

loc_20DE6E:
	move.l	a1,obj.sprite_data(a0)
	move.l	a2,obj.var_32(a0)
	move.l	d0,obj.var_2e(a0)
	lea	player_object,a1
	move.w	obj.x(a1),d0
	cmp.w	obj.x(a0),d0
	blt.s	locret_20DE98
	neg.l	obj.var_2e(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)

locret_20DE98:
	rts

; ------------------------------------------------------------------------------

HotaruObject_0_Routine2:
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.x(a0)
	move.w	obj.x(a0),d0
	sub.w	obj.var_2c(a0),d0
	bpl.s	loc_20DEAE
	neg.w	d0

loc_20DEAE:
	cmpi.w	#$50,d0
	blt.s	loc_20DECC
	move.l	obj.var_2e(a0),d0
	sub.l	d0,obj.x(a0)
	neg.l	obj.var_2e(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)

loc_20DECC:
	move.w	#-$38,d1
	move.w	#$70,d2
	move.w	#-$50,d3
	move.w	#$A0,d4
	lea	player_object,a1
	bsr.w	sub_20E202
	bcc.s	loc_20DF06
	movea.w	obj.var_2a(a0),a2
	move.w	$32(a2),d0
	beq.s	loc_20DEF8
	movea.w	d0,a3
	move.b	#4,$24(a3)

loc_20DEF8:
	move.w	$34(a2),d0
	beq.s	loc_20DF06
	movea.w	d0,a4
	move.b	#4,$24(a4)

loc_20DF06:
	bra.w	loc_20E086

; ------------------------------------------------------------------------------

HotaruObject_0_Routine4:
	movea.w	obj.var_2a(a0),a2
	move.w	$32(a2),d0
	beq.w	loc_20DFF6
	movea.w	d0,a3
	move.w	$34(a2),d0
	beq.w	loc_20DFF6
	movea.w	d0,a4
	sf	d6
	move.w	8(a3),d0
	add.w	8(a4),d0
	asr.w	#1,d0
	sub.w	scroll_fg_x,d0
	cmpi.w	#$98,d0
	blt.w	loc_20DF7A
	cmpi.w	#$A8,d0
	bgt.w	loc_20DFA4
	st	d6

loc_20DF44:
	sf	d5
	move.w	$C(a3),d0
	add.w	$C(a4),d0
	asr.w	#1,d0
	sub.w	scroll_fg_y,d0
	cmpi.w	#$68,d0
	blt.w	loc_20DFD0
	cmpi.w	#$78,d0
	bgt.w	loc_20DFE2
	st	d5

loc_20DF66:
	and.b	d6,d5
	beq.s	loc_20DF76
	move.b	#6,$24(a3)
	move.b	#6,$24(a4)

loc_20DF76:
	bra.w	loc_20E086

; ------------------------------------------------------------------------------

loc_20DF7A:
	bset	#0,1(a3)
	bset	#0,1(a4)
	bset	#0,$22(a3)
	bset	#0,$22(a4)
	move.l	obj.var_2e(a0),d0
	bpl.s	loc_20DF9A
	neg.l	d0

loc_20DF9A:
	add.l	d0,8(a3)
	add.l	d0,8(a4)
	bra.s	loc_20DF44

; ------------------------------------------------------------------------------

loc_20DFA4:
	bclr	#0,1(a3)
	bclr	#0,1(a4)
	bclr	#0,$22(a3)
	bclr	#0,$22(a4)
	move.l	obj.var_2e(a0),d0
	bpl.s	loc_20DFC4
	neg.l	d0

loc_20DFC4:
	sub.l	d0,8(a3)
	sub.l	d0,8(a4)
	bra.w	loc_20DF44

; ------------------------------------------------------------------------------

loc_20DFD0:
	move.l	obj.var_2e(a0),d0
	bpl.s	loc_20DFD8
	neg.l	d0

loc_20DFD8:
	add.l	d0,$C(a3)
	add.l	d0,$C(a4)
	bra.s	loc_20DF66

; ------------------------------------------------------------------------------

loc_20DFE2:
	move.l	obj.var_2e(a0),d0
	bpl.s	loc_20DFEA
	neg.l	d0

loc_20DFEA:
	sub.l	d0,$C(a3)
	sub.l	d0,$C(a4)
	bra.w	loc_20DF66

; ------------------------------------------------------------------------------

loc_20DFF6:
	addq.b	#2,obj.routine(a0)

HotaruObject_0_Routine6:
	addq.b	#2,obj.routine(a0)
	move.b	#$C,obj.width(a0)
	move.b	#$C,obj.width_2(a0)
	move.b	#$14,obj.height(a0)
	move.b	#$33,obj.collide_type(a0)
	move.b	#0,obj.sprite_flags(a0)
	move.w	obj.x(a0),d0
	move.w	obj.y(a0),d1
	sub.w	scroll_fg_x,d0
	sub.w	scroll_fg_y,d1
	addi.w	#$80,d0
	addi.w	#$80,d1
	swap	d0
	move.w	d1,d0
	move.l	d0,obj.x(a0)

HotaruObject_0_Routine8:
	movea.l	obj.var_32(a0),a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

HotaruObject_0_RoutineA:
	addq.b	#2,obj.routine(a0)
	move.w	#$1FF,obj.anim_id(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.w	obj.x(a0),d0
	move.w	obj.x+2(a0),d1
	subi.w	#$80,d0
	subi.w	#$80,d1
	add.w	scroll_fg_x,d0
	add.w	scroll_fg_y,d1
	move.w	d0,obj.x(a0)
	move.w	d1,obj.y(a0)

HotaruObject_0_RoutineC:
	movea.l	obj.var_32(a0),a1
	jsr	AnimateObject

loc_20E086:
	jsr	DrawObject
	move.w	obj.var_2a(a0),-(sp)
	jsr	CheckObjectDespawn
	movea.w	(sp)+,a1
	tst.b	(a0)
	beq.s	loc_20E0AA
	rts

; ------------------------------------------------------------------------------

loc_20E09E:
	move.w	obj.var_2a(a0),-(sp)
	jsr	DeleteObject
	movea.w	(sp)+,a1

loc_20E0AA:
	lea	$32(a1),a2
	cmpa.w	(a2),a0
	beq.s	loc_20E0B4
	addq.w	#2,a2

loc_20E0B4:
	clr.w	(a2)
	rts

; ------------------------------------------------------------------------------

HotaruObject_0_RoutineE:
	addq.b	#2,obj.routine(a0)
	move.w	#$2FF,obj.anim_id(a0)
	tst.b	obj.subtype(a0)
	bne.s	loc_20E0CC
	bsr.w	sub_20E0F8

loc_20E0CC:
	bra.s	HotaruObject_0_RoutineC

; ------------------------------------------------------------------------------

HotaruObject_0_Routine12:
	addq.b	#2,obj.routine(a0)
	move.w	#$3FF,obj.anim_id(a0)
	bra.s	HotaruObject_0_RoutineC

; ------------------------------------------------------------------------------

HotaruObject_0_Routine14:
	subq.w	#2,obj.y(a0)
	tst.b	obj.sprite_flags(a0)
	bmi.s	loc_20E0F6
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	cmpi.w	#$A0,d0
	bgt.s	loc_20E09E

loc_20E0F6:
	bra.s	HotaruObject_0_RoutineC

; ------------------------------------------------------------------------------

sub_20E0F8:
	movea.w	obj.var_2a(a0),a1
	move.w	$32(a1),d5
	beq.s	locret_20E170
	move.w	$34(a1),d6
	beq.s	locret_20E170
	movea.w	d5,a5
	movea.w	d6,a6
	cmpa.w	a0,a5
	bne.s	locret_20E170
	tst.b	1(a5)
	bpl.s	locret_20E170
	tst.b	1(a6)
	bpl.s	locret_20E170
	moveq	#2,d6
	move.w	8(a5),d5
	move.w	$C(a5),d4
	move.w	8(a6),d3
	move.w	$C(a6),d2
	sub.w	d5,d3
	sub.w	d4,d2
	asr.w	#2,d3
	asr.w	#2,d2
	addq.w	#7,d4

loc_20E138:
	jsr	SpawnObject
	bne.s	locret_20E170
	move.w	a5,obj.var_2a(a1)
	move.w	a6,obj.var_2c(a1)
	move.b	0(a5),obj.id(a1)
	move.b	$28(a5),obj.subtype(a1)
	move.b	#$FE,obj.subtype_2(a1)
	move.w	2(a5),obj.sprite_tile(a1)
	add.w	d3,d5
	add.w	d2,d4
	move.w	d5,obj.x(a1)
	move.w	d4,obj.y(a1)
	dbf	d6,loc_20E138

locret_20E170:
	rts

; ------------------------------------------------------------------------------

loc_20E172:
	movea.w	obj.var_2a(a0),a1
	movea.w	obj.var_2c(a0),a2
	cmpi.b	#$23,obj.id(a1)
	bne.w	HotaruObject_1_Routine4
	cmpi.b	#$23,obj.id(a2)
	bne.w	HotaruObject_1_Routine4
	cmpi.b	#$10,obj.routine(a1)
	bne.w	HotaruObject_1_Routine4
	cmpi.b	#$10,obj.routine(a1)
	bne.w	HotaruObject_1_Routine4
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E1B0(pc,d0.w),d0
	jmp	off_20E1B0(pc,d0.w)

; ------------------------------------------------------------------------------

off_20E1B0:
	dc.w	HotaruObject_1_Routine0-*
	dc.w	HotaruObject_1_Routine2-off_20E1B0
	dc.w	HotaruObject_1_Routine4-off_20E1B0

; ------------------------------------------------------------------------------

HotaruObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.b	#$C,obj.width(a0)
	move.b	#$C,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$B4,obj.collide_type(a0)
	move.l	#HotaruSparkSprites,obj.sprite_data(a0)

HotaruObject_1_Routine2:
	lea	HotaruSparkAnims(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20E1F6:
	jmp	DespawnObject

; ------------------------------------------------------------------------------

HotaruObject_1_Routine4:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

sub_20E202:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	sub.w	d1,d0
	sub.w	d2,d0
	bcc.s	locret_20E21C
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	sub.w	d3,d0
	sub.w	d4,d0

locret_20E21C:
	rts

; ------------------------------------------------------------------------------

HotaruAnims1:
	include	"anims/r7/hotaru_1.asm"
	even

HotaruAnims2:
	include	"anims/r7/hotaru_2.asm"
	even

HotaruSprites1:
	include	"sprites/r7/hotaru_1.asm"
	even

HotaruSprites2:
	include	"sprites/r7/hotaru_2.asm"
	even

HotaruSparkAnims:
	include	"anims/r7/hotaru_spark.asm"
	even

HotaruSparkSprites:
	include	"sprites/r7/hotaru_spark.asm"
	even

word_20E33A:
	dc.w	$24, $3C
	dc.w	8, -$44
	dc.w	$38, -$38
	dc.w	$50, $10

; ------------------------------------------------------------------------------
